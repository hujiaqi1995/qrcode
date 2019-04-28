package com.xdlr.qrcode.util;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.WriterException;
import com.google.zxing.common.BitMatrix;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

public class QrcodeUtil {
    public static void generateQrcode(String url, String deviceId) {
        MultiFormatWriter multiFormatWriter = new MultiFormatWriter();
        Map hints = new HashMap();
        String qrcodeImagePath = "images/" + deviceId + ".jpg";
        hints.put(EncodeHintType.CHARACTER_SET, "UTF-8");
        BitMatrix bitMatrix = null;
        try{
            bitMatrix = multiFormatWriter.encode(url, BarcodeFormat.QR_CODE, 400, 400, hints);
            File file = new File(qrcodeImagePath);
            if(!file.exists()) {
                file.getParentFile().mkdirs();
            }
            MatrixToImageWriter.writeToFile(bitMatrix, "jpg", file);
        } catch (WriterException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

}
