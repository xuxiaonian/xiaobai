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
public class ShoppingProductsDetail {

	private Integer gsBigcategoryId;
	private String content;
	private Integer type;
	private Date createTime;
	private Integer version;
	
	private String bigcategoryImage;
	private String bigcategoryName;
	@Transient
	private CommonsMultipartFile attachment;
	
	@ManyToOne
	@JoinColumn(name = "shoppingProductsId", referencedColumnName = "id")
	private ShoppingProducts shoppingProductsId;// 商品ID
//这个是展示页面查询基础数据用的
	
	public static List<ShoppingProductsDetail> getShoppingId(ShoppingProducts shoppingProductsId) {
		TypedQuery<ShoppingProductsDetail> query = entityManager().createQuery("SELECT o FROM ShoppingProductsDetail o where o.shoppingProductsId=:shoppingProductsId", ShoppingProductsDetail.class);
		query.setParameter("shoppingProductsId", shoppingProductsId);
        return query.getResultList();
	}
	public static List<ShoppingProductsDetail> getShopping(ShoppingProducts shoppingProductsId,Integer gsBigcategoryId ) {
		TypedQuery<ShoppingProductsDetail> query = entityManager().createQuery("SELECT o FROM ShoppingProductsDetail o where o.shoppingProductsId=:shoppingProductsId and gsBigcategoryId=:gsBigcategoryId order by o.type asc", ShoppingProductsDetail.class);
		query.setParameter("shoppingProductsId", shoppingProductsId);
		query.setParameter("gsBigcategoryId", gsBigcategoryId);
        return query.getResultList();
	}
	public ShoppingProductsContent set(int i) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
	
}
