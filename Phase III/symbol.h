#ifndef SYMBOL_H
#define SYMBOL_H

#include <string>
#include <ostream>
#include "type.h"

class Symbol {
	std::string _name;
	Type _type;
    bool _defined;
public:
	// CONSTRUCTORS
	Symbol();
	Symbol(std::string name, Type type, bool defined=false);

	// ACCESSORS
	std::string name() const { return _name; }
	Type type() const { return _type; }
    bool defined() const { return _defined; }
    
    // SETTERS
    void define(bool flag) { _defined = flag; }
};

// NON_MEMBER OUTPUT FUNCTION
std::ostream &operator<<(std::ostream &out, const Type &type);

#endif /* SYMBOL_H */
