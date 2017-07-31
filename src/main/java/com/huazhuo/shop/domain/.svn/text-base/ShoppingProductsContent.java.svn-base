package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ShoppingProductsContent {

	private String content;
	private Integer type;
	private Date createTime;
	private String picName;
	@ManyToOne
	@JoinColumn(name = "shoppingProductsId", referencedColumnName = "id")
	private ShoppingProducts shoppingProductsId;// 商品ID
	@Transient
	private CommonsMultipartFile attachment;
	//这个是展示页面查询基础数据用的
	
		public static List<ShoppingProductsContent> getShoppingId(ShoppingProducts shoppingProductsId) {
			TypedQuery<ShoppingProductsContent> query = entityManager().createQuery("SELECT o FROM ShoppingProductsContent o where o.shoppingProductsId=:shoppingProductsId", ShoppingProductsContent.class);
			query.setParameter("shoppingProductsId", shoppingProductsId);
	        return query.getResultList();
		}
}
