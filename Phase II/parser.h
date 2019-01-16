#ifndef PARSER_H
#define PARSER_H

static void match(int token);
static void functionDefinition(); // COMBINE
static void globalDeclaration(); // COMBINE
static void globalDeclaratorList(); // COMBINE
static void globalDeclarator();
static void pointers();
static int specifier();
static void parameters();
static void parameter();
static void declarations();
static void declaration();
static void declarator();
static void statements();
static void statement();
static void exprOR();
static void exprAND();
static void exprEQL();
static void exprCOMP();
static void exprADDSUB();
static void exprMULDIV();
static void exprPREFIX();
static void exprPOSTFIX();
static void exprPRIMARY();
static void exprList();

#endif /* PARSER_H */
