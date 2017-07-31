package com.huazhuo.shop.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_evaluate_img")
public class ShopOrderEvaluateImg {

	private String imgUrl;

	@ManyToOne
	@JoinColumn(name = "shoppingEvaluateId", referencedColumnName = "id")
	private ShopOrderEvaluate shoppingEvaluateId;// 用户
	
	
}
