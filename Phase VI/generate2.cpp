#include "Label.h"

/*
 * Function:	test
 *
 * Description: Generates code for the expression.
 *		Compares the result against zero.
 *		Branches to the given label depending on the status of the
 *		ifTrue parameter.
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

void LessThan::test(const Label &label, bool ifTrue) {
	_left->generate();
	_right->generate();
	
	if (_left->register == nullptr) {
		load(_left, getRegister());
	}

	cout << "\tcmpl\t" << _right << ", " << _left << end;
	cout << (ifTrue ? "\tjl\t" : "\tjge\t") << label << endl;
	
	assign(_left, nullptr);
	assign(_right, nullptr);
}

/*
 * Function:	Add::generate
 *
 * Description: Generate code for an add expression.
 */
void Add::generate() {
	// generate code for both left and right child
	_left->generate();
	_right->generate();

	// if left child not in register, allocate and load it
	if (_left->_register == nullptr) {
		load(_left, getRegister());
	}

	// perform operation
	cout << "\tadd" << suffix(_left);
	cout << _right << ", " << _left << endl;

	// if right operand in register, deallocate it
	assign(_right, nullptr);
	assign(this, _left->_register);
}

	
/*
 * Function:	While::generate
 *
 * Description: Generate code for a while statement.
 */

void While::generate() {
	Label loop, exit;

	cout << loop << ":" << endl;

	_expr->test(exit, false);
	_stmt->generate();
	release();

	cout << "\tjmp\t" << loop << endl;
	cout << Exit << ":" << endl;
}

/*
 * Function:	release
 *
 * Description: 
 */
void release() {
	for (auto const &reg: registers) {
		assign(nullptr, reg);
	}
}

/*
 * Function:	load
 *
 * Description:	Load an expression into a given register.
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
 * Function:	assign
 *
 * Description: Maintains the proper mappings of registers and nodes. It is
 *		at the lowest level, unlike policy decisions which will be made
 *		at a higher level. This function does not emit any assebmly code
 *		to load values into registers, nor does it perform any spills if
 *		the register is already in use.
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
 * Function:	assignTemp
 *
 * Description:	Creates temporaries on the run-time stack to introduce spills.
 *		For simplicity, we will just assign temporaries the next available
 *		offset on the stack, just like locals.
 */
void assignTemp(Expression *expr) {
	offset = offset - expr->type().size();
	expr->_operand = offset + "(%ebp);
}
