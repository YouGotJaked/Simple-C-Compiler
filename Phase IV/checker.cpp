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
static string E5 = "invalid return type";
static string E6 = "invalid type for test expression";
static string E7 = "lvalue required in expression";
static string E8 = "invalid operands to binary %s";
static string E9 = "invalid operand to unary %s";
static string E10 = "invalid operand in cast expression";
static string E11 = "called object is not a function";
static string E12 = "invalid arguments to called function";
static Type error = Type();

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
        delete symbol.type().parameters();
    } else {
        delete symbol.type().parameters();
    }
    
    return function;
}

Symbol *defineFunction(const Symbol &symbol) {
    Symbol *function = declareFunction(symbol);
    
    if (function->defined()) {
        report(E1, symbol.name());   // redefinition
    } else {
        cout << "Define function " << symbol.name() << " with type " << symbol.type() << endl;
    }
    
    function->define(true);
    return function;
}

Symbol *declareVariable(const Symbol &symbol) {
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
    
    return variable;
}

Symbol *checkIdentifier(const string &name) {
    Symbol *symbol = currentScope->lookup(name);
    
    if (symbol == nullptr) {
        report(E4, name);   // undeclared
        symbol = new Symbol(name, error);
    }
    
    return symbol;
}

Symbol *checkFunction(const string &name) {
    Symbol *symbol = currentScope->lookup(name);

    // implicitly declare as INT
    if (symbol == nullptr) {
        Type type(INT, 0, nullptr);
        Symbol *implicit = new Symbol(name, type);
        declareFunction(*implicit);
        return implicit;
    }
    
    return symbol;
}

/*
 *  Statements:
 *      The type of the expression in a return statement must be compatible with the return type of the enclosing function [E5].
 *      The type of an expression in a while or if statement must be a predicate type [E6].
 *      In an assignment statement, the left-hand side must be an lvalue [E7], and the types of the left-hand and right-hand sides must be compatible [E8].
 */

void checkReturn(const Type &exprType, const Type &returnType) {
    Type t = Type(returnType.specifier(), returnType.indirection());
    
    if (!exprType.isCompatibleWith(t)) {
        report(E5);     // "invalid return type"
    }

void checkWhileIf(const Type &exprType) {
    if (exprType == error) {
        return;
    }
    if (!exprType.isPredicate()) {
        report(E6);     // "invalid type for test expression"
    }
}

void checkAssign(const Type &left, const Type &right, bool &lvalue) {
    if (left == error || right == error) {
        return;
    }
    if (!lvalue) {
        report(E7);     // lvalue required
        return;
    }
    Type pLeft = left.promote();
    Type pRight = right.promote();
    cout << "checkASSIGN:" << endl;
    cout << "LEFT: " << pLeft << endl;
    cout << "RIGHT: " << pRight << endl;
    if (!pLeft.isCompatibleWith(pRight)) {
        report(E8, "=");     // invalid binary operands
    }
}

/*
 *  Logical Expressions:
 *      The type of each operand must be a predicate type, after any promotion [E8].
 *      The result has type INT and is not an lvalue.
 *      The types of the two operands need not be compatible.
 */
Type checkOR(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isPredicate() && pRight.isPredicate()) {
        return Type(INT);
    }
    
    report(E8, "||");   // invalid binary operands
    return error;
}

Type checkAND(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isPredicate() && pRight.isPredicate()) {
        return Type(INT);
    }
    
    report(E8, "&&");   // invalid binary operands
    return error;
}

/*
 *  Equality Expressions:
 *      The types of the left and right operands must be compatible, after any promotion [E8].
 *      The result has type INT and is not an lvalue.
 */
Type checkEQL(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isCompatibleWith(pRight)) {
        return Type(INT);
    }
    
    report(E8, "==");   // invalid binary operands
    return error;
}

Type checkNEQ(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isCompatibleWith(pRight)) {
        return Type(INT);
    }
    
    report(E8, "!=");   // invalid binary operands
    return error;
}

/*
 *  Relational Expressions:
 *      The types of the left and right operands must be compatible, after any promotion [E8].
 *      The result has type INT and is not an lvalue.
 */

