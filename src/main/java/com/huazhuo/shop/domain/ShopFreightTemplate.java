package com.huazhuo.shop.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.city.Areas;
import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;
import com.huazhuo.shop.enumtype.ShopFreightTemplateType;
import com.huazhuo.shop.util.ListWithAddElementModifier;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_freight_template")
public class ShopFreightTemplate {

	private String name;
	
	
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
	@JoinColumn(name = "shopFreightTemplateType", referencedColumnName = "id")
	private ShopFreightTemplateType shopFreightTemplateType;//   发货时间
	
	private String setType;//页面字段  固定自定义运费  以后扩充使用
	
	private String billing;//页面字段  固定按件数   以后扩充使用
	
	private String shipping;//配送方式 页面字段  固定快递   以后扩充使用
	
	private Integer shopId;//商家ID
	private Integer freeShipping ;//包邮 
	private Integer mode;//方式
	private Integer prior;//单品运费优先店铺运费 0:否  1 ：是
	private Integer templateType;// 店铺模板还是单品模板 0：单品  1：店铺
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   最后编辑时间
	
	@OneToMany(targetEntity = ShopFreightTemplateDetail.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopFreightTemplate")
	private List<ShopFreightTemplateDetail> shopFreightTemplateDetails = new ListWithAddElementModifier<ShopFreightTemplateDetail, ShopFreightTemplate>(
			this) {
		private static final long serialVersionUID = 1L;
		@Override
		public void addElementModifyHook(ShopFreightTemplateDetail child, ShopFreightTemplate parent) {
			child.setShopFreightTemplate(parent);
		}
	};
	
	@OneToMany(targetEntity = ShopFreightFreeShipping.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopFreightTemplate")
	private List<ShopFreightFreeShipping> shopFreightFreeShipping = new ListWithAddElementModifier<ShopFreightFreeShipping, ShopFreightTemplate>(
			this) {
		private static final long serialVersionUID = 1L;
		@Override
		public void addElementModifyHook(ShopFreightFreeShipping child, ShopFreightTemplate parent) {
			child.setShopFreightTemplate(parent);
		}
	};
	public static List<ShopFreightTemplate> findUUIDId(String uuid) {
		TypedQuery<ShopFreightTemplate> query = entityManager().createQuery("SELECT o FROM ShopFreightTemplate o where o.uuid=:uuid", ShopFreightTemplate.class);
		query.setParameter("uuid", uuid);
        return query.getResultList();
    }
	public static List<ShopFreightTemplate> findAllShopFreightTemplatesByShopId(Integer shopId) {
		TypedQuery<ShopFreightTemplate> query = entityManager().createQuery("SELECT o FROM ShopFreightTemplate o where o.shopId=:shopId  order by updatedAt  desc", ShopFreightTemplate.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	public static List<ShopFreightTemplate> findShopId(Integer shopId) {
		TypedQuery<ShopFreightTemplate> query = entityManager().createQuery("SELECT o FROM ShopFreightTemplate o where o.shopId=:shopId  and templateType=1 ", ShopFreightTemplate.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	public static ShopFreightTemplate getNewShopFreightTemplate(ShopFreightTemplate shopFreightTemplate){
		ShopFreightTemplate newSFT = new ShopFreightTemplate();
		newSFT.setAreas(shopFreightTemplate.getAreas());
		newSFT.setBilling(shopFreightTemplate.getBilling());
		newSFT.setCities(shopFreightTemplate.getCities());
		newSFT.setCreatedAt(shopFreightTemplate.getCreatedAt());
		newSFT.setName(shopFreightTemplate.getName());
		newSFT.setProvinces(shopFreightTemplate.getProvinces());
		newSFT.setSetType(shopFreightTemplate.getSetType());
		newSFT.setShipping(shopFreightTemplate.getShipping());
		newSFT.setShopFreightTemplateType(shopFreightTemplate.getShopFreightTemplateType());
		newSFT.setUpdatedAt(shopFreightTemplate.getUpdatedAt());
		newSFT.setShopId(shopFreightTemplate.getShopId());
		
		List<ShopFreightTemplateDetail> shopFreightTemplateDetails = new ArrayList<ShopFreightTemplateDetail>();
		for(ShopFreightTemplateDetail shopFreightTemplateDetail:shopFreightTemplate.getShopFreightTemplateDetails()){
			ShopFreightTemplateDetail sftd = new ShopFreightTemplateDetail();
			sftd.setAddCount(shopFreightTemplateDetail.getAddCount());
			sftd.setAddFreight(shopFreightTemplateDetail.getAddFreight());
			sftd.setCount(shopFreightTemplateDetail.getCount());
			sftd.setFreight(shopFreightTemplateDetail.getFreight());
			sftd.setShopFreightTemplate(newSFT);
			
			List<ShopFreightTemplateDetailCity> shopFreightTemplateDetailCities = new ArrayList<ShopFreightTemplateDetailCity>();
			for(ShopFreightTemplateDetailCity shopFreightTemplateDetailCity:shopFreightTemplateDetail.getShopFreightTemplateDetailCities()){
				ShopFreightTemplateDetailCity sftdc = new ShopFreightTemplateDetailCity();
				sftdc.setAreas(shopFreightTemplateDetailCity.getAreas());
				sftdc.setCities(shopFreightTemplateDetailCity.getCities());
				sftdc.setProvinces(shopFreightTemplateDetailCity.getProvinces());
				sftdc.setShopFreightTemplateDetail(sftd);
				shopFreightTemplateDetailCities.add(sftdc);
			}
			sftd.setShopFreightTemplateDetailCities(shopFreightTemplateDetailCities);
			shopFreightTemplateDetails.add(sftd);
		}
		newSFT.setShopFreightTemplateDetails(shopFreightTemplateDetails);
		return newSFT;
	}
	
	
	public void removeEmptyDetail() {
		List<ShopFreightTemplateDetail> shopFreightTemplateDetails = this.shopFreightTemplateDetails;
		int shopFreightTemplateDetailsSize = shopFreightTemplateDetails.size();
		for (int i = shopFreightTemplateDetailsSize - 1; i >= 0; i--) {
			ShopFreightTemplateDetail file = shopFreightTemplateDetails.get(i);
			if (file.isEmpty()) {
				shopFreightTemplateDetails.remove(file);
			}

		}
	}

	public void removeShipping() {
		List<ShopFreightFreeShipping> shopFreightFreeShipping = this.shopFreightFreeShipping;
		int shopFreightFreeShippingSize = shopFreightFreeShipping.size();
		for (int i = shopFreightFreeShippingSize - 1; i >= 0; i--) {
			ShopFreightFreeShipping file = shopFreightFreeShipping.get(i);
			if (file.isEmpty()) {
				shopFreightFreeShipping.remove(file);
			}

		}
	}
	public static List<ShopFreightTemplate> findShId(Integer shopId) {
		TypedQuery<ShopFreightTemplate> query = entityManager().createQuery("SELECT o FROM ShopFreightTemplate o where o.shopId=:shopId and templateType=0 ", ShopFreightTemplate.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	public static List<ShopFreightTemplate> findShIds(Integer shopId) {
		TypedQuery<ShopFreightTemplate> query = entityManager().createQuery("SELECT o FROM ShopFreightTemplate o where o.shopId=:shopId and templateType=0  order by updatedAt  desc ", ShopFreightTemplate.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	public static List<ShopFreightTemplate> findShIdss(Integer shopId) {
		TypedQuery<ShopFreightTemplate> query = entityManager().createQuery("SELECT o FROM ShopFreightTemplate o where o.shopId=:shopId and templateType=1  order by updatedAt  desc ", ShopFreightTemplate.class);
		query.setParameter("shopId", shopId);
        return query.getResultList();
    }
	
}
