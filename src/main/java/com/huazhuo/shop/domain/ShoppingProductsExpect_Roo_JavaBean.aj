// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import com.huazhuo.shop.domain.ShoppingProductsExpect;
import java.util.Date;

privileged aspect ShoppingProductsExpect_Roo_JavaBean {
    
    public Date ShoppingProductsExpect.getExpectTimeBegin() {
        return this.expectTimeBegin;
    }
    
    public void ShoppingProductsExpect.setExpectTimeBegin(Date expectTimeBegin) {
        this.expectTimeBegin = expectTimeBegin;
    }
    
    public Date ShoppingProductsExpect.getExpectTimeEnd() {
        return this.expectTimeEnd;
    }
    
    public void ShoppingProductsExpect.setExpectTimeEnd(Date expectTimeEnd) {
        this.expectTimeEnd = expectTimeEnd;
    }
    
    public Integer ShoppingProductsExpect.getIsCommon() {
        return this.isCommon;
    }
    
    public void ShoppingProductsExpect.setIsCommon(Integer isCommon) {
        this.isCommon = isCommon;
    }
    
    public ShoppingProducts ShoppingProductsExpect.getProductsId() {
        return this.productsId;
    }
    
    public void ShoppingProductsExpect.setProductsId(ShoppingProducts productsId) {
        this.productsId = productsId;
    }
    
    public Date ShoppingProductsExpect.getSendGoodsTime() {
        return this.sendGoodsTime;
    }
    
    public void ShoppingProductsExpect.setSendGoodsTime(Date sendGoodsTime) {
        this.sendGoodsTime = sendGoodsTime;
    }
    
}
