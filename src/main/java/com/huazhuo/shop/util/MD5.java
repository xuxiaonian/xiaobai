package com.huazhuo.shop.util;

import java.security.NoSuchAlgorithmException;

import org.springframework.security.authentication.encoding.Md5PasswordEncoder;
import org.springframework.security.authentication.encoding.ShaPasswordEncoder;

public class MD5 {
	
	public static void md5() {     
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();     
        // false 表示：生成32位的Hex版, 这也是encodeHashAsBase64的, Acegi 默认配置; true  表示：生成24位的Base64版     
        md5.setEncodeHashAsBase64(false);     
        String pwd = md5.encodePassword("admin", null);     
        System.out.println("MD5: " + pwd + " len=" + pwd.length());     
    }  
    public static void sha_256() throws NoSuchAlgorithmException {       
        ShaPasswordEncoder sha = new ShaPasswordEncoder(256);     
        sha.setEncodeHashAsBase64(true);     
        String pwd = sha.encodePassword("admin", null);     
        System.out.println("哈希算法 256: " + pwd + " len=" + pwd.length());     
    }     
         
        
    public static String sha256(String passWord) {     
        ShaPasswordEncoder sha = new ShaPasswordEncoder(256);     
        sha.setEncodeHashAsBase64(false);     
        String pwd = sha.encodePassword(passWord, null);      
		return pwd;
    }     
         
        
    public static void md5_SystemWideSaltSource () {     
        Md5PasswordEncoder md5 = new Md5PasswordEncoder();     
        md5.setEncodeHashAsBase64(false);     
             
        // 使用动态加密盐的只需要在注册用户的时候将第二个参数换成用户名即可     
        String pwd = md5.encodePassword("admin", null);     
        System.out.println("MD5 SystemWideSaltSource: " + pwd + " len=" + pwd.length());     
    }     
    public static void main(String[] args) throws NoSuchAlgorithmException {  
        md5(); // 使用简单的MD5加密方式     
          
        sha_256(); // 使用256的哈希算法(SHA)加密     
             
        sha256("admin"); // 使用SHA-256的哈希算法(SHA)加密     
             
        md5_SystemWideSaltSource(); // 使用MD5再加全局加密盐加密的方式加密      
    }  
}
