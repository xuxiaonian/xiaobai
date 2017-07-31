// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShopOrderEvaluateImg_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShopOrderEvaluateImg.entityManager;
    
    public static final EntityManager ShopOrderEvaluateImg.entityManager() {
        EntityManager em = new ShopOrderEvaluateImg().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShopOrderEvaluateImg.countShopOrderEvaluateImgs() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShopOrderEvaluateImg o", Long.class).getSingleResult();
    }
    
    public static List<ShopOrderEvaluateImg> ShopOrderEvaluateImg.findAllShopOrderEvaluateImgs() {
        return entityManager().createQuery("SELECT o FROM ShopOrderEvaluateImg o", ShopOrderEvaluateImg.class).getResultList();
    }
    
    public static ShopOrderEvaluateImg ShopOrderEvaluateImg.findShopOrderEvaluateImg(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShopOrderEvaluateImg.class, id);
    }
    
    public static List<ShopOrderEvaluateImg> ShopOrderEvaluateImg.findShopOrderEvaluateImgEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShopOrderEvaluateImg o", ShopOrderEvaluateImg.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShopOrderEvaluateImg.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShopOrderEvaluateImg.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShopOrderEvaluateImg attached = ShopOrderEvaluateImg.findShopOrderEvaluateImg(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShopOrderEvaluateImg.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShopOrderEvaluateImg.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShopOrderEvaluateImg ShopOrderEvaluateImg.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShopOrderEvaluateImg merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
