// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.persistence.Version;

privileged aspect ShopOrderReturnConsult_Roo_Jpa_Entity {
    
    declare @type: ShopOrderReturnConsult: @Entity;
    
    declare @type: ShopOrderReturnConsult: @Table(name = "shop_order_return_consult");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer ShopOrderReturnConsult.id;
    
    @Version
    @Column(name = "version")
    private Integer ShopOrderReturnConsult.version;
    
    public Integer ShopOrderReturnConsult.getId() {
        return this.id;
    }
    
    public void ShopOrderReturnConsult.setId(Integer id) {
        this.id = id;
    }
    
    public Integer ShopOrderReturnConsult.getVersion() {
        return this.version;
    }
    
    public void ShopOrderReturnConsult.setVersion(Integer version) {
        this.version = version;
    }
    
}
