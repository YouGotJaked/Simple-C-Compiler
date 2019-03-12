#include <sstream>
#include <iostream>
#include <iterator>
#include <algorithm>
#include <vector>
#include "Tree.h"
#include "Label.h"
#include "generate.h"
#include "tokens.h"

#define STACK_ALIGNMENT	4
#define SIZEOF_REG 4
#define PARAM_OFFSET 8
#define FP(expr)	( (expr)->type().isReal() )
#define BYTE(expr)	( (expr)->type().size() == 1 )

#define isNumber(expr)	( expr->_operand[0] == '$' )
#define isRegister(expr)( expr->_register != nullptr)
using std::cout;
using std::endl;
using std::string;
using std::to_string;
using std::stringstream;
using std::vector;
using std::reverse;
using std::begin;
using std::end;

static int tempOffset = 0;
static vector<string> stringLabels;
static Label *returnLabel;

// This needs to be zero if temporaries are placed on the stack
#define SIMPLE_PROLOGUE 0

// This needs to be set if we want to use the callee-saved registers
#define CALLEE_SAVED 1

# if CALLEE_SAVED
static Registers callee_saved = {ebx, esi, edi};
# else
static Registers callee_saved = {};
# endif

/*
 * Function:	align
 *
 * Descripion:	Return the number of bytes necessary to align the given
 * 		offset on the stack.
 */
static int align(int offset) {
    if (offset % STACK_ALIGNMENT == 0) {
	return 0;
    }

    return STACK_ALIGNMENT - (abs(offset) % STACK_ALIGNMENT);
}	

// ################
// ##  GENERATE  ##
// ################

/*
 * Function:	generateGlobals
 * 
 * Description: Given a scope, define all global variables (ignore functions).
 *
 * Format:
 * 	.comm	name, size, alignment (not used)
 */
void generateGlobals(const Symbols &globals) {
    cout << "#GLOBALS" << endl;
    for (auto const &var: globals) {
        cout << "\t.comm\t" << var->name();
        cout << ", " << var->type().size() << endl;
   }
}

void generateStrings() {
    cout << "#STRINGS" << endl;
    for (auto const &str: stringLabels) {
	cout << str << endl;
    }
}

/*
 * Function:	Function::prologue
 *
 * Description:	Generate code for the prologue of a function.
 */
void Function::prologue(const int &offset) {
    cout << "\t#PROLOGUE" << endl;
    cout << _id->name() << ":" << endl;
    returnLabel = new Label();
    cout << *returnLabel << ":" << endl;
    cout << "\tpushl\t%ebp" << endl;
    cout << "\tmovl\t%esp, %ebp" << endl;
    cout << "\tsubl\t$" << -offset << ", %esp" << endl;
}

/*
 * Function:	Function::epilogue
 *
 * Description:	Generate code for the epilogue of a function.
 */
void Function::epilogue() {
    cout << "\t#EPILOGUE" << endl;
    cout << "\tmovl\t%ebp, %esp" << endl;
    cout << "\tpopl\t%ebp" << endl;
    cout << "\tret" << endl;
}

/*
 * Function:	Function::generate
 *
 * Description: Generate code for statements.
 *
 * Format: 
 * 	1. Assign offsets
 * 	2. Prologue
 * 		pushl	%ebp
 * 		movl	%esp, %ebp
 * 		subl	$n, %esp
 * 	3. Body (block)
 * 	4. Epilogue
 * 		movl	%ebp, %esp
 * 		popl	%ebp
 * 		ret
 */
