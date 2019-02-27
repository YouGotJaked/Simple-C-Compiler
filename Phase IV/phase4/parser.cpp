 #include <cstdio>
#include <cstdlib>
#include <iostream>
#include <string>
#include "lexer.h"
#include "tokens.h"
#include "parser.h"
#include "checker.h"
#include "type.h"

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
        match(LPAREN);
        Parameters *p = new Parameters;
        parameters(p);
        match(RPAREN);
        Type type(typespec, indirection, p);
        
        if (lookahead == LBRACE) {
            Symbol symbol(name, type);
            defineFunction(symbol);
            match(LBRACE);
            declarations();
            statements(symbol.type());
            closeScope("FUNCTION");
            match(RBRACE);
        } else {
            closeScope("FUNCTION");
            Symbol symbol(name, type);
            declareFunction(symbol);
            remainingDeclarators(typespec);
        }
    } else if (lookahead == LBRACKET) {                 // ARRAY
        match(LBRACKET);
        unsigned length = atoi(lexbuf.c_str());
        match(INTEGER);
        match(RBRACKET);
        Type type(typespec, indirection, length);
        Symbol symbol(name, type);
        declareVariable(symbol);
        remainingDeclarators(typespec);
    } else {                                            // SCALAR
        Type type(typespec, indirection);
        Symbol symbol(name, type);
        declareVariable(symbol);
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
    int typespec = ERROR;
    
    if (isSpecifier(lookahead)) {
        typespec = lookahead;
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
        parameters(p);
        Type type(typespec, indirection, p);
        Symbol symbol(name, type);
        declareFunction(symbol);
        closeScope("FUNCTION");
        match(RPAREN);
    } else if (lookahead == LBRACKET) {             // ARRAY
        match(LBRACKET);
        unsigned length = atoi(lexbuf.c_str());
        match(INTEGER);
        match(RBRACKET);
        Type type(typespec, indirection, length);
        Symbol symbol(name, type);
        declareVariable(symbol);
    } else {
        Type type(typespec, indirection);
        Symbol symbol(name, type);
        declareVariable(symbol);
    }
}

/*
 *  parameters  ->  void
 *              |   parameter-list
 */
