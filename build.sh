#!/bin/bash

make clean
./setenv-android.sh

perl -pi -e 's/install: all install_docs install_sw/install: install_docs install_sw/g' Makefile.org

./config no-shared no-ssl2 no-ssl3 no-comp no-hw no-engine \
--openssldir=/Users/xiaoqiang/workspace/mycodec/openssl/ssl/$ANDROID_API \
--prefix=/Users/xiaoqiang/workspace/mycodec/openssl/output 

make depend
make all
echo "ANDROID_TOOLCHAIN ${ANDROID_TOOLCHAIN}"
sudo -E make install CC=$ANDROID_TOOLCHAIN/arm-linux-androideabi-gcc RANLIB=$ANDROID_TOOLCHAIN/arm-linux-androideabi-ranlib
