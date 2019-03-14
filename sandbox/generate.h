#include <string>
#include "Tree.h"
#include "Register.h"

void generateGlobals(const Symbols &globals);
void generateStrings();
void generateReals();
void load(Expression *expr, Register *reg);
void release();
void assign(Expression *expr, Register *reg);
void assignTemp(Expression *expr);
std::string suffix(Expression *expr);
Register *getRegister();
Register *getFPRegister();
Register *getCalleeRegister();
