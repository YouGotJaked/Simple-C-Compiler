#include "symbol.h"
#include "type.h"

using std::string;

Symbol::Symbol(string name, Type type)
	: _name(name), _type(type)
{
}