void Function::generate() {
    cout << "#FUNCTION" << endl;
    // assign offsets
    int offset, parameter_offset;
    returnLabel = new Label();

    parameter_offset = PARAM_OFFSET + SIZEOF_REG * callee_saved.size();
    offset = parameter_offset;
    allocate(offset);

    // prologue
    cout << "\t#PROLOGUE" << endl;
    cout << _id->name() << ":" << endl;
    cout << "\tpushl\t%ebp" << endl;

    for (auto const &reg: callee_saved) {
	cout << "\tpushl\t" << reg << endl;
    }

    cout << "\tmovl\t%esp, %ebp" << endl;

    if (SIMPLE_PROLOGUE) {
	offset -= align(offset - parameter_offset);
   	cout << "\tsubl\t$" << -offset << ", %esp" << endl;
    } else {
	cout << "\tsubl\t$" << _id->name() << ".size, %esp" << endl;
    }

    // body
    cout << "\t#BODY" << endl;
    tempOffset = offset;
    _body->generate();
    offset = tempOffset;
    cout << *returnLabel << ":" << endl;
    cout << "\t#END BODY" << endl;
    
    // epilogue
    cout << "\t#EPILOGUE" << endl;
    cout << "\tmovl\t%ebp, %esp" << endl;

    for (int i = callee_saved.size()-1; i >= 0; i--) {
	cout << "\tpopl\t" << callee_saved[i] << endl;
    }

    cout << "\tpop\t%ebp" << endl;
    cout << "\tret" << endl;

    if (!SIMPLE_PROLOGUE) {
	offset -= align(offset - parameter_offset);
	cout << "\t.set\t" << _id->name() << ".size, " << -offset << endl;
    }

    cout << "\t.globl\t" << _id->name() << endl;   
}

/*
 * Function:	Block::generate
 *
 * Description: Generate code for statements within block.
 */
void Block::generate() {
    cout << "\t #BLOCK" << endl;
    
    for (auto const &stmt: _stmts) {
        stmt->generate();
    }
}

/*
 * Function:	Call::generate
 *
 * Description: Generate code for a function call. Arguments are pushed in
 * 		reverse order.
 */
void Call::generate() {
    cout << "\t#CALL" << endl;

    unsigned bytesPushed = 0;

    Expressions temp = _args;
    reverse(begin(temp), end(temp));

    // compute number of bytes that will be pushed onto the stack
    for (auto const &arg: temp) {
	bytesPushed += arg->type().size();
   
	if (STACK_ALIGNMENT != 4 && arg->_hasCall) {
	    arg->generate();
	}
    }

    // empty registers
    for (auto const &reg: registers) {
	load(nullptr, reg);
    }

    // adjust stack to keep it aligned
    if (align(bytesPushed) > 0) {
	cout << "\tsubl\t$" << align(bytesPushed) << ", %esp" << endl;
	bytesPushed += align(bytesPushed);
    }

    // push each argument onto the stack
    for (auto const &arg: temp) {
	if (STACK_ALIGNMENT == 4 || !arg->_hasCall) {
	    arg->generate();
	}
	cout << "\tpushl\t" << arg << endl;
    }

    // call function
    cout << "\tcall\t" << _id->name() << endl;

    // reclaim space of arguments pushed onto stack
    if (bytesPushed > 0) {
	cout << "\taddl\t$" << bytesPushed << ", %esp" << endl;
    }
 
    cout << "\t#END CALL" << endl;
}

// ##################
// ##  STATEMENTS  ##
// ##################

/*
 * Function:    Return::generate
 *
 * Description:    Generate code for a return statement.
 *        Values are always returned in the %eax register.
 */
void Return::generate() {
    cout << "\t#RETURN" << endl;

    _expr->generate();
    load(_expr, eax);
    cout << "\tjmp\t" << *returnLabel << endl;

    cout << "\t#END RETURN" << endl;
}

/*
 * Function:    While::generate
 *
 * Description: Generate code for a while statement.
 */

void While::generate() {
    cout << "\t#WHILE" << endl;

    Label loop, exit;
    
    cout << loop << ":" << endl;
    
    _expr->test(exit, false);
    _stmt->generate();
    release();
    
    cout << "\tjmp\t" << loop << endl;
    cout << exit << ":" << endl;

    cout << "\t#END WHILE" << endl;
}

