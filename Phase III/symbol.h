#ifndef SYMBOL_H
#define SYMBOL_H

#include <string>
#include <ostream>
#include "type.h"

class Symbol {
	std::string _name;
	Type _type;
    
public:
	// CONSTRUCTORS
	Symbol();
	Symbol(std::string name, Type type);

	// ACCESSORS
	std::string name() const { return _name; }
	Type type() const { return _type; }
	
};

// NON_MEMBER OUTPUT FUNCTION
std::ostream &operator<<(std::ostream &out, const Type &type);

#endif /* SYMBOL_H */
