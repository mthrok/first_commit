#!/bin/bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
export LD_LIBRARY_PATH=$DIR/out/install/lib:$DIR/out/external/install/lib:$LD_LIBRARY_PATH
export PATH=$DIR/out/install/bin:$PATH
