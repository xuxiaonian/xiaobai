package com.huazhuo.shop.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_products_parameter")
public class ShoppingProductsParameter {

	private String parameterType;//参数类别
	
	private String parameterValue;//参数值
	
	@ManyToOne
	@JoinColumn(name = "shoppingProducts", referencedColumnName = "id")
	private ShoppingProducts shoppingProducts;//  商品ID
}
