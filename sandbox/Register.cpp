#include <iostream>
#include "Register.h"
#include "Tree.h"
#include "generate.h"

using std::string;
using std::ostream;
using std::cout;
using std::endl;

Register::Register(const string &lword, const string &byte)
    : _lword(lword), _byte(byte), _isFP(false), _node(nullptr) 
{
}

Register::Register(const string &oword)
    : _oword(oword), _lword("ERROR"), _byte("ERROR"), _isFP(true), _node(nullptr)
{
}

/*
 * Function:    Register::name
 *
 * Description: Return the correct register name based on size needed.
 */
const string &Register::name(unsigned name) const {
    if (_isFP) {
	return _oword;
    } else {
	return name == 1 ? _byte : _lword;
    }
}

ostream &operator <<(ostream &out, const Register *reg) {
    if (reg->_node != nullptr) {
        return out << reg->name(reg->_node->type().size());
    }
    return out << reg->name();
}

