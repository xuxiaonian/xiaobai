// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import com.huazhuo.shop.domain.ShoppingProductsContent;
import java.util.Date;

import org.springframework.web.multipart.commons.CommonsMultipartFile;

privileged aspect ShoppingProductsContent_Roo_JavaBean {
    public String ShoppingProductsContent.getPicName() {
        return this.picName;
    }
    
    public void ShoppingProductsContent.setPicName(String picName) {
        this.picName = picName;
    }
    public String ShoppingProductsContent.getContent() {
        return this.content;
    }
    
    public void ShoppingProductsContent.setContent(String content) {
        this.content = content;
    }
    
    public Integer ShoppingProductsContent.getType() {
        return this.type;
    }
    
    public void ShoppingProductsContent.setType(Integer type) {
        this.type = type;
    }
    
    public Date ShoppingProductsContent.getCreateTime() {
        return this.createTime;
    }
    
    public void ShoppingProductsContent.setCreateTime(Date createTime) {
        this.createTime = createTime;
    }
    
    
    public ShoppingProducts ShoppingProductsContent.getShoppingProductsId() {
        return this.shoppingProductsId;
    }
    
    public void ShoppingProductsContent.setShoppingProductsId(ShoppingProducts shoppingProductsId) {
        this.shoppingProductsId = shoppingProductsId;
    }
    
    public CommonsMultipartFile ShoppingProductsContent.getAttachment() {
        return this.attachment;
    }
    
    public void ShoppingProductsContent.setAttachment(CommonsMultipartFile attachment) {
        this.attachment = attachment;
    }
    
}
