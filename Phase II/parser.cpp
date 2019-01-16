#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include "../Phase I/lexer.h"
#include "tokens.h"
#include "parser.h"

using std::string;
using std::cout;
using std::endl;

static int lookahead;
static string lexbuf;

static void error() {
    exit(EXIT_FAILURE);
}

static void match(int token) {
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
    while (lookahead == PTR) {
        match(PTR);
        cout << "PTR" << endl;
    }
}

/*
 * specifier    ->  char
 *              |   int
 *              |   double
 */
static int specifier() {
    if (lookahead == CHAR || lookahead == INT || lookahead == DOUBLE) {
        switch (lookahead) {
            case CHAR:
                cout << "CHAR" << endl;
                break;
            case INT:
                cout << "INT" << endl;
                break;
            case DOUBLE:
                cout << "DOUBLE" << endl;
                break;
                
            default:
                break;
        }
        match(lookahead);
    } else {
        error();
        return 0;   // TODO: actually do something
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
static void parameterList() {
    
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
static void declaratorList() {
    
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
    
    if (lookahead == LBRACKET) {
        match(LBRACKET);
        match(INT);
        match(RBRACKET);
        cout << "LBRACKET" << endl;
        cout << "RBRACKET" << endl;
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
 *
 * After left-factoring:
 * exprOR       ->  exprAND exprOR_p
 * exprOR_p     ->  || exprAND exprOR_p
 *              |   ε
 */
static void exprOR() {
    exprAND();
    while (lookahead == OR) {
        match(lookahead);
        exprAND();
        cout << "OR" << endl;
    }
}

/*
 * exprAND      ->  exprAND && exprEQL
 *              |   exprEQL
 *
 * After left-factoring:
 * exprAND      ->  exprEQL exprAND_p
 * exprAND_p    ->  && exprEQL exprAND_p
 *              |   ε
 */
static void exprAND() {
    exprEQL();
    while (lookahead == AND) {
        cout << "AND" << endl;
        match(lookahead);
        exprEQL();
    }
}

/*
 * exprEQL      ->  exprEQL == exprCOMP
 *              |   exprEQL != exprCOMP
 *              |   exprCOMP
 *
 * After left-factoring:
 * exprEQL      ->  exprCOMP exprEQL_p
 * exprEQL_p    ->  == exprCOMP exprEQL_p
 *              |   != exprCOMP exprEQL_p
 *              |   ε
 */
static void exprEQL() {
    exprCOMP();
    while (lookahead == EQL || lookahead == NEQ) {
        match(lookahead);
        exprCOMP();
        cout << ((lookahead == EQL) ? "EQL" : "NEQ") << endl;
    }
}

/*
 * exprCOMP     ->  exprCOMP < exprADDSUB
 *              |   exprCOMP > exprADDSUB
 *              |   exprCOMP <= exprADDSUB
 *              |   exprCOMP >= exprADDSUB
 *              |   exprADDSUB
 *
 * After left-factoring:
 * exprCOMP     ->  exprADDSUB exprCOMP_p
 * exprCOMP_p   ->  < exprADDSUB exprCOMP_p
 *              |   > exprADDSUB exprCOMP_p
 *              |   <= exprADDSUB exprCOMP_p
 *              |   >= exprADDSUB exprCOMP_p
 *              |   ε
 */
static void exprCOMP() {
    exprADDSUB();
    while (lookahead == LTN || lookahead == GTN || lookahead == LEQ || lookahead == GEQ) {
        match(lookahead);
        exprADDSUB();
        switch (lookahead) {
            case LTN:
                cout << "LTN" << endl;
                break;
            case GTN:
                cout << "GTN" << endl;
                break;
            case LEQ:
                cout << "LEQ" << endl;
                break;
            case GEQ:
                cout << "GEQ" << endl;
                break;
            default:
                break;
        }
    }
}

/*
 * exprADDSUB   ->  exprADDSUB + exprMULDIV
 *              |   exprADDSUB - exprMULDIV
 *              |   exprMULDIV
 *
 * After left-factoring:
 * exprADDSUB   ->  exprMULDIV exprADDSUB_p
 * exprADDSUB_p ->  + exprMULDIV exprADDSUB_p
 *              |   - exprMULDIV exprADDSUB_p
 *              |   exprMULDIV
 */
static void exprADDSUB() {
    exprMULDIV();
    while (lookahead == ADD || lookahead == SUB) {
        match(lookahead);
        exprMULDIV();
        cout << ((lookahead == ADD) ? "ADD" : "SUB") << endl;
    }
}

/*
 * exprMULDIV   ->  exprMULDIV * exprPREFIX
 *              |   exprMULDIV / exprPREFIX
 *              |   exprMULDIV % exprPREFIX
 *              |   exprPREFIX
 *
 * After left-factoring:
 * exprMULDIV   ->  exprPREFIX exprMULDIV_p
 * exprMULDIV_p ->  * exprPREFIX exprMULDIV_p
 *              |   / exprPREFIX exprMULDIV_p
 *              |   % exprPREFIX exprMULDIV_p
 *              |   exprPREFIX
 */
static void exprMULDIV() {
    exprPREFIX();
    while (lookahead == MUL || lookahead == DIV || lookahead == REM) {
        match(lookahead);
        exprPREFIX();
        switch (lookahead) {
            case MUL:
                cout << "MUL" << endl;
                break;
            case DIV:
                cout << "DIV" << endl;
                break;
            case REM:
                cout << "REM" << endl;
                break;
            default:
                break;
        }
    }
}

/*
 * exprPREFIX   ->  ( specifier pointers ) exprPREFIX
 *              |   & exprPREFIX
 *              |   * exprPREFIX
 *              |   ! exprPREFIX
 *              |   - exprPREFIX
 *              |   sizeof ( specifier pointers )
 *              |   exprPOSTFIX
 *
 */
static void exprPREFIX() {
    while (lookahead == ADDR || lookahead == DEREF || lookahead == NOT || lookahead == NEG || lookahead == SIZEOF) {
        match(lookahead);
        exprPREFIX();
        switch (lookahead) {
            case ADDR:
                cout << "ADDR" << endl;
                break;
            case DEREF:
                cout << "DEREF" << endl;
            case NOT:
                cout << "NOT" << endl;
            case NEG:
                cout << "NEG" << endl;
            case SIZEOF:
                cout << "SIZEOF" << endl;
            default:
                break;
        }
    }
    exprPOSTFIX();
}

/*
 * exprPOSTFIX      ->  exprPRIMARY exprPOSTFIX_p
 * exprPOSTFIX_p    ->  [ exprOR ] exprPOSTFIX_p
 */
static void exprPOSTFIX() {
    if (lookahead == LBRACKET) {
        match(lookahead);
        while (lookahead != RBRACKET) {
            exprOR();
        }
        
        match(lookahead);
        cout << "LBRACKET" << endl;
        cout << "RBRACKET" << endl;
    }
    exprPRIMARY();
}

/*
 * exprPRIMARY  ->  ID
 *              |   ID ( )
 *              |   ID ( exprList )
 *              |   REAL
 *              |   INT
 *              |   STRING
 *              |   ( exprOR )
 */
static void exprPRIMARY() {
    if (lookahead == ID) {
        match(lookahead);
        if (lookahead == LPAREN) {
            match(lookahead);
            while (lookahead != RPAREN) {
                exprList();
            }
            match(lookahead);
            cout << "LPAREN" << endl;
            cout << "RPAREN" << endl;
        }
    } else if (lookahead == REAL || lookahead == INT || lookahead == STRING) {
        match(lookahead);
        switch (lookahead) {
            case REAL:
                cout << "REAL" << endl;
                break;
            case INT:
                cout << "INT" << endl;
                break;
            case STRING:
                cout << "STRING" << endl;
                break;
            default:
                break;
        }
    } else if (lookahead == LPAREN) {
        match(lookahead);
        while (lookahead != RPAREN) {
            exprOR();
        }
        match(lookahead);
        cout << "LPAREN" << endl;
        cout << "RPAREN" << endl;
        
    }
}

/*
 * exprList     ->  exprOR
 *              |   exprOR , exprList
 */
static void exprList() {
    exprOR();
    while (lookahead == COMMA) {
        match(lookahead);
        exprOR();
        cout << "COMMA" << endl;
    }
}

int main() {
    lookahead = lexan(lexbuf);
    while (lookahead != DONE) {
        exprOR();
    }
    return 0;
}
