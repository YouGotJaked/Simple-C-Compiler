#include <sstream>
#include <iostream>
#include "Tree.h"

using std::cout;
using std::endl;
using std::stringstream;

/*
 * Function:	generateGlobals
 * 
 * Description: Given a scope, define all global variables (ignore functions).
 */
void generateGlobals(const Symbols &globals) {
    cout << "#GLOBALS" << endl;
	//if (globals.size() > 0) {
	//	cout << "\t.data" << endl;
	//}

	//	.comm	name,size,alignment
	for (auto const &var: globals) {
		cout << "\t.comm\t" << var->name();
		cout << ", " << var->type().size();
		cout << ", " << var->type().size() << endl;
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
	cout << _id->name() << ":" << endl;
	cout << "\tpush\t%ebp" << endl;
	cout << "\tmovl\t%esp, %ebp" << endl;
    cout << "\tsubl\t$" << ((offset >= 0) ? offset : -offset) << ", %esp" << endl;
	// body
    _body->generate();
	// epilogue
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
    cout << "#BLOCK" << endl;
	for (auto const &stmt: _stmts) {
		stmt->generate();
	}
}

/*
 * Function:	Assignment::generate
 *
 * Description: Generate code for simple assignments.
 */
void Assignment::generate() {
    cout << "#ASSIGNMENT" << endl;
    _left->generate();
    _right->generate();
    
    cout << "\tmovl\t" << _right << ", %esp" << endl;
    cout << "\tmovl\t" << "%eax, " << _left << endl;
}

/*
 * Function:	Call::generate
 *
 * Description: Generate code for a function call.
 */
void Call::generate() {
    cout << "#CALL" << endl;
    unsigned bytes = 0;
    
    int i = _args.size();
    
    while (--i >= 0) {
        _args[i]->generate();
        cout << "\tpushl\t" << _args[i] << endl;
        bytes += _args[i]->type().size();
    }
    
    cout << "\tcall\t" << _id->name() << endl;
    
    if (bytes > 0) {
        cout << "\taddl\t" << bytes << ", %esp" << endl;
    }
}

/*
 * Function:	Integer::generate
 *
 * Description: Set _operand field.
 */
void Integer::generate() {
    cout << "#INT" << endl;
    stringstream ss;
    ss << "$" << _value;
    _operand = ss.str();
}

/*
 * Function:	Identifier::generate
 *
 * Description: Set _operand field.
 */
void Identifier::generate() {
    cout << "#ID" << endl;
    stringstream ss;
    int offset = _symbol->offset();
    
    if (offset) {
        ss << offset << "(%ebp)";
    } else {
        ss << _symbol->name();
    }
    
    _operand = ss.str();
    
}
