package com.xdlr.qrcode.util;

public interface GlobalVariable {
    String HOST_IP = "http://jqhu.top";
    String QR_CODE_PATH = HOST_IP + ":8080" + "/detailPage?deviceId=";
    String QR_CODE_IMAGE_PATH = HOST_IP + "/qrcode/images/";
}
