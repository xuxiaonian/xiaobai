package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.city.Areas;
import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ShopFreightFreeShippingCity {

	@ManyToOne
	@JoinColumn(name = "provinces", referencedColumnName = "id")
	private Provinces provinces;//   省
	
	@ManyToOne
	@JoinColumn(name = "cities", referencedColumnName = "id")
	private Cities cities;//   市
	
	@ManyToOne
	@JoinColumn(name = "areas", referencedColumnName = "id")
	private Areas areas;//   县
	
	@ManyToOne
	@JoinColumn(name = "shopFreightFreeShipping", referencedColumnName = "id")
	private ShopFreightFreeShipping shopFreightFreeShipping;//  包邮条件的ID

	
	public static List<ShopFreightFreeShippingCity> findShopId(ShopFreightFreeShipping shopFreightFreeShipping) {
		TypedQuery<ShopFreightFreeShippingCity> query = entityManager().createQuery("SELECT o FROM ShopFreightFreeShippingCity o where o.shopFreightFreeShipping=:shopFreightFreeShipping ", ShopFreightFreeShippingCity.class);
		query.setParameter("shopFreightFreeShipping", shopFreightFreeShipping);
        return query.getResultList();
    }
}