/*
 * Function:	If::generate
 *
 * Description: Generate code for an if statement.
 */
void If::generate() {
    cout << "\t#IF" << endl;

    Label skip, exit;
    
    _expr->test(skip, false);
    _thenStmt->generate();
    
    if (_elseStmt == nullptr) {
	cout << skip << ":" << endl;
    } else {
    	cout << "\tjmp\t" << exit << endl;
    	cout << skip << ":" << endl;
	_elseStmt->generate();
    	cout << exit << ":" << endl;
    } 
    
    cout << "\t#END IF" << endl;
}

/*
 * Function:    Assignment::generate
 *
 * Description: Generate code for simple assignments.
 *         Right hand side of assignment is always generated first.
 */
void Assignment::generate() {
    cout << "\t  #ASSIGNMENT" << endl;
    _right->generate();
    _left->generate();
    
    cout << "\tmov" << suffix(_left) << _right << ", " << _left << endl;
    cout << "\t  #END ASSIGNMENT" << endl;
}

// ###############
// ##  LOGICAL  ##
// ###############

/*
 * Function:	LogicalAnd::generate
 *
 * Description:	Generate code for a LogicalAnd expression.
 *		Generate code for left side. 
 *		Compare left to 0, exit if equal.
 *		Generate code for right side.
 *		Compare right to 0, exit if equal.
 */
void LogicalAnd::generate() {
    cout << "\t#AND" << endl;

    Label label;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    // move right side into temp reg
    Register *temp = getRegister();
    load(_right, temp);

    cout << "\tandl\t" << temp << ", " << _left << endl;
    cout << "\tcmp\t$0, " << temp << endl;
    cout << "\tje\t" << label << endl;
    cout << "\tmov\t$1, " << temp << endl;
    cout << label << ":" << endl;
    //cout << "\tmov\t$1, " << temp << nedl;
	/*
    _left->test(left, false);
    _right->test(left, false);

    Register *temp = getRegister();
    cout << "\tmov\t$0, " << temp << endl;
    cout << "\tjmp\t" << right << endl;
    cout << left << ":" << endl;
    cout << "\tmov\t$1, " << temp << endl;
    cout << right << ":" << endl;
	*/
    assign(this, temp);
	
    cout << "\t#END AND" << endl;
}

void LogicalOr::generate() {
    cout << "\t#OR" << endl;
/*
    Label label;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    Register *temp;
    temp = CALLEE_SAVED ? getCalleeRegister() : getRegister();
    load(_right, temp);
    cout << "\torl\t" << temp << ", " << _left << endl;
    cout << "\tcmp\t$0, " << temp << endl;
    cout << "\tje\t" << label << endl;
    cout << "\tmov\t$1, " << temp << endl;
    cout << label << ":" << endl;
    */
    Label L1, L2;

    // generate left side
    // compare to 0
    // jump to L1 if not 0
    ///_left->test(L1, true);
    //_right->test(L1, true);
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    // if (E1 != 0)
    //     result = 1
    cout << "\tcmpl\t$0, " << _left << endl;
    cout << "\tjne\t" << L1 << endl;

    // else if (E2 != 0)
    //     result = 1
    cout << "\tcmpl\t$0, " << _right << endl;
    cout << "\tjne\t" << L1 << endl;
    

    // else
    //     result = 0
    Register *temp = getRegister();
    cout << "\tmov\t$0, " << temp << endl;
    cout << "\tjmp\t" << L2 << endl;
    cout << L1 << ":" << endl;
    cout << "\tmov\t$1, " << temp << endl;
    cout << L2 << ":" << endl;

    assign(this, temp);
    cout << "\t#END OR" << endl;
}

// ###################
// ##  COMPARATIVE  ##
// ###################

