// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShopOrderEvaluateReply_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShopOrderEvaluateReply.entityManager;
    
    public static final EntityManager ShopOrderEvaluateReply.entityManager() {
        EntityManager em = new ShopOrderEvaluateReply().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShopOrderEvaluateReply.countShopOrderEvaluateReplys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShopOrderEvaluateReply o", Long.class).getSingleResult();
    }
    
    public static List<ShopOrderEvaluateReply> ShopOrderEvaluateReply.findAllShopOrderEvaluateReplys() {
        return entityManager().createQuery("SELECT o FROM ShopOrderEvaluateReply o", ShopOrderEvaluateReply.class).getResultList();
    }
    
    public static ShopOrderEvaluateReply ShopOrderEvaluateReply.findShopOrderEvaluateReply(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShopOrderEvaluateReply.class, id);
    }
    
    public static List<ShopOrderEvaluateReply> ShopOrderEvaluateReply.findShopOrderEvaluateReplyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShopOrderEvaluateReply o", ShopOrderEvaluateReply.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShopOrderEvaluateReply.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShopOrderEvaluateReply.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShopOrderEvaluateReply attached = ShopOrderEvaluateReply.findShopOrderEvaluateReply(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShopOrderEvaluateReply.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShopOrderEvaluateReply.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShopOrderEvaluateReply ShopOrderEvaluateReply.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShopOrderEvaluateReply merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
