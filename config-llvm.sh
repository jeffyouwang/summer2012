#!/bin/sh
#
# Initial configuration for compiling LLVM on UG machines.
#

cd build

# Clang is already installed on UG machines. Avoid using it.
CC=gcc
CXX=g++

# Include debugging symbols.
# Also, we do not need all back-ends.
../llvm/configure \
    --enable-optimized=no \
    --enable-debug-runtime=yes \
    --enable-targets=cpp,x86,x86_64

exit 0

