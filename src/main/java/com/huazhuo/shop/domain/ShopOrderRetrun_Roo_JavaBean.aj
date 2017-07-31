// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.huazhuo.shop.enumtype.ShopOrderRetrunType;

privileged aspect ShopOrderRetrun_Roo_JavaBean {
    
    public String ShopOrderRetrun.getReturnNumber() {
        return this.returnNumber;
    }
    
    public void ShopOrderRetrun.setReturnNumber(String returnNumber) {
        this.returnNumber = returnNumber;
    }
    
    public Date ShopOrderRetrun.getReturnTime() {
        return this.returnTime;
    }
    
    public void ShopOrderRetrun.setReturnTime(Date returnTime) {
        this.returnTime = returnTime;
    }
    
    public ShopOrders ShopOrderRetrun.getShopOrderId() {
        return this.shopOrderId;
    }
    
    public void ShopOrderRetrun.setShopOrderId(ShopOrders shopOrderId) {
        this.shopOrderId = shopOrderId;
    }
    
    public BigDecimal ShopOrderRetrun.getReturnCost() {
        return this.returnCost;
    }
    
    public void ShopOrderRetrun.setReturnCost(BigDecimal returnCost) {
        this.returnCost = returnCost;
    }
    
    public ShopOrderRetrunType ShopOrderRetrun.getShopOrderRetrunType() {
        return this.shopOrderRetrunType;
    }
    
    public void ShopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType shopOrderRetrunType) {
        this.shopOrderRetrunType = shopOrderRetrunType;
    }
    
    public Date ShopOrderRetrun.getCreatedAt() {
        return this.createdAt;
    }
    
    public void ShopOrderRetrun.setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date ShopOrderRetrun.getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void ShopOrderRetrun.setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public String ShopOrderRetrun.getLogisticsCode() {
        return this.logisticsCode;
    }
    
    public void ShopOrderRetrun.setLogisticsCode(String logisticsCode) {
        this.logisticsCode = logisticsCode;
    }
    
    public String ShopOrderRetrun.getLogisticsNumber() {
        return this.logisticsNumber;
    }
    
    public void ShopOrderRetrun.setLogisticsNumber(String logisticsNumber) {
        this.logisticsNumber = logisticsNumber;
    }
    
    public Boolean ShopOrderRetrun.getIsDel() {
        return this.isDel;
    }
    
    public void ShopOrderRetrun.setIsDel(Boolean isDel) {
        this.isDel = isDel;
    }
    
    public Date ShopOrderRetrun.getShopAgreeTime() {
        return this.shopAgreeTime;
    }
    
    public void ShopOrderRetrun.setShopAgreeTime(Date shopAgreeTime) {
        this.shopAgreeTime = shopAgreeTime;
    }
    
    public String ShopOrderRetrun.getShopOrderReturnReason() {
        return this.shopOrderReturnReason;
    }
    
    public void ShopOrderRetrun.setShopOrderReturnReason(String shopOrderReturnReason) {
        this.shopOrderReturnReason = shopOrderReturnReason;
    }
    
    public List<ShopOrderReturnConsult> ShopOrderRetrun.getShopOrderReturnConsults() {
        return this.shopOrderReturnConsults;
    }
    
    public void ShopOrderRetrun.setShopOrderReturnConsults(List<ShopOrderReturnConsult> shopOrderReturnConsults) {
        this.shopOrderReturnConsults = shopOrderReturnConsults;
    }
    
}
