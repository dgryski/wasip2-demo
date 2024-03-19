#!/bin/sh -x -e
rm -rf component-docs

git clone https://github.com/bytecodealliance/component-docs
cd component-docs/component-model/examples/tutorial
(cd calculator && cargo component build --release)
(cd adder && cargo component build --release)
(cd command && cargo component build --release)
wasm-tools compose calculator/target/wasm32-wasi/release/calculator.wasm -d adder/target/wasm32-wasi/release/adder.wasm -o composed.wasm
wasm-tools compose command/target/wasm32-wasi/release/command.wasm -d composed.wasm -o command.wasm
wasmtime run command.wasm 1 2 add
