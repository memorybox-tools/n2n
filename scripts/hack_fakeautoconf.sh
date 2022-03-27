#!/bin/sh
#
# Specifically for windows, where installing autoconf looks suspiciously
# like boiling the ocean.

N2N_VERSION_SHORT='happynet3.0.0'
GIT_COMMITS=`git rev-list --count HEAD`

sed \
    -e "s%@N2N_VERSION_SHORT@%N2N_VERSION_SHORT%g" \
    -e "s%@GIT_COMMITS@%$GIT_COMMITS%g" \
    -e "s%@CC@%gcc%g" \
    -e "s%@AR@%ar%g" \
    -e "s%@CFLAGS@%$CFLAGS%g" \
    -e "s%@LDFLAGS@%$LDFLAGS%g" \
    -e "s%@N2N_LIBS@%$LDLIBS%g" \
    < Makefile.in > Makefile

sed \
    -e "s%@ADDITIONAL_TOOLS@%%g" \
    < tools/Makefile.in > tools/Makefile

cat <<EOF >include/config.h
#define PACKAGE_VERSION $N2N_VERSION_SHORT
#define PACKAGE_OSNAME "Windows"
#define GIT_RELEASE $N2N_VERSION_SHORT
EOF