void Equal::generate() {
    cout << "\t#EQUAL" << endl;

    Label left, right;

    _left->generate();
    _right->generate();
    //_left->test(left, true);
    //_right->test(right, true);

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmpl\t" << _right << ", " << _left << endl;
    cout << "\tsete\t" << _left->byteRegister() << endl;
    cout << "\tmovzbl\t" << _left->byteRegister();
    cout << ", " << _left->lwordRegister() << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END EQUAL" << endl;
}

void NotEqual::generate() {
    cout << "\t#NOT EQUAL" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }

    cout << "\tcmpl\t" << _right << ", " << _left << endl;
    cout << "\tsetne\t" << _left->byteRegister() << endl;
    cout << "\tmovzbl\t" << _left->byteRegister();
    cout << ", " << _left->lwordRegister() << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END EQUAL" << endl;

    cout << "\t#END NOT EQUAL" << endl;
}

void LessOrEqual::generate() {
    cout << "\t#LESS OR EQUAL" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmp\t" << _right << ", " << _left << endl;
    cout << "\tsetle\t" << _left->byteRegister() << endl;
    cout << "\tmovzbl\t" << _left->byteRegister();
    cout << ", " << _left->lwordRegister() << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END LESS OR EQUAL" << endl;
} 

void GreaterOrEqual::generate() {
    cout << "\t#GREATER OR EQUAL" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmp\t" << _right << ", " << _left << endl;
    cout << "\tsetge\t" << _left->byteRegister() << endl;
    cout << "\tmovzbl\t" << _left->byteRegister();
    cout << ", " << _left->lwordRegister() << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END GREATER OR EQUAL" << endl;
}

void LessThan::generate() {
    cout << "\t#LESS THAN" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmp\t" << _right << ", " << _left << endl;
    cout << "\tsetl\t" << _left->byteRegister() << endl;
    cout << "\tmovzbl\t" << _left->byteRegister();
    cout <<  ", " << _left->lwordRegister() << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END LESS THAN" << endl;
}

void GreaterThan::generate() {
    cout << "\t#GREATER THAN" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmp\t" << _right << ", " << _left << endl;
    cout << "\tsetg\t" << _left->byteRegister() << endl;
    cout << "\tmovzbl\t" << _left->byteRegister();
    cout << ", " << _left->lwordRegister() << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END GREATER THAN" << endl;
}

// ################
// ##  ADDITIVE  ##
// ################

/*
 * Function:    Add::generate
 *
 * Description: Generate code for an add expression.
 */
// DO NOT MODIFY
void Add::generate() {
    cout << "\t#ADD" << endl;
    
    // generate code for both left and right child
    _left->generate();
    _right->generate();
    
    // if left child not in register, allocate and load it
    if (_left->_register == nullptr) {
        load(_left, FP(_left) ? getFPRegister() : getRegister());
    }
    
    // perform operation
    cout << "\tadd" << suffix(_left);
    cout << _right << ", " << _left << endl;
    
    // if right operand in register, deallocate it
    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END ADD" << endl;
}

void Subtract::generate() {
    cout << "\t#SUBTRACT" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, FP(_left) ? getFPRegister() : getRegister());
    }

    cout << "\tsub" << suffix(_left);
    cout << _right << ", " << _left << endl;

    assign(_right, nullptr);
    assign(this, _left->_register);
    
    cout << "\t#END SUBTRACT" << endl;
}

// ######################
// ##  MULTIPLICATIVE  ##
// ######################

void Multiply::generate() {
    cout << "\t#MULTIPLY" << endl;

    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, FP(_left) ? getFPRegister() : getRegister());
    }

    cout << "\timul" << suffix(_left);
    cout << _right << ", " << _left << endl;;

    assign(_right, nullptr);
    assign(this, _left->_register);

    cout << "\t#END MULTIPLY" << endl;
}

