// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShoppingProducts_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShoppingProducts.entityManager;
    
    public static final EntityManager ShoppingProducts.entityManager() {
        EntityManager em = new ShoppingProducts().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShoppingProducts.countShoppingProductses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShoppingProducts o", Long.class).getSingleResult();
    }
    
    public static List<ShoppingProducts> ShoppingProducts.findAllShoppingProductses() {
        return entityManager().createQuery("SELECT o FROM ShoppingProducts o", ShoppingProducts.class).getResultList();
    }
    
    public static ShoppingProducts ShoppingProducts.findShoppingProducts(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShoppingProducts.class, id);
    }
    
    public static List<ShoppingProducts> ShoppingProducts.findShoppingProductsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShoppingProducts o", ShoppingProducts.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShoppingProducts.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShoppingProducts.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShoppingProducts attached = ShoppingProducts.findShoppingProducts(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShoppingProducts.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShoppingProducts.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShoppingProducts ShoppingProducts.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShoppingProducts merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
