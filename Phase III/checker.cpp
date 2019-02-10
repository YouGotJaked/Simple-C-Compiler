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
static Scopes *ss;

// Error messages
static string E1 = "redefinition of '%s'";
static string E2 = "redeclaration of '%s'";
static string E3 = "conflicting types for '%s'";
static string E4 = "'%s' undeclared";
// ./scc < file.c 2>&1 >/dev/null | diff = file.out

void openScope(string curS) {
    cout << "OPEN " << curS << " SCOPE" << endl;
    //currentScope = ss.top();
    currentScope = new Scope(currentScope);
        //open(*ss);
    if (globalScope == nullptr) {
        globalScope = currentScope;
    }

}

void closeScope(string curS) {
    cout << "CLOSE " << curS << " SCOPE" << endl;
    currentScope = currentScope->enclosing();
    //close(*ss);
}

Symbol *declareFunction(const string &name, const Type &type) {
    // add to global scope
    Symbol *s2 = globalScope->find(name);

    if (s2 == nullptr) {
        s2 = new Symbol(name, type);
        globalScope->insert(s2);
        //cout << "&type in declareFunction=" << &type << endl;
        //cout << "Declare function " << name << " with type " << type;     // seg fault
    } else if (s2->type() != type) {
        report(E3, name);   // conflicting type
        delete type.parameters();
    } else {
        delete type.parameters();
    }
    return s2;
}

void defineFunction(const string &name, const Type &type) {
    Symbol *s2 = declareFunction(name, type);
    
    if (s2->defined()) {
        report(E1, name);   // redefinition
    } else {
        cout << "Define function " << name << " with type " << type;
    }
    s2->define(true);
}

void declareVariable(const string &name, const Type &type) {
    // add to current scope
    Symbol *s2 = currentScope->find(name);
    // new var in current scope
    if (s2 == nullptr) {
        s2 = new Symbol(name, type);
        currentScope->insert(s2);
        cout << "Declare variable " << name << " with type " << type;
    } else if (currentScope != globalScope) {
        report(E2, name);   // redeclared
    } else if (s2->type() != type) {
        report(E3, name);  // conflicting type
    }

}

void checkIdentifier(const string &name) {
    Symbol *s2 = currentScope->lookup(name);
    
    if (s2 == nullptr) {
        report(E4, name);   // undeclared
        s2 = new Symbol(name, ERROR);
        currentScope->insert(s2);
    }
}

void checkFunction(const string &name) {
    Symbol *s2 = currentScope->lookup(name);
    // implicitly return int
    if (s2 == nullptr) {
        Type *t = new Type(INT, 0, nullptr);
        declareFunction(name, *t);
    }
}
