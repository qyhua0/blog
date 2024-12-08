package top.modelx.blog.common.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * 生成字符串的MD5摘要
 * @author zhehua
 * @date 2024-12-2
 */
public class MD5Util {


    public static String generateMD5(String input) {
        if (input == null || input.isEmpty()) {
            throw new IllegalArgumentException("Input cannot be null or empty");
        }
        try {
            // 创建MD5消息摘要实例
            MessageDigest md = MessageDigest.getInstance("MD5");
            // 计算MD5哈希值
            byte[] digest = md.digest(input.getBytes());
            // 将字节数组转换为16进制字符串
            return bytesToHex(digest);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("MD5 algorithm not found", e);
        }
    }

    /**
     * 将字节数组转换为16进制字符串
     *
     * @param bytes 字节数组
     * @return 16进制字符串
     */
    private static String bytesToHex(byte[] bytes) {
        StringBuilder hexString = new StringBuilder();
        for (byte b : bytes) {
            String hex = Integer.toHexString(0xff & b);
            if (hex.length() == 1) {
                hexString.append('0');
            }
            hexString.append(hex);
        }
        return hexString.toString();
    }
}