Type checkLEQ(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isCompatibleWith(pRight)) {
        return Type(INT);
    }
    
    report(E8, "<=");   // invalid binary operands
    return error;
}

Type checkGEQ(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isCompatibleWith(pRight)) {
        return Type(INT);
    }
    
    report(E8, ">=");   // invalid binary operands
    return error;
}

Type checkLTN(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isCompatibleWith(pRight)) {
        cout << pLeft << " compatible with " << pRight << endl;
        return Type(INT);
    }
    
    report(E8, "<");   // invalid binary operands
    return error;
}

Type checkGTN(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isCompatibleWith(pRight)) {
        return Type(INT);
    }
    
    report(E8, ">");   // invalid binary operands
    return error;
}

/*
 *  Additive Expressions:
 *      If the types of both operands are numeric, then the result has type DOUBLE if either operand has type DOUBLE, and has type INT otherwise.
 *      If the left operand has type “pointer to T” and the right operand has type INT, then the result has type “pointer to T.”
 *      For addition only, if the left operand has type INT and the right operand has type “pointer to T ” then the result has type “pointer to T .”
 *      For subtraction only, if both operands have type “pointer to T ” then the result has type INT.
 *      Otherwise, the result is an error [E8].
 *      In all cases, operands undergo promotion and the result is never an lvalue.
 */
Type checkADD(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isNumeric() && pRight.isNumeric()) {
        return (pLeft == Type(DOUBLE) || pRight == Type(DOUBLE)) ? DOUBLE : INT;
    }
    if (pLeft.isPointer() && pRight == Type(INT)) {
        return pLeft;
    }
    if (pLeft == Type(INT) && pRight.isPointer()) {
        return pLeft;
    }
    
    report(E8, "+");    // invalid binary operands
    return error;
}

Type checkSUB(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    cout << "checkSUB: pLeft = " << pLeft << " and pRight = " << pRight << endl;
    
    if (pLeft.isNumeric() && pRight.isNumeric()) {
        return (pLeft == Type(DOUBLE) || pRight == Type(DOUBLE)) ? DOUBLE : INT;
    }
    if (pLeft.isPointer() && pRight == Type(INT)) {
        return pLeft;
    }
    if (pLeft.isPointer() && pLeft == pRight) {
        return Type(INT);
    }
    
    report(E8, "-");    // invalid binary operands
    return error;
}

/*
 *  Multiplicative Expressions:
 *      For multiplication and division, the types of both operands must be numeric, after any promotion [E8].
 *      If either operand has type DOUBLE then the result has type DOUBLE.
 *      Otherwise, the result has type INT.
 *      For the remainder operation, both operands must have type INT after promotion, and the result has type INT [E8].
 *      In all cases, the result is never an lvalue.
 */

Type checkMUL(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isNumeric() && pRight.isNumeric()) {
        return (pLeft == Type(DOUBLE) || pRight == Type(DOUBLE)) ? DOUBLE : INT;
    }
    
    report(E8, "*");    // invalid binary operands
    return error;
}

Type checkDIV(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft.isNumeric() && pRight.isNumeric()) {
        return (pLeft == Type(DOUBLE) || pRight == Type(DOUBLE)) ? DOUBLE : INT;
    }
    
    report(E8, "/");    // invalid binary operands
    return error;
}

