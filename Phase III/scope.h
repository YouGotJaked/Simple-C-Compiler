#ifndef SCOPE_H
#define SCOPE_H

#include <vector>
#include <stack>
#include <string>
#include "symbol.h"

typedef std::vector<Symbol*> Symbols;

class Scope {
    Scope *_enclosing;
    Symbols _symbols;

public:
    // CONSTRUCTOR
    Scope(Scope *enclosing = nullptr);

    void insert(Symbol *symbol);
    void remove(const std::string &name);
    Symbol *find(const std::string &name) const;
    Symbol *lookup(const std::string &name) const;
    
    // ACCESSORS
    Scope *enclosing() const { return _enclosing; }
    const Symbols &symbols() const { return _symbols; }
};

typedef std::stack<Scope*> Scopes;

void open(Scopes &ss);
void close(Scopes &ss);

#endif /* SCOPE_H */
