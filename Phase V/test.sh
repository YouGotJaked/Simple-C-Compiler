#!/bin/bash

echo
echo "Cleaning object files..."
#make clean
echo "DONE"

echo
echo "Compiling..."
#make
echo "DONE"

echo
RESULTS="$PWD/results/"
if [ ! -d "$RESULTS" ]; then
	echo "$RESULTS does not exist. Creating directory..."
	mkdir "$RESULTS"
fi

echo
echo "Analyzing examples..."
lib=""
for f in "$PWD/examples"/*.c; do
    # assign library file
    if [[ $f =~ .*-lib.* ]]; then
        lib=${f##*/}
    fi
    # compile and assemble code
    if [[ ! $f =~ .*-lib.* ]]; then
        filename=${f##*/}
        echo $filename
        filename=${filename%??}
        assembly="$PWD/results/$filename.s"
       ./scc < "$f" > "$assembly"
        # check if lib file defined
        if [ ! -z "$lib" ]; then
	    gcc -m32 "$assembly" "$PWD/examples/$lib"
            lib=""
        else
            gcc -m32 "$assembly"
        fi
    fi
    #./a.out
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
