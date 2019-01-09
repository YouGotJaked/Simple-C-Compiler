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
