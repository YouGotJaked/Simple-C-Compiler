#include "Label.h"

using std::ostream;

unsigned Label::_counter = 0;

Label::Label() {
	_number = _counter++;
}

ostream &operator <<(ostream &out, const Label &label) {
	return out << ".L" << label.number();
}
