/*
 * File:	lexer.cpp
 *
 * Description:	This file contains the public and private function and
 *		variable definitions for the lexical analyzer for Simple C.
 */

# include <cstdio>
# include <cctype>
# include <string>
# include <iostream>
# include "lexer.h"
# include "../../Phase II/tokens.h"

using namespace std;
int numerrors, lineno = 1;


/* Yes, we could have used a map, but we'd probably initialize it with an
   array anyway, and let's face it, it's pretty simple to search an array. */

static struct {
    string lexeme;
    int token;
} keywords[] = {
    {"auto",     AUTO},
    {"break",    BREAK},
    {"case",     CASE},
    {"char",     CHAR},
    {"const",    CONST},
    {"continue", CONTINUE},
    {"default",  DEFAULT},
    {"do",       DO},
    {"double",   DOUBLE},
    {"else",     ELSE},
    {"enum",     ENUM},
    {"extern",   EXTERN},
    {"float",    FLOAT},
    {"for",      FOR},
    {"goto",     GOTO},
    {"if",       IF},
    {"int",      INT},
    {"long",     LONG},
    {"register", REGISTER},
    {"return",   RETURN},
    {"short",    SHORT},
    {"signed",   SIGNED},
    {"sizeof",   SIZEOF},
    {"static",   STATIC},
    {"struct",   STRUCT},
    {"switch",   SWITCH},
    {"typedef",  TYPEDEF},
    {"union",    UNION},
    {"unsigned", UNSIGNED},
    {"void",     VOID},
    {"volatile", VOLATILE},
    {"while",    WHILE},
};

# define numKeywords (sizeof(keywords) / sizeof(keywords[0]))


/*
 * Function:	report
 *
 * Description:	Report an error to the standard error prefixed with the
 *		line number.  We'll be using this a lot later with an
 *		optional string argument, but C++'s stupid streams don't do
 *		positional arguments, so we actually resort to snprintf.
 *		You just can't beat C for doing things down and dirty.
 */

void report(const string &str, const string &arg)
{
    char buf[1000];

    snprintf(buf, sizeof(buf), str.c_str(), arg.c_str());
    cerr << "line " << lineno << ": " << buf << endl;
    numerrors ++;
}


/*
 * Function:	lexan
 *
 * Description:	Read and tokenize the standard input stream.  The lexeme is
 *		stored in a buffer.
 */

int lexan(string &lexbuf)
{
    int p;
    unsigned i;
    static int c = cin.get();


    /* The invariant here is that the next character has already been read
       and is ready to be classified.  In this way, we eliminate having to
       push back characters onto the stream, merely to read them again. */

    while (!cin.eof()) {
	lexbuf.clear();


	/* Ignore white space */

	while (isspace(c)) {
	    if (c == '\n')
		lineno ++;

	    c = cin.get();
	}


	/* Check for an identifier or a keyword */

	if (isalpha(c) || c == '_') {
	    do {
		lexbuf += c;
		c = cin.get();
	    } while (isalnum(c) || c == '_');

	    for (i = 0; i < numKeywords; i ++)
		if (keywords[i].lexeme == lexbuf)
		    return keywords[i].token;

	    return ID;


	/* Check for a number */

	} else if (isdigit(c)) {
	    do {
		lexbuf += c;
		c = cin.get();
	    } while (isdigit(c));

	    return INTEGER;


	/* There must be an easier way to do this.  It might seem stupid at
	   this point to recognize each token separately, but eventually
	   we'll be returning separate token values to the parser, so we
	   might as well do it now. */

	} else {
	    lexbuf += c;

	    switch(c) {


	    /* Check for '||' */

	    case '|':
		c = cin.get();

		if (c == '|') {
		    lexbuf += c;
		    c = cin.get();
		    return OR;
		}

		return ERROR;


	    /* Check for '=' and '==' */

	    case '=':
		c = cin.get();

		if (c == '=') {
		    lexbuf += c;
		    c = cin.get();
		    return EQL;
		}

		return '=';


	    /* Check for '&' and '&&' */

	    case '&':
		c = cin.get();

		if (c == '&') {
		    lexbuf += c;
		    c = cin.get();
		    return AND;
		}

		return '&';


	    /* Check for '!' and '!=' */

	    case '!':
		c = cin.get();

		if (c == '=') {
		    lexbuf += c;
		    c = cin.get();
		    return NEQ;
		}

		return '!';


	    /* Check for '<' and '<=' */

	    case '<':
		c = cin.get();

		if (c == '=') {
		    lexbuf += c;
		    c = cin.get();
		    return LEQ;
		}

		return '<';


	    /* Check for '>' and '>=' */

	    case '>':
		c = cin.get();

		if (c == '=') {
		    lexbuf += c;
		    c = cin.get();
		    return GEQ;
		}

		return '>';


	    /* Check for '-', '--', and '->' */

	    case '-':
		c = cin.get();

		if (c == '-') {
		    lexbuf += c;
		    c = cin.get();
		    return DEC;

		} else if (c == '>') {
		    lexbuf += c;
		    c = cin.get();
		    return PTR;
		}

		return '-';


	    /* Check for '+' and '++' */

	    case '+':
		c = cin.get();

		if (c == '+') {
		    lexbuf += c;
		    c = cin.get();
		    return INC;
		}

		return '+';


	    /* Check for simple, single character tokens */

	    case '*': case '%': case ':': case ';':
	    case '(': case ')': case '[': case ']':
	    case '{': case '}': case '.': case ',':
		c = cin.get();
		return lexbuf[0];


	    /* Check for '/' or a comment */

	    case '/':
		c = cin.get();

		if (c == '*') {
		    do {
			while (c != '*' && !cin.eof()) {
			    if (c == '\n')
				lineno ++;

			    c = cin.get();
			}

			c = cin.get();
		    } while (c != '/' && !cin.eof());

		    c = cin.get();
		    break;

		} else
		    return '/';


	    /* Check for a string literal */

	    case '"':
		do {
		    p = c;
		    c = cin.get();
		    lexbuf += c;
		} while ((c != '"' || p == '\\') && c != '\n' && !cin.eof());

		if (c == '\n' || cin.eof())
		    report("malformed string literal");

		c = cin.get();
		return STRING;


	    /* Handle EOF here as well */

	    case EOF:
		return DONE;


	    /* Everything else is illegal */

	    default:
		c = cin.get();
		return ERROR;
	    }
	}
    }

    return DONE;
}

