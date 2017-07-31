// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.bill;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import com.huazhuo.shop.billenum.BillEnum;
import com.huazhuo.shop.billenum.BillShowEnum;

privileged aspect ShopBill_Roo_JavaBean {
    
    public String ShopBill.getBillNumber() {
        return this.billNumber;
    }
    
    public void ShopBill.setBillNumber(String billNumber) {
        this.billNumber = billNumber;
    }
    
    public Date ShopBill.getBillStart() {
        return this.billStart;
    }
    
    public void ShopBill.setBillStart(Date billStart) {
        this.billStart = billStart;
    }
    
    public Date ShopBill.getBillEnd() {
        return this.billEnd;
    }
    
    public void ShopBill.setBillEnd(Date billEnd) {
        this.billEnd = billEnd;
    }
    
    public Date ShopBill.getCreateDate() {
        return this.createDate;
    }
    
    public void ShopBill.setCreateDate(Date createDate) {
        this.createDate = createDate;
    }
    
    public Date ShopBill.getShopEnterDate() {
        return this.shopEnterDate;
    }
    
    public void ShopBill.setShopEnterDate(Date shopEnterDate) {
        this.shopEnterDate = shopEnterDate;
    }
    
    public Date ShopBill.getOperFinancialManagerSettleTime() {
        return this.operFinancialManagerSettleTime;
    }
    
    public void ShopBill.setOperFinancialManagerSettleTime(Date operFinancialManagerSettleTime) {
        this.operFinancialManagerSettleTime = operFinancialManagerSettleTime;
    }
    
    public Date ShopBill.getSettleDate() {
        return this.settleDate;
    }
    
    public void ShopBill.setSettleDate(Date settleDate) {
        this.settleDate = settleDate;
    }
    
    public BigDecimal ShopBill.getBillCost() {
        return this.billCost;
    }
    
    public void ShopBill.setBillCost(BigDecimal billCost) {
        this.billCost = billCost;
    }
    
    public BigDecimal ShopBill.getSettleCost() {
        return this.settleCost;
    }
    
    public void ShopBill.setSettleCost(BigDecimal settleCost) {
        this.settleCost = settleCost;
    }
    
    public Integer ShopBill.getBillEnum() {
        return this.billEnum;
    }
    
    public void ShopBill.setBillEnum(Integer billEnum) {
        this.billEnum = billEnum;
    }
    
    public Integer ShopBill.getBillShowEnum() {
        return this.billShowEnum;
    }
    
    public void ShopBill.setBillShowEnum(Integer billShowEnum) {
        this.billShowEnum = billShowEnum;
    }
    
    public Integer ShopBill.getShopId() {
        return this.shopId;
    }
    
    public void ShopBill.setShopId(Integer shopId) {
        this.shopId = shopId;
    }
    
    public List<ShopBillDetail> ShopBill.getShopBillDetails() {
        return this.shopBillDetails;
    }
    
    public void ShopBill.setShopBillDetails(List<ShopBillDetail> shopBillDetails) {
        this.shopBillDetails = shopBillDetails;
    }
    
    public String ShopBill.getAuditNotThroughReason() {
        return this.auditNotThroughReason;
    }
    
    public void ShopBill.setAuditNotThroughReason(String auditNotThroughReason) {
        this.auditNotThroughReason = auditNotThroughReason;
    }
    
    public String ShopBill.getAuditPerson() {
        return this.auditPerson;
    }
    
    public void ShopBill.setAuditPerson(String auditPerson) {
        this.auditPerson = auditPerson;
    }
    
    public Date ShopBill.getAuditTime() {
        return this.auditTime;
    }
    
    public void ShopBill.setAuditTime(Date auditTime) {
        this.auditTime = auditTime;
    }
    
    public Integer ShopBill.getAuditRole() {
        return this.auditRole;
    }
    
    public void ShopBill.setAuditRole(Integer auditRole) {
        this.auditRole = auditRole;
    }
}