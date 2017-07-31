package com.huazhuo.shop.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_fast_mail")
public class ShopFastMail {

	private Integer shopId;//   商店ID
	private String mailName;//   快递名称
	private String cost;//   费用
	private Integer defCheck;//   默认选择
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   
	private String att1;//   
	private String att2;//   
	private String att3;//   
	private String att4;//   
	private String att5;//   
}
