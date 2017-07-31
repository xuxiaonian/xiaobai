package com.huazhuo.shop.enumtype;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "logistics_company")
public class LogisticsCompany {

	private String logisticsCode;
	
	private String logisticsName;
	
	private Integer companyType;//1-国内，2-国际，3-转运
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   
	
	private String att1;
	private String att2;
	
	
	public static List<LogisticsCompany> findAllLogisticsCompanysByCompanyType(Integer companyType) {
		TypedQuery<LogisticsCompany> query = entityManager().createQuery("SELECT o FROM LogisticsCompany o where o.companyType=:companyType", LogisticsCompany.class);
		query.setParameter("companyType", companyType);
        return query.getResultList();
    }
	
	public static List<LogisticsCompany> findAllLogisticsCompanysByLogisticsCode(String logisticsCode) {
		TypedQuery<LogisticsCompany> query = entityManager().createQuery("SELECT o FROM LogisticsCompany o where o.logisticsCode=:logisticsCode", LogisticsCompany.class);
		query.setParameter("logisticsCode", logisticsCode);
        return query.getResultList();
    }
	
	public static List<LogisticsCompany> findAllLogisticsCompanysByName(String name) {
		TypedQuery<LogisticsCompany> query = entityManager().createQuery("SELECT o FROM LogisticsCompany o where o.logisticsName=:logisticsName", LogisticsCompany.class);
		query.setParameter("logisticsName", name);
        return query.getResultList();
    }
	
}
