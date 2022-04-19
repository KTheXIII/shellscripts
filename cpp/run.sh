#!/usr/bin/env sh

# Compile and run single C++ file
set -e

bin=bin
obj=obj

in=$1
out="${in%.*}"

cpp_version=-std=c++20
warnings="-Wall -Wextra -Wpedantic -Werror -Wno-missing-field-initializers"
input_file=$1
target_dir=bin
include_dir="-I."
library=""
compile_flags="${cpp_version} ${warnings} ${include_dir} ${library}"

# compile
c++ $compile_flags $in -o $bin/$out

# run
./bin/$out "${@:2}"

