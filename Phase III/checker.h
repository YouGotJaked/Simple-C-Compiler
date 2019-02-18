#ifndef CHECKER_H
#define CHECKER_H

#include <string>
#include "scope.h"
#include "symbol.h"

void openScope(const std::string scopeType=" ");
void closeScope(const std::string scopeType=" ");
Symbol *declareFunction(const Symbol &symbol);
void defineFunction(const Symbol &s);
void declareVariable(const Symbol &s);
void checkIdentifier(const std::string &name);
void checkFunction(const std::string &name);

#endif /* CHECKER_H */
