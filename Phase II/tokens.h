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
    NEG,
    AUTO,
    BREAK,
    CASE,
    CHAR,
    CONST,
    CONTINUE,           // 270
    DEFAULT,
    DO,
    DONE,               // 273
    DOUBLE,
    ELSE,               // 275
    ENUM,
    ERROR,
    EXTERN,
    FLOAT,
    FOR,                // 280
    GOTO,
    ID,
    IF,
    INT,
    INTEGER,            // 285
    LONG,
    PTR,
    REAL,
    REGISTER,
    RETURN,             // 290
    SHORT,
    SIGNED,
    SIZEOF,
    STATIC,
    STRING,             // 295
    STRUCT,
    SWITCH,
    TYPEDEF,
    UNION,
    UNSIGNED,           // 300
    VOID,
    VOLATILE,
    WHILE
};

# endif /* TOKENS_H */
