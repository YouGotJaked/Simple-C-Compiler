./scc < test.c > test.s
gcc -m32 test.s
./a.out > scc_test.out

gcc test.c
./a.out > gcc_test.out

diff scc_test.out gcc_test.out