void Divide::generate() {
    cout << "\t#DIVIDE" << endl;

    _left->generate();
    _right->generate();

    load(_left, eax);
 
    Register *temp;
    temp = CALLEE_SAVED ? getCalleeRegister() : getRegister();

    // integer division
    if (_right->type().isInteger()) {
	cout << "\tcltd" << endl;
	if (_right->_operand[0] == '$') {
	    load(_right, temp);
	    cout << "\tidivl\t" << temp << endl;
	} else {
	    cout << "\tidivl\t" << _right << endl;
	}
    }
    // floating-point division
    else {
	cout << "\tcqto" << endl;
	if (_right->_operand[0] == '$') {
	    load(_right, temp);
	    cout << "\tidivq\t" << temp << endl;
	} else {
	    cout << "\tidivq\t" << _right << endl;
    	}
    }

    assign(_right, nullptr);
    assign(this, eax);
    assign(nullptr, edx);
    assign(nullptr, temp);
    cout << "\t#END DIVIDE" << endl;
}

void Remainder::generate() {
    cout << "\t#REMAINDER" << endl;

    _left->generate();
    _right->generate();

    load(_left, eax);

    Register *temp;
    temp = CALLEE_SAVED ? getCalleeRegister() : getRegister();
    cout << "#temp=" << temp << endl; 
    
    //integer division
    if (_right->type().isInteger()) {
	cout << "\tcltd" << endl;
        if (_right->_operand[0] == '$') {
	    load(_right, temp);
     	    cout << "\tidivl\t" << temp << endl;
	} else {
	    cout << "\tidivl\t" << _right << endl;
    	}
    }                                                                            // floating-point division
    else {
	cout << "\tcqto" << endl;
	if (_right->_operand[0] == '$') {
            load(_right, temp);
	    cout << "\tidivq\t" << temp << endl;
        } else {
            cout << "\tidivq\t" << _right << endl;
    	}
    }
    
    assign(_right, nullptr);
    assign(this, edx);
    assign(nullptr, eax);
    assign(nullptr, temp); 
    cout << "\t#END REMAINDER" << endl;
}

// ##############
// ##  PREFIX  ##
// ##############

void Negate::generate() {
    cout << "\t#NEGATE" << endl;

    _expr->generate();

    if (_expr->_register == nullptr) {
	load(_expr, getRegister());
    }

    cout << "\tneg" << suffix(_expr) << _expr << endl;

    assign(this, _expr->_register);

    cout << "\t#END NEGATE" << endl;
}

void Not::generate() {
    cout << "\t#NOT" << endl;

    _expr->generate();

    if (_expr->_register == nullptr) {
	load(_expr, getRegister());
    }

    cout << "\tnot" << suffix(_expr) << _expr << endl;

    assign(this, _expr->_register);

    cout << "\t#END NOT" << endl;
}

/*
 * Function:	Address:generate
 *
 * Description:	Generate code for an address expression.
 * 		If the operand is *, do nothing.
 * 		If the operand is ID, use LEA instruction to load address.
 */
void Address::generate() {
    cout << "\t#ADDRESS" << endl;
    
    if (_expr->_operand == "*") {
	return;
    } else {
	_expr->generate();

	if (_expr->_register != nullptr) {
	    assign(this, _expr->_register);
	}

	assign(this, getRegister());
        // address is always 32-bit long
        cout << "\tleal\t" << _expr->_operand << ", " << this << endl;
    }
    cout << "\t#END ADDRESS" << endl;
}

void Dereference::generate() {
    cout << "\t#DEREFERENCE" << endl;

    _expr->generate();

    if (_expr->_register == nullptr) {
	load(_expr, getRegister());
    }

    cout << "\tmov" << suffix(_expr) << "\t(" << _expr->_register << "), ";
    cout << _expr->_register << endl;
    assign(this, _expr->_register);
    cout << "\t#END DEREFERENCE" << endl;
}

/*
 * Function:	Cast::generate
 *
 * Description:	NOT WORKING, DO LAST
 */
