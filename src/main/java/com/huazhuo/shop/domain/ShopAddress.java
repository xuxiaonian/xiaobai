package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.city.Areas;
import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_address")
public class ShopAddress {
	
	@Size(max = 255)
	private String contact;//联系人
	
	@ManyToOne
	@JoinColumn(name = "provinces", referencedColumnName = "id")
	private Provinces provinces;//   省
	
	@ManyToOne
	@JoinColumn(name = "cities", referencedColumnName = "id")
	private Cities cities;//   市
	
	@ManyToOne
	@JoinColumn(name = "areas", referencedColumnName = "id")
	private Areas areas;//   县
	
	@Size(max = 4000)
	private String address;//地址
	
	private String zipcood;//邮编
	
	private String phoneNumber;//
	
	private String tel1;
	
	private String tel2;
	
	private String tel3;
	
	private Boolean sendProduct;//	默认发货地址
	
	private Boolean returnProduct;//	默认退货地址
	
	private Integer shopId;//商家id
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   
	
	public static List<ShopAddress> findAllShopAddressesByShopId(Integer shopId) {
		TypedQuery<ShopAddress> query = entityManager().createQuery("SELECT o FROM ShopAddress o where o.shopId=:shopId", ShopAddress.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	public static List<ShopAddress> findAllShopAddressesById(Integer id) {
		TypedQuery<ShopAddress> query = entityManager().createQuery("SELECT o FROM ShopAddress o where o.id=:id", ShopAddress.class);
		query.setParameter("id", id);
        return query.getResultList();
    }
	public static long countShopAddressesByShopId(Integer shopId) {
		TypedQuery<Long> query = entityManager().createQuery("SELECT COUNT(o) FROM ShopAddress o where o.shopId=:shopId", Long.class);
		query.setParameter("shopId", shopId);
        return query.getSingleResult();
    }
	
	public static List<ShopAddress> findAllShopAddressesByShopIdAndSendProduct(Integer shopId,Boolean sendProduct) {
		TypedQuery<ShopAddress> query = entityManager().createQuery("SELECT o FROM ShopAddress o where o.shopId=:shopId and o.sendProduct=:sendProduct", ShopAddress.class);
		query.setParameter("shopId", shopId);
		query.setParameter("sendProduct", sendProduct);
        return query.getResultList();
    }
	
	public static List<ShopAddress> findAllShopAddressesByShopIdAndReturnProduct(Integer shopId,Boolean returnProduct) {
		TypedQuery<ShopAddress> query = entityManager().createQuery("SELECT o FROM ShopAddress o where o.shopId=:shopId and o.returnProduct=:returnProduct", ShopAddress.class);
		query.setParameter("shopId", shopId);
		query.setParameter("returnProduct", returnProduct);
        return query.getResultList();
    }
}
