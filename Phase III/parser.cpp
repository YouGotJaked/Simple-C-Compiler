#include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include "lexer.h"
#include "tokens.h"
#include "parser.h"
#include "checker.h"

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

string expect(int token) {
    string buffer = lexbuf;
    match(token);
    return buffer;
}

/*
 * functionOrGlobal     ->  specifier pointers id functionOrGlobal_p
 * functionOrGlobal_p   ->  ( parameters ) { declarations statements }
 *                      |   ( parameters ) remainingDeclarators
 *                      |   [ integer ] remainingDeclarators
 *                      |   remainingDeclarators
 */
void functionOrGlobal() {
    int typespec = specifier();
    unsigned indirection = pointers();
    string name = expect(ID);
    
    if (lookahead == LPAREN) {
        //cout << "OPEN FUNCTION SCOPE" << endl;
        //openScope("FUNCTION");
        match(LPAREN);
        Parameters *p = new Parameters;
        parameters(p);
        match(RPAREN);
        Type t(typespec, indirection, p);
        
        if (lookahead == LBRACE) {
            //cout << Type(typespec, indirection, p);
            //Symbol s(name, t);
            defineFunction(name, t);
                        match(LBRACE);
            //while (lookahead != RBRACE) {
                declarations();
                statements();
            //}
            //cout << "CLOSE FUNCTION SCOPE" << endl;
            closeScope("FUNCTION");
            match(RBRACE);
        } else {
            //cout << "CLOSE FUNCTION SCOPE" << endl;
            closeScope("FUNCTION");
            declareFunction(name, t);
            remainingDeclarators(typespec);
        }
    } else if (lookahead == LBRACKET) {                 // ARRAY
        match(LBRACKET);
        unsigned length = atoi(lexbuf.c_str());
        match(INTEGER);
        match(RBRACKET);
        Type t(typespec, indirection, length);
        //Symbol s(name, t);
        declareVariable(name, t);
        remainingDeclarators(typespec);
    } else {
        Type t(typespec, indirection);
        //Symbol s(name, t);
        declareVariable(name, t);
        remainingDeclarators(typespec);
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
int specifier() {
    int typespec = lookahead;
    
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
    return typespec;
}

/*
 * pointers     ->  ε
 *              |   * pointers
 */
unsigned pointers() {
    unsigned count = 0;
    while (lookahead == STAR) {
        match(STAR);
        count++;
    }
    return count;
}

/*
 * remainingDeclarators -> ;
 *                      |  , globalDeclarator remainingDeclarators
 */
void remainingDeclarators(int typespec) {
    while (lookahead == COMMA) {
        match(COMMA);
        globalDeclarator(typespec);
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
void globalDeclarator(int typespec) {
    unsigned indirection = pointers();
    string name = expect(ID);
    
    if (lookahead == LPAREN) {
        match(LPAREN);
        Parameters *p = new Parameters;
        cout << "calling parameters(p)" << endl;
        parameters(p);
        Type t(typespec, indirection, p);
        //Symbol s(name, t);
        cout << "declaring function..." << endl;
        declareFunction(name, t);
        closeScope("PARAMETER");
        match(RPAREN);
    } else if (lookahead == LBRACKET) {             // ARRAY
        match(LBRACKET);
        unsigned length = atoi(lexbuf.c_str());
        match(INTEGER);
        match(RBRACKET);
        Type t(typespec, indirection, length);
        //Symbol s(name, t);
        declareVariable(name, t);
    } else {
        Type t(typespec, indirection);
        //Symbol s(name, t);
        declareVariable(name, t);
    }
    //cout << Type(typespec, indirection);
}

/*
 *  parameters  ->  void
 *              |   parameter-list
 */
void parameters(Parameters *p) {
    openScope("PARAMETER");
    if (lookahead == VOID) {
        match(VOID);
        cout << "matched void" << endl;
    } else {
        parameterList(p);
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
void parameterList(Parameters *p) {
    parameter(p);
    while (lookahead == COMMA) {
        match(COMMA);
        parameter(p);
    }
}

/*
 *  parameter   ->  specifier pointers id
 */
void parameter(Parameters *p) {
    int typespec = specifier();
    unsigned indirection = pointers();
    string name = expect(ID);
    
    Type t(typespec, indirection);
    declareVariable(name, t);
    p->push_back(t);
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
    int typespec = specifier();
    declaratorList(typespec);
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
void declaratorList(int typespec) {
    declarator(typespec);
    
    while (lookahead == COMMA) {
        match(COMMA);
        declarator(typespec);
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
void declarator(int typespec) {
    unsigned indirection = pointers();
    string name = expect(ID);
    
    if (lookahead == LBRACKET) {
        match(LBRACKET);
        unsigned length = atoi(lexbuf.c_str());
        match(INTEGER);
        match(RBRACKET);
        Type t(typespec, indirection, length); // DECLARE ARRAY
        //Symbol s(name, t);
        declareVariable(name, t);
    } else {
        Type t(typespec, indirection);
        //Symbol s(name, t);
        declareVariable(name, t);
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
 * statement    ->  { declarations statements }
 *              |   return expression ;
 *              |   while ( expression ) statement
 *              |   if ( expression ) statement
 *              |   if ( expression ) statement else statement
 *              |   expr = expr ;
 *              |   expr ;
 */
void statement() {
    if (lookahead == LBRACE) {
        //cout << "OPEN BLOCK SCOPE" << endl;
        openScope("BLOCK");
        match(LBRACE);
        declarations();
        statements();
        //cout << "CLOSE BLOCK SCOPE" << endl;
        closeScope("BLOCK");
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
        expr();
        if (lookahead == ASSIGN) {
            match(ASSIGN);
            expr();
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
 * exprPRIMARY  ->  ( expr )
 *              |   ID
 *              |   ID ( )
 *              |   ID ( exprList )
 *              |   REAL
 *              |   INTEGER
 *              |   STRING
 */
void exprPRIMARY(bool lp) {
    // cast
    if (lp) {
        expr();
        match(RPAREN);
    } else if (lookahead == ID) {
        string name = expect(ID);
        if (lookahead == LPAREN) {
            match(LPAREN);
            if (lookahead != RPAREN) {
                exprList();
            }
            match(RPAREN);
            cout << "checking function" << endl;
            checkFunction(name);
            cout << "function is #checked" << endl;
        } else {
            checkIdentifier(name);
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
    //cout << "OPEN GLOBAL SCOPE" << endl;
    openScope("GLOBAL");
    lookahead = lexan(lexbuf);
    while (lookahead != DONE) {
        functionOrGlobal();
    }
    closeScope("GLOBAL");
    //cout << "CLOSE GLOBAL SCOPE" << endl;
    return 0;
}

