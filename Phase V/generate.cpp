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
	cout << "#glob size:" << globals.size() << endl;
	//	.comm	name,size,alignment
	for (unsigned i = 0; i < globals.size(); i++) {
		cout << "#" << i << endl;
		cout << "\t.comm\t" << globals[i]->name();
		cout << ", " << globals[i]->type().size();
		cout << ", " << globals[i]->type().size() << endl;
	}
	cout << "#we out" << endl;
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
	cout << "\tpushl\t%ebp" << endl;
	cout << "\tmovl\t%esp, %ebp" << endl;
    	cout << "\tsubl\t$" << -offset << ", %esp" << endl;
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
    _right->generate();
    _left->generate();
    
    cout << "\tmovl\t" << _right->operand << ", " << _left->operand << endl;
}

/*
 * Function:	Call::generate
 *
 * Description: Generate code for a function call.
 */
void Call::generate() {
    cout << "#CALL" << endl;
    //unsigned bytes = 0;
    for (int i = _args.size()-1; i >= 0; i--) {
    	_args[i]->generate();
        cout << "\tpushl\t" << _args[i]->operand << endl;
      //  bytes += _args[i]->type().size();
    }
    
    cout << "\tcall\t" << _id->name() << endl;
    
    //if (bytes > 0) {
      //  cout << "\taddl\t" << bytes << ", %esp" << endl;
    //}
}

/*
 * Function:	Integer::generate
 *
 * Description: Set _operand field.
 */
void Integer::generate() {
    cout << "#INT" << endl;
    operand = "$" + value();
}

/*
 * Function:	Identifier::generate
 *
 * Description: Set _operand field.
 */
void Identifier::generate() {
    cout << "#ID" << endl;
    stringstream ss;
    ss << symbol()->offset;
    string sOff = ss.str();
    if (_symbol->offset == 0) {
        operand = _symbol->name();
    } else {
    	operand = sOff + "(%ebp)";	
    }
}