void Cast::generate() {
    cout << "\t#CAST" << endl;

    _expr->generate();

    if (_expr->type().size() >= _type.size()) {
	_operand = _expr->_operand;
	assign(this, _expr->_register);
    } else {
        Register *temp = getRegister();
        if (_expr->_operand[0] == '$') {
            load(_expr, temp);
        }

        cout << "\tmovs" << suffix(_expr,true) << suffix(this,true) << "\t";
	cout << _expr << ", " << temp->name(_type.size()) << endl;

        assign(this, temp);
    }

    cout << "\t#END CAST" << endl;
}

// ###############
// ##  PRIMARY  ##
// ###############

/*
 * Function:    Identifier::generate
 *
 * Description: Set _operand field. If offset is nonzero, operand is a parameter
 *         or local and set to the offset from the frame pointer.
 *         Otherwise, operand is global and set to the variable name.
 */
void Identifier::generate() {
    cout << "\t    #ID" << endl;
    int offset = _symbol->_offset;
    _operand = offset ? to_string(offset) + "(%ebp)" : _symbol->name();
    cout << "\t    #_operand = " << _operand << endl;
    cout << "\t    #END ID" << endl;
}

/*
 * Function:    Integer::generate
 *
 * Description: Set _operand field.
 */
void Integer::generate() {
    cout << "\t   #INT" << endl;
    _operand = "$" + value();
    cout << "\t   #_operand = " << _operand << endl;
    cout << "\t   #END INT" << endl;
}

void Real::generate() {
    cout << "\t   #REAL" << endl;    
    _operand = value();
}

void String::generate() {
    cout << "\t   #STRING" << endl;

    stringstream ss, temp;
    Label stringLabel;

    ss << stringLabel << ":\t.asciz\t" << value();
    temp << stringLabel;;
    _operand = temp.str();
    stringLabels.push_back(ss.str());
}

// ################
// ##    TEST    ##
// ################

/*
 * Function:    Expression::test
 *
 * Description: Generates code for the expression. Compares the result
 * 		against zero. Branches to the given label depending on the 
 * 		status of the ifTrue parameter.
 */
void Expression::test(const Label &label, bool ifTrue) {
    cout << "\t#EXPRESSION::TEST" << endl;
    generate();
    
    if (_register == nullptr) {
        load(this, getRegister());
    }
    
    cout << "\tcmpl\t$0, " << this << endl;
    cout << (ifTrue ? "\tjne\t" : "\tje\t") << label << endl;
    
    assign(this, nullptr);
}

/*
void LogicalAnd::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }
}
*/

//	if (left != 0)
//		result = 1
//	else if (right != 0)
//		result = 1
//	else
//		result = 0

/*

void LogicalOr::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmpl\t$0, " << _left << endl;
    cout << (ifTrue ? "\tje\t" : "\tjne\t") << label << endl;

    cout << "\tcmpl\t$), " << _right << endl;
    cout << "\t
}

void Equal::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }

    cout << "\tcmpl\t" << _right << ", " << _left << endl;
    cout << (ifTrue ? "\tje\t" : "\tjne") << label << endl;
}

void NotEqual::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }

    cout << "\tcmpl\t" << _right << ", " << _left << endl;
    cout << (ifTrue ? "\tjne\t" : "\tje") << label << endl;
}

void LessOrEqual::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }
    
    cout << "\tcmpl\t" << _right << ", " << _left << endl;
    cout << (ifTrue ? "\tjle\t" : "\tjg\t") << label << endl;

    assign(_left, nullptr);
    assign(_right, nullptr);}

void GreaterOrEqual::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }

    cout << "\tcmp\t" << _right << ", " << _left << endl;
    cout << (ifTrue ? "\tjge\t" : "\tjl\t") << label << endl;

    assign(_left, nullptr);
    assign(_right, nullptr);
}

*/

/*
 * Function:	LessThan::test
 * 
 * Description:	Specialized version of test for LessThan subclass.
 */

