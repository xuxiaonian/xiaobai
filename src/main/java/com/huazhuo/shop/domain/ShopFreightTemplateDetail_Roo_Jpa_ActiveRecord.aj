// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShopFreightTemplateDetail_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShopFreightTemplateDetail.entityManager;
    
    public static final EntityManager ShopFreightTemplateDetail.entityManager() {
        EntityManager em = new ShopFreightTemplateDetail().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShopFreightTemplateDetail.countShopFreightTemplateDetails() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShopFreightTemplateDetail o", Long.class).getSingleResult();
    }
    
    public static List<ShopFreightTemplateDetail> ShopFreightTemplateDetail.findAllShopFreightTemplateDetails() {
        return entityManager().createQuery("SELECT o FROM ShopFreightTemplateDetail o", ShopFreightTemplateDetail.class).getResultList();
    }
    
    public static ShopFreightTemplateDetail ShopFreightTemplateDetail.findShopFreightTemplateDetail(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShopFreightTemplateDetail.class, id);
    }
    
    public static List<ShopFreightTemplateDetail> ShopFreightTemplateDetail.findShopFreightTemplateDetailEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShopFreightTemplateDetail o", ShopFreightTemplateDetail.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShopFreightTemplateDetail.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShopFreightTemplateDetail.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShopFreightTemplateDetail attached = ShopFreightTemplateDetail.findShopFreightTemplateDetail(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShopFreightTemplateDetail.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShopFreightTemplateDetail.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShopFreightTemplateDetail ShopFreightTemplateDetail.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShopFreightTemplateDetail merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
