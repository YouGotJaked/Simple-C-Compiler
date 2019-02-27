#include <iostream>
#include "Tree.h"
#include "arc.h"

using std::cout;
using std::endl;

/*
 * Function:	generateGlobals
 * 
 * Description: Given a scope, define all global variables (ignore functions).
 */
void generateGlobals(const Symbols &globals) {
	if (globals.size() > 0) {
		cout << "\t.data" << endl;
	}

	//	.comm	name,size,alignment
	for (auto const &var: globals) {
		cout << "\t.comm\t" << "_" << var->name();
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
	// assign offsets
	// prologue
	cout << "_" << _id->name() << ":" << endl;
	cout << "\tpush\t%ebp" << endl;
	cout << "\tmovl\t%esp, %ebp" << endl;
	cout << "\tsubl\t$" << _id->name() << ".size, %esp" << endl;
	// body
	
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

}

/*
 * Function:	Call::generate
 *
 * Description: Generate code for a function call.
 */
void Call::generate() {
	
}

/*
 * Function:	Integer::generate
 *
 * Description: Set _operand field.
 */
void Integer::generate() {

}

/*
 * Function:	Identifier::generate
 *
 * Description: Set _operand field.
 */
void Identifier::generate() {

}
