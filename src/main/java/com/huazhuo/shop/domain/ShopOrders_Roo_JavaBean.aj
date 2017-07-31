// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.huazhuo.shop.enumtype.LogisticsCompany;
import com.huazhuo.shop.enumtype.ShopOrderType;

privileged aspect ShopOrders_Roo_JavaBean {
    
    public String ShopOrders.getOrderNumber() {
        return this.orderNumber;
    }
    
    public void ShopOrders.setOrderNumber(String orderNumber) {
        this.orderNumber = orderNumber;
    }
    
    public ShopOrderType ShopOrders.getOrderStatus() {
        return this.orderStatus;
    }
    
    public void ShopOrders.setOrderStatus(ShopOrderType orderStatus) {
        this.orderStatus = orderStatus;
    }
    
    public String ShopOrders.getRemarks() {
        return this.remarks;
    }
    
    public void ShopOrders.setRemarks(String remarks) {
        this.remarks = remarks;
    }
    
    public MobileUsers ShopOrders.getMobileUserId() {
        return this.mobileUserId;
    }
    
    public void ShopOrders.setMobileUserId(MobileUsers mobileUserId) {
        this.mobileUserId = mobileUserId;
    }
    
    public Integer ShopOrders.getShopId() {
        return this.shopId;
    }
    
    public void ShopOrders.setShopId(Integer shopId) {
        this.shopId = shopId;
    }
    
    public Date ShopOrders.getOrderTime() {
        return this.orderTime;
    }
    
    public void ShopOrders.setOrderTime(Date orderTime) {
        this.orderTime = orderTime;
    }
    
    public Date ShopOrders.getPayedAt() {
        return this.payedAt;
    }
    
    public void ShopOrders.setPayedAt(Date payedAt) {
        this.payedAt = payedAt;
    }
    
    public Date ShopOrders.getSendTime() {
        return this.sendTime;
    }
    
    public void ShopOrders.setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }
    
    public Date ShopOrders.getEndTime() {
        return this.endTime;
    }
    
    public void ShopOrders.setEndTime(Date endTime) {
        this.endTime = endTime;
    }
    
    public String ShopOrders.getLogisticsNumber() {
        return this.logisticsNumber;
    }
    
    public void ShopOrders.setLogisticsNumber(String logisticsNumber) {
        this.logisticsNumber = logisticsNumber;
    }
    
    public String ShopOrders.getTripleOrderNumber() {
        return this.tripleOrderNumber;
    }
    
    public void ShopOrders.setTripleOrderNumber(String tripleOrderNumber) {
        this.tripleOrderNumber = tripleOrderNumber;
    }
    
    public LogisticsCompany ShopOrders.getLogisticsCompany() {
        return this.logisticsCompany;
    }
    
    public void ShopOrders.setLogisticsCompany(LogisticsCompany logisticsCompany) {
        this.logisticsCompany = logisticsCompany;
    }
    
    public Integer ShopOrders.getDeleteStatus() {
        return this.deleteStatus;
    }
    
    public void ShopOrders.setDeleteStatus(Integer deleteStatus) {
        this.deleteStatus = deleteStatus;
    }
    
    public BigDecimal ShopOrders.getCollect() {
        return this.collect;
    }
    
    public void ShopOrders.setCollect(BigDecimal collect) {
        this.collect = collect;
    }
    
    public String ShopOrders.getAddress() {
        return this.address;
    }
    
    public void ShopOrders.setAddress(String address) {
        this.address = address;
    }
    
    public ShopFastMail ShopOrders.getFastMailId() {
        return this.fastMailId;
    }
    
    public void ShopOrders.setFastMailId(ShopFastMail fastMailId) {
        this.fastMailId = fastMailId;
    }
    
    public String ShopOrders.getMailCost() {
        return this.mailCost;
    }
    
    public void ShopOrders.setMailCost(String mailCost) {
        this.mailCost = mailCost;
    }
    
    public String ShopOrders.getShopOrderscol() {
        return this.shopOrderscol;
    }
    
    public void ShopOrders.setShopOrderscol(String shopOrderscol) {
        this.shopOrderscol = shopOrderscol;
    }
    
    public Date ShopOrders.getCreatedAt() {
        return this.createdAt;
    }
    
    public void ShopOrders.setCreatedAt(Date createdAt) {
        this.createdAt = createdAt;
    }
    
    public Date ShopOrders.getUpdatedAt() {
        return this.updatedAt;
    }
    
    public void ShopOrders.setUpdatedAt(Date updatedAt) {
        this.updatedAt = updatedAt;
    }
    
    public Boolean ShopOrders.getIsReturn() {
        return this.isReturn;
    }
    
    public void ShopOrders.setIsReturn(Boolean isReturn) {
        this.isReturn = isReturn;
    }
    
    public Boolean ShopOrders.getIsReturnSucc() {
        return this.isReturnSucc;
    }
    
    public void ShopOrders.setIsReturnSucc(Boolean isReturnSucc) {
        this.isReturnSucc = isReturnSucc;
    }
    
    public String ShopOrders.getAtt1() {
        return this.att1;
    }
    
    public void ShopOrders.setAtt1(String att1) {
        this.att1 = att1;
    }
    
    public String ShopOrders.getAtt2() {
        return this.att2;
    }
    
    public void ShopOrders.setAtt2(String att2) {
        this.att2 = att2;
    }
    
    public String ShopOrders.getAtt3() {
        return this.att3;
    }
    
    public void ShopOrders.setAtt3(String att3) {
        this.att3 = att3;
    }
    
    public String ShopOrders.getAtt4() {
        return this.att4;
    }
    
    public void ShopOrders.setAtt4(String att4) {
        this.att4 = att4;
    }
    
    public String ShopOrders.getAtt5() {
        return this.att5;
    }
    
    public void ShopOrders.setAtt5(String att5) {
        this.att5 = att5;
    }
    
    public List<ShopOrderRetrun> ShopOrders.getShopOrderRetruns() {
        return this.shopOrderRetruns;
    }
    
    public void ShopOrders.setShopOrderRetruns(List<ShopOrderRetrun> shopOrderRetruns) {
        this.shopOrderRetruns = shopOrderRetruns;
    }
    
    public List<ShopOrderList> ShopOrders.getShopOrderList() {
        return this.shopOrderList;
    }
    
    public void ShopOrders.setShopOrderList(List<ShopOrderList> shopOrderList) {
        this.shopOrderList = shopOrderList;
    }
    
}
