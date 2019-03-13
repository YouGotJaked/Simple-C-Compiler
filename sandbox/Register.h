#ifndef REGISTER_H
#define REGISTER_H

#include <string>
#include <ostream>
#include <vector>

class Register {
    typedef std::string string;
    string _oword;
    string _lword;
    string _byte;
    bool _isFP;

public:
    Register();
    Register(const string &lword, const string &byte);
    Register(const string &oword);
    bool isFP() { return _isFP; }
    class Expression *_node;
    const string &name(unsigned size = 0) const;
};

// NON-MEMBER OUTPUT FUNCTION
std::ostream &operator <<(std::ostream &out, const Register *reg);

typedef std::vector<Register *> Registers;
/*
static Register *eax = new Register("%eax", "%al");
static Register *ebx = new Register("%ebx", "%bl");
static Register *ecx = new Register("%ecx", "%cl");
static Register *edx = new Register("%edx", "%dl");
static Register *esi = new Register("%esi", "");
static Register *edi = new Register("%edi", "");
static Registers registers = { eax, ecx, edx };

static Register *xmm0 = new Register("%xmm0");
static Register *xmm1 = new Register("%xmm1");
static Register *xmm2 = new Register("%xmm2");
static Register *xmm3 = new Register("%xmm3");
static Register *xmm4 = new Register("%xmm4");
static Register *xmm5 = new Register("%xmm5");
static Register *xmm6 = new Register("%xmm6");
static Register *xmm7 = new Register("%xmm7");
static Registers fp_registers = { xmm0, xmm1, xmm2, xmm3, xmm4, xmm5,
					   xmm6, xmm7 };
*/
#endif /* REGISTER_H */
