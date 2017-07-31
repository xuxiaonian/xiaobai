package com.huazhuo.shop.domain;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.city.Areas;
import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_freight_template_detail_city")
public class ShopFreightTemplateDetailCity {

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
	@JoinColumn(name = "shopFreightTemplateDetail", referencedColumnName = "id")
	private ShopFreightTemplateDetail shopFreightTemplateDetail;//   县
}
