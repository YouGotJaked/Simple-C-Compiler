/*
 * File:	generator.cpp
 *
 * Description:	This file contains the public and member function
 *		definitions for the code generator for Simple C.
 *
 *		Extra functionality:
 *		- putting all the global declarations at the end
 */

# include <sstream>
# include <iostream>
# include "generator.h"
# include "machine.h"
# include "Tree.h"

using namespace std;


/* This needs to be set to zero if temporaries are placed on the stack. */

# define SIMPLE_PROLOGUE 1


/* This should be set if we want to use the callee-saved registers. */

# define CALLEE_SAVED 0


/* The registers and their related functions */

typedef vector<Register *>Registers;

static Register *ebx = new Register("%ebx", "%bl");
static Register *esi = new Register("%esi");
static Register *edi = new Register("%edi");

# if CALLEE_SAVED
static Registers callee_saved = {ebx, esi, edi};
# else
static Registers callee_saved = {};
# endif

/* Global pointer to label */
static Label *returnLabel;

/*
 * Function:	align (private)
 *
 * Description:	Return the number of bytes necessary to align the given
 *		offset on the stack.
 */

static int align(int offset)
{
    if (offset % STACK_ALIGNMENT == 0)
	return 0;

    return STACK_ALIGNMENT - (abs(offset) % STACK_ALIGNMENT);
}


/*
 * Function:	operator << (private)
 *
 * Description:	Write an expression to the specified stream.  This function
 *		first checks to see if the expression is in a register, and
 *		if not then uses its operand.
 */

static ostream &operator <<(ostream &ostr, Expression *expr)
{
    if (expr->_register != nullptr)
	return ostr << expr->_register;

    return ostr << expr->_operand;
}


/*
 * Function:	Identifier::generate
 *
 * Description:	Generate code for an identifier.  Since there is really no
 *		code to generate, we simply update our operand.
 */

void Identifier::generate()
{
    stringstream ss;


    if (_symbol->_offset != 0)
	ss << _symbol->_offset << "(%ebp)";
    else
	ss << global_prefix << _symbol->name();

    _operand = ss.str();
}


/*
 * Function:	Integer::generate
 *
 * Description:	Generate code for an integer.  Since there is really no
 *		code to generate, we simply update our operand.
 */

void Integer::generate()
{
    stringstream ss;


    ss << "$" << _value;
    _operand = ss.str();
}


/*
 * Function:	Call::generate
 *
 * Description:	Generate code for a function call expression.
 *
 *		NOT FINISHED: Only guaranteed to work if the argument is
 *		either an integer literal or an integer scalar variable.
 */

void Call::generate()
{
    unsigned bytesPushed = 0;


    /* Compute how many bytes will be pushed on the stack. */

    for (int i = _args.size() - 1; i >= 0; i --) {
	bytesPushed += _args[i]->type().size();

	if (STACK_ALIGNMENT != 4 && _args[i]->_hasCall)
	    _args[i]->generate();
    }


    /* Adjust the stack keep it aligned.  We do this by simply subtracting
       the necessary number of bytes from the stack pointer.  Effectively,
       we are pushing nonexistent arguments on the stack so that the total
       number of bytes pushed is a multiple of the alignment. */

    if (align(bytesPushed) > 0) {
	cout << "\tsubl\t$" << align(bytesPushed) << ", %esp" << endl;
	bytesPushed += align(bytesPushed);
    }


    /* Push each argument on the stack. */

    for (int i = _args.size() - 1; i >= 0; i --) {
	if (STACK_ALIGNMENT == 4 || !_args[i]->_hasCall)
	    _args[i]->generate();

	cout << "\tpushl\t" << _args[i] << endl;
    }


    /* Call the function and then adjust the stack pointer back. */

    cout << "\tcall\t" << global_prefix << _id->name() << endl;

    if (bytesPushed > 0)
	cout << "\taddl\t$" << bytesPushed << ", %esp" << endl;
}


/*
 * Function:	Assignment::generate
 *
 * Description:	Generate code for an assignment statement.
 *
 *		NOT FINISHED: Only guaranteed to work if the right-hand
 *		side is an integer literal and the left-hand side is an
 *		integer scalar.
 */

void Assignment::generate()
{
    cout << "\t  #ASSIGNMENT" << endl;
    _left->generate();
    _right->generate();
    cout << "\tmovl\t" << _right << ", " << _left << endl;
    cout << "\t  #END ASSIGNMENT" << endl;
}


