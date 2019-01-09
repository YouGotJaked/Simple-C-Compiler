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
./scc < examples/fib.c > results/fib.txt
./scc < examples/hello.c > results/hello.txt
./scc < examples/list.c > results/list.txt
./scc < examples/malloc.c > results/malloc.txt
./scc < examples/real.c > results/real.txt
./scc < examples/sum.c > results/sum.txt
./scc < examples/tricky.c > results/tricky.txt
echo "DONE"

echo "Testing difference..."
diff examples/fib.out results/fib.txt
diff examples/hello.out results/hello.txt
diff examples/list.out results/list.txt
diff examples/malloc.out results/malloc.txt
diff examples/real.out results/real.txt
diff examples/sum.out results/sum.txt
diff examples/tricky.out results/tricky.txt
echo "DONE"
