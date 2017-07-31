package com.huazhuo.shop.city;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;


@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "provinces")
public class Provinces {

	private String provinceName;
	
	private String indexId;
	
	private String spell;
	
	@ManyToOne
	@JoinColumn(name = "locality", referencedColumnName = "id")
	private Locality locality;//   地区
}
