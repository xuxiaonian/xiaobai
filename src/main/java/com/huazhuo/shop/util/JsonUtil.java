package com.huazhuo.shop.util;

import com.alibaba.fastjson.JSONObject;

public class JsonUtil {
	public static Integer replace(Integer shopId) {
		String str = HttpRequest.sendGet(H5UrlUtil.SERVICE_ZCHECK_URL ,"productsSpecId=0&productId="+shopId);
		JSONObject fjs = JSONObject.parseObject(str);
		Integer code = fjs.getInteger("code");
        return code;
    }
	

}
