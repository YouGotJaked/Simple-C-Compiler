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

static int lookahead;
static string lexbuf;
static int count = 0;

static void error(int token) {
    cout << "ERROR #" << count << "=" << token << "\t LOOKAHEAD=" << lookahead << endl;
    exit(EXIT_FAILURE);
}

static void match(int token) {
    if (lookahead == token) {
        //cerr << "TOKEN #" << ++count << "=" << token << endl;
        //cout << "LOOKAHEAD #" << count << "=" << lookahead << endl;
        lookahead = lexan(lexbuf);
        //cout << "lookahead is now " << lookahead << endl;
    } else {
        cerr << "\tLookahead=" << lookahead << "\ttoken=" << token << endl;
        report("Lookahead did not match token...");
        error(token);
    }
}

/*
 * functionOrGlobal     ->  specifier pointers id functionOrGlobal_p
 * functionOrGlobal_p   ->  ( parameters ) { declarations statements }
 *                      |   [ integer ] remainingDeclarators
 *                      |   remainingDeclarators
 */
static void functionOrGlobal() {
    //cout << "functionOrGlobal()" << endl;
    specifier();
    pointers();
    if (lookahead == ID) {
        match(ID);
    }
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
            if (lookahead == RBRACE) {
                match(RBRACE);
            }
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

static bool isSpecifier(int token) {
    return token == CHAR || token == INT || token == DOUBLE;
}

/*
 * specifier    ->  char
 *              |   int
 *              |   double
 */
static void specifier() {
    //cerr << "specifier(): "  << lookahead << endl;
    if (isSpecifier(lookahead)) {
        switch (lookahead) {
            case CHAR:
                match(CHAR);
                //cout << "CHAR" << endl;
                break;
            case INT:
                match(INT);
                //cout << "INT" << endl;
                break;
            case DOUBLE:
                match(DOUBLE);
                //cout << "DOUBLE" << endl;
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
static void pointers() {
    //cout << "pointers()" << endl;
    while (lookahead == STAR) {
        match(STAR);
        //cout << "PTR" << endl;
    }
}

/*
 * remainingDeclarators -> ;
 *                      |  , globalDeclarator remainingDeclarators
 */
static void remainingDeclarators() {
    //cout << "remainingDeclarators()" << endl;
    while (lookahead != SEMICOLON) {
        match(COMMA);
        globalDeclarator();
        //remainingDeclarators();
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
static void globalDeclarator() {
    //cout << "globalDeclarator()" << endl;
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
static void parameters() {
    //cout << "parameters()" << endl;
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
static void parameterList() {
    //cout << "parameterList(): la=" << lookahead << endl;
    parameter();
    while (lookahead == COMMA) {
        match(COMMA);
        parameter();
    }
}

/*
 *  parameter   ->  specifier pointers id
 */
static void parameter() {
    //cout << "parameter(): la=" << lookahead << endl;
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
static void declarations() {
    //cout << "declarations(): la=" << lookahead << endl;
    while (isSpecifier(lookahead)) {
        declaration();
    }
}

/*
 * declaration  ->  specifier declarator-list ;
 */
static void declaration() {
    //cout << "declaration(): la=" << lookahead << endl;
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
static void declaratorList() {
    //cout << "declarationList(): la=" << lookahead << endl;
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
static void declarator() {
    //cout << "declarator(): lookahead=" << lookahead << endl;
    pointers();
    match(ID);
    if (lookahead == LBRACKET) {
        match(LBRACKET);
        match(INTEGER);
        match(RBRACKET);
    }
    //cout << "LOOKAHEAD_3=" << lookahead << endl;

}
 
/*
 * statements   ->  ε
 *              |   statement statements
 */
static void statements() {
    //cout << "statements(): lookahead=" << lookahead << endl;
    while(lookahead != RBRACE) {                // && lookahead != DONE
        statement();
    }
}

/*
 * statement    ->  { declarations statement }
 *              |   return expression ;
 *              |   while ( expression ) statement
 *              |   if ( expression ) statement
 *              |   if ( expression ) statement else statement
 *              |   assignment ;
 */
static void statement() {
    //cout << "statement(): lookahead=" << lookahead << endl;
    if (lookahead == LBRACE) {
        match(LBRACE);
        while (lookahead != RBRACE) {
            declarations();
            statement();
        }
        match(RBRACE);
    } else if (lookahead == RETURN) {
        match(RETURN);
        while (lookahead != SEMICOLON) {
            expr();
        }
        match(SEMICOLON);
    } else if (lookahead == WHILE) {
        match(WHILE);
        match(LPAREN);
        while (lookahead != RPAREN) {
            expr();
        }
        match(RPAREN);
        statement();
    } else if (lookahead == IF) {
        match(IF);
        match(LPAREN);
        while (lookahead != RPAREN) {
            expr();
        }
        match(RPAREN);
        statement();
        if (lookahead == ELSE) {
            match(ELSE);
            statement();
        }
    } else {
        while (lookahead != SEMICOLON) {
            assignment();
        }
        //cout << "assignment exited" << endl;
        match(SEMICOLON);
        //cout << "matched ;" << endl;
    }
}

/*
 * assignment   ->  expr = expr
 *              |   expr
 *
 * After left-factoring:
 * assignment   ->  expr assignment_p
 * assignment_p ->  = expr
 */
static void assignment() {
    //cout << "assignment(): lookahead=" << lookahead << endl;
    expr();
    //cout << "matched assign, la=" << lookahead << endl;
    while (lookahead == ASSIGN) {
        match(ASSIGN);
        expr();
        //cout << "matched assign, la=" << lookahead << endl;
    }
    //cout << "matched assign, la=" << lookahead << endl;
}

/*
 * expr         ->  exprOR
 */
static void expr() {
    //cout << "expr(): lookahead=" << lookahead << endl;
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
static void exprOR() {
    //cout << "exprOR(): lookahead=" << lookahead << endl;
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
static void exprAND() {
    //cout << "exprAND(): lookahead=" << lookahead << endl;
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
static void exprEQL() {
    //cout << "exprEQL(): lookahead=" << lookahead << endl;
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

static bool isCOMP(int token) {
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
static void exprCOMP() {
    //cout << "exprCOMP(): lookahead=" << lookahead << endl;
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
static void exprADDSUB() {
    //cout << "exprADDSUB(): lookahead=" << lookahead << endl;
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

static bool isMULDIV(int token) {
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
static void exprMULDIV() {
    //cout << "exprMULDIV(): lookahead=" << lookahead << endl;
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

static bool isPREFIX(int token) {
    return token == ADDR || token == STAR || token == NOT || token == NEG || token == SIZEOF;
}

/*
 * exprPREFIX   ->  ( specifier pointers ) exprPREFIX
 *              |   & exprPREFIX
 *              |   * exprPREFIX
 *              |   ! exprPREFIX
 *              |   - exprPREFIX
 *              |   sizeof ( exprPREFIXcd  )
 *              |   exprPOSTFIX
 *
 */
static void exprPREFIX() {
    //cout << "exprPREFIX(): lookahead=" << lookahead << endl;
    if (isPREFIX(lookahead)) {
        switch (lookahead) {
            case ADDR:
                match(ADDR);
                cout << "addr" << endl;
                break;
            case STAR:
                match(STAR);
                cout << "deref" << endl;
                break;
            case NOT:
                match(NOT);
                cout << "not" << endl;
                break;
            case NEG:
                match(NEG);
                cout << "neg" << endl;
                break;
            case SIZEOF:
                match(SIZEOF);
                exprPREFIX();
                cout << "sizeof" << endl;
                break;
            default:
                break;
        }
    } else if (lookahead == LPAREN) {
        match(LPAREN);
        if (isSpecifier(lookahead)) {
            specifier();
            pointers();
            match(RPAREN);
        } else {
            exprPOSTFIX(true);
        }
        //cout << "LPAREN" << endl;
        //cout << "RPAREN" << endl;
    } else {
        exprPOSTFIX(false);
    }
}

/*
 * exprPOSTFIX      ->  exprPRIMARY exprPOSTFIX_p
 * exprPOSTFIX_p    ->  [ expr ] exprPOSTFIX_p
 */
static void exprPOSTFIX(bool lp) {
    //cout << "exprPOSTFIX(): lookahead=" << lookahead << endl;
    exprPRIMARY(lp);
    if (lookahead == LBRACKET) {
        match(LBRACKET);
        while (lookahead != RBRACKET) {
            expr();
        }
        match(RBRACKET);
    }
}

static bool isPRIMARY(int token) {
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
static void exprPRIMARY(bool lp) {
    //cout << "exprPRIMARY(): lookahead=" << lookahead << endl;
    if (lp) {
        //cout << "lp true" << endl;
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
                //cout << "REAL" << endl;
                break;
            case INTEGER:
                match(INTEGER);
                //cout << "INTEGER" << endl;
                break;
            case STRING:
                match(STRING);
                //cout << "STRING" << endl;
                break;
            default:
                break;
        }
    } else if (lookahead == LPAREN) {
        match(LPAREN);
        while (lookahead != RPAREN) {
            expr();
        }
        match(RPAREN);
    }
    //cout << "ended primary" << endl;
}

/*
 * exprList     ->  expr
 *              |   expr , exprList
 */
static void exprList() {
    //cout << "exprList()" << endl;
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
