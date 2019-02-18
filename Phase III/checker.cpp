#include <iostream>
#include <string>
#include "lexer.h"
#include "checker.h"
#include "type.h"
#include "tokens.h"

using std::string;
using std::cout;
using std::endl;

static Scope *globalScope, *currentScope;

// Error messages
static string E1 = "redefinition of '%s'";
static string E2 = "redeclaration of '%s'";
static string E3 = "conflicting types for '%s'";
static string E4 = "'%s' undeclared";
// ./scc < file.c 2>&1 >/dev/null | diff = file.out

void openScope(const string scopeType) {
    cout << "OPEN " << scopeType << " SCOPE" << endl;
    currentScope = new Scope(currentScope);

    if (globalScope == nullptr) {
        globalScope = currentScope;
    }
}

void closeScope(const string scopeType) {
    cout << "CLOSE " << scopeType << " SCOPE" << endl;
    currentScope = currentScope->enclosing();
}

Symbol *declareFunction(const Symbol &symbol) {
    Symbol *function = globalScope->find(symbol.name());

    if (function == nullptr) {
        function = new Symbol(symbol.name(), symbol.type());
        globalScope->insert(function);
        cout << "Declare function " << symbol.name() << " with type " << symbol.type() << endl;
    } else if (function->type() != symbol.type()) {
        report(E3, symbol.name());   // conflicting type
    }
    
    return function;
}

void defineFunction(const Symbol &symbol) {
    Symbol *function = declareFunction(symbol);
    
    if (function->defined()) {
        report(E1, symbol.name());   // redefinition
    } else {
        cout << "Define function " << symbol.name() << " with type " << symbol.type() << endl;
    }
    
    function->define(true);
}

void declareVariable(const Symbol &symbol) {
    Symbol *variable = currentScope->find(symbol.name());
    
    if (variable == nullptr) {
        variable = new Symbol(symbol.name(), symbol.type());
        currentScope->insert(variable);
        cout << "Declare variable " << symbol.name() << " with type " << symbol.type() << endl;
    } else if (currentScope != globalScope) {
        report(E2, symbol.name());   // redeclared
    } else if (variable->type() != symbol.type()) {
        report(E3, symbol.name());  // conflicting type
    }
}

void checkIdentifier(const string &name) {
    if (currentScope->lookup(name) == nullptr) {
        report(E4, name);   // undeclared
    }
}

void checkFunction(const string &name) {
    // implicitly declare as INT
    if (currentScope->lookup(name) == nullptr) {
        Type type(INT, 0, nullptr);
        Symbol implicit(name, type);
        declareFunction(implicit);
    }
}
