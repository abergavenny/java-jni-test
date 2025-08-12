package src;

import java.nio.ByteBuffer;

public class BufferAddressJNI {
    public static native long getMemoryAddress(ByteBuffer byteBuffer);

    static {
        System.loadLibrary("bufferaddressjni");
    }
}
