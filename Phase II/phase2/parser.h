#ifndef PARSER_H
#define PARSER_H

void match(int token);
void functionOrGlobal();
void globalDeclarator();
void pointers();
void specifier();
void parameters();
void parameter();
void parameterList();
void declarations();
void declaration();
void declarator();
void declaratorList();
void remainingDeclarators();
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
