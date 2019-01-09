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
static set<string> keywords = {
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

static set<string> operators = {
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

int line = 1;

// Store matched text in lexbuf and return an integer token value.
int lexan(string &lexbuf) {
    while (!cin.eof()) {
        char c = cin.get();

        // clear buffer
        lexbuf.clear();
        
        // ignore whitespace
        while (isspace(c)) {
            c = cin.get();
        }
        
        // handle comments and division
        if (c == '/') {
            c = cin.get();
            if (c == '*') {
                while (c != '/' && !cin.eof()) {
                    while (c != '*' && !cin.eof()) {
                        c = cin.get();
                    }
                    c = cin.get();
                }
            } else {
                lexbuf += c;
                return OPERATOR;
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
            while (isdigit(c)) {
                lexbuf += c;
                c = cin.get();
            }
            
            if (c != '.') {
                return INTEGER;
            } else {
                do {
                    lexbuf += c;
                    c = cin.get();
                } while (isdigit(c) || c == 'e' || c == 'E' || c == '-' || c == '+');
            }
            return REAL;
        }
        // handle string literals
        else if (c == '"') {
            do {
                lexbuf += c;
                c = cin.get();
            } while(c != '"' && c != '\n' && !cin.eof());
            lexbuf += c;
            return STRING;
        }

        else if (operators.find(string(1,c).c_str()) != operators.end()) {
            lexbuf += c;
            c = cin.get();
            string temp = lexbuf + string(1,c);
            if (operators.find(temp.c_str()) != operators.end()) {
                lexbuf += c;
            }
            return OPERATOR;
        } else {
            cout << "ILLEGAL TOKEN " << c << " ON LINE " << line << endl;
            c = cin.get();
        }
        line++;
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
