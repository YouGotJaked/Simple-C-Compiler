#include "symbol.h"

using std::string;
using std::ostream;
using std::endl;

Symbol::Symbol(string name, Type type)
	: _name(name), _type(type)
{
}

ostream &operator<<(ostream &out, const Symbol &symbol) {
    out << "NAME: " << symbol.name() << "\tType: " << endl;
    return out;
}
