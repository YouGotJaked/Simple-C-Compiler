#ifndef LEXER_H
#define LEXER_H

extern int lineno, numerrors;

void report(const std::string &str, const std::string &arg = "");
int lexan(std::string &lexbuf);

#endif /* LEXER_H */
