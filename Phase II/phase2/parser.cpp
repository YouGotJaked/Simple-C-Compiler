#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include "lexer.h"
#include "tokens.h"
#include "parser.h"

using std::string;
using std::cout;
using std::cerr;
using std::endl;

int lookahead;
string lexbuf;

void match(int token) {
    if (lookahead == token) {
        lookahead = lexan(lexbuf);
    } else {
        report("Lookahead=" + std::to_string(lookahead) + " did not match token=" + std::to_string(token));
        exit(EXIT_FAILURE);
    }

}

/*
 * functionOrGlobal     ->  specifier pointers id functionOrGlobal_p
 * functionOrGlobal_p   ->  ( parameters ) { declarations statements }
 *                      |   [ integer ] remainingDeclarators
 *                      |   remainingDeclarators
 */
void functionOrGlobal() {
    specifier();
    pointers();
    match(ID);
    if (lookahead == LPAREN) {
        match(LPAREN);
        parameters();
        match(RPAREN);
        if (lookahead == LBRACE) {
            match(LBRACE);
            while (lookahead != RBRACE) {
                declarations();
                statements();
            }
            match(RBRACE);
        } else {
            remainingDeclarators();
        }
    } else if (lookahead == LBRACKET) {
        match(LBRACKET);
        match(INTEGER);
        match(RBRACKET);
        remainingDeclarators();
    } else {
        remainingDeclarators();
    }
}

bool isSpecifier(int token) {
    return token == CHAR || token == INT || token == DOUBLE;
}

/*
 * specifier    ->  char
 *              |   int
 *              |   double
 */
void specifier() {
    if (isSpecifier(lookahead)) {
        switch (lookahead) {
            case CHAR:
                match(CHAR);
                break;
            case INT:
                match(INT);
                break;
            case DOUBLE:
                match(DOUBLE);
                break;
            default:
                break;
        }
    }
}

/*
 * pointers     ->  ε
 *              |   * pointers
 */
 void pointers() {
    while (lookahead == STAR) {
        match(STAR);
    }
}

/*
 * remainingDeclarators -> ;
 *                      |  , globalDeclarator remainingDeclarators
 */
void remainingDeclarators() {
    while (lookahead != SEMICOLON) {
        match(COMMA);
        globalDeclarator();
    }
    match(SEMICOLON);
}

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
void globalDeclarator() {
    pointers();
    match(ID);
    if (lookahead == LPAREN) {
        match(LPAREN);
        parameters();
        match(RPAREN);
    } else if (lookahead == LBRACKET) {
        match(LBRACKET);
        match(INTEGER);
        match(RBRACKET);
    }
}

/*
 *  parameters  ->  void
 *              |   parameter-list
 */
