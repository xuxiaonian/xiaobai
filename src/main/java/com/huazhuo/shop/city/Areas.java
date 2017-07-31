package com.huazhuo.shop.city;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class Areas {

	private String cityId;

	private String cityName;

	private String areaName;

	private String provinceId;

	private String spell;
	
	 public static List<Areas> findAllAreasesBycityId(String cityId) {
		 TypedQuery<Areas> query =entityManager().createQuery("SELECT o FROM Areas o where o.cityId=:cityId", Areas.class);
		 query.setParameter("cityId", cityId);
		 return query.getResultList();
	 }
}
