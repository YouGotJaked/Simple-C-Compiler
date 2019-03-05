#ifndef LABEL_H
#define LABEL_H

#include <ostream>

class Label {
	static unsigned _counter;
	unsigned _number;

public:
	Label();
	unsigned number() const { return _number; }
};

std::ostream &operator <<(std::ostream &out, const Label &label);

#endif /* LABEL_H */
