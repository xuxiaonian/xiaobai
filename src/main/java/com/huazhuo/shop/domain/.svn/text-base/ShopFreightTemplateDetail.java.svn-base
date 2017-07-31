package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.validation.constraints.Digits;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.util.ListWithAddElementModifier;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_freight_template_detail")
public class ShopFreightTemplateDetail {
	
	private Integer count;//多少件内 多少钱 freight
	
	@Digits(integer = 8, fraction = 2)
	private BigDecimal freight;//   多少件内 多少钱 运费
	
	private Integer addCount;
	
	@Digits(integer = 8, fraction = 2)
	private BigDecimal addFreight;
	
	@ManyToOne
	@JoinColumn(name = "shopFreightTemplate", referencedColumnName = "id")
	private ShopFreightTemplate shopFreightTemplate;//  运费模板ID
	
	@OneToMany(targetEntity = ShopFreightTemplateDetailCity.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopFreightTemplateDetail")
	private List<ShopFreightTemplateDetailCity> shopFreightTemplateDetailCities = new ListWithAddElementModifier<ShopFreightTemplateDetailCity, ShopFreightTemplateDetail>(
			this) {
		private static final long serialVersionUID = 1L;
		@Override
		public void addElementModifyHook(ShopFreightTemplateDetailCity child, ShopFreightTemplateDetail parent) {
			child.setShopFreightTemplateDetail(parent);
		}
	};
	
	public boolean isEmpty() {
		if (this.count != null || this.freight!=null || this.addCount!=null || this.addFreight!=null ) {
			return false;
		} else {
			return true;
		}
	}
}
