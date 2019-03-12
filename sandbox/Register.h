#ifndef REGISTER_H
#define REGISTER_H

#include <string>
#include <ostream>
#include <vector>

class Register {
	typedef std::string string;
	string _lword;
	string _byte;

public:
    Register();
	Register(const string &lword, const string &byte="");
	class Expression *_node;
	const string &name(unsigned size = 0) const;
};

class FPRegister: public Register {
	typedef std::string string;
	string _oword;

public:
	FPRegister(const string &oword);
	const string &name(unsigned size = 0) const;
};

// NON-MEMBER HELPER FUNCTIONS
Register *getRegister();
FPRegister *getFPRegister();

// NON-MEMBER OUTPUT FUNCTION
std::ostream &operator <<(std::ostream &out, const Register *reg);

typedef std::vector<Register *> Registers;
typedef std::vector<FPRegister *> FPRegisters;

static Register *eax = new Register("%eax", "%al");
static Register *ebx = new Register("%ebx", "%bl");
static Register *ecx = new Register("%ecx", "%cl");
static Register *edx = new Register("%edx", "%dl");
static Register *esi = new Register("%esi");
static Register *edi = new Register("%edi");
static Registers registers = { eax, ebx, ecx, edx };

static FPRegister *xmm0 = new FPRegister("%xmm0");
static FPRegister *xmm1 = new FPRegister("%xmm1");
static FPRegister *xmm2 = new FPRegister("%xmm2");
static FPRegister *xmm3 = new FPRegister("%xmm3");
static FPRegister *xmm4 = new FPRegister("%xmm4");
static FPRegister *xmm5 = new FPRegister("%xmm5");
static FPRegister *xmm6 = new FPRegister("%xmm6");
static FPRegister *xmm7 = new FPRegister("%xmm7");
static FPRegisters fp_registers = { xmm0, xmm1, xmm2, xmm3, xmm4, xmm5,
					   xmm6, xmm7 };

#endif /* REGISTER_H */
