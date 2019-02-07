#include <iostream>
#include <string>
#include "lexer.h"
#include "checker.h"
#include "type.h"
#include "tokens.h"

using std::string;
using std::cout;
using std::endl;

Scope *globalScope, *currentScope;
// Scopes *ss;

// Error messages
static string E1 = "redefinition of '%s'";
static string E2 = "redeclaration of '%s'";
static string E3 = "conflicting types for '%s'";
static string E4 = "'%s' undeclared";
// ./scc < file.c 2>&1 >/dev/null | diff = file.out

void openScope(string curS) {
    cout << "OPEN " << curS << " SCOPE" << endl;
    currentScope = new Scope(currentScope);
    
    if (globalScope == nullptr) {
        globalScope = currentScope;
    }
    //open(*ss);
}

void closeScope(string curS) {
    cout << "CLOSE " << curS << " SCOPE" << endl;
    currentScope = currentScope->enclosing();
    //close(*ss);
}

void declareFunction(Symbol *s) {
    // add to global scope
    Symbol *s2 = globalScope->find(s->name());
    
    cout << s;
    
    // not found
    if (s2 == nullptr) {
        globalScope->insert(s);
        cout << "Declare function " << s->name() << " with type " << s->type();
    } else if (currentScope != globalScope) {
        report(E2, s->name());
    } else if (s2->type() != s->type()) {
        report(E3, s->name());
    }
}

void defineFunction(Symbol *s) {
    Symbol *s2;
    s2 = globalScope->lookup(s->name());
    
    if (s2 == nullptr) {
        cout << "Define function " << s->name() << " with type " << s->type();
    }
}

void declareVariable(Symbol *s) {
    // add to current scope
    Symbol *s2 = currentScope->find(s->name());
    // new var in current scope
    if (s2 == nullptr) {
        //Symbol *s3 = currentScope->lookup(s->name());
        // new var in other scope
        //if (s3 == nullptr) {
            currentScope->insert(s);
            cout << "Declare variable " << s->name() << " with type " << s->type();
        //}
    } else if (currentScope != globalScope) {
        report(E2, s->name());
    } else if (s2->type() != s->type()) {
        report(E3, s->name());
    }

}

void checkIdentifier(const string &name) {
    Symbol *s2 = currentScope->lookup(name);
    
    if (s2 == nullptr) {
        report(E4, name);
        s2 = new Symbol(name, ERROR);
        currentScope->insert(s2);
    }
}

void checkFunction(const string &name) {
    Symbol *s2 = currentScope->lookup(name);
    
    // implicitly return int
    if (s2 == nullptr) {
        Type t(INT, 0, nullptr);
        Symbol s(name, t);
        declareFunction(&s);
    }
}
