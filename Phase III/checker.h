#ifndef CHECKER_H
#define CHECKER_H

#include <string>
#include "scope.h"
#include "symbol.h"

void openScope(std::string curS="");
void closeScope(std::string curS="");
Symbol *declareFunction(const std::string &name, const Type &type);
void defineFunction(const std::string &name, const Type &type);
void declareVariable(const std::string &name, const Type &type);
void checkIdentifier(const std::string &name);
void checkFunction(const std::string &name);

#endif /* CHECKER_H */
