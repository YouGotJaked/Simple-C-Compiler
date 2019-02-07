#ifndef CHECKER_H
#define CHECKER_H

#include <string>
#include "scope.h"
#include "symbol.h"

void openScope(std::string curS="");
void closeScope(std::string curS="");
void declareFunction(Symbol *s);
void defineFunction(Symbol *s);
void declareVariable(Symbol *s);
void checkIdentifier(const std::string &name);
void checkFunction(const std::string &name);

#endif /* CHECKER_H */
