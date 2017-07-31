package com.huazhuo.shop.domain;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "message")
public class Message {

	private String message;
	
	private String operation;
	
	private Integer type0;
	
	private Integer type1;
	
	@DateTimeFormat(style = "MM")
	private Date createTime;//
	
	private Integer mobileUserId;
	
	private String messageType;
	
	private int status;//0 未读 1已读
	
	private String time;
	
	private String date;
}
