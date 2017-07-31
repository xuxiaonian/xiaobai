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
public class GsBigcategoryGoodsRela {

	private Integer gsBigcategoryId;
	private Integer goodsId;
	private Date createTime;
	private boolean isTemp;
	
	  public static List<GsBigcategoryGoodsRela> getId(Integer goodsId) {
	    	TypedQuery<GsBigcategoryGoodsRela> query =entityManager().createQuery("SELECT o FROM GsBigcategoryGoodsRela o where o.goodsId=:goodsId ", GsBigcategoryGoodsRela.class);
	    	query.setParameter("goodsId", goodsId);
	        return query.getResultList();
	    }
}
