#include <jni.h>
#include <cstdio>
#include <cstdint>  // for uintptr_t
#include "src_BufferAddressJNI.h" // Generated from javac -h

extern "C" {

JNIEXPORT jlong JNICALL Java_src_BufferAddressJNI_getMemoryAddress(JNIEnv *env, jclass cls, jobject byteBuffer) {
    void* address = env->GetDirectBufferAddress(byteBuffer);
    return (jlong)(uintptr_t)address;
}

} // extern "C"
