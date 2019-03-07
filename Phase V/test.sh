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

echo "Analyzing tests..."
echo ---------test00.c-----------
./scc < tests/test00.c > results/test00.s
gcc -m32 results/test00.s
./a.out > results/test00.out
diff results/test00.out tests/test00.out

echo ---------test01.c-----------
./scc < tests/test01.c > results/test01.s
gcc -m32 results/test01.s tests/test01-lib.c
./a.out > results/test01.out
diff results/test01.out tests/test01.out

echo ---------test02.c-----------
./scc < tests/test02.c > results/test02.s
gcc -m32 results/test02.s tests/test02-lib.c
./a.out > results/test02.out
diff results/test02.out tests/test02.out

echo ---------test00.c-----------
./scc < tests/test03.c > results/test03.s
gcc -m32 results/test03.s
./a.out > results/test03.out
diff results/test03.out tests/test03.out

echo ---------test04.c-----------
./scc < tests/test04.c > results/test04.s
gcc -m32 results/test04.s
./a.out > results/test04.out
diff results/test04.out tests/test04.out

echo ---------test05.c-----------
./scc < tests/test05.c > results/test05.s
gcc -m32 results/test05.s tests/test05-lib.c
./a.out > results/test05.out
diff results/test05.out tests/test05.out

echo ---------test06.c-----------
./scc < tests/test06.c > results/test06.s
gcc -m32 results/test06.s tests/test06-lib.c
./a.out > results/test06.out
diff results/test06.out tests/test06.out

echo ---------test07.c-----------
./scc < tests/test07.c > results/test07.s
gcc -m32 results/test07.s tests/test07-lib.c
./a.out > results/test07.out
diff results/test07.out tests/test07.out

echo ---------test08.c-----------
./scc < tests/test08.c > results/test08.s
gcc -m32 results/test08.s tests/test08-lib.c
./a.out > results/test08.out
diff results/test08.out tests/test08.out

echo ---------test09.c-----------
./scc < tests/test09.c > results/test09.s
gcc -m32 results/test09.s tests/test09-lib.c
./a.out > results/test09.out
diff results/test09.out tests/test09.out
echo "DONE"
