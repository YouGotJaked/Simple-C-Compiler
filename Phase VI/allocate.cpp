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

void Block::allocate(int &offset) {
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

void While::allocate(int &offset) {
    _stmt->allocate(offset);
}

void If::allocate(int &offset) {
    int saved, temp;
    saved = offset;
    _thenStmt->allocate(offset);
    if (_elseStmt != nullptr) {
        temp = saved;
        _elseStmt->allocate(temp);
        offset = min(offset, temp);
    }
}