/*
 * Function:	Block::generate
 *
 * Description:	Generate code for this block, which simply means we
 *		generate code for each statement within the block.
 */

void Block::generate()
{
    for (unsigned i = 0; i < _stmts.size(); i ++)
	_stmts[i]->generate();
}


/*
 * Function:	Function::generate
 *
 * Description:	Generate code for this function, which entails allocating
 *		space for local variables, then emitting our prologue, the
 *		body of the function, and the epilogue.
 *
 *		The stack must be aligned at the point at which a function
 *		begins execution.  Since the call instruction pushes the
 *		return address on the stack and each function is expected
 *		to push its base pointer, we adjust our offset by that
 *		amount and then perform the alignment.
 *
 *		On a 32-bit Intel platform, 8 bytes are pushed (4 for the
 *		return address and 4 for the base pointer).  Since Linux
 *		requires a 4-byte alignment, all we need to do is ensure
 *		the stack size is a multiple of 4, which will usually
 *		already be the case.  However, since OS X requires a
 *		16-byte alignment (thanks, Apple, for inventing your own
 *		standards), we will often see an extra amount of stack
 *		space allocated.
 *
 *		On a 64-bit Intel platform, 16 bytes are pushed (8 for the
 *		return address and 8 for the base pointer).  Both Linux and
 *		OS X require 16-byte alignment.
 */

void Function::generate()
{
    int param_offset, offset;


    /* Generate our prologue. */

    param_offset = PARAM_OFFSET + SIZEOF_REG * callee_saved.size();
    offset = param_offset;
    allocate(offset);

    cout << global_prefix << _id->name() << ":" << endl;
    cout << "\tpushl\t%ebp" << endl;

    for (unsigned i = 0; i < callee_saved.size(); i ++)
	cout << "\tpushl\t" << callee_saved[i] << endl;

    cout << "\tmovl\t%esp, %ebp" << endl;

    if (SIMPLE_PROLOGUE) {
	offset -= align(offset - param_offset);
	cout << "\tsubl\t$" << -offset << ", %esp" << endl;
    } else
	cout << "\tsubl\t$" << _id->name() << ".size, %esp" << endl;


    /* Generate the body of this function. */

    _body->generate();


    /* Generate our epilogue. */

    cout << "\tmovl\t%ebp, %esp" << endl;

    for (int i = callee_saved.size() - 1; i >= 0; i --)
	cout << "\tpopl\t" << callee_saved[i] << endl;

    cout << "\tpopl\t%ebp" << endl;
    cout << "\tret" << endl << endl;

    if (!SIMPLE_PROLOGUE) {
	offset -= align(offset - param_offset);
	cout << "\t.set\t" << _id->name() << ".size, " << -offset << endl;
    }

    cout << "\t.globl\t" << global_prefix << _id->name() << endl << endl;
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
    //cout << "\tjmp\t" << *returnLabel << endl;
    
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
 * Function:    If::generate
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
    
    cout << "\tmov" << suffix(_left) << _right->_operand << ", " << _left->_operand << endl;

}

// ###############
// ##  LOGICAL  ##
// ###############

void LogicalAnd::generate() {
}

void LogicalOr::generate() {
    cout << "\t#OR" << endl;
    
    Label left, right;
    
    _left->test(left, true);
    _right->test(left, true);
    
    Register *temp = getRegister();
    cout << "\tmov\t $0, " << temp << endl;
    cout << "\tjmp\t" << right << endl;
    cout << left << ":" << endl;
    cout << "\tmov\t $1, " << temp << endl;
    cout << right << ":" << endl;
    
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
    cout << "\tsete\t" << _left->_register->name(1) << endl;
    cout << "\tmovezbl\t" << _left->_register->name(1) << ", " << _left->_register->name(4) << endl;
    
    assign(_right, nullptr);
    assign(this, _left->_register);
    
    cout << "\t#END EQUAL" << endl;
}

void NotEqual::generate() {
    cout << "\t#NOT EQUAL" << endl;
    
    Label left, right;
    
    _left->test(left, true);
    _right->test(right, true);
    
    cout << "\t#END NOT EQUAL" << endl;
}

void LessOrEqual::generate() {
}

void GreaterOrEqual::generate() {
}

void LessThan::generate() {
    cout << "\t#LESS THAN" << endl;
    
    Label left, right;
    
    _left->test(left, true);
    _right->test(right, true);
    
    cout << "\t#END LESS THAN" << endl;
}

