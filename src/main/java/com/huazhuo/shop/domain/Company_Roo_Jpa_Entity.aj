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

privileged aspect Company_Roo_Jpa_Entity {
    
    declare @type: Company: @Entity;
    
    declare @type: Company: @Table(name = "company");
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Integer Company.id;
    
    @Version
    @Column(name = "version")
    private Integer Company.version;
    
    public Integer Company.getId() {
        return this.id;
    }
    
    public void Company.setId(Integer id) {
        this.id = id;
    }
    
    public Integer Company.getVersion() {
        return this.version;
    }
    
    public void Company.setVersion(Integer version) {
        this.version = version;
    }
    
}
