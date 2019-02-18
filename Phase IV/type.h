#ifndef TYPE_H
#define TYPE_H

#include <vector>
#include <string>
#include <ostream>

typedef std::vector<class Type> Parameters;

class Type {
    int _kind;
	int _specifier;
	unsigned _indirection;
	unsigned _length;
	Parameters *_parameters;
    
    enum { ARRAY, FUNCTION, SCALAR, ERROR };

public:
    // DEFAULT CONSTRUCTOR
    Type();
    // SCALAR CONSTRUCTOR 
    Type(int specifier, unsigned indirection=0);
    // ARRAY CONSTRUCTOR
    Type(int specifier, unsigned indirection, unsigned length);
    // FUNCTION CONSTRUCTOR
    Type(int specifier, unsigned indirection, Parameters *parameters);
    
    // OVERLOADED OPERATORS
    bool operator==(const Type &rhs) const ;
    bool operator!=(const Type &rhs) const { return !operator==(rhs); }
    
    // HELPER FUNCTIONS
    Type promote() const;
    bool isArray() const { return _kind == ARRAY; }
    bool isFunction() const { return _kind == FUNCTION; }
    bool isScalar() const { return _kind == SCALAR; }
    bool isNumeric() const;
    bool isPointer() const;
    bool isPredicate() const { return _kind != FUNCTION; }
    bool isCompatibleWith(const Type &that) const;

    // ACCESSORS
    int kind() const { return _kind; }
    int specifier() const { return _specifier; }
    unsigned indirection() const { return _indirection; }
    unsigned length() const;
    Parameters *parameters() const { return _parameters; }
};

// NON_MEMBER OUTPUT FUNCTION
std::ostream &operator<<(std::ostream &out, const Type &type);

#endif /* TYPE_H */
