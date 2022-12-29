#!/bin/bash
set -ex

# delete bazel file that interferes
rm BUILD

mkdir build
cd build

cmake -G Ninja \
    ${CMAKE_ARGS} \
    -DCMAKE_INSTALL_PREFIX="${PREFIX}" \
    -DCMAKE_LIBRARY_PATH="${PREFIX}/lib" \
    -DBUILD_SHARED_LIBS=ON \
    ..

cmake --build .
cmake --install .

# debug
ls -R ./clif

# shift some generated artefacts where python build expects them, see
# https://github.com/google/clif/blob/v0.4.1/INSTALL.sh#L86-L90
cp ./clif/protos/ast_pb2.py ${SRC_DIR}/clif/protos/
cp ./clif/python/utils/proto_util.cc ${SRC_DIR}/clif/python/utils/
cp ./clif/python/utils/proto_util_clif.h ${SRC_DIR}/clif/python/utils/
cp ./clif/python/utils/proto_util.init.cc ${SRC_DIR}/clif/python/utils/
