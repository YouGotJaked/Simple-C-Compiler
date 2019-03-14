#include <iostream>
#include "checker.h"
#include "tokens.h"
#include "Tree.h"

using std::min;
using std::cout;
using std::endl;

/*
 * Function:    Function::allocate
 *
 * Description: Allocate storage for a function and its parameters.
 */
void Function::allocate(int &offset) const {
    Parameters *params;
    Symbols symbols;

    params = _id->type().parameters();
    symbols = _body->declarations()->symbols();

    for (unsigned i = 0; i < params->size(); i ++) {
	symbols[i]->_offset = offset;
	offset += (*params)[i].promote().size();
    }

    offset = 0;
    _body->allocate(offset);
}

void Block::allocate(int &offset) const {
    int temp, saved;
    Symbols symbols = _decls->symbols();
    
    for (auto const &s: symbols) {
	if (s->_offset == 0) {
            offset -= s->type().size();
            s->_offset = offset;
	}
    }
    
    saved = offset;
    
    for (auto const &stmt: _stmts) {
        temp = saved;
        stmt->allocate(temp);
        offset = min(offset, temp);
    }
}

void While::allocate(int &offset) const {
    _stmt->allocate(offset);
}

void If::allocate(int &offset) const {
    int saved, temp;
    saved = offset;
    _thenStmt->allocate(offset);
   
     if (_elseStmt != nullptr) {
        temp = saved;
        _elseStmt->allocate(temp);
        offset = min(offset, temp);
    }
}
