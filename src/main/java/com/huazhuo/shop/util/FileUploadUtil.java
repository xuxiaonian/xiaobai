package com.huazhuo.shop.util;

import java.io.IOException;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

public class FileUploadUtil {
	
	/**
	 * 文件上传
	 * @param img
	 * @return
	 * @throws IOException
	 */
	public static Boolean upload(CommonsMultipartFile img,String fileName) throws IOException{
		boolean result =false;
		if(!img.isEmpty()){
			 byte[] file = img.getBytes();
			 UpYun up = new UpYun(UpaiYunStatic.BUCKET_NAME,UpaiYunStatic.USER_NAME,UpaiYunStatic.PASSWORD);
			 result = up.writeFile(UpaiYunStatic.MOBILE_USER_ICON_DIR+fileName, file, true);
		}
		
		return result;
	}
	
	public static Boolean upload(byte[] file,String fileName) throws IOException{
		boolean result =false;
		if(file.length>0){
			 UpYun up = new UpYun(UpaiYunStatic.BUCKET_NAME,UpaiYunStatic.USER_NAME,UpaiYunStatic.PASSWORD);
			 result = up.writeFile(UpaiYunStatic.MOBILE_USER_ICON_DIR+fileName, file, true);
		}
		
		return result;
	}
}
