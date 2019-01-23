#!/bin/bash

echo "Compiling lexical and syntax analyzer..."
make clean
make
echo "DONE"

DIRECTORY="$PWD/results/"
if [ ! -d "$DIRECTORY" ]; then
	echo "$DIRECTORY does not exist. Creating directory..."
	mkdir "$DIRECTORY"
fi

echo "Analyzing test C programs..."
./scc < examples/fib.c > results/fib.out
./scc < examples/hello.c > results/hello.out
./scc < examples/malloc.c > results/malloc.out
./scc < examples/real.c > results/real.out
./scc < examples/sum.c > results/sum.out
echo "DONE"

echo "Testing difference..."
echo "FIB"
diff examples/fib.out results/fib.out
echo "HELLO"
diff examples/hello.out results/hello.out
echo "MALLOC"
diff examples/malloc.out results/malloc.out
echo "REAL"
diff examples/real.out results/real.out
echo "SUM"
diff examples/sum.out results/sum.out
echo "DONE"
