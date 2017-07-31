// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShopFreightTemplate_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShopFreightTemplate.entityManager;
    
    public static final EntityManager ShopFreightTemplate.entityManager() {
        EntityManager em = new ShopFreightTemplate().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShopFreightTemplate.countShopFreightTemplates() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShopFreightTemplate o", Long.class).getSingleResult();
    }
    
    public static List<ShopFreightTemplate> ShopFreightTemplate.findAllShopFreightTemplates() {
        return entityManager().createQuery("SELECT o FROM ShopFreightTemplate o", ShopFreightTemplate.class).getResultList();
    }
    
    public static ShopFreightTemplate ShopFreightTemplate.findShopFreightTemplate(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShopFreightTemplate.class, id);
    }
    
    public static List<ShopFreightTemplate> ShopFreightTemplate.findShopFreightTemplateEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShopFreightTemplate o", ShopFreightTemplate.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShopFreightTemplate.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShopFreightTemplate.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShopFreightTemplate attached = ShopFreightTemplate.findShopFreightTemplate(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShopFreightTemplate.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShopFreightTemplate.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShopFreightTemplate ShopFreightTemplate.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShopFreightTemplate merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
