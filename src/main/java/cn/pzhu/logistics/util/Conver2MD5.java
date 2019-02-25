package cn.pzhu.logistics.util;

import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public final class Conver2MD5 {

    public static String getMD5(String str) {
        String reStr = null;
        try {
            MessageDigest md = MessageDigest.getInstance("MD5");
            md.update(str.getBytes("GBK"));
            byte ss[] = md.digest();
            reStr = bytes2String(ss);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return reStr;
    }

    public static String getSHA(String str) {
        String reStr = null;
        try {
            MessageDigest sha = MessageDigest.getInstance("SHA");
            sha.update(str.getBytes("GBK"));
            byte ss[] = sha.digest();
            reStr = bytes2String(ss);
        } catch (NoSuchAlgorithmException | UnsupportedEncodingException e) {
            e.printStackTrace();
        }
        return reStr;

    }

    private static String bytes2String(byte[] aa) {
        StringBuilder hash = new StringBuilder();
        for (byte anAa : aa) {
            int temp;
            if (anAa < 0)
                temp = 256 + anAa;
            else
                temp = anAa;
            if (temp < 16)
                hash.append("0");
            hash.append(Integer.toString(temp, 16));
        }
        hash = new StringBuilder(hash.toString().toUpperCase());
        return hash.toString();
    }
}
