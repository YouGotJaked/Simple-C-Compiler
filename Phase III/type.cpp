#include <iostream>
#include <cassert>
#include "type.h"
#include "tokens.h"

using std::string;
using std::ostream;
using std::cout;
using std::endl;

Type::Type(int specifier, unsigned indirection)
    : _kind(SCALAR), _specifier(specifier), _indirection(indirection)
{
}

Type::Type(int specifier, unsigned indirection, unsigned length)
    : _kind(ARRAY), _specifier(specifier), _indirection(indirection), _length(length)
{
}

Type::Type(int specifier, unsigned indirection, Parameters *parameters)
	:  _kind(FUNCTION), _specifier(specifier), _indirection(indirection), _parameters(parameters)
{
}

unsigned Type::length() const {
	assert(_kind == ARRAY);
	return _length;
}

bool Type::operator==(const Type &rhs) const {
	if (_kind != rhs._kind) {
		return false;
	}
	if (_kind == ERROR) {
		return true;
	}
	if (_specifier != rhs._specifier) {
		return false;
	}
	if (_indirection != rhs._indirection) {
		return false;
	}
	if (_kind == SCALAR) {
		return true;
	}
	if (_kind == ARRAY) {
		return _length == rhs._length;
	}
	if (!_parameters || !rhs._parameters) {
		return true;
	}
	return *_parameters == *rhs._parameters;
}

ostream &operator<<(ostream &out, const Type &type) {
    string ptrs = " ";
    for (unsigned i = 0; i < type.indirection(); i++) { ptrs += "*"; }
    
    string spec = "";
    switch (type.specifier()) {
        case CHAR:
            spec = "char";
            break;
        case INT:
            spec = "int";
            break;
        case DOUBLE:
            spec = "double";
            break;
        default:
            break;
    }
    
    if (type.isScalar()) {
        out << "(SCALAR: " << spec << ptrs << " )";
    } else if (type.isArray()) {
        out << "(ARRAY: " << spec << ptrs << "[" << type.length() << "] )";
    } else if (type.isFunction()) {
        size_t size = (type.parameters() == nullptr) ? 0 : type.parameters()->size();
        out << "(FUNCTION: " << spec << ptrs << " " << size << " parameters )";
    } else {
        out << "(ERROR)";
    }
    
    return out;
}

/*
int main() {
    Type t1(CHAR, 2);
    Type t2(INT, 0, 10);
    cout << t1;
    cout << t2;
    int x;
    double *p;
    char a[10];
    int **q;
    double *b[10];
    int **d[10];
    int f(int x);
    double *g(int x);
    // (INT, 0, SCALAR)
    // (DOUBLE, 1, SCALAR)
    // (CHAR, 0, ARRAY)
    // (INT, 2, SCALAR)
    // (DOUBLE, 1, ARRAY)
    // (INT, 2, ARRAY)
    // (INT, 0, FUNCTION)
    // (DOUBLE, 1, FUNCTION)
}
*/