void GreaterThan::generate() {
    cout << "\t#GREATER THAN" << endl;
    
    Label left, right;
    
    _left->test(left, true);
    _right->test(right, true);
    
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
    cout << _right << ", " << _left->_register << endl;
    
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
    cout << _right->_operand << ", " << _left->_operand << endl;;
    
    assign(_right, nullptr);
    assign(this, _left->_register);
    
    cout << "\t#END MULTIPLY" << endl;
}

void Divide::generate() {
    cout << "\t#DIVIDE" << endl;
    
    _left->generate();
    _right->generate();
    
    load(_left, eax);
    load(_right, ecx);
    load(nullptr, edx);
    
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
    load(_right, ecx);
    load(nullptr, edx);
    
    // sign extend
    cout << "\tmovl\t %eax, %edx" << endl;
    cout << "\tsarl\t$31, %edx" << endl;
    
    cout << "\tidivl\t" << _right << endl;
    
    assign(_right, nullptr);
    assign(this, edx);
    assign(nullptr, eax);
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
    
    cout << "\tneg" << suffix(_expr) << "\t" << _expr << endl;
    
    assign(this, _expr->_register);
    
    cout << "\t#END NEGATE" << endl;
}

void Not::generate() {
    cout << "\t#NOT" << endl;
    
    _expr->generate();
    
    if (_expr->_register == nullptr) {
        load(_expr, getRegister());
    }
    
    cout << "\tnot" << suffix(_expr) << "\t" << _expr << endl;
    
    assign(this, _expr->_register);
    
    cout << "\t#END NOT" << endl;
}

/*
 * Function:    Address:generate
 *
 * Description:    Generate code for an address expression.
 *         If the operand is *, do nothing.
 *         If the operand is ID, use LEA instruction to load address.
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
        cout << "\tleal\t" << _expr->_operand << ", %eax" << endl;
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
 * Description: Generates code for the expression. Compares the result against
 *        zero. Branches to the given label depending on the status of the
 *            ifTrue parameter.
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


void LogicalAnd::test(const Label &label, bool ifTrue) {
    _left->generate();
    _right->generate();
    
    if (_left->_register == nullptr) {
        load(_left, getRegister());
    }
}
/*
 void LogicalOr::test(const Label &label, bool ifTrue) {
 _left->generate();
 _right->generate();
 
 if (_left->_register == nullptr) {
 load(_left, getRegister());
 }
 
 cout << "\torl\t" << _right << ", " << _left << endl;
 cout << "\tcmpl\t$0, " << _right << endl;
 cout << (ifTrue ? "\tje\t" : "\tjne\t") << label << endl;
 }
 */
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

/*
 * Function:    LessThan::test
 *
 * Description:    Specialized version of test for LessThan subclass.
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

/*
 * Function:    GreaterThan::test
 *
 * Description:    Specialized version of test for GreaterThan subclass.
 */
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


/*
 * Function:    If::test
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
 }*/

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
            //cout << "\t#reg->_node != expr" << endl;
            unsigned size = reg->_node->type().size();
            assignTemp(reg->_node);
            cout << "\tmov" << suffix(reg->_node);
            cout << reg->name(size) << ", ";
            cout << reg->_node->_operand << endl;
        }
        
        if (expr != nullptr) {
            //cout << "\t#expr != nullptr" << endl;
            //cout << "\t#expr = " << expr << endl;
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
 * Description: Maintains the proper mappings of registers and nodes. It is at
 *        the lowest level, unlike policy decisions which will be made
 *            at a higher level. This function does not emit any assebmly code
 *          to load values into registers, nor does it perform any spills if
 *            the register is already in use.
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
 *          For simplicity, we will just assign temporaries the next
 *        available offset on the stack, just like locals.
 */
void assignTemp(Expression *expr) {
    offset = offset - expr->type().size();
    expr->_operand = to_string(offset) + "(%ebp)";
}

/*
 * Function:    suffix
 *
 * Description:    Returns the correct instruction suffix based on the size of the
 *        given expression.
 */
string suffix(Expression *expr) {
    return FP(expr) ? "sd\t" : (BYTE(expr) ? "b\t" : "l\t");
}




/*
 * Function:	generateGlobals
 *
 * Description:	Generate code for any global variable declarations.
 */

void generateGlobals(Scope *scope)
{
    const Symbols &symbols = scope->symbols();

    for (unsigned i = 0; i < symbols.size(); i ++)
	if (!symbols[i]->type().isFunction()) {
	    cout << "\t.comm\t" << global_prefix << symbols[i]->name() << ", ";
	    cout << symbols[i]->type().size() << endl;
	}
}
