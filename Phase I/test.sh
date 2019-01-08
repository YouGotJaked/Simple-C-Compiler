#!/bin/bash

echo "Compiling lexical analyzer..."
g++ lexer.cpp -std=gnu++11
echo "DONE"

cd "$PWD"
DIRECTORY="$PWD/results/"
if [ ! -d "$DIRECTORY" ]
then
	echo "$DIRECTORY does not exist. Creating directory..."
	mkdir "$DIRECTORY"
fi

echo "Analyzing test C programs..."
./a.out < examples/fib.c > results/fib.txt
./a.out < examples/hello.c > results/hello.txt
./a.out < examples/list.c > results/list.txt
./a.out < examples/malloc.c > results/malloc.txt
./a.out < examples/real.c > results/real.txt
./a.out < examples/sum.c > results/sum.txt
./a.out < examples/tricky.c > results/tricky.txt
echo "DONE"