void parameters() {
    if (lookahead == VOID) {
        match(VOID);
    } else {
        parameterList();
    }
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
void parameterList() {
    parameter();
    while (lookahead == COMMA) {
        match(COMMA);
        parameter();
    }
}

/*
 *  parameter   ->  specifier pointers id
 */
void parameter() {
    specifier();
    pointers();
    if (lookahead == ID) {
        match(ID);
    }
}

/*
 * declarations ->  ε
 *              |   declaration declarations
 */
void declarations() {
    while (isSpecifier(lookahead)) {
        declaration();
    }
}

/*
 * declaration  ->  specifier declarator-list ;
 */
void declaration() {
    specifier();
    declaratorList();
    match(SEMICOLON);
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
void declaratorList() {
    declarator();
    while (lookahead == COMMA) {
        match(COMMA);
        declarator();
    }
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
void declarator() {
    pointers();
    match(ID);
    if (lookahead == LBRACKET) {
        match(LBRACKET);
        match(INTEGER);
        match(RBRACKET);
    }
}
 
/*
 * statements   ->  ε
 *              |   statement statements
 */
void statements() {
    while(lookahead != RBRACE) {
        statement();
    }
}

/*
 * statement    ->  { declarations statement }
 *              |   return expression ;
 *              |   while ( expression ) statement
 *              |   if ( expression ) statement
 *              |   if ( expression ) statement else statement
 *              |   expr = expr ;
 *              |   expr ;
 */
void statement() {
    if (lookahead == LBRACE) {
        match(LBRACE);
        while (lookahead != RBRACE) {
            declarations();
            statement();
        }
        match(RBRACE);
    } else if (lookahead == RETURN) {
        match(RETURN);
        expr();
        match(SEMICOLON);
    } else if (lookahead == WHILE) {
        match(WHILE);
        match(LPAREN);
        expr();
        match(RPAREN);
        statement();
    } else if (lookahead == IF) {
        match(IF);
        match(LPAREN);
        expr();
        match(RPAREN);
        statement();
        if (lookahead == ELSE) {
            match(ELSE);
            statement();
        }
    } else {
        while (lookahead != SEMICOLON) {
            expr();
            while (lookahead == ASSIGN) {
                match(ASSIGN);
                expr();
            }
        }
        match(SEMICOLON);
    }
}

/*
 * expr         ->  exprOR
 */
void expr() {
    exprOR();
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
void exprOR() {
    exprAND();
    while (lookahead == OR) {
        match(OR);
        exprAND();
        cout << "or" << endl;
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
void exprAND() {
    exprEQL();
    while (lookahead == AND) {
        match(AND);
        exprEQL();
        cout << "and" << endl;
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
void exprEQL() {
    exprCOMP();
    while (lookahead == EQL || lookahead == NEQ) {
        switch (lookahead) {
            case EQL:
                match(EQL);
                exprCOMP();
                cout << "eql" << endl;
                break;
            case NEQ:
                match(NEQ);
                exprCOMP();
                cout << "neq" << endl;
            default:
                break;
        }
    }
}

bool isCOMP(int token) {
    return token == LTN || token == GTN || token == LEQ || token == GEQ;
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
void exprCOMP() {
    exprADDSUB();
    while (isCOMP(lookahead)) {
        switch (lookahead) {
            case LTN:
                match(LTN);
                exprADDSUB();
                cout << "ltn" << endl;
                break;
            case GTN:
                match(GTN);
                exprADDSUB();
                cout << "gtn" << endl;
                break;
            case LEQ:
                match(LEQ);
                exprADDSUB();
                cout << "leq" << endl;
                break;
            case GEQ:
                match(GEQ);
                exprADDSUB();
                cout << "geq" << endl;
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
 *              |   ε
 */
void exprADDSUB() {
    exprMULDIV();
    while (lookahead == ADD || lookahead == DASH) {
        switch (lookahead) {
            case ADD:
                match(ADD);
                exprMULDIV();
                cout << "add" << endl;
                break;
            case DASH:
                match(DASH);
                exprMULDIV();
                cout << "sub" << endl;
            default:
                break;
        }
    }
}

bool isMULDIV(int token) {
    return token == STAR || token == DIV || token == REM;
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
 *              |   ε
 */
void exprMULDIV() {
    exprPREFIX();
    while (isMULDIV(lookahead)) {
        switch (lookahead) {
            case STAR:
                match(STAR);
                exprPREFIX();
                cout << "mul" << endl;
                break;
            case DIV:
                match(DIV);
                exprPREFIX();
                cout << "div" << endl;
                break;
            case REM:
                match(REM);
                exprPREFIX();
                cout << "rem" << endl;
                break;
            default:
                break;
        }
    }
}

bool isPREFIX(int token) {
    return token == ADDR || token == STAR || token == NOT || token == DASH || token == SIZEOF;
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
void exprPREFIX() {
    if (lookahead == LPAREN) {
        match(LPAREN);
        if (isSpecifier(lookahead)) {
            specifier();
            pointers();
            match(RPAREN);
            exprPREFIX();
            cout << "cast" << endl;
        } else {
            exprPOSTFIX(true);
        }
    } else if (isPREFIX(lookahead)) {
        switch (lookahead) {
            case ADDR:
                match(ADDR);
                exprPREFIX();
                cout << "addr" << endl;
                break;
            case STAR:
                match(STAR);
                exprPREFIX();
                cout << "deref" << endl;
                break;
            case NOT:
                match(NOT);
                exprPREFIX();
                cout << "not" << endl;
                break;
            case DASH:
                match(DASH);
                exprPREFIX();
                cout << "neg" << endl;
                break;
            case SIZEOF:
                match(SIZEOF);
                match(LPAREN);
                specifier();
                pointers();
                match(RPAREN);
                cout << "sizeof" << endl;
                break;
            default:
                break;
        }
    } else {
        exprPOSTFIX(false);
    }
}

/*
 * exprPOSTFIX      ->  exprPRIMARY exprPOSTFIX_p
 * exprPOSTFIX_p    ->  [ expr ] exprPOSTFIX_p
 */
 void exprPOSTFIX(bool lp) {
    exprPRIMARY(lp);
    while (lookahead == LBRACKET) {
        match(LBRACKET);
        expr();
        match(RBRACKET);
        cout << "index" << endl;
    }
}

bool isPRIMARY(int token) {
    return token == REAL || token == INTEGER || token == STRING;
}

/*
 * exprPRIMARY  ->  ID
 *              |   ID ( )
 *              |   ID ( exprList )
 *              |   REAL
 *              |   INTEGER
 *              |   STRING
 *              |   ( expr )
 */
void exprPRIMARY(bool lp) {
    if (lp) {
        expr();
        match(RPAREN);
    } else if (lookahead == ID) {
        match(ID);
        if (lookahead == LPAREN) {
            match(LPAREN);
            while (lookahead != RPAREN) {
                exprList();
            }
            match(RPAREN);
        }
    } else if (isPRIMARY(lookahead)) {
        switch (lookahead) {
            case REAL:
                match(REAL);
                break;
            case INTEGER:
                match(INTEGER);
                break;
            case STRING:
                match(STRING);
                break;
            default:
                break;
        }
    } else if (lookahead == LPAREN) {
        match(LPAREN);
        expr();
        match(RPAREN);
    }
}

/*
 * exprList     ->  expr
 *              |   expr , exprList
 */
void exprList() {
    expr();
    while (lookahead == COMMA) {
        match(COMMA);
        expr();
    }
}

int main() {
    lookahead = lexan(lexbuf);
    while (lookahead != DONE) {
        functionOrGlobal();
    }
    return 0;
}

