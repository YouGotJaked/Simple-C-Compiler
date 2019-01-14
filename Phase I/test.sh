#!/bin/bash

echo "Compiling lexical analyzer..."
make
echo "DONE"

cd "$PWD"
DIRECTORY="$PWD/results/"
if [ ! -d "$DIRECTORY" ]
then
	echo "$DIRECTORY does not exist. Creating directory..."
	mkdir "$DIRECTORY"
fi

echo "Analyzing test C programs..."
./scc < examples/fib.c > results/fib.out
./scc < examples/hello.c > results/hello.out
./scc < examples/list.c > results/list.out
./scc < examples/malloc.c > results/malloc.out
./scc < examples/real.c > results/real.out
./scc < examples/sum.c > results/sum.out
./scc < examples/tricky.c > results/tricky.out
./scc < tcase/abc_period.txt > results/abc_period.out
./scc < tcase/five_white_spaces.txt > results/five_white_spaces.out
./scc < tcase/keywords.txt > results/keywords.out
./scc < tcase/number.txt > results/number.out
./scc < tcase/numbers.txt > results/numbers.out
./scc < tcase/operators.txt > results/operators.out
echo "DONE"

echo "Testing difference..."
echo "FIB"
diff examples/fib.out results/fib.out
echo "HELLO"
diff examples/hello.out results/hello.out
echo "LIST"
diff examples/list.out results/list.out
echo "MALLOC"
diff examples/malloc.out results/malloc.out
echo "REAL"
diff examples/real.out results/real.out
echo "SUM"
diff examples/sum.out results/sum.out
echo "TRICKY"
diff examples/tricky.out results/tricky.out
echo "DONE"
