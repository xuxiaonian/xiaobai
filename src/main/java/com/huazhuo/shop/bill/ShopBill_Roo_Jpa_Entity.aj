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

privileged aspect ShopBill_Roo_Jpa_Entity {
    
    declare @type: ShopBill: @Entity;
    
    declare @type: ShopBill: @Table(name = "shop_bill");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer ShopBill.id;
    
    @Version
    @Column(name = "version")
    private Integer ShopBill.version;
    
    public Integer ShopBill.getId() {
        return this.id;
    }
    
    public void ShopBill.setId(Integer id) {
        this.id = id;
    }
    
    public Integer ShopBill.getVersion() {
        return this.version;
    }
    
    public void ShopBill.setVersion(Integer version) {
        this.version = version;
    }
    
}