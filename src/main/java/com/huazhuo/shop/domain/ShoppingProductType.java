package com.huazhuo.shop.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_product_type")
public class ShoppingProductType {

	@ManyToOne
	@JoinColumn(name = "shoppingProductsId", referencedColumnName = "id")
	private ShoppingProducts shoppingProductsId;//   订单状态
	
	private String typeName;
	
	private String typeValue;
	
	
}
