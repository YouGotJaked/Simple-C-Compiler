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

// Keywords that may not be used as identifiers
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

set<string> operators = {
    "=",
    "||",
    "&&",
    "==",
    "!=",
    "<",
    ">",
    "<=",
    ">=",
    "+",
    "-",
    "*",
    "/",
    "%",
    "&",
    "!",
    "++",
    "--",
    ".",
    "->",
    "(",
    ")",
    "[",
    "]",
    "{",
    "}",
    ";",
    ":",
    ","
};

/*
void whitespace_handler(char c) {

}

void comment_handler(char c) {

}

int id_keyword_handler(char *c, string *lexbuf) {
    
}

int int_real_handler() {
    
}

int string_handler() {
    
}

int operator_handler() {
    
}
*/

// Store matched text in lexbuf and return an integer token value.
int lexan(string &lexbuf) {
    char c = cin.get();
    
    while (!cin.eof()) {
        // clear buffer
        lexbuf.clear();
        
        // ignore whitespace
        while (isspace(c)) {
            c = cin.get();
        }
        
        // handle comments
        if (c == '/') {
            c = cin.get();
            if (c == '*') {
                do {
                    while (c != '*' && !cin.eof()) {
                        c = cin.get();
                    }
                    c = cin.get();
                } while (c != '/' && !cin.eof());
            }
        }
        // handle identifiers and keywords
        else if (isalpha(c) || c == '_') {
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
            // [0-9]+
            do {
                lexbuf += c;
                c = cin.get();
            } while (isdigit(c));
            
            if (c != '.') {
                return INTEGER;
            } else {
                do {
                    lexbuf += c;
                    c = cin.get();
                } while (isdigit(c) || c == 'e' || c == 'E' || c == '-' || c == '+');
                // TODO: implement scientific notation ([eE][+-]?[0-9]+)?
            }
            return REAL;
        }
        // handle string literals
        else if (c == '"') {
            do {
                lexbuf += c;
                c = cin.get();
            } while (c != '"' && c != '\n' && !cin.eof());  // TODO: ignore \n
            lexbuf += c;
            return STRING;
        }
        // handle operators
        else {
            lexbuf += c;
            // single operators
            if (operators.find(lexbuf.c_str()) != operators.end()) {
                return OPERATOR;
            } else {    // double operators
                c = cin.get();
                lexbuf += c;
                if (operators.find(lexbuf.c_str()) != operators.end()) {
                    return OPERATOR;
                }
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
