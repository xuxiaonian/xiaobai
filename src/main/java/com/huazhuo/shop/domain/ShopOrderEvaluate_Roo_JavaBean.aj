// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

privileged aspect ShopOrderEvaluate_Roo_JavaBean {
    
    public String ShopOrderEvaluate.getContent() {
        return this.content;
    }
    
    public void ShopOrderEvaluate.setContent(String content) {
        this.content = content;
    }
    
    public Integer ShopOrderEvaluate.getGrade() {
        return this.grade;
    }
    
    public void ShopOrderEvaluate.setGrade(Integer grade) {
        this.grade = grade;
    }
    
    public Date ShopOrderEvaluate.getCreatedAt() {
        return this.createdAt;
    }
    
    public void ShopOrderEvaluate.setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date ShopOrderEvaluate.getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void ShopOrderEvaluate.setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public MobileUsers ShopOrderEvaluate.getMobileUserId() {
        return this.mobileUserId;
    }
    
    public void ShopOrderEvaluate.setMobileUserId(MobileUsers mobileUserId) {
        this.mobileUserId = mobileUserId;
    }
    
    public ShoppingProducts ShopOrderEvaluate.getShoppingProductsId() {
        return this.shoppingProductsId;
    }
    
    public void ShopOrderEvaluate.setShoppingProductsId(ShoppingProducts shoppingProductsId) {
        this.shoppingProductsId = shoppingProductsId;
    }
    
    public ShopOrders ShopOrderEvaluate.getShopOrder() {
        return this.shopOrder;
    }
    
    public void ShopOrderEvaluate.setShopOrder(ShopOrders shopOrder) {
        this.shopOrder = shopOrder;
    }
    
    public List<ShopOrderEvaluateReply> ShopOrderEvaluate.getShopOrderEvaluateReplies() {
        return this.shopOrderEvaluateReplies;
    }
    
    public void ShopOrderEvaluate.setShopOrderEvaluateReplies(List<ShopOrderEvaluateReply> shopOrderEvaluateReplies) {
        this.shopOrderEvaluateReplies = shopOrderEvaluateReplies;
    }
    
}
