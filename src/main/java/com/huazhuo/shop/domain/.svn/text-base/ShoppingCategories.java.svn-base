package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_categories")
public class ShoppingCategories {
	
	@Size(max = 255)
	private String name;
	
	@Size(max = 255)
	private String description;
	
	@Size(max = 255)
	private String image;
	
	private Integer status;
	
	private Integer parentId;
	
	private Integer cityId;
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   
	  
	private Integer enabled;
	
    public static List<ShoppingCategories> findAllShoppingCategoriesesByParentId() {
    	TypedQuery<ShoppingCategories> query =entityManager().createQuery("SELECT o FROM ShoppingCategories o where o.parentId = 0 and enabled=1 and status=1", ShoppingCategories.class);
        return query.getResultList();
    }
    public static List<ShoppingCategories> findAllShoppingCategoriesestId() {
    	TypedQuery<ShoppingCategories> query =entityManager().createQuery("SELECT o FROM ShoppingCategories o where o.parentId is not 0 and enabled=1 and status=1", ShoppingCategories.class);
        return query.getResultList();
    }
    public static List<ShoppingCategories> findAllShoppingCategoriesesByParentId(Integer parentId) {
    	TypedQuery<ShoppingCategories> query =entityManager().createQuery("SELECT o FROM ShoppingCategories o where o.parentId=:parentId and enabled=1 and status=1", ShoppingCategories.class);
    	query.setParameter("parentId", parentId);
        return query.getResultList();
    }
    public static List<ShoppingCategories> getId(Integer id) {
    	TypedQuery<ShoppingCategories> query =entityManager().createQuery("SELECT o FROM ShoppingCategories o where o.id=:id and enabled=1", ShoppingCategories.class);
    	query.setParameter("id", id);
        return query.getResultList();
    }
    
}
