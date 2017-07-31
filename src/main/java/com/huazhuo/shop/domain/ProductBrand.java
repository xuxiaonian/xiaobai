package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "product_brand")
public class ProductBrand {

	private String brandName;// 品牌名称
	private String brandStory;// 品牌故事
	private String createdBy;//
	private String categoryName;
	private String brandLogo;
	private String uuid;
	@DateTimeFormat(style = "MM")
	private Date createdAt;//
	private String categoryId;
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//
	private Integer	brandShop;
	private Integer auditStatus;
	private String att1;
	private String att2;
	private String att3;
	private String att4;
	private String att5;
	private Integer status;
	private String auditReasion;
	public static List<ProductBrand> findId( String uuid) {
		TypedQuery<ProductBrand> query =entityManager().createQuery("SELECT o FROM ProductBrand o where o.uuid=:uuid", ProductBrand.class);
		query.setParameter("uuid", uuid);
        return query.getResultList();
    }
	public static List<ProductBrand> findsId( Integer id) {
		TypedQuery<ProductBrand> query =entityManager().createQuery("SELECT o FROM ProductBrand o where o.id=:id", ProductBrand.class);
		query.setParameter("id", id);
        return query.getResultList();
    }
	public static List<ProductBrand> findSid( Integer brandShop) {
		TypedQuery<ProductBrand> query =entityManager().createQuery("SELECT o FROM ProductBrand o where o.brandShop=:brandShop", ProductBrand.class);
		query.setParameter("brandShop", brandShop);
        return query.getResultList();
    }
	public static List<ProductBrand> findBrandShop( Integer brandShop) {
		TypedQuery<ProductBrand> query =entityManager().createQuery("SELECT o FROM ProductBrand o where o.brandShop=:brandShop and auditStatus=2 ", ProductBrand.class);
		query.setParameter("brandShop", brandShop);
        return query.getResultList();
    }
}
