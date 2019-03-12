/*
 * File:	generator.h
 *
 * Description:	This file contains the function declarations for the code
 *		generator for Simple C.  Most of the function declarations
 *		are actually member functions provided as part of Tree.h.
 */

# ifndef GENERATOR_H
# define GENERATOR_H
#include <string>
#include "Tree.h"
#include "Register.h"
# include "Scope.h"

void generateGlobals(Scope *scope);
void generateStrings();
void load(Expression *expr, Register *reg);
void release();
void assign(Expression *expr, Register *reg);
void assignTemp(Expression *expr);
std::string suffix(Expression *expr);
# endif /* GENERATOR_H */
