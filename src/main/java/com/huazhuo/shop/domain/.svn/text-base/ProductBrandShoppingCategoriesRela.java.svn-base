package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ProductBrandShoppingCategoriesRela {
	
	private Integer productBrandId;
	
	private Integer shoppingCategoriesId;
	
	
	
	public static List<ProductBrandShoppingCategoriesRela> deleteproductBrandId( Integer productBrandId) {
		TypedQuery<ProductBrandShoppingCategoriesRela> query =entityManager().createQuery("SELECT o FROM ProductBrandShoppingCategoriesRela o where o.productBrandId=:productBrandId", ProductBrandShoppingCategoriesRela.class);
		query.setParameter("productBrandId", productBrandId);
        return query.getResultList();
    }
}
