#!/bin/bash

echo
echo "Cleaning object files..."
make clean
echo "DONE"

echo
echo "Compiling lexical and syntax analyzer..."
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
    ./scc < "$f" > "$PWD/results/$filename.out"
    diff "$PWD/examples/$filename.out" "$PWD/results/$filename.out"
done

echo
echo "Analyzing test cases..."
for f in "$PWD/tests"/*.c; do
    filename=${f##*/}
    echo $filename
    filename=${filename%??}
    ./scc < "$f" > "$PWD/results/$filename.out"
    diff "$PWD/tests/$filename.out" "$PWD/results/$filename.out"
done
