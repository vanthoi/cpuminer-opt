#!/bin/bash

make distclean || echo clean

rm -f config.status
./autogen.sh || echo done
./nomacro.pl && cd asm && ../nomacro.pl && cd ..

CC=/usr/local/bin/gcc-12 CXX=/usr/local/bin/g++-12 CFLAGS="-O3 -march=native -Wall -I/usr/local/include -L/usr/local/lib" ./configure --with-curl --with-crypto=/usr/local/opt/openssl\@3

make -j 4

strip cpuminer
