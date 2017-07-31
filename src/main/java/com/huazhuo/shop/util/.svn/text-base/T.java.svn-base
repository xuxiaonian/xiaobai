package com.huazhuo.shop.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.h2.store.Data;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huazhuo.shop.pojo.History;
import com.huazhuo.shop.pojo.ZListPromotion;
import com.huazhuo.shop.pojo.ZListReward;

public class T {

	public static void main(String[] args) throws ParseException, UnsupportedEncodingException {

		
		
	
//		
//		
//		String str = HttpRequest.sendGet(H5UrlUtil.SERVICE_ZREWARDLIST_URL ,"startPage="+1+"&pageSize=10&shopId="+3);
//		JSONObject fjs = JSONObject.parseObject(str);
//	    
//    	JSONObject data = fjs.getJSONObject("data");
//    	Integer pageSize=data.getInteger("pageSize");
//    	Integer totalRow=data.getInteger("totalRow");
//    	Integer currentPage=data.getInteger("currentPage");
//    	JSONArray datas = data.getJSONArray("dataList");
//    	   List<ZListReward> list = new ArrayList<ZListReward>();
//    	if(datas!=null){
//    	 	for(Object jb:datas){
//    	 		ZListReward  zListReward=new ZListReward();
//    	    		JSONObject jo = (JSONObject) jb;
//    	    		zListReward.setId(jo.getInteger("id"));
//    	    		zListReward.setProductId(jo.getInteger("productId"));
//    	    		zListReward.setProductName(jo.getString("productName"));
//    	    		zListReward.setRewardRatio(jo.getInteger("rewardRatio"));
//    	    		zListReward.setStartTime(jo.getDate("startTime"));
//    	    		zListReward.setEndTime(jo.getDate("endTime"));
//    	    		zListReward.setCreateTime(jo.getDate("createTime"));
//    	    		zListReward.setRewardStatus(jo.getString("rewardStatus"));
//    	    		
//    	    		list.add(zListReward);
//
//    	    		
//    	    	}
//    	}
    	String str = HttpRequest.sendGet(H5UrlUtil.SERVICE_ZCHECK_URL ,"productsSpecId=0&productId="+1199);
    	JSONObject fjs = JSONObject.parseObject(str);
    	Integer code = fjs.getInteger("code");
    	System.out.println(code);
		//    String str = HttpRequest.sendGet(H5UrlUtil. SERVICE_ZLOOK_URL ,"id="+4);
//	JSONObject fjs = JSONObject.parseObject(str);
//	
//	JSONObject jo = fjs.getJSONObject("data");
//	 ZListPromotion  zListPromotion=new ZListPromotion();
//	    zListPromotion.setId(jo.getInteger("id"));
//		zListPromotion.setRebateName(jo.getString("rebateName"));
//		zListPromotion.setPrice(jo.getBigDecimal("price"));
//		zListPromotion.setRebatePrice(jo.getBigDecimal("rebatePrice"));
//		zListPromotion.setProductNum(jo.getInteger("productNum"));
//		zListPromotion.setCreateTime(jo.getDate("createTime"));
//		zListPromotion.setStartTime(jo.getDate("startTime"));
//		zListPromotion.setEndTime(jo.getDate("endTime"));
//		zListPromotion.setIsDeleted(jo.getInteger("isDeleted"));
//		zListPromotion.setRebateStatus(jo.getString("rebateStatus"));
//    System.out.println(zListPromotion.toString());
//		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd ");
//		Date date=null;
//		date = new Date();
//		Calendar ca=Calendar.getInstance();
//		ca.setTime(date);
//		ca.add(Calendar.DATE, 3);
//		System.out.println(sdf.format(ca.getTime()));
//		String city="北京是是是";
//		String org="北京ssss是是是";
//		String ss=  HttpRequest.sendPost(H5UrlUtil.SERVICEURL,
////				  "sellerId="+mo.getId()+"&certType="+mo.getAuthRole()+"&custName="+company.getLegalPersion()+"&identType=0&identNo="+company.getLegalPersionCard()+"&email="+company.getEmail()+"&telphone="+company.getPhone()+"&address="+company.getAddress()+"&org="+company.g+"&province"=北京&"&city"=北京&"&postcode"=100000&"&xPosition"=100&"&yPosition"=100
//				  
//				  "sellerId="+"asd"+
//					"&certType="+0+
//					"&custName=qwe&identType=0&identNo=43&email=23&telphone=0&address="+urlEncode(city)+"&org="+urlEncode(org)+"&unit=''&country=CN &province=province&city="+urlEncode(city)+"&postcode=000000&xPosition=100&yPosition=225&pageNum=7"
//					
////				  ); 
//		String his=  HttpRequest.sendGet(H5UrlUtil.SERVICE_ZHISTORY_URL,"rebateId=30&startPage=0&pageSize=100"
//				  
//				  ); 
//		 JSONObject hiss = JSONObject.parseObject(his);
//	    JSONObject data = hiss.getJSONObject("data");
//				JSONArray datas = data.getJSONArray("dataList");
//		    	   List<History> list = new ArrayList<History>();
//		    	if(datas!=null){
//		    	 	for(Object jb:datas){
//		    	 		History  histo=new History();
//		    	 		JSONObject jo = (JSONObject) jb;
//		    	 	      	histo.setTime(jo.getDate("createTime"));
//		    	    		histo.setName(jo.getString("operName"));
//		    	    		histo.setOperation(jo.getString("operType"));
//		    	    		histo.setRemarks(jo.getString("remarks"));
//		    	    		
//
//	    	    		list.add(histo);
//		    	 	}
//		    	 	}
		
    	
	}
	
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
