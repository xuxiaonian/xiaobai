package com.huazhuo.shop.domain;
import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.util.ListWithAddElementModifier;



@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ShopFreightFreeShipping {

	private Integer count;
	private BigDecimal charge;
	private BigDecimal freight;
	private Integer numbers;
	private Integer mold;
	private Integer fixedFreight;
	
	@ManyToOne
	@JoinColumn(name = "shopFreightTemplate", referencedColumnName = "id")
	private ShopFreightTemplate shopFreightTemplate;
	
	@OneToMany(targetEntity = ShopFreightFreeShippingCity.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopFreightFreeShipping")
	private List<ShopFreightFreeShippingCity> shopFreightFreeShippingCity = new ListWithAddElementModifier<ShopFreightFreeShippingCity, ShopFreightFreeShipping>(
			this) {
		private static final long serialVersionUID = 1L;
		@Override
		public void addElementModifyHook(ShopFreightFreeShippingCity child, ShopFreightFreeShipping parent) {
			child.setShopFreightFreeShipping(parent);
		}
	};

	public boolean isEmpty() {
		if (this.count != null || this.freight!=null   ) {
			return false;
		} else {
			return true;
		}
	}

	
}
