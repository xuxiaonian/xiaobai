package com.huazhuo.shop.city;

import java.util.Date;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "cities")
public class Cities {

	private String name;//   名称
	private String pinyin;//   名称拼音
	private String pinyinAbridge;//   拼音简写
	private String initial;//   拼音首字母大写
	private String zipcode;//   邮政编码
	private Integer status;//   
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//     
	
	private Integer count;//   搜索次数
	private String cityCode;//   
	private String weather;//   天气
	private String temperature;//   温度
	private String pmTwoPointFive;//   pm2.5
	private String currentTemperature;//   当前气温
	private String hint;//   天气建议
	
	@ManyToOne
	@JoinColumn(name = "provinces", referencedColumnName = "id")
	private Provinces provinces;
	
	public static List<Cities> findAllCitiesesByProvinces(Provinces provinces) {
		TypedQuery<Cities> query =entityManager().createQuery("SELECT o FROM Cities o where o.provinces=:provinces", Cities.class);
		query.setParameter("provinces", provinces);
        return query.getResultList();
    }
}
