#include <iostream>
#include "Register.h"
#include "Tree.h"
#include "generate.h"

using std::string;
using std::ostream;
using std::cout;
using std::endl;

Register::Register(const string &lword, const string &byte)
    : _lword(lword), _byte(byte), _node(nullptr)
{
}

FPRegister::FPRegister(const string &oword)
    : Register("", ""), _oword(oword)
{
}

/*
 * Function:    Register::name
 *
 * Description: Return the correct register name based on size needed.
 */
const string &Register::name(unsigned name) const {
    return name == 1 ? _byte : _lword;
}

const string &FPRegister::name(unsigned name) const {
    return _oword;
}

/*
 * Function:	getRegister
 *
 * Description:	Return the first available register. If no registers are
 *		available, spill the first register.
 */
Register *getRegister() {
    for (auto const &reg: registers) {
        if (reg->_node == nullptr) {
	    cout << "#reg " << reg << " is empty" << endl;
            return reg;
        }
    }
    // spill first register so it's available
    load(nullptr, registers[0]);
    return registers[0];
}

/*
 * Function:	getFPRegister
 *
 * Description:	Return the first available floating-point register. The logic
 *		of this function is the same as that of getRegister.
 */
FPRegister *getFPRegister() {
    for (auto const &fp_reg: fp_registers) {
	if (fp_reg->_node == nullptr) {
	    return fp_reg;
	}
    }

    load(nullptr, fp_registers[0]);
    return fp_registers[0];
}

ostream &operator <<(ostream &out, const Register *reg) {
    if (reg->_node != nullptr) {
        return out << reg->name(reg->_node->type().size());
    }
    return out << reg->name();
}
