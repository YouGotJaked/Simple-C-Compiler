#include <iostream>
#include "Tree.h"

using std::cout;
using std::endl;

void Function::allocate(const int &offset) {
	offset = 8;
	int pSize = _id->type().parameters()->size();
	
	for (int i = 0; i < pSize; i++) {
		_body->declarations()->symbols()[i]->offset() = offset;
		offset += 4;
	}
	
	offset = 0;	
	int dSize = _body->declarations()->symbols().size();
	
	for (int i = pSize; i < dSize; i++) {
		if (_body->declarations()->symbols()[i]->type().isArray()) {
			int length == _body->declarations()->symbols()[i]->type().length();
			offset -= length * 4;
			_body->declarations()->symbols()[i]->offset = offset;
		} else if (_body->declarations()->symbols[i]->type().isScalar()) {
			offsset -= 4;
			_body->declarations()->symbols()[i]->offset = offset;
		}
	}
}