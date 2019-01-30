#ifndef SCOPE_H
#define SCOPE_H

void open(scope);
void close();
void insert(scope, symbol);
void find(scope, name);
void lookup(scope, name);

#endif /* SCOPE_H */