int main() {
    int token;
    string lexbuf, type;
    
    while ((token = lexan(lexbuf)) != DONE) {
        switch(token) {
            case ID:
                type = "identifier";
                break;
                
            case AUTO:
                type = "keyword";
                break;
                
            case BREAK:
                type = "keyword";
                break;
                
            case CASE:
                type = "keyword";
                break;
                
            case CHAR:
                type = "keyword";
                break;
                
            case CONST:
                type = "keyword";
                break;
                
            case CONTINUE:
                type = "keyword";
                break;
                
            case DEFAULT:
                type = "keyword";
                break;
                
            case DO:
                type = "keyword";
                break;
                
            case DOUBLE:
                type = "keyword";
                break;
                
            case ELSE:
                type = "keyword";
                break;
                
            case ENUM:
                type = "keyword";
                break;
                
            case EXTERN:
                type = "keyword";
                break;
                
            case FLOAT:
                type = "keyword";
                break;
                
            case FOR:
                type = "keyword";
                break;
                
            case GOTO:
                type = "keyword";
                break;
                
            case IF:
                type = "keyword";
                break;
                
            case INT:
                type = "keyword";
                break;
                
            case LONG:
                type = "keyword";
                break;
                
            case REGISTER:
                type = "keyword";
                break;
                
            case RETURN:
                type = "keyword";
                break;
                
            case SHORT:
                type = "keyword";
                break;
                
            case SIGNED:
                type = "keyword";
                break;
                
            case SIZEOF:
                type = "keyword";
                break;
                
            case STATIC:
                type = "keyword";
                break;
                
            case STRUCT:
                type = "keyword";
                break;
                
            case SWITCH:
                type = "keyword";
                break;
                
            case TYPEDEF:
                type = "keyword";
                break;
                
            case UNION:
                type = "keyword";
                break;
                
            case UNSIGNED:
                type = "keyword";
                break;
                
            case VOID:
                type = "keyword";
                break;
                
            case VOLATILE:
                type = "keyword";
                break;
                
            case WHILE:
                type = "keyword";
                break;
                
            case INTEGER:
                type = "integer";
                break;
                
            case REAL:
                type = "real";
                break;
                
            case STRING:
                type = "string";
                break;
                
            case ASSIGN:
                type = "operator";
                break;
                
            case LBRACKET:
                type = "operator";
                break;
                
            case RBRACKET:
                type = "operator";
                break;
                
            case LPAREN:
                type = "operator";
                break;
                
            case RPAREN:
                type = "operator";
                break;
                
            case LBRACE:
                type = "operator";
                break;
                
            case RBRACE:
                type = "operator";
                break;
                
            case ADDR:
                type = "operator";
                break;
                
            case NOT:
                type = "operator";
                break;
                
            case STAR:
                type = "operator";
                break;
                
            case DIV:
                type = "operator";
                break;
                
            case REM:
                type = "operator";
                break;
                
            case ADD:
                type = "operator";
                break;
                
            case DASH:
                type = "operator";
                break;
                
            case DOT:
                type = "operator";
                break;
                
            case SEMICOLON:
                type = "operator";
                break;
                
            case COLON:
                type = "operator";
                break;
                
            case COMMA:
                type = "operator";
                break;
                
            case LTN:
                type = "operator";
                break;
                
            case GTN:
                type = "operator";
                break;
                
            case LEQ:
                type = "operator";
                break;
                
            case GEQ:
                type = "operator";
                break;
                
            case EQL:
                type = "operator";
                break;
                
            case NEQ:
                type = "operator";
                break;
                
            case AND:
                type = "operator";
                break;
                
            case OR:
                type = "operator";
                break;
                
            case DEC:
                type = "operator";
                break;
                
            case INC:
                type = "operator";
                break;
                
            case PTR:
                type = "operator";
                break;
                
            case NEG:
                type = "operator";
                break;
        }
        
        cout << type << ":" << lexbuf << endl;
    }
    
    return 0;
}
