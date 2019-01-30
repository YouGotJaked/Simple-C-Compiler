# ifndef TOKENS_H
# define TOKENS_H

enum {
    NOT = '!',          // 33
    REM = '%',          // 37
    ADDR = '&',         // 38
    LPAREN = '(',       // 40
    RPAREN = ')',       // 41
    STAR = '*',         // 42
    ADD = '+',          // 43
    COMMA = ',',        // 44
    DASH = '-',         // 45
    DOT = '.',          // 46
    DIV = '/',          // 47
    COLON = ':',        // 58
    SEMICOLON = ';',    // 59
    LTN = '<',          // 60
    ASSIGN = '=',       // 61
    GTN = '>',          // 62
    LBRACKET = '[',     // 91
    RBRACKET = ']',     // 93
    LBRACE = '{',       // 123
    RBRACE = '}',       // 125
    LEQ = 256,          // ASCII runs from 0-255
    GEQ,
    EQL,
    NEQ,
    AND,                // 260
    OR,
    DEC,
    INC,
    AUTO,
    BREAK,              // 265
    CASE,
    CHAR,
    CONST,
    CONTINUE,
    DEFAULT,            // 270
    DO,
    DONE,
    DOUBLE,
    ELSE,
    ENUM,               // 275
    ERROR,
    EXTERN,
    FLOAT,
    FOR,
    GOTO,               // 280
    ID,
    IF,
    INT,
    INTEGER,
    LONG,               // 285
    PTR,
    REAL,
    REGISTER,
    RETURN,
    SHORT,              // 290
    SIGNED,
    SIZEOF,
    STATIC,
    STRING,
    STRUCT,             // 295
    SWITCH,
    TYPEDEF,
    UNION,
    UNSIGNED,
    VOID,               // 300
    VOLATILE,
    WHILE
};

# endif /* TOKENS_H */
