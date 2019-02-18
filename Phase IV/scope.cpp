#include <algorithm>
#include <assert.h>
#include "scope.h"

using std::vector;
using std::stack;
using std::string;
using std::remove;

Scope::Scope(Scope *enclosing)
    : _enclosing(enclosing)
{
}

/*
 *  Insert a symbol into the scope.
 */
void Scope::insert(Symbol *symbol) {
    assert(find(symbol->name()) == nullptr);
    _symbols.push_back(symbol);
}

/*
 *  Remove a symbol with the given name from the scope.
 */
void Scope::remove(const string &name) {
    int i = 0;
    for (auto const &symbol: _symbols) {
        if (symbol->name() == name) {
            _symbols.erase(_symbols.begin() + i);
        } else {
            i++;
        }
    }
}

/*
 *  Search a given scope for a name.
 */
Symbol *Scope::find(const string &name) const {
    for (auto const &symbol: _symbols) {
        if (symbol->name() == name) {
            return symbol;
        }
    }
    return nullptr;
}

/*
 *  Starting with a given scope, search it and all enclosing scopes for a name.
 */
Symbol *Scope::lookup(const std::string &name) const {
    Symbol *symbol = find(name);

    // search current scope
    if (symbol != nullptr) {
        return symbol;
    }
    // recursive search in enclosing scope
    if (_enclosing != nullptr) {
        return _enclosing->lookup(name);
    }
    return nullptr;
}
