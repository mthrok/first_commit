#!/bin/sh
SCRIPT=$(readlink -f "$0")
DIR=$(dirname "$SCRIPT")

export LD_LIBRARY_PATH=$DIR/out/install/lib:$DIR/out/external/install/lib:$LD_LIBRARY_PATH
export PATH=$DIR/out/install/bin:$PATH
