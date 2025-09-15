package com.kopo.criminaleyes.util;

import org.apache.tomcat.util.codec.binary.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.spec.SecretKeySpec;
import javax.crypto.spec.IvParameterSpec;
import java.nio.charset.StandardCharsets;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.MessageDigest;
import java.security.spec.AlgorithmParameterSpec;

public class EncryptUtil {

    final static  String addMessage = "PolyDataAnalysis";

    final static byte[] ivBytes = {0x00, 0x00,  0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
            0x00,  0x00, 0x00, 0x00,  0x00, 0x00, 0x00, 0x00};

    final static String key = "PolyTechnic12345";

    public static String encHashSHA256(String str) {

        String res; // 암호화 결과값이 저장되는 변수
        String plantText = addMessage + str;

        try {

            MessageDigest sh = MessageDigest.getInstance("SHA-256");

            sh.update(plantText.getBytes());

            byte[] byteData = sh.digest();

            StringBuilder sb = new StringBuilder();

            for (byte byteDatum : byteData) {
                sb.append(Integer.toString((byteDatum & 0xff) + 0x100, 16).substring(1));
            }

            res = sb.toString();

        } catch (NoSuchAlgorithmException e) {
            res = "";
        }

        return res;
    }

    public static String encAES128CBC(String str)
            throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidKeyException, BadPaddingException, IllegalBlockSizeException, InvalidAlgorithmParameterException {

        byte[] textBytes = str.getBytes(StandardCharsets.UTF_8);
        AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
        SecretKeySpec newKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES");
        Cipher cipher;
        cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, newKey, ivSpec);
        return Base64.encodeBase64String(cipher.doFinal(textBytes));
    }

    public static String decAES128CBC(String str)
        throws NoSuchPaddingException, NoSuchAlgorithmException,
            InvalidKeyException, BadPaddingException, IllegalBlockSizeException, InvalidAlgorithmParameterException {

        byte[] textBytes = Base64.decodeBase64(str);
        // byte[] textBytes = str.getBytes("UTF-8");
        AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
        SecretKeySpec newKey = new SecretKeySpec(key.getBytes(StandardCharsets.UTF_8), "AES");
        Cipher cipher =  Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, newKey, ivSpec);
        return new String(cipher.doFinal(textBytes), StandardCharsets.UTF_8);
    }
}
