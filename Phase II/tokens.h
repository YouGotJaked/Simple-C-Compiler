# ifndef TOKENS_H
# define TOKENS_H

enum operators{
    ASSIGN = '=',
    LBRACKET = '[',
    RBRACKET = ']',
    LPAREN = '(',
    RPAREN = ')',
    LBRACE = '{',
    RBRACE = '}',
    ADDR = '&',
    //DEREF = '*',
    NOT = '!',
    //NEG = '-',
    MUL = '*',          // conflict
    DIV = '/',
    REM = '%',
    ADD = '+',
    SUB = '-',          // conflict
    DOT = '.',
    SEMICOLON = ';',
    COLON = ':',
    COMMA = ',',
    LTN = '<',
    GTN = '>',
    LEQ = 256,
    GEQ,
    EQL,
    NEQ,
    AND,
    OR,
    DEC,
    INC,
    PTR,              // = 264
    DEREF,
    NEG
};

enum keywords{
    AUTO = 267,
    BREAK,
    CASE,
    CHAR,
    CONST,
    CONTINUE,
    DEFAULT,
    DO,
    DOUBLE,
    ELSE,
    ENUM,
    EXTERN,
    FLOAT,
    FOR,
    GOTO,
    IF,
    INT,
    LONG,
    REGISTER,
    RETURN,
    SHORT,
    SIGNED,
    SIZEOF,
    STATIC,
    STRUCT,
    SWITCH,
    TYPEDEF,
    UNION,
    UNSIGNED,
    VOID,
    VOLATILE,
    WHILE
};

# endif /* TOKENS_H */
