package com.huazhuo.shop.util;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletResponse;

import com.huazhuo.shop.security.BackUser;

public class CookieUtil {
	
	public static void saveCookie(BackUser user,HttpServletResponse response){
		Cookie nameCookie = new Cookie("username", user.getUserName());
		nameCookie.setMaxAge(60 * 60 * 24 * 30);
		Cookie pwdCookie = new Cookie("password", user.getPassword());
		pwdCookie.setMaxAge(60 * 60 * 24 * 30);
		response.addCookie(nameCookie);
		response.addCookie(pwdCookie);
		
	}
}
