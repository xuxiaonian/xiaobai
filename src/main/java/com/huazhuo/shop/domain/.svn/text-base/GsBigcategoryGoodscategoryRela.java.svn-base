package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class GsBigcategoryGoodscategoryRela {

	private Integer gsBigcategoryId;
	private Integer shoppingCategoriesId;
	private Date createTime;

	public static List<GsBigcategoryGoodscategoryRela> findShopId(Integer shoppingCategoriesId) {
		TypedQuery<GsBigcategoryGoodscategoryRela> query = entityManager().createQuery("SELECT o FROM GsBigcategoryGoodscategoryRela o where  o.shoppingCategoriesId=:shoppingCategoriesId", GsBigcategoryGoodscategoryRela.class);
		query.setParameter("shoppingCategoriesId", shoppingCategoriesId);
        return query.getResultList();
	}
}
