#include <sstream>
#include <iostream>
#include <iterator>
#include <algorithm>
#include <vector>
#include "Tree.h"
#include "Label.h"
#include "generate.h"

#define FP(expr)	( (expr)->type().isReal() )
#define BYTE(expr)	( (expr)->type().size() == 1 )

using std::cout;
using std::endl;
using std::string;
using std::to_string;
using std::stringstream;
using std::vector;
using std::reverse;
using std::begin;
using std::end;

static int offset = 0;
static vector<string> stringLabels;
static Label *returnLabel;

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
    int offset = 0;
    cout << "#here" << endl;
    allocate(offset);
    cout << "#here" << endl;
    cout << ".globl " << _id->name() << endl; 
    prologue(offset);
    cout << "\t#BODY" << endl;
    _body->generate();
    epilogue();
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
    /*
    reverse(begin(_args), end(_args));
    
    for (auto const &arg: _args) {
	arg->generate();
	cout << "\tpushl\t" << arg->_operand << endl;
    }
    */
    for (int i = _args.size() - 1; i >= 0; i --) {
        _args[i]->generate();
        cout << "\tpushl\t" << _args[i] << endl;
    }
    cout << "\tcall\t" << _id->name() << endl;    
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
}

/*
 * Function:	If::generate
 *
 * Description: Generate code for an if statement.
 */
void If::generate() {
    cout << "\t#IF" << endl;
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
   
    if (_left->dereference() == nullptr) {
	_left->generate();
    } else {
	_left->dereference()->generate();
    }

    stringstream ss;

    if (_left->dereference() == nullptr) {
	ss << _left;
    } else {
	if (_left->dereference()->_register == nullptr) {
	    load(_left->dereference(), getRegister());
	}
	ss << "(" << _left->dereference() << ")";
    }
    
    cout << "\tmov" << suffix(_left) << "\t" << _right << ", " << ss.str() << endl;
}

// ###############
// ##  LOGICAL  ##
// ###############

void LogicalAnd::generate() {
}

void LogicalOr::generate() {
}

// ###################
// ##  COMPARATIVE  ##
// ###################

void Equal::generate() {
}

void NotEqual::generate() {
}

void LessOrEqual::generate() {
} 

void GreaterOrEqual::generate() {
}

void LessThan::generate() {
}

void GreaterThan::generate() {
}

// ################
// ##  ADDITIVE  ##
// ################

/*
 * Function:    Add::generate
 *
 * Description: Generate code for an add expression.
 */
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
    cout << _right << ", " << _left;

    assign(_right, nullptr);
    assign(this, _left->_register);
}

void Divide::generate() {
    cout << "\t#DIVIDE" << endl;

    _left->generate();
    _right->generate();

    load(_left, eax);
    
    // sign extend
    cout << "\tmovl\t %eax, %edx" << endl;
    cout << "\tsarl\t$31, %edx" << endl;

    cout << "\tidivl\t" << _right << endl;

    assign(_right, nullptr);
    assign(this, eax);
    assign(nullptr, edx);
}


void Remainder::generate() {
    cout << "\t#REMAINDER" << endl;

    _left->generate();
    _right->generate();

    load(_left, eax);
    
    // sign extend
    cout << "\tmovl\t %eax, %edx" << endl;
    cout << "\tsarl\t$31, %edx" << endl;

    cout << "\tidivl\t" << _right << endl;

    assign(_right, nullptr);
    assign(this, edx);
    assign(nullptr, eax);
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

    cout << "\tneg" << suffix(_expr) << "\t" << _expr << endl;

    assign(this, _expr->_register);
}

void Not::generate() {
    cout << "\t#NOT" << endl;

    _expr->generate();

    if (_expr->_register == nullptr) {
	load(_expr, getRegister());
    }

    cout << "\tnot" << suffix(_expr) << "\t" << _expr << endl;

    assign(this, _expr->_register);
}

void Address::generate() {
    cout << "\t#ADDRESS" << endl;
 
    if (_expr->dereference() != nullptr) {
        _expr->dereference()->generate();
        assign(this, _expr->dereference()->_register);
    } else {
        _expr->generate();

        if (_expr->_register == nullptr) {
            assign(_expr, getRegister());
        }

        // address is always 32-bit long
        assign(this, _expr->_register);
        cout << "\tleal\t" << _expr << ", %eax" << endl;
    }
}

void Dereference::generate() {
    cout << "\t#DEREFERENCE" << endl;

    _expr->generate();

    if (_expr->_register == nullptr) {
	load(_expr, getRegister());
    }

    cout << "\tmov" << suffix(_expr) << "\t(" << _expr << "), ";
    cout << _expr->_register->name(_type.size()) << endl;
    assign(this, _expr->_register);
}

void Cast::generate() {
    cout << "\t#CAST" << endl;

    _expr->generate();

    if (_expr->type().size() < _type.size()) {
	if (_expr->type().isInteger()) {
	    load(_expr, getRegister());
	}

	cout << "\tmovs" << suffix(_expr) << suffix(this) << "\t";
	cout  << _expr << ", " << _register->name(_type.size()) << endl;

	assign(this, _register);
    }
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
}

/*
 * Function:    Integer::generate
 *
 * Description: Set _operand field.
 */
void Integer::generate() {
    cout << "\t   #INT" << endl;
    _operand = "$" + value();
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
 * Description: Generates code for the expression. Compares the result against 
 *		zero. Branches to the given label depending on the status of the
 *        	ifTrue parameter.
 */
void Expression::test(const Label &label, bool ifTrue) {
    generate();
    
    if (_register == nullptr) {
        load(this, getRegister());
    }
    
    cout << "\tcmpl\t$0, " << this << endl;
    cout << (ifTrue ? "\tjne\t" : "\tje\t") << label << endl;
    
    assign(this, nullptr);
}

/*
 * Function:	LessThan::test
 * 
 * Description:	Specialized version of test for LessThan subclass.
 */
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
    unsigned size;
    
    if (reg->_node != expr) {
        if (reg->_node != nullptr) {
            size = reg->_node->type().size();
            
            assignTemp(reg->_node);
            cout << "\tmov" << suffix(reg->_node) << expr;
            cout << ", " << reg->name(size) << ", ";
            cout << reg->_node->_operand << endl;
        }
        
        if (expr != nullptr) {
            size = expr->type().size();
            cout << "\tmov" << suffix(expr) << expr;
            cout << ", " << reg->name(size) << endl;
        }
        
        assign(expr, reg);
    }
}

/*
 * Function:    assign
 *
 * Description: Maintains the proper mappings of registers and nodes. It is at
 *		the lowest level, unlike policy decisions which will be made
 *	        at a higher level. This function does not emit any assebmly code
 *      	to load values into registers, nor does it perform any spills if
 *        	the register is already in use.
 */
void assign(Expression *expr, Register *reg) {
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
}

/*
 * Function:    assignTemp
 *
 * Description: Creates temporaries on the run-time stack to introduce spills.
 *      	For simplicity, we will just assign temporaries the next 
 *		available offset on the stack, just like locals.
 */
void assignTemp(Expression *expr) {
    offset = offset - expr->type().size();
    expr->_operand = to_string(offset) + "(%ebp)";
}

/*
 * Function:	suffix
 *
 * Description:	Returns the correct instruction suffix based on the size of the
 *		given expression.
 */
string suffix(Expression *expr) {
    return FP(expr) ? "sd\t" : (BYTE(expr) ? "b\t" : "l\t");
}

