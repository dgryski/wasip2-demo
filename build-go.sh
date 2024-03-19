#!/bin/sh -x -e

wit-bindgen-go go wit/deps/docs/calculator.wit
tinygo build -target=wasip2 -wit-package=wit/ -wit-world=demo:tinygocalc/app
wasm-tools compose wasip2-demo.wasm -d component-docs//component-model/examples/tutorial/adder/target/wasm32-wasi/release/adder.wasm -o command-go.wasm
wasmtime run command-go.wasm 1 2 add
