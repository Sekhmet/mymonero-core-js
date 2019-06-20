#!/usr/bin/env bash

DIR="./build";
FAKEFETCH_FILE="./monero_utils/fakefetch.js"
MAIN_FILE="$DIR/mymonero-core.js"

echo "🔁  Preparing directories" 
mkdir -p $DIR
rm -rf $DIR/*

echo "🔁  Building bundle"
node --max_old_space_size=8192 node_modules/.bin/webpack --config webpack.browser.prod.config.js --display-modules

echo "🔁  Embedding fetch fakefill"
cat $FAKEFETCH_FILE $MAIN_FILE > temp && mv temp $MAIN_FILE

echo "🔁  Embedding WASM"
echo "var WASM=\"`base64 monero_utils/MyMoneroCoreCpp_WASM.wasm`\";" | cat - $MAIN_FILE > temp && mv temp $MAIN_FILE
