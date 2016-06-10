#!/bin/sh

REACTOR_RELEASE_PATH=`readlink -f $RS_VM_ROOT/release`

# goto source dir
pushd $REACTOR_RELEASE_PATH

# delete old DB
rm cscope*

# create cscope DB
find . \
    -name "*.h" -o \
    -name "*.hxx" -o \
    -name "*.hpp" -o \
    -name "*.ixx" -o \
    -name "*.c" -o \
    -name "*.cxx" -o \
    -name "*.cpp" -o \
    -name "*.sql" -o \
    -name "Makefile" -o \
    -name "makefile" > cscope.files

cscope -bkq -i ./cscope.files

# return from source dir
popd
