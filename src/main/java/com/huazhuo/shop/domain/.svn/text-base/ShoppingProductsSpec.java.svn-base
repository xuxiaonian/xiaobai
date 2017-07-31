package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Digits;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_products_spec")
public class ShoppingProductsSpec {

	private String specName;
	private Integer productsNum;
	@Digits(integer = 8, fraction = 2)
	private BigDecimal weight;
	
	private Integer warningNum;
	@Digits(integer = 8, fraction = 2)
	private BigDecimal orgPrice;// 费用

	@Digits(integer = 8, fraction = 2)
	private BigDecimal price;// 费用

	@ManyToOne
	@JoinColumn(name = "shoppingProducts", referencedColumnName = "id")
	private ShoppingProducts shoppingProducts;// 商品ID

	public static String getLowestPrice(List<ShoppingProductsSpec> shoppingProductsSpecs) {
		BigDecimal p = new BigDecimal(0);
		for (ShoppingProductsSpec s : shoppingProductsSpecs) {
			if (s.getPrice() != null) {
				if (p.compareTo(new BigDecimal(0)) == 0) {
					p = s.getPrice();
				} else {
					if (s.getPrice().compareTo(p) == -1) {
						p = s.getPrice();
					}
				}
			}
		}
		return p.toString();
	}

	public static String getLowestOrgPrice(List<ShoppingProductsSpec> shoppingProductsSpecs) {
		BigDecimal p = new BigDecimal(0);
		for (ShoppingProductsSpec s : shoppingProductsSpecs) {
			if (s.getPrice() != null) {
				if (p.compareTo(new BigDecimal(0)) == 0) {
					p = s.getOrgPrice();
				} else {
					if (s.getPrice().compareTo(p) == -1) {
						p = s.getOrgPrice();
					}
				}
			}
		}
		return p.toString();
	}
	  public static List<ShoppingProductsSpec> findShopId(ShoppingProducts shoppingProducts) {
	    	TypedQuery<ShoppingProductsSpec> query =entityManager().createQuery("SELECT o FROM ShoppingProductsSpec o where o.shoppingProducts=:shoppingProducts ", ShoppingProductsSpec.class);
	    	query.setParameter("shoppingProducts", shoppingProducts);
	        return query.getResultList();
	    }

}
