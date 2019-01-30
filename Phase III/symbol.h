#ifndef SYMBOL_H
#define SYMBOL_H

#include <string>
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

#endif /* SYMBOL_H */
