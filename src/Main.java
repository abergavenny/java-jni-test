package src;

import java.nio.ByteBuffer;

import sun.nio.ch.DirectBuffer;

public class Main {
    public static void main(String[] args) {
        ByteBuffer byteBuffer = java.nio.ByteBuffer.allocateDirect(1024);

        long address = BufferAddressJNI.getMemoryAddress(byteBuffer);
        long internal = ((DirectBuffer) byteBuffer).address();

        System.out.println(String.format("Address -> {%s} {%s}", address, internal));
    }
}
