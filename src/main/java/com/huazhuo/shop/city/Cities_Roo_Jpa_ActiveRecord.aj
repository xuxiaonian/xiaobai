// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.city;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect Cities_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Cities.entityManager;
    
    public static final EntityManager Cities.entityManager() {
        EntityManager em = new Cities().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Cities.countCitieses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Cities o", Long.class).getSingleResult();
    }
    
    public static List<Cities> Cities.findAllCitieses() {
        return entityManager().createQuery("SELECT o FROM Cities o", Cities.class).getResultList();
    }
    
    public static Cities Cities.findCities(Integer id) {
        if (id == null) return null;
        return entityManager().find(Cities.class, id);
    }
    
    public static List<Cities> Cities.findCitiesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Cities o", Cities.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Cities.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Cities.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Cities attached = Cities.findCities(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Cities.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Cities.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Cities Cities.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Cities merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}