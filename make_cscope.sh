#!/bin/sh

usage()
{
    echo "Usage: $0 <src_path> <project_name>"
}

if [ $# -ne 2 ] 
then 
    usage
    exit
fi

SRC_PATH=$1
CSCOPE_PATH=~/cscope/$2

mkdir -p $CSCOPE_PATH
cd $CSCOPE_PATH

find $SRC_PATH \
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
