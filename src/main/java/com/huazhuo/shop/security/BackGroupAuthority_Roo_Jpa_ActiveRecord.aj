// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.security;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect BackGroupAuthority_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager BackGroupAuthority.entityManager;
    
    public static final EntityManager BackGroupAuthority.entityManager() {
        EntityManager em = new BackGroupAuthority().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long BackGroupAuthority.countBackGroupAuthoritys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM BackGroupAuthority o", Long.class).getSingleResult();
    }
    
    public static List<BackGroupAuthority> BackGroupAuthority.findAllBackGroupAuthoritys() {
        return entityManager().createQuery("SELECT o FROM BackGroupAuthority o", BackGroupAuthority.class).getResultList();
    }
    
    public static BackGroupAuthority BackGroupAuthority.findBackGroupAuthority(Integer id) {
        if (id == null) return null;
        return entityManager().find(BackGroupAuthority.class, id);
    }
    
    public static List<BackGroupAuthority> BackGroupAuthority.findBackGroupAuthorityEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM BackGroupAuthority o", BackGroupAuthority.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void BackGroupAuthority.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void BackGroupAuthority.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            BackGroupAuthority attached = BackGroupAuthority.findBackGroupAuthority(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void BackGroupAuthority.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void BackGroupAuthority.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public BackGroupAuthority BackGroupAuthority.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        BackGroupAuthority merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
