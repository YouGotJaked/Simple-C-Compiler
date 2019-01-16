#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include "../Phase I/lexer.h"
#include "parser.h"

using std::string;

static int lookahead;
static string lexbuf;

static void error() {
    exit(EXIT_FAILURE);
}

static void match (int token) {
    if (lookahead != token) {
        error();
    }
    lookahead = lexan(lexbuf);
}

/*
 * pointers     ->  ε
 *              |   * pointers
 */
static void pointers() {
    while (lookahead == '*') {
        match('*');
    }
}

/*
 * specifier    ->  char
 *              |   int
 *              |   double
 */
static int specifier() {
    if (lookahead == CHAR || lookahead == INT || lookahead == DOUBLE) {
        match(lookahead);
    } else {
        error();
        return ERROR;
    }
    return lookahead;
}

static void functionDefinition(); // COMBINE
static void globalDeclaration(); // COMBINE
static void globalDeclaratorList(); // COMBINE

/*
 * global-declarator    ->  pointers id
 *                      |   pointers id ( parameters )
 *                      |   pointers id [ integer ]
 *
 * After left-factoring:
 *
 * global-declarator    ->  pointers global-declarator_p
 * global-declarator_p  ->  id
 *                      |   id ( parameters )
 *                      |   id [ integer ]
 */
static void globalDeclarator() {
    
}

/*
 *  parameters  ->  void
 *              |   parameter-list
 */
static void parameters() {
    
}

/*
 * parameter-list   ->  parameter
 *                  |   parameter , parameter-list
 *
 * After left-factoring:
 *
 * parameter-list   ->  parameter parameter-list_p
 * parameter-list_p ->  , parameter-list
 */
static void parameter-list() {
    
}

/*
 *  parameter   ->  specifier pointers id
 */
static void parameter() {
    
}

/*
 * declarations ->  ε
 *              |   declaration declarations
 */
static void declarations() {
    
}

/*
 * declaration  ->  specifier declarator-list ;
 */
static void declaration() {
    
}

/*
 * declarator-list  ->  declarator
 *                  |   declarator , declarator-list
 *
 * After left-factoring:
 *
 * declarator-list   ->  declarator declarator-list_p
 * declarator-list_p ->  , declarator-list
 */
static void declarator-list() {
    
}

/*
 * declarator   ->  pointers id
 *              |   pointers id [ integer ]
 *
 * After left-factoring:
 *
 * declarator   ->  pointers declarator_p
 * declarator_p ->  id
 *              |   id [ integer ]
 */
static void declarator() {
    pointers();
    match(ID);
    
    if (lookahead == '[') {
        match('[');
        match(INT);
        match(']');
    }
}

/*
 * statements   ->  ε
 *              |   statement statements
 */
static void statements() {
    
}

/*
 * statement    ->  { declarations declaration }
 *              |   return expression ;
 *              |   while ( expression ) statement
 *              |   if ( expression ) statement
 *              |   if ( expression ) statement else statement
 *              |   expression = expression ;
 *              |   expression ;
 */
static void statement() {
    
}

/*
 * exprOR       ->  exprOR || exprAND
 *              |   exprAND
 */
static void exprOR() {
    
}

/*
 * exprAND      ->  exprAND && exprEQL
 *              |   exprEQL
 */
static void exprAND() {
    
}

/*
 * exprEQL      ->  exprEQL == exprCOMP
 *              |   exprEQL != exprCOMP
 *              |   exprCOMP
 */
static void exprEQL() {
    
}

/*
 * exprCOMP     ->  exprCOMP < exprADDSUB
 *              |   exprCOMP > exprADDSUB
 *              |   exprCOMP <= exprADDSUB
 *              |   exprCOMP >= exprADDSUB
 *              |   exprADDSUB
 */
static void exprCOMP() {
    
}

/*
 * exprADDSUB   ->  exprADDSUB + exprMULDIV
 *              |   exprADDSUB - exprMULDIV
 *              |   exprMULDIV
 */
static void exprADDSUB() {
    
}

/*
 * exprMULDIV   ->  exprMULDIV * exprUNARY
 *              |   exprMULDIV / exprUNARY
 *              |   exprMULDIV % exprUNARY
 *              |   exprUNARY
 */
static void exprMULDIV() {
    
}

/*
 * exprUNARY    ->  & exprUNARY
 *              |   * exprUNARY
 *              |   ! exprUNARY
 *              |   - exprUNARY
 *              |   sizeof exprUNARY
 *              |   exprINDEX
 */
static void exprUNARY() {
    
}

/*
 * exprINDEX    ->  [ exprOR ]
 *              |   exprID
 */
static void exprINDEX() {
    
}

/*
 * exprID       ->  ID ( exprList )
 *              |   ID ( )
 *              |   ID
 *              |   REAL
 *              |   INT
 *              |   STRING
 *              |   ( exprOR )
 */
static void exprID() {
    
}

/*
 * exprList     ->  exprOR
 *              |   exprOR , exprList
 */
static void exprList() {
    
}
