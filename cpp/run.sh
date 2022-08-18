#!/usr/bin/env sh

# Compile and run single C++ file
set -e

# Build
ESCAPE_CODE='\033'
RED='\033[0;31m'
NC='\033[0m'      # No Color
if [ $# -eq 0 ]; then
    printf "${RED}No input file${NC} (っ- ‸ – ς)\n"
    printf "\n"
    printf "Usage: ${0} {filename}.cpp\n"
    exit 1
fi

bin=bin
obj=obj
mkdir -p $bin
mkdir -p $obj

cpp_version=-std=c++20
warnings='-Wall -Wextra -Wpedantic -Werror'
includes=""   # Use $(pkg-config --cflags fmt)
libraries=""  # Use $(pkg-config --libs fmt)

input=$1
out="${input%.*}"
target=${bin}/${out}

printf "Building ${out} (*′☉.̫☉)..."

ccache c++ $cpp_version $includes $libraries $warnings $input -o $target
#c++ $cpp_version $includes $libraries $warnings $input -o $target

printf ' Done! (^～^)\n'

# Run
./${bin}/${out} "${@:2}"

