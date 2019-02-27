#include "Tree.h"

/*
 * Function:	generateGlobals
 * 
 * Description: Given a scope, define all global variables (ignore functions).
 */
void generateGlobals(const Symbols &globals) {
	if (globals.size() > 0) {
		cout << "\t.data" << endl;
	}

	for (auto const &var: globals) {
		cout << "\t.comm\t" << 
	}
}

/*
 * Function:	Function::generate
 *
 * Description: Generate code for statements.
 */
void Function::generate() {
	// assign offsets
	// prologue
	// epilogue
	// gen code
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
