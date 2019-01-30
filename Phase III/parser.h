#ifndef PARSER_H
#define PARSER_H

#include "type.h"

void match(int token);
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
void statements();
void statement();
void expr();
void exprOR();
void exprAND();
void exprEQL();
void exprCOMP();
void exprADDSUB();
void exprMULDIV();
void exprPREFIX();
void exprPOSTFIX(bool lp);
void exprPRIMARY(bool lp);
void exprList();

#endif /* PARSER_H */
