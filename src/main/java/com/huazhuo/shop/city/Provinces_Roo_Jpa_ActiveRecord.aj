// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.city;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect Provinces_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager Provinces.entityManager;
    
    public static final EntityManager Provinces.entityManager() {
        EntityManager em = new Provinces().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long Provinces.countProvinceses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Provinces o", Long.class).getSingleResult();
    }
    
    public static List<Provinces> Provinces.findAllProvinceses() {
        return entityManager().createQuery("SELECT o FROM Provinces o", Provinces.class).getResultList();
    }
    
    public static Provinces Provinces.findProvinces(Integer id) {
        if (id == null) return null;
        return entityManager().find(Provinces.class, id);
    }
    
    public static List<Provinces> Provinces.findProvincesEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Provinces o", Provinces.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void Provinces.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void Provinces.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            Provinces attached = Provinces.findProvinces(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void Provinces.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void Provinces.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public Provinces Provinces.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Provinces merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
