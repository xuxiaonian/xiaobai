// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.enumtype;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

import org.springframework.transaction.annotation.Transactional;

privileged aspect LogisticsCompany_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager LogisticsCompany.entityManager;
    
    public static final EntityManager LogisticsCompany.entityManager() {
        EntityManager em = new LogisticsCompany().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long LogisticsCompany.countLogisticsCompanys() {
        return entityManager().createQuery("SELECT COUNT(o) FROM LogisticsCompany o", Long.class).getSingleResult();
    }
    
    public static List<LogisticsCompany> LogisticsCompany.findAllLogisticsCompanys() {
        return entityManager().createQuery("SELECT o FROM LogisticsCompany o", LogisticsCompany.class).getResultList();
    }
    
    public static LogisticsCompany LogisticsCompany.findLogisticsCompany(Integer id) {
        if (id == null) return null;
        return entityManager().find(LogisticsCompany.class, id);
    }
    
    public static List<LogisticsCompany> LogisticsCompany.findLogisticsCompanyEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM LogisticsCompany o", LogisticsCompany.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void LogisticsCompany.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void LogisticsCompany.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            LogisticsCompany attached = LogisticsCompany.findLogisticsCompany(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void LogisticsCompany.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void LogisticsCompany.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public LogisticsCompany LogisticsCompany.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        LogisticsCompany merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
