#!/bin/sh

usage()
{
    echo "Usage: $0 <src_path>"
}

if [ $# -ne 1 ] 
then 
    usage
    exit
fi

SRC_PATH=$1

# goto source dir
pushd $SRC_PATH

# create cscope DB
find . \
    -name "*.h" -o \
    -name "*.hxx" -o \
    -name "*.hpp" -o \
    -name "*.ixx" -o \
    -name "*.c" -o \
    -name "*.cxx" -o \
    -name "*.cpp" -o \
    -name "Makefile" -o \
    -name "makefile" > cscope.files

cscope -bkq -i ./cscope.files

# return from source dir
popd
