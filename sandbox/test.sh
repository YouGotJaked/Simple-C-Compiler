#!/bin/bash

echo
echo "Cleaning object files..."
make clean
echo "DONE"

echo
echo "Compiling..."
make
echo "DONE"

echo
RESULTS="$PWD/results/"
if [ ! -d "$RESULTS" ]; then
	echo "$RESULTS does not exist. Creating directory..."
	mkdir "$RESULTS"
fi

echo "Analyzing examples..."
if false; then
echo ---------array.c------------
./scc < examples/array.c > results/array.s
gcc -m32 results/array.s examples/array-lib.c
./a.out > results/array.out
diff results/array.out examples/array.out

echo ---------local.c------------
./scc < examples/local.c > results/local.s
gcc -m32 results/local.s examples/local-lib.c
./a.out > results/local.out
diff results/local.out examples/local.out

echo ---------putchar.c----------
./scc < examples/putchar.c > results/putchar.s
gcc -m32 results/putchar.s
./a.out > results/putchar.out
diff results/putchar.out examples/putchar.out

echo ---------towers.c-----------
./scc < examples/towers.c > results/towers.s
gcc -m32 results/towers.s examples/towers-lib.c
./a.out > results/towers.out
diff results/towers.out examples/towers.out
fi

echo ---------double.c-----------
./scc < examples/double.c > results/double.s
gcc -m32 results/double.s
./a.out < examples/double.in > results/double.out
diff results/double.out examples/double.out

echo ---------fib.c--------------
./scc < examples/fib.c > results/fib.s
gcc -m32 results/fib.s
./a.out < examples/fib.in > results/fib.out
diff results/fib.out examples/fib.out

echo ---------global.c-----------
./scc < examples/global.c > results/global.s
gcc -m32 results/global.s
./a.out < examples/global.in > results/global.out
diff results/global.out examples/global.out

echo ---------hello.c------------
./scc < examples/hello.c > results/hello.s
gcc -m32 results/hello.s
./a.out < examples/hello.in > results/hello.out
diff results/hello.out examples/hello.out

echo ---------int.c--------------
./scc < examples/int.c > results/int.s
gcc -m32 results/int.s
./a.out < examples/int.in > results/int.out
diff results/int.out examples/int.out

echo ---------matrix.c-----------
./scc < examples/matrix.c > results/matrix.s
gcc -m32 results/matrix.s
./a.out < examples/matrix.in > results/matrix.out
diff results/matrix.out examples/matrix.out

echo ---------mixed.c------------
./scc < examples/mixed.c > results/mixed.s
gcc -m32 results/mixed.s
./a.out < examples/tree.in > results/tree.out
diff results/tree.out examples/tree.out

echo ---------tree.c-------------
./scc < examples/tree.c > results/tree.s
gcc -m32 results/tree.s
./a.out < examples/tree.in > results/tree.out
diff results/tree.out examples/tree.out

echo "DONE"
