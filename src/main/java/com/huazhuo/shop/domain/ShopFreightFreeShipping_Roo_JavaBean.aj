// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import com.huazhuo.shop.domain.ShopFreightFreeShipping;
import java.math.BigDecimal;
import java.util.List;

privileged aspect ShopFreightFreeShipping_Roo_JavaBean {
    
    public Integer ShopFreightFreeShipping.getCount() {
        return this.count;
    }
    
    public void ShopFreightFreeShipping.setNumbers(Integer numbers) {
        this.numbers = numbers;
    }
    public Integer ShopFreightFreeShipping.getNumbers() {
        return this.numbers;
    }
    
    public void ShopFreightFreeShipping.setMold(Integer mold) {
        this.mold = mold;
    }
    public Integer ShopFreightFreeShipping.getMold() {
        return this.mold;
    }
    public void ShopFreightFreeShipping.setFixedFreight(Integer fixedFreight) {
        this.fixedFreight = fixedFreight;
    }
    public Integer ShopFreightFreeShipping.getFixedFreight() {
        return this.fixedFreight;
    }
    public void ShopFreightFreeShipping.setCount(Integer count) {
        this.count = count;
    }
    public BigDecimal ShopFreightFreeShipping.getFreight() {
        return this.freight;
    }
    
    public void ShopFreightFreeShipping.setFreight(BigDecimal freight) {
        this.freight = freight;
    }
    public BigDecimal ShopFreightFreeShipping.getCharge() {
        return this.charge;
    }
    
    public void ShopFreightFreeShipping.setCharge(BigDecimal charge) {
        this.charge = charge;
    }
    public ShopFreightTemplate ShopFreightFreeShipping.getShopFreightTemplate() {
        return this.shopFreightTemplate;
    }
    
    public void ShopFreightFreeShipping.setShopFreightTemplate(ShopFreightTemplate shopFreightTemplate) {
        this.shopFreightTemplate = shopFreightTemplate;
    }

	 public List<ShopFreightFreeShippingCity> ShopFreightFreeShipping.getShopFreightFreeShippingCity() {
	        return this.shopFreightFreeShippingCity;
	    }
	    
	    public void ShopFreightFreeShipping.setShopFreightFreeShippingCity(List<ShopFreightFreeShippingCity> shopFreightFreeShippingCity) {
	        this.shopFreightFreeShippingCity = shopFreightFreeShippingCity;
	    }
	
}