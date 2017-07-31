// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShoppingProductType_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShoppingProductType.entityManager;
    
    public static final EntityManager ShoppingProductType.entityManager() {
        EntityManager em = new ShoppingProductType().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShoppingProductType.countShoppingProductTypes() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShoppingProductType o", Long.class).getSingleResult();
    }
    
    public static List<ShoppingProductType> ShoppingProductType.findAllShoppingProductTypes() {
        return entityManager().createQuery("SELECT o FROM ShoppingProductType o", ShoppingProductType.class).getResultList();
    }
    
    public static ShoppingProductType ShoppingProductType.findShoppingProductType(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShoppingProductType.class, id);
    }
    
    public static List<ShoppingProductType> ShoppingProductType.findShoppingProductTypeEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShoppingProductType o", ShoppingProductType.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShoppingProductType.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShoppingProductType.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShoppingProductType attached = ShoppingProductType.findShoppingProductType(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShoppingProductType.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShoppingProductType.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShoppingProductType ShoppingProductType.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShoppingProductType merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
