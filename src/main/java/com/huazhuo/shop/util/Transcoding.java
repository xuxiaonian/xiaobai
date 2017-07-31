package com.huazhuo.shop.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
public class Transcoding {




public static String urlEncode(String str){
	if(str == null || "".equals(str.trim())){
		return str;
	}
	try {
		str = URLEncoder.encode(str, "UTF-8");
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	}
	return str;
}

}