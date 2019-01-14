#include <cstdio>
#include <cctype>
#include <string>
#include <iostream>
#include <set>

using std::string;
using std::cin;
using std::cout;
using std::endl;
using std::set;

enum {
    KEYWORD, ID, INTEGER, REAL, STRING, OPERATOR, DONE,
};

// keywords that may not be used as identifiers
set<string> keywords = {
    "auto",
    "break",
    "case",
    "char",
    "const",
    "continue",
    "default",
    "do",
    "double",
    "else",
    "enum",
    "extern",
    "float",
    "for",
    "goto",
    "if",
    "int",
    "long",
    "register",
    "return",
    "short",
    "signed",
    "sizeof",
    "static",
    "struct",
    "switch",
    "typedef",
    "union",
    "unsigned",
    "void",
    "volatile",
    "while"
};

// store matched text in lexbuf and return an integer token value
int lexan(string &lexbuf) {
    static char c = cin.get();
    
    while (!cin.eof()) {
        // clear buffer
        lexbuf.clear();
        
        // handle comments
        while (isspace(c)) {
            c = cin.get();
        }
        
        // handle identifiers and keywords
        if (isalpha(c) || c == '_') {
            do {
                lexbuf += c;
                c = cin.get();
            } while (isalnum(c) || c == '_');
            
            if (keywords.find(lexbuf.c_str()) != keywords.end()) {
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
            } while (isdigit(c) || c == 'e' || c == 'E' || c == '+');
            
            // decimal half
            if (c != '.' && c != '-') {
                return INTEGER;
            } else {
                do {
                    lexbuf += c;
                    c = cin.get();
                } while (isdigit(c) || c == 'e' || c == 'E' || c == '-' || c == '+');
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
                        return OPERATOR;
                    }
                // handle || operator
                case '|':
                    c = cin.get();
                    if (c == '|') {
                        lexbuf += c;
                        c = cin.get();
                        return OPERATOR;
                    }
                    break;
                // handle = and == operators
                case '=':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    return OPERATOR;
                // handle & and && operators
                case '&':
                    c = cin.get();
                    if (c == '&') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    return OPERATOR;
                // handle ! and != operators
                case '!':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    return OPERATOR;
                // handle < and <= operators
                case '<':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    return OPERATOR;
                // handle > and >= operators
                case '>':
                    c = cin.get();
                    if (c == '=') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    return OPERATOR;
                // handle + and ++ operators
                case '+':
                    c = cin.get();
                    if (c == '+') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    return OPERATOR;
                // handle - and -- and -> operators
                case '-':
                    c = cin.get();
                    if (c == '-' || c == '>') {
                        lexbuf += c;
                        c = cin.get();
                    }
                    
                    return OPERATOR;
                // handle * operator
                case '*':
                    c = cin.get();
                    return OPERATOR;
                // handle % operator
                case '%':
                    c = cin.get();
                    return OPERATOR;
                // handle . operator
                case '.':
                    c = cin.get();
                    return OPERATOR;
                // handle ( operator
                case '(':
                    c = cin.get();
                    return OPERATOR;
                // handle ) operator
                case ')':
                    c = cin.get();
                    return OPERATOR;
                // handle [ operator
                case '[':
                    c = cin.get();
                    return OPERATOR;
                // handle ] operator
                case ']':
                    c = cin.get();
                    return OPERATOR;
                // handle { operator
                case '{':
                    c = cin.get();
                    return OPERATOR;
                // handle } operator
                case '}':
                    c = cin.get();
                    return OPERATOR;
                // handle ; operator
                case ';':
                    c = cin.get();
                    return OPERATOR;
                // handle : operator
                case ':':
                    c = cin.get();
                    return OPERATOR;
                // handle , operator
                case ',':
                    c = cin.get();
                    return OPERATOR;
                // handle illegal tokens
                default:
                    c = cin.get();
                    break;
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
                
            case KEYWORD:
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
                
            case OPERATOR:
                type = "operator";
                break;
        }
        
        cout << type << ":" << lexbuf << endl;
    }
    
    return 0;
}
