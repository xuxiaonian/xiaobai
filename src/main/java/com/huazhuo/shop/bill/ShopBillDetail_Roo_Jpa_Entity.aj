// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.bill;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect ShopBillDetail_Roo_Jpa_Entity {
    
    declare @type: ShopBillDetail: @Entity;
    
    declare @type: ShopBillDetail: @Table(name = "shop_bill_detail");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer ShopBillDetail.id;
    
    @Version
    @Column(name = "version")
    private Integer ShopBillDetail.version;
    
    public Integer ShopBillDetail.getId() {
        return this.id;
    }
    
    public void ShopBillDetail.setId(Integer id) {
        this.id = id;
    }
    
    public Integer ShopBillDetail.getVersion() {
        return this.version;
    }
    
    public void ShopBillDetail.setVersion(Integer version) {
        this.version = version;
    }
    
}