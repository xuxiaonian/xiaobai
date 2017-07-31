package com.huazhuo.shop.util;

import com.huazhuo.shop.domain.Message;

public class MessageUtils {
	
	public static void sendMessage(Message message){
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/jpush", "userId=" + message.getMobileUserId() + "&content="+message.getMessage()+","+message.getOperation()+"&type="+message.getType0()+"&type="+message.getType1());
	}
	
	public static void sendSms(String userName){
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/mobileUsers/sendSms", "userName=" +userName);
	}
	
	public static String checkSms(String userName,String sms){
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/mobileUsers/checkSms", "userName=" +userName+"&sms="+sms);
		return str;
	}
}
