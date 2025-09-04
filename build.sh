#!/bin/bash
mkdir build/Debug -p && cd build/Debug
cmake -D CMAKE_C_COMPILER=clang -D CMAKE_BUILD_TYPE=Release ../..
cmake --build .
