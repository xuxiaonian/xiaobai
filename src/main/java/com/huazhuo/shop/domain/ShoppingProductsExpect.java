package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.JoinColumn;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.query.ShoppingProductQuery;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.StringUtils;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ShoppingProductsExpect {
	@Temporal(TemporalType.DATE)
	@Column(name = "expect_time_begin", nullable = false, length = 10)
	private Date expectTimeBegin;
	
	@Temporal(TemporalType.DATE)
	@Column(name = "expect_time_end", nullable = false, length = 10)
	private Date expectTimeEnd;
	
	private Integer isCommon;

	
	
//	private Integer productsId;

	
	@ManyToOne
	@JoinColumn(name = "productsId", referencedColumnName = "id")
	private ShoppingProducts productsId;
	


	
	
	@Temporal(TemporalType.DATE)
	@Column(name = "send_goods_time", nullable = false, length = 10)
	private Date sendGoodsTime;
	

	public static List<ShoppingProductsExpect> findproductsId(ShoppingProducts productsId) {
		TypedQuery<ShoppingProductsExpect> query = entityManager().createQuery("SELECT spe FROM ShoppingProductsExpect spe WHERE spe.productsId=:productsId ", ShoppingProductsExpect.class);
		query.setParameter("productsId", productsId);
        return query.getResultList();
	}
	
	public static List<ShoppingProductsExpect> findShoppingProducts(Date start,String name,String sysNumber,String productNumber,String shoppingCategoryId,int firstResult, int maxResults) {
		TypedQuery<ShoppingProductsExpect> query = entityManager().createQuery(
				" SELECT spe FROM ShoppingProductsExpect spe  where (spe.expectTimeBegin >=:expectTimeBegin ) AND spe.productsId.id=:id AND spe.productsId.review=:review "
				+ "AND spe.productsId.onSale=:onSale AND  spe.productsId.isExpect=:isExpect", 
				ShoppingProductsExpect.class);
		query.setParameter("expectTimeBegin",start);
		query.setParameter("review",1);//审核通过
		query.setParameter("onSale",0);//未上架
		query.setParameter("isExpect",1);//是预售商品
		query.setParameter("name",name);//商品名称
		query.setParameter("sysNumber",sysNumber);//平台货号    
		query.setParameter("productNumber",productNumber);//平台货号  product_number
		query.setParameter("shoppingCategoryId",shoppingCategoryId);//平台货号  product_number
		
		
		//review
		query.setParameter("id",726);
		return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}
	public static long countShopOrder(Date start) {
		TypedQuery<Long> query = entityManager().createQuery(
				" SELECT count(spe) FROM ShoppingProductsExpect spe  where (spe.expectTimeBegin >=:expectTimeBegin) AND spe.productsId.id=:id ",Long.class);
		query.setParameter("expectTimeBegin",start);
		query.setParameter("id",726);
		return query.getSingleResult();
	}
	
}
