#ifndef PARSER_H
#define PARSER_H

#include <string>
#include "type.h"

void match(int token);
std::string expect(int token);
void functionOrGlobal();
void globalDeclarator(int typespec);
unsigned pointers();
int specifier();
void parameters(Parameters *p);
void parameter(Parameters *p);
void parameterList(Parameters *p);
void declarations();
void declaration();
void declaratorList(int typespec);
void declarator(int typespec);
void remainingDeclarators(int typespec);
void statements(const Type &type);
void statement(const Type &type);
Type expr(bool &lvalue);
Type exprOR(bool &lvalue);
Type exprAND(bool &lvalue);
Type exprEQL(bool &lvalue);
Type exprCOMP(bool &lvalue);
Type exprADDSUB(bool &lvalue);
Type exprMULDIV(bool &lvalue);
Type exprPREFIX(bool &lvalue);
Type exprPOSTFIX(bool lp, bool &lvalue);
Type exprPRIMARY(bool lp, bool &lvalue);
Type exprList(Parameters &p, bool &lvalue);

#endif /* PARSER_H */
