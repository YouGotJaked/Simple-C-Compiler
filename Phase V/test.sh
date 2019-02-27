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

echo
echo "Analyzing examples..."
search="examples"
for f in "$PWD/examples"/*.c; do
    filename=${f##*/}
    echo $filename
    filename=${filename%??}
    if  [[ ! $f =~ .*-lib.* ]]; then
   	./scc < "$f" > "$PWD/results/$filename.s"
        gcc -m32 "$PWD/results/$filename.s" "$PWD/examples/$filename-lib.c"
    fi
    ./a.out
done
echo "DONE"

echo
echo "Analyzing test cases..."
for f in "$PWD/tests"/*.c; do
    filename=${f##*/}
    echo $filename
    filename=${filename%??}
    ./scc < "$f" > /dev/null 2> "$PWD/results/$filename.err"
    diff "$PWD/tests/$filename.err" "$PWD/results/$filename.err"
done
echo "DONE"
