#include <iostream>
#include "Tree.h"

using std::cout;
using std::endl;
using std::to_string;

/*
 * Function:	generateGlobals
 * 
 * Description: Given a scope, define all global variables (ignore functions).
 *
 * Format:
 * 	.comm	name, size, alignment
 */
void generateGlobals(const Symbols &globals) {
    cout << "#GLOBALS" << endl;
    for (auto const &arg: globals) {
        cout << "\t.comm\t" << arg->name();
        cout << ", " << arg->type().size();
        cout << ", " << arg->type().size() << endl;
   }
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
	// prologue
    cout << "\t#PROLOGUE" << endl;
	cout << _id->name() << ":" << endl;
	cout << "\tpushl\t%ebp" << endl;
	cout << "\tmovl\t%esp, %ebp" << endl;
    	cout << "\tsubl\t$" << -offset << ", %esp" << endl;
	// body
    cout << "\t#BODY" << endl;
    _body->generate();
	// epilogue
    cout << "\t#EPILOGUE" << endl;
	cout << "\tmovl\t%ebp, %esp" << endl;
	cout << "\tpopl\t%ebp" << endl;
	cout << "\tret" << endl;
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
 * Description: Generate code for simple assignments. Right hand side of assignment is always generated first.
 */
void Assignment::generate() {
    cout << "\t  #ASSIGNMENT" << endl;
    _right->generate();
    _left->generate();
    
    cout << "\tmovl\t" << _right->_operand << ", %eax" << endl;
    cout << "\tmovl\t%eax, " << _left->_operand << endl;
}

/*
 * Function:	Call::generate
 *
 * Description: Generate code for a function call.
 */
void Call::generate() {
    cout << "\t#CALL" << endl;
    
    for (int i = _args.size()-1; i >= 0; i--) {
    	_args[i]->generate();
        cout << "\tpushl\t" << _args[i]->_operand << endl;
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
 * Description: Set _operand field. If offset is nonzero, operand is offset from frame pointer. Otherwise, operand is the variable name.
 */
void Identifier::generate() {
    cout << "\t    #ID" << endl;
    int offset = _symbol->_offset;
    cout << "#ID::gen() offset=" << offset << endl;
    _operand = offset ? to_string(offset) + "(%ebp)" : _symbol->name();
}