/*

void LessThan::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();
    
    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }
    
    cout << "\tcmpl\t" << _right << ", " << _left << endl;
    cout << (ifTrue ? "\tjl\t" : "\tjge\t") << label << endl;
    
    assign(_left, nullptr);
    assign(_right, nullptr);
}

*/

/*
 * Function:	GreaterThan::test
 *
 * Description:	Specialized version of test for GreaterThan subclass.
 */

/*
 
void GreaterThan::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << "\tcmp\t" << _right << ", " << _left << endl;
    cout << (ifTrue ? "\tjg\t" : "\tjle\t") << label << endl;

    assign(_left, nullptr);
    assign(_right, nullptr);
}

*/

/*
 * Function:	If::test
 *
 * Description: Specialized version of test for If subclass.
 */

/*
void If::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();

    if (_left->_register == nullptr) {
	load(_left, getRegister());
    }

    cout << 
}

*/

// ################
// ##    MISC    ##
// ################

/*
 * Function:    release
 *
 * Description: Release all registers.
 */
void release() {
    for (auto const &reg: registers) {
        assign(nullptr, reg);
    }

    for (auto const &fp_reg: fp_registers) {
	assign(nullptr, fp_reg);
    }	
}

/*
 * Function:    load
 *
 * Description: Load an expression into a given register.
 */
void load(Expression *expr, Register *reg) {
    //cout << "\t#LOAD" << endl;
    if (reg->_node != expr) {
        if (reg->_node != nullptr) {
	    unsigned size = reg->_node->type().size();
            assignTemp(reg->_node);
            cout << "\tmov" << suffix(reg->_node);
            cout << reg->name(size) << ", ";
            cout << reg->_node->_operand << endl;
        }
        
        if (expr != nullptr) {
            unsigned size = expr->type().size();
            cout << "\tmov" << suffix(expr) << expr;
            cout << ", " << reg->name(size) << endl;
        }
        
        assign(expr, reg);
    }
    //cout << "\t#END LOAD" << endl;
}

/*
 * Function:    assign
 *
 * Description: Maintains the proper mappings of registers and nodes. It is 
 * 		at the lowest level, unlike policy decisions which will be 
 * 		made at a higher level. This function does not emit any 
 * 		assebmly code to load values into registers, nor does it 
 * 		`perform any spills if the register is already in use.
 */
void assign(Expression *expr, Register *reg) {
    //cout << "\t#ASSIGN" << endl;

    if (expr != nullptr) {
        if (expr->_register != nullptr) {
            expr->_register->_node = nullptr;
        }
        expr->_register = reg;
    }
    
    if (reg != nullptr) {
        if (reg->_node != nullptr) {
            reg->_node->_register = nullptr;
        }
        reg->_node = expr;
    }

    //cout << "\t#END ASSIGN" << endl;
}

/*
 * Function:    assignTemp
 *
 * Description: Creates temporaries on the run-time stack to introduce spills.
 *      	For simplicity, we will just assign temporaries the next 
 *		available offset on the stack, just like locals.
 */
void assignTemp(Expression *expr) {
    tempOffset = tempOffset - expr->type().size();
    expr->_operand = to_string(tempOffset) + "(%ebp)";
}

/*
 * Function:	suffix
 *
 * Description:	Returns the correct instruction suffix based on the size of the
 *		given expression.
 */
string suffix(Expression *expr, bool isCast) {
    if (isCast) {
	return FP(expr) ? "sd" : (BYTE(expr) ? "b" : "l");
    }
    return FP(expr) ? "sd\t" : (BYTE(expr) ? "b\t" : "l\t");
}

Register *getCalleeRegister() {
    for (auto const &reg: callee_saved) {
	if (reg->_node == nullptr) {
	    return reg;
	}
    }
    load(nullptr, callee_saved[0]);  
    return callee_saved[0];
}
