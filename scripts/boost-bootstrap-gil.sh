#!/bin/sh
set -x

if [ ! -f boost-build.jam ]; then
    echo "Run inside Boost root"
    exit 1
fi

./bootstrap.sh
b2 headers

b2 toolset=gcc-5 variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
b2 toolset=gcc-9 variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
b2 toolset=clang-9 variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage
b2 toolset=clang-10 variant=debug,release address-model=64 --layout=versioned --with-test --with-filesystem stage

rm -rf ./bin.v2
