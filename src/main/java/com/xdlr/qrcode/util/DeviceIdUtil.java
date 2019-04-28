package com.xdlr.qrcode.util;

import java.util.concurrent.ThreadLocalRandom;

public class DeviceIdUtil {
    public static String generateId(){
        StringBuilder sb = new StringBuilder();
        for (int i = 0; i < 10; i++) {
            sb.append(ThreadLocalRandom.current().nextInt(10));
        }
        return sb.toString();
    }

    public static void main(String[] args) {
        System.out.println(generateId());
    }

}
