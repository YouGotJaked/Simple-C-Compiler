#ifndef CHECKER_H
#define CHECKER_H

#include <string>
#include "scope.h"
#include "symbol.h"
#include "type.h"

void openScope(const std::string scopeType=" ");
void closeScope(const std::string scopeType=" ");
Symbol *declareFunction(const Symbol &symbol);
Symbol *defineFunction(const Symbol &s);
Symbol *declareVariable(const Symbol &s);
Symbol *checkIdentifier(const std::string &name);
Symbol *checkFunction(const std::string &name);
void checkReturn(const Type &exprType, const Type &returnType);
void checkWhileIf(const Type &exprType);
void checkAssign(const Type &left, const Type &right, bool &lvalue);
Type checkOR(const Type &left, const Type &right);
Type checkAND(const Type &left, const Type &right);
Type checkEQL(const Type &left, const Type &right);
Type checkNEQ(const Type &left, const Type &right);
Type checkLEQ(const Type &left, const Type &right);
Type checkGEQ(const Type &left, const Type &right);
Type checkLTN(const Type &left, const Type &right);
Type checkGTN(const Type &left, const Type &right);
Type checkADD(const Type &left, const Type &right);
Type checkSUB(const Type &left, const Type &right);
Type checkMUL(const Type &left, const Type &right);
Type checkDIV(const Type &left, const Type &right);
Type checkREM(const Type &left, const Type &right);
Type checkNEG(const Type &left);
Type checkNOT(const Type &left);
Type checkADDR(const Type &left, bool &lvalue);
Type checkDEREF(const Type &left);
Type checkSIZEOF(const Type &left);
Type checkCAST(const Type &left, const int &specifier, const unsigned &indirection);
Type checkPOSTFIX(const Type &left, const Type &expr);
Type checkFunctionCall(const Type &left, Parameters &p);

#endif /* CHECKER_H */
