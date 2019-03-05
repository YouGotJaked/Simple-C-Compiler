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
echo ---------array.c------------
./scc < examples/array.c > results/array.s
gcc -m32 results/array.s examples/array-lib.c
./a.out > results/array.out
diff results/array.out examples/array.out

echo ---------global.c-----------
./scc < examples/global.c > results/global.s
gcc -m32 results/global.s examples/global-lib.c
./a.out > results/global.out
diff results/global.out examples/global.out

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
echo "DONE"
