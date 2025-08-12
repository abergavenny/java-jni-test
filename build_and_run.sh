#!/bin/bash

# Set strict error handling
set -e

JAVA_HOME=/usr/lib/jvm/java-8-openjdk-amd64
SRC_DIR=src
NATIVE_DIR=src-native
OUT_DIR=out

LIB_NAME=libbufferaddressjni.so

mkdir -p "$OUT_DIR"

echo "Compiling java"
javac -h "$NATIVE_DIR" -d "$OUT_DIR" "$SRC_DIR/Main.java"

# echo "Compiling native code to shared library"
gcc -fPIC \
    -I"$JAVA_HOME/include" \
    -I"$JAVA_HOME/include/linux" \
    -shared -o "$OUT_DIR/$LIB_NAME" \
    "$NATIVE_DIR/BufferAddressJNI.cpp"

# echo "Running Java program"
LD_LIBRARY_PATH=$OUT_DIR java -cp "$OUT_DIR" src.Main