Type checkREM(const Type &left, const Type &right) {
    if (left == error || right == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pRight = right.promote();
    
    if (pLeft == Type(INT) && pRight == Type(INT)) {
        return Type(INT);
    }
    
    report(E8, "%");    // invalid binary operands
    return error;
}

/*
 *  Prefix Expressions:
 *      The operand in a unary * expression must have type “pointer to T” after any promotion [E9]. The result has type T and is an lvalue.
 *      The operand in a unary & expression must be an lvalue [E7]. If the operand has type T, then the result has type “pointer to T ” and is not an lvalue.
 *      The operand in a ! expression must have a predicate type [E9], and the result has type INT.
 *      The operand in a unary - expression must have a numeric type [E9], and the result has the same type after promotion.
 *      The result of a SIZEOF expression has type INT.
 *      In none of these cases is the result an lvalue.
 *      For a type cast, the result type is that of specifier, along with any pointer declarators specified as part of pointers. The types of the result and operand must (after any promotion) either both be numeric types, both be pointer types, or one is INT and the other is a “pointer to T ” [E10]. The result is not an lvalue.
 */

Type checkNEG(const Type &left) {
    if (left == error) {
        return error;
    }
    
    if (left.isNumeric()) {
        return left;
    }
    
    report(E9, "-");    // invalid unary operand
    return error;
}

Type checkNOT(const Type &left) {
    if (left == error) {
        return error;
    }
    
    if (left.isPredicate()) {
        return Type(INT);
    }
    
    report(E9, "!");    // invalid unary operand
    return error;
}

Type checkADDR(const Type &left, bool &lvalue) {
    if (left == error) {
        return error;
    }
    
    if (!lvalue) {
        report(E7);     // lvalue required
        return error;
    } else {
        return Type(left.specifier(), left.indirection() + 1);
    }
}

Type checkDEREF(const Type &left) {
    if (left == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    
    if (pLeft.isPointer()) {
        return Type(pLeft.specifier(), pLeft.indirection() - 1);   // lvalue
    }
    
    report(E9, "*");    // invalid unary operand
    return error;
}

Type checkSIZEOF(const Type &left) {
    if (left == error) {
        return error;
    }
    
    return Type(INT);
}

Type checkCAST(const Type &left, const int &specifier, const unsigned &indirection) {
    if (left == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type result = Type(specifier, indirection);
    
    if ((pLeft.isNumeric() && result.isNumeric()) ||
        (pLeft.isPointer() && result.isPointer()) ||
        (pLeft.isPointer() && result == Type(INT)) ||
        (pLeft == Type(INT) && result.isPointer())) {
        return result;
    }
    
    report(E10);  // invalid cast operand
    return error;
}

/*
 *  Postfix Expressions:
 *      The left operand in an array reference expression must have type “pointer to T” after any promotion and the expression must have type INT after promotion [E8].
 *      The result has type T and is an lvalue.
 */

Type checkPOSTFIX(const Type &left, const Type &expr) {
    if (left == error || expr == error) {
        return error;
    }
    
    Type pLeft = left.promote();
    Type pExpr = expr.promote();
    
    if (pLeft.isPointer() && pExpr == Type(INT)) {
        return Type(pLeft.specifier(), pLeft.indirection() - 1);
    }
    
    report(E8, "[]");   // invalid binary operands
    return error;
}

/*
 *  Primary Expressions:
 *      The type of an identifier is provided at the time of its declaration.
 *      An identifier is an lvalue if it refers to a scalar (i.e., neither a function nor an array).
 *      The type of a real is double, and the type of an integer is int.
 *      Neither is an lvalue. A string literal has type “array of char” and is not an lvalue.
 *      The type of a parenthesized expression is that of the expression, and is an lvalue if the expression itself is an lvalue.
 *      The identifier in a function call expression must have type “function returning T” and the result has type T [E11].
 *      In addition, the number of parameters and arguments must agree and their types must be compatible, if the parameters have been specified [E12].
 *      The result is not an lvalue.
 */

Type checkFunctionCall(const Type &left, Parameters &p) {
    Type result = error;
    
    if (left == error) {
        return error;
    }
    
    if (left.isFunction()) {
        result = Type(left.specifier());
    } else {
        report(E11);    // not function
        return result;
    }
    
    Parameters *args = left.parameters();
    if (args != nullptr) {
        if (args->size() == p.size()) {
            int i = 0;
            for (auto const &arg: *args) {
                if (arg.isPredicate() && arg.isCompatibleWith(p[i])) {
                    result = Type(left.specifier(), left.indirection());
                } else {
                    report(E12);    // invalid args
                    return result;
                }
                i++;
            }
        } else {
            report(E12);    // invalid args
        }
    }
    
    return result;
}