void parameters(Parameters *p) {
    openScope("FUNCTION");
    
    if (lookahead == VOID) {
        match(VOID);
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
    
    Type type(typespec, indirection);
    Symbol symbol(name, type);
    declareVariable(symbol);
    
    p->push_back(type);
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
 * declarator   ->  pointers id [ integer ]
 *              |   pointers id
 *
 * After left-factoring:
 *
 * declarator   ->  pointers declarator_p
 * declarator_p ->  id [ integer ]
 *              |   id
 */
void declarator(int typespec) {
    unsigned indirection = pointers();
    string name = expect(ID);
    
    if (lookahead == LBRACKET) {
        match(LBRACKET);
        unsigned length = atoi(lexbuf.c_str());
        match(INTEGER);
        match(RBRACKET);
        Type type(typespec, indirection, length);
        Symbol symbol(name, type);
        declareVariable(symbol);     // ARRAY
    } else {
        Type type(typespec, indirection);
        Symbol symbol(name, type);
        declareVariable(symbol);     // SCALAR
    }
}
 
/*
 * statements   ->  ε
 *              |   statement statements
 */
void statements(const Type &type) {
    while (lookahead != RBRACE) {
        statement(type);
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
void statement(const Type &type) {
    Type left, right, exprType;
    bool lvalue = false;
    bool rvalue = false;
    
    if (lookahead == LBRACE) {
        openScope("BLOCK");
        match(LBRACE);
        declarations();
        statements(type);
        closeScope("BLOCK");
        match(RBRACE);
    } else if (lookahead == RETURN) {
        match(RETURN);
        exprType = expr(lvalue);
        checkReturn(exprType, type);
        match(SEMICOLON);
    } else if (lookahead == WHILE) {
        match(WHILE);
        match(LPAREN);
        exprType = expr(lvalue);
        checkWhileIf(exprType);
        match(RPAREN);
        statement(exprType);
    } else if (lookahead == IF) {
        match(IF);
        match(LPAREN);
        exprType = expr(lvalue);
        checkWhileIf(exprType);
        match(RPAREN);
        statement(exprType);
        if (lookahead == ELSE) {
            match(ELSE);
            statement(exprType);
        }
    } else {
        left = expr(lvalue);
        
        if (lookahead == ASSIGN) {
            match(ASSIGN);
            right = expr(rvalue);
            checkAssign(left, right, lvalue);
        }
        match(SEMICOLON);
    }
}

/*
 * expr         ->  exprOR
 */
Type expr(bool &lvalue) {
    return exprOR(lvalue);
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
Type exprOR(bool &lvalue) {
    Type left, right;
    left = exprAND(lvalue);
    
    while (lookahead == OR) {
        match(OR);
        right = exprAND(lvalue);
        left = checkOR(left, right);
        lvalue = false;
        cout << "or" << endl;
    }
    
    return left;
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
Type exprAND(bool &lvalue) {
    Type left, right;
    left = exprEQL(lvalue);
    
    while (lookahead == AND) {
        match(AND);
        right = exprEQL(lvalue);
        left = checkAND(left, right);
        lvalue = false;
        cout << "and" << endl;
    }
    
    return left;
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
Type exprEQL(bool &lvalue) {
    Type left, right;
    left = exprCOMP(lvalue);
    
    while (lookahead == EQL || lookahead == NEQ) {
        switch (lookahead) {
            case EQL:
                match(EQL);
                right = exprCOMP(lvalue);
                left = checkEQL(left, right);
                cout << "eql" << endl;
                break;
            case NEQ:
                match(NEQ);
                right = exprCOMP(lvalue);
                left = checkNEQ(left, right);
                cout << "neq" << endl;
                break;
            default:
                break;
        }
        lvalue = false;
    }
    
    return left;
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
Type exprCOMP(bool &lvalue) {
    Type left, right;
    left = exprADDSUB(lvalue);
    
    while (isCOMP(lookahead)) {
        switch (lookahead) {
            case LTN:
                match(LTN);
                right = exprADDSUB(lvalue);
                left = checkLTN(left, right);
                cout << "ltn" << endl;
                break;
            case GTN:
                match(GTN);
                right = exprADDSUB(lvalue);
                left = checkGTN(left, right);
                cout << "gtn" << endl;
                break;
            case LEQ:
                match(LEQ);
                right = exprADDSUB(lvalue);
                left = checkLEQ(left, right);
                cout << "leq" << endl;
                break;
            case GEQ:
                match(GEQ);
                right = exprADDSUB(lvalue);
                left = checkGEQ(left, right);
                cout << "geq" << endl;
                break;
            default:
                break;
        }
        lvalue = false;
    }
    
    return left;
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
Type exprADDSUB(bool &lvalue) {
    Type left, right;
    left = exprMULDIV(lvalue);
    
    while (lookahead == ADD || lookahead == DASH) {
        switch (lookahead) {
            case ADD:
                match(ADD);
                right = exprMULDIV(lvalue);
                left = checkADD(left, right);
                cout << "add" << endl;
                break;
            case DASH:
                match(DASH);
                right = exprMULDIV(lvalue);
                left = checkSUB(left, right);
                cout << "sub" << endl;
            default:
                break;
        }
        lvalue = false;
    }
    
    return left;
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
Type exprMULDIV(bool &lvalue) {
    Type left, right;
    left = exprPREFIX(lvalue);
    
    while (isMULDIV(lookahead)) {
        switch (lookahead) {
            case STAR:
                match(STAR);
                right = exprPREFIX(lvalue);
                left = checkMUL(left, right);
                cout << "mul" << endl;
                break;
            case DIV:
                match(DIV);
                right = exprPREFIX(lvalue);
                left = checkDIV(left, right);
                cout << "div" << endl;
                break;
            case REM:
                match(REM);
                right = exprPREFIX(lvalue);
                left = checkREM(left, right);
                cout << "rem" << endl;
                break;
            default:
                break;
        }
        lvalue = false;
    }
    
    return left;
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
Type exprPREFIX(bool &lvalue) {
    //cout << "exprPREFIX lvalue=" << lvalue << endl;
    Type left;
    int typespec;
    unsigned indirection;
    
    if (lookahead == LPAREN) {  // CAST
        match(LPAREN);
        if (isSpecifier(lookahead)) {
            typespec = specifier();
            indirection = pointers();
            match(RPAREN);
            left = exprPREFIX(lvalue);
            left = checkCAST(left, typespec, indirection);
            lvalue = false;
            cout << "cast" << endl;
        } else {
            exprPOSTFIX(true, lvalue);
        }
    } else if (isPREFIX(lookahead)) {
        switch (lookahead) {
            case ADDR:
                match(ADDR);
                left = exprPREFIX(lvalue);
                left = checkADDR(left, lvalue);
                cout << "addr" << endl;
                lvalue = false;
                break;
            case STAR:
                match(STAR);
                left = exprPREFIX(lvalue);
                left = checkDEREF(left);
                cout << "deref" << endl;
                lvalue = true;
                break;
            case NOT:
                match(NOT);
                left = exprPREFIX(lvalue);
                left = checkNOT(left);
                cout << "not" << endl;
                lvalue = false;
                break;
            case DASH:
                match(DASH);
                left = exprPREFIX(lvalue);
                left = checkNEG(left);
                cout << "neg" << endl;
                lvalue = false;
                break;
            case SIZEOF:
                match(SIZEOF);
                match(LPAREN);
                typespec = specifier();
                indirection = pointers();
                left = Type(typespec, indirection);
                left = checkSIZEOF(left);
                match(RPAREN);
                cout << "sizeof" << endl;
                lvalue = false;
                break;
            default:
                break;
        }
    } else {
        left = exprPOSTFIX(false, lvalue);
    }
    return left;
}

/*
 * exprPOSTFIX      ->  exprPRIMARY exprPOSTFIX_p
 * exprPOSTFIX_p    ->  [ expr ] exprPOSTFIX_p
 */
Type exprPOSTFIX(bool lp, bool &lvalue) {
    Type left, expression;
    left = exprPRIMARY(lp, lvalue);
    
    while (lookahead == LBRACKET) {
        match(LBRACKET);
        expression = expr(lvalue);
        match(RBRACKET);
        left = checkPOSTFIX(left, expression);
        lvalue = true;
        cout << "index" << endl;
    }
    
    return left;
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
Type exprPRIMARY(bool lp, bool &lvalue) {
    Type left;
    string str = lexbuf;
    unsigned length = str.length() - 2; // don't account for quotation marks
    
    if (lp) {
        left = expr(lvalue);
        match(RPAREN);
    } else if (lookahead == ID) {
        string name = expect(ID);
        Parameters *p = new Parameters;
        
        if (lookahead == LPAREN) {
            match(LPAREN);
            if (lookahead != RPAREN) {
                left = exprList(*p, lvalue);
            }
            match(RPAREN);
            Symbol *checkFunc = checkFunction(name);
            Type fType = checkFunc->type();
            left = checkFunctionCall(fType, *p);
            lvalue = false;
        } else {
            Symbol *checkID = checkIdentifier(name);
            left = checkID->type();
            lvalue = left.isScalar();
        }
    } else if (isPRIMARY(lookahead)) {
        switch (lookahead) {
            case REAL:
                match(REAL);
                left = Type(DOUBLE, 0);
                lvalue = false;
                break;
            case INTEGER:
                match(INTEGER);
                left = Type(INT, 0);
                lvalue = false;
                break;
            case STRING:
                match(STRING);
                left = Type(CHAR, 0, length);
                lvalue = false;
                break;
            default:
                break;
        }
    } else if (lookahead == LPAREN) {
        match(LPAREN);
        left = expr(lvalue);
        match(RPAREN);
    }

    return left;
}

/*
 * exprList     ->  expr
 *              |   expr , exprList
 */
Type exprList(Parameters &p, bool &lvalue) {
    Type left;
    left = expr(lvalue);
    p.push_back(left);
    
    while (lookahead == COMMA) {
        match(COMMA);
        left = expr(lvalue);
        p.push_back(left);
    }
    
    return left;
}

int main() {
    openScope("GLOBAL");
    lookahead = lexan(lexbuf);
    
    while (lookahead != DONE) {
        functionOrGlobal();
    }
    
    closeScope("GLOBAL");
    return 0;
}

