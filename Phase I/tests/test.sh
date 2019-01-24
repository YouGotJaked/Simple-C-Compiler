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
./scc < test00.c > results/test00.out
./scc < test01.c > results/test01.out
./scc < test02.c > results/test02.out
./scc < test03.c > results/test03.out
./scc < test04.c > results/test04.out
./scc < test05.c > results/test05.out
./scc < test06.c > results/test06.out
echo "DONE"

echo "Testing difference..."
echo "00"
diff test00.out results/test00.out
echo "01"
diff test01.out results/test01.out
echo "02"
diff test02.out results/test02.out
echo "03"
diff test03.out results/test03.out
echo "04"
diff test04.out results/test04.out
echo "05"
diff test05.out results/test05.out
echo "06"
diff test06.out results/test06.out
echo "DONE"
