package com.huazhuo.shop.domain;

import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_order_retrun_img")
public class ShopOrderReturnImg {
	
	private String imgUrl;
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//  
	
	@ManyToOne
	@JoinColumn(name = "shopOrderReturnConsultId", referencedColumnName = "id")
	private ShopOrderReturnConsult shopOrderReturnConsultId;//   退货ID
}
