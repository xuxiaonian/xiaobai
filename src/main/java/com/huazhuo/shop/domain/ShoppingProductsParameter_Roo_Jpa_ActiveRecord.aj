// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect ShoppingProductsParameter_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ShoppingProductsParameter.entityManager;
    
    public static final EntityManager ShoppingProductsParameter.entityManager() {
        EntityManager em = new ShoppingProductsParameter().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ShoppingProductsParameter.countShoppingProductsParameters() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ShoppingProductsParameter o", Long.class).getSingleResult();
    }
    
    public static List<ShoppingProductsParameter> ShoppingProductsParameter.findAllShoppingProductsParameters() {
        return entityManager().createQuery("SELECT o FROM ShoppingProductsParameter o", ShoppingProductsParameter.class).getResultList();
    }
    
    public static ShoppingProductsParameter ShoppingProductsParameter.findShoppingProductsParameter(Integer id) {
        if (id == null) return null;
        return entityManager().find(ShoppingProductsParameter.class, id);
    }
    
    public static List<ShoppingProductsParameter> ShoppingProductsParameter.findShoppingProductsParameterEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ShoppingProductsParameter o", ShoppingProductsParameter.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ShoppingProductsParameter.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ShoppingProductsParameter.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ShoppingProductsParameter attached = ShoppingProductsParameter.findShoppingProductsParameter(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ShoppingProductsParameter.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ShoppingProductsParameter.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ShoppingProductsParameter ShoppingProductsParameter.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ShoppingProductsParameter merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}