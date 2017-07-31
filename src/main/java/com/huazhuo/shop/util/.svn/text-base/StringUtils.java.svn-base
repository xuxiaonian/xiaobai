package com.huazhuo.shop.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

public class StringUtils {
	
	public static String gb2312ToUtf8(String str) {

        String urlEncode = "" ;

        try {

            urlEncode = URLEncoder.encode (str, "UTF-8" );

        } catch (UnsupportedEncodingException e) {

            e.printStackTrace();

        }

        return urlEncode;

}
	
	public static boolean isBlank(String name) {
		if (name == null)
			return true;
		if (name.trim().length() == 0)
			return true;
		return false;
	}

	public static String[] addStringToArray(String[] strs, String str) {
		String[] newStrs = null;
		if (strs != null) {
			newStrs = new String[strs.length + 1];
			for (int i = 0; i < strs.length; i++) {
				newStrs[i] = strs[i];
			}
			newStrs[strs.length] = str;
		} else {
			newStrs = new String[1];
			newStrs[0] = str;
		}
		return newStrs;
	}

	public static String[] removeStringFormArray(String[] strs, String str) {
		String[] newStrs = null;
		if (strs != null && strs.length != 0) {
			newStrs = new String[strs.length - 1];
			for (int i = 0; i < strs.length; i++) {
				if (strs[i].equals(str)) {
					continue;
				}
				newStrs[i] = strs[i];
			}
		}
		return newStrs;

	}

	public static String getStr(String str) {
		String newStr = "";
		String[] strarray = str.split(",");
		for (int i = 0; i < strarray.length; i++) {
			if (i != strarray.length - 1) {
				newStr = newStr + strarray[i] + ",";
			} else {
				newStr = newStr + strarray[i];
			}

		}
		return newStr;
	}

	public static String[] getStrType(String str,String spl) {
		if (!isBlank(str)) {
			String[] strarray = str.split(spl);
			return strarray;
		} else {
			String[] strarray = {};
			return strarray;
		}

	}
	
	public static String[] getStrType(String str) {
		if (!isBlank(str)) {
			String[] strarray = str.split(",");
			return strarray;
		} else {
			String[] strarray = {};
			return strarray;
		}

	}

	/**
	 * 
	 * @param str
	 * @return
	 */
	public static String[] getStrList(String str) {
		if (!isBlank(str)) {
			String str1 = str.substring(0, 1);
			String str2 = str.substring(1, 2);
			String str3 = str.substring(2, str.length());
			String[] strarray = { str1, str2, str3 };
			return strarray;
		} else {
			String[] strarray = {};
			return strarray;
		}
	}
	/*
	 * 
	 *  2unicode
	 */
	public static String string2Unicode(String string) {
		 
	    StringBuffer unicode = new StringBuffer();
	 
	    for (int i = 0; i < string.length(); i++) {
	 
	        char c = string.charAt(i);
	 
	       
	        unicode.append("\\u" + Integer.toHexString(c));
	    }
	 
	    return unicode.toString();
	}
}
