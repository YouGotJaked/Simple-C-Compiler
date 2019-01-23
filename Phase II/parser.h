#ifndef PARSER_H
#define PARSER_H

static void match(int token);
static void functionOrGlobal();
static void globalDeclarator();
static void pointers();
static void specifier();
static void parameters();
static void parameter();
static void parameterList();
static void declarations();
static void declaration();
static void declarator();
static void declaratorList();
static void remainingDeclarators();
static void statements();
static void statement();
static void assignment();
static void expr();
static void exprOR();
static void exprAND();
static void exprEQL();
static void exprCOMP();
static void exprADDSUB();
static void exprMULDIV();
static void exprPREFIX();
static void exprPOSTFIX(bool lp);
static void exprPRIMARY(bool lp);
static void exprList();

#endif /* PARSER_H */
