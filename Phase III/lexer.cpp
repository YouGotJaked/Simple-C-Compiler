#include <cstdio>
#include <cctype>
#include <string>
#include <iostream>
#include <unordered_map>
#include "lexer.h"
#include "tokens.h"

using std::string;
using std::cin;
using std::cerr;
using std::cout;
using std::endl;
using std::unordered_map;

int numerrors, lineno = 1;

// keywords that may not be used as identifiers
static unordered_map<string, int> keywords = {
    {"auto",        AUTO},
    {"break",       BREAK},
    {"case",        CASE},
    {"char",        CHAR},
    {"const",       CONST},
    {"continue",    CONTINUE},
    {"default",     DEFAULT},
    {"do",          DO},
    {"double",      DOUBLE},
    {"else",        ELSE},
    {"enum",        ENUM},
    {"extern",      EXTERN},
    {"float",       FLOAT},
    {"for",         FOR},
    {"goto",        GOTO},
    {"if",          IF},
    {"int",         INT},
    {"long",        LONG},
    {"register",    REGISTER},
    {"return",      RETURN},
    {"short",       SHORT},
    {"signed",      SIGNED},
    {"sizeof",      SIZEOF},
    {"static",      STATIC},
    {"struct",      STRUCT},
    {"switch",      SWITCH},
    {"typedef",     TYPEDEF},
    {"union",       UNION},
    {"unsigned",    UNSIGNED},
    {"void",        VOID},
    {"volatile",    VOLATILE},
    {"while",       WHILE}
};

/*
 * Function:    report
 *
 * Description:    Report an error to the standard error prefixed with the
 *        line number.  We'll be using this a lot later with an
 *        optional string argument, but C++'s stupid streams don't do
 *        positional arguments, so we actually resort to snprintf.
 *        You just can't beat C for doing things down and dirty.
 */

void report(const string &str, const string &arg)
{
    char buf[1000];
    
    snprintf(buf, sizeof(buf), str.c_str(), arg.c_str());
    cerr << "line " << lineno << ": " << buf << endl;
    numerrors++;
}


/*
 * Function:    lexan
 *
 * Description: Store matched text in lexbuf and return an integer token value.
 */
int lexan(string &lexbuf) {
    static int c = cin.get();
    
    while (!cin.eof()) {     // 10 = line feed
        // clear buffer
        lexbuf.clear();
        
        // handle comments
        while (isspace(c)) {
            if (c == '\n') {
                lineno++;
            }
            c = cin.get();
        }
    
        // handle identifiers and keywords
        if (isalpha(c) || c == '_') {
            do {
                lexbuf += c;
                c = cin.get();
            } while (isalnum(c) || c == '_');
            
            //int KEYWORD = keywords[lexbuf.c_str()];
            //return KEYWORD ? isKeyword(lexbuf) : ID;
            
            auto iter = keywords.find(lexbuf.c_str());
            int KEYWORD = keywords[lexbuf.c_str()];
            if (iter != keywords.end() && KEYWORD != 0) {
                //cout << "keyword: " << lexbuf << endl;
                return KEYWORD;
            } else {
                return ID;
            }
            
        }
        // handle integers and real numbers
        else if (isdigit(c)) {
            // integer half
            do {
                lexbuf += c;
                c = cin.get();
            } while (isdigit(c));
            
            // decimal half
            if (c != '.') {
                return INTEGER;
            }
            
            lexbuf += c;
            c = cin.get();
            
            if (isdigit(c)) {
                do {
                    lexbuf += c;
                    c = cin.get();
                } while (isdigit(c));
            
                if (c == 'e' || c == 'E') {
                    lexbuf += c;
                    c = cin.get();
                    
                    if (c == '-' || c == '+') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    
                    if (isdigit(c)) {
                        do {
                            lexbuf += c;
                            c = cin.get();
                        } while (isdigit(c));
                    } else {
                        report("Missing exponent of floating-point constant");
                    }
                }
            } else {
                report("Missing fractional component of floating-point constant");
            }
            return REAL;
        } else {
            lexbuf += c;

            switch (c) {
                // string literals
                case '"':
                    do {
                        c = cin.get();
                        lexbuf += c;
                    } while(c != '"' && c != '\n' && !cin.eof());
                    c = cin.get();
                    return STRING;
                // handle comments and division
                case '/':
                    c = cin.get();
                    // comments
                    if (c == '*') {
                        do {
                            while (c != '*' && !cin.eof()) {
                                c = cin.get();
                            }
                            c = cin.get();
                        } while (c != '/' && !cin.eof());
                        c = cin.get();
                        break;
                    }
                    // division
                    else {
                        return DIV;
                    }
                // handle || operator
                case '|':
                    c = cin.get();
                    if (c == '|') {
                        lexbuf += c;
                        c = cin.get();
                        return OR;
                    }
                    return ERROR;
                // handle = and == operators
                case '=':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                        return EQL;
                    }
                    return ASSIGN;
                // handle & and && operators
                case '&':
                    c = cin.get();
                    if (c == '&') {
                        lexbuf += c;
                        c = cin.get();
                        return AND;
                    }
                    return ADDR;
                // handle ! and != operators
                case '!':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                        return NEQ;
                    }
                    return NOT;
                // handle < and <= operators
                case '<':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                        return LEQ;
                    }
                    return LTN;
                // handle > and >= operators
                case '>':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                        return GEQ;
                    }
                    return GTN;
                // handle + and ++ operators
                case '+':
                    c = cin.get();
                    if (c == '+') {
                        lexbuf += c;
                        c = cin.get();
                        return INC;
                    }
                    return ADD;
                // handle - and -- and -> operators
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
                    return DASH;
                // handle * operator
                case '*':
                    c = cin.get();
                    return STAR;
                // handle % operator
                case '%':
                    c = cin.get();
                    return REM;
                // handle . operator
                case '.':
                    c = cin.get();
                    return DOT;
                // handle ( operator
                case '(':
                    c = cin.get();
                    return LPAREN;
                // handle ) operator
                case ')':
                    c = cin.get();
                    return RPAREN;
                // handle [ operator
                case '[':
                    c = cin.get();
                    return LBRACKET;
                // handle ] operator
                case ']':
                    c = cin.get();
                    return RBRACKET;
                // handle { operator
                case '{':
                    c = cin.get();
                    return LBRACE;
                // handle } operator
                case '}':
                    c = cin.get();
                    return RBRACE;
                // handle ; operator
                case ';':
                    c = cin.get();
                    return SEMICOLON;
                // handle : operator
                case ':':
                    c = cin.get();
                    return COLON;
                // handle , operator
                case ',':
                    c = cin.get();
                    return COMMA;
                // handle EOF
                case EOF:
                    return DONE;
                // handle illegal tokens
                default:
                    c = cin.get();
                    return ERROR;
            }
        }
    }
    return DONE;
}

bool isKeyword(string &lexbuf) {
    auto iter = keywords.find(lexbuf.c_str());
    int KEYWORD = keywords[lexbuf.c_str()];
    return iter != keywords.end() && KEYWORD != 0;
}

/*
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
*/
