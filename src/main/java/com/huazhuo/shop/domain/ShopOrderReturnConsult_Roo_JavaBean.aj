// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

privileged aspect ShopOrderReturnConsult_Roo_JavaBean {
    
    public String ShopOrderReturnConsult.getContent() {
        return this.content;
    }
    
    public void ShopOrderReturnConsult.setContent(String content) {
        this.content = content;
    }
    
    public Date ShopOrderReturnConsult.getCreatedAt() {
        return this.createdAt;
    }
    
    public void ShopOrderReturnConsult.setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date ShopOrderReturnConsult.getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void ShopOrderReturnConsult.setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public Boolean ShopOrderReturnConsult.getIsShop() {
        return this.isShop;
    }
    
    public void ShopOrderReturnConsult.setIsShop(Boolean isShop) {
        this.isShop = isShop;
    }
    
    public ShopOrderRetrun ShopOrderReturnConsult.getShopOrderRetrunId() {
        return this.shopOrderRetrunId;
    }
    
    public void ShopOrderReturnConsult.setShopOrderRetrunId(ShopOrderRetrun shopOrderRetrunId) {
        this.shopOrderRetrunId = shopOrderRetrunId;
    }
    
    public List<ShopOrderReturnImg> ShopOrderReturnConsult.getShopOrderReturnImgs() {
        return this.shopOrderReturnImgs;
    }
    
    public void ShopOrderReturnConsult.setShopOrderReturnImgs(List<ShopOrderReturnImg> shopOrderReturnImgs) {
        this.shopOrderReturnImgs = shopOrderReturnImgs;
    }
    
}
