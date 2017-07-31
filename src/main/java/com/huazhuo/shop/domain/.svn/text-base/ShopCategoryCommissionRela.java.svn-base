package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.security.BackUser;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ShopCategoryCommissionRela {
	
	private Integer shopId;
	private Integer categoryId;
	private BigDecimal commissionRate;
	private Date createTime;
	
	public static List<ShopCategoryCommissionRela> findShopId(Integer shopId) {
		TypedQuery<ShopCategoryCommissionRela> query =entityManager().createQuery("SELECT o FROM ShopCategoryCommissionRela o where o.shopId=:shopId", ShopCategoryCommissionRela.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	public static List<ShopCategoryCommissionRela> deleteShopId(Integer shopId) {   
		TypedQuery<ShopCategoryCommissionRela> query =entityManager().createQuery("DELETE FROM  ShopCategoryCommissionRela o where o.shopId=:shopId", ShopCategoryCommissionRela.class);
		query.setParameter("shopId", shopId);
        return null;
    }
}
