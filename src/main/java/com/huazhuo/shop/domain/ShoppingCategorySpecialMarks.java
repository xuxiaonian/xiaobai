package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_categories_special_marks")
public class ShoppingCategorySpecialMarks {
	
	private Integer shoppingCategoryId;//   一级、二级分类外键
	
	private Integer specialMarkId;//   一级、二级分类外键
	
	
	public static List<ShoppingCategorySpecialMarks> findAllShoppingCategorySpecialMarksesByshoppingCategoryId(Integer shoppingCategoryId) {
		TypedQuery<ShoppingCategorySpecialMarks> query =entityManager().createQuery("SELECT o FROM ShoppingCategorySpecialMarks o where o.shoppingCategoryId=:shoppingCategoryId", ShoppingCategorySpecialMarks.class);
		query.setParameter("shoppingCategoryId", shoppingCategoryId);
        return query.getResultList();
    }
}
