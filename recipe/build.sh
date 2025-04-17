#! /bin/bash
# Get an updated config.sub and config.guess
./bootstrap.sh

set -ex

./configure --prefix=$PREFIX || { cat config.log ; exit 1 ; }

make
make install

$PYTHON -m pip install -vv --no-deps --ignore-installed .
