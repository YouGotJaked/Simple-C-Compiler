#include <iostream>
#include <iterator>
#include <algorithm>
#include "Tree.h"

using std::cout;
using std::endl;
using std::to_string;
using std::reverse;
using std::begin;
using std::end;

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

/*
 * Function:    Function::allocate
 *
 * Description: Allocate storage for a function and its parameters.
 *              Since all types are INT for this assignment, offset will
 *              always be a multiple of 4.
 */
void Function::allocate(int &offset) {
    Symbol *param, *local;

    // first parameter offset is always 8
    offset = 8;
    int pSize = _id->type().parameters()->size();

    for (int i = 0; i < pSize; i++) {
	param = _body->declarations()->symbols()[i];
	param->_offset = offset;
        offset += 4;
    }
    
    offset = 0;
    int lSize = _body->declarations()->symbols().size();
    
    // local variables referenced via negative offsets from frame pointer
    for (int i = pSize; i < lSize; i++) {
        local = _body->declarations()->symbols()[i];
        // if array, multiply offset by its length
	int length = local->type().isArray() ? local->type().length() : 1;
        offset -= length * 4;
    	local->_offset = offset;
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
    allocate(offset);
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
 * Function:	Assignment::generate
 *
 * Description: Generate code for simple assignments.
 * 		Right hand side of assignment is always generated first.
 */
void Assignment::generate() {
    cout << "\t  #ASSIGNMENT" << endl;
    
    _right->generate();
    _left->generate();
    
    cout << "\tmovl\t" << _right->_operand << ", " << _left->_operand << endl;
}

/*
 * Function:	Call::generate
 *
 * Description: Generate code for a function call. Arguments are pushed in
 * 		reverse order.
 */
void Call::generate() {
    cout << "\t#CALL" << endl;
    reverse(begin(_args), end(_args));
    
    for (auto const &arg: _args) {
	arg->generate();
	cout << "\tpushl\t" << arg->_operand << endl;
    }
    
    cout << "\tcall\t" << _id->name() << endl;    
}

/*
 * Function:	Integer::generate
 *
 * Description: Set _operand field.
 */
void Integer::generate() {
    cout << "\t   #INT" << endl;
    _operand = "$" + value();
}

/*
 * Function:	Identifier::generate
 *
 * Description: Set _operand field. If offset is nonzero, operand is a parameter
 * 		or local and set to the offset from the frame pointer. 
 * 		Otherwise, operand is global and set to the variable name.
 */
void Identifier::generate() {
    cout << "\t    #ID" << endl;
    int offset = _symbol->_offset;
    _operand = offset ? to_string(offset) + "(%ebp)" : _symbol->name();
}

