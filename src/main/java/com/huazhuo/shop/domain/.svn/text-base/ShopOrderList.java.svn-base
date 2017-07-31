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
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_order_list")
public class ShopOrderList {
	
	@ManyToOne
	@JoinColumn(name = "shopOrderId", referencedColumnName = "id")
	private ShopOrders shopOrderId;
	
	private Integer buyCouts;//   商品数量
	
	@ManyToOne
	@JoinColumn(name = "productId", referencedColumnName = "id")
	private ShoppingProducts productId;//   商品ID
	
	private String productName;//   商品名称
	private String productProperty;//   商品属性
	private String price;//   商品价格
	
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
