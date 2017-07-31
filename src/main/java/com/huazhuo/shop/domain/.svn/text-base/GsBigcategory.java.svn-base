package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class GsBigcategory {

	private Integer parentId;
	private String parentName;
	private String name;
	private String tempPic;
	private String tempPicDesc;
	private Date createTime;
	private Date updateTime;
	private String enabled;
	private Integer sort;
	private Integer isRequired;

	public static List<GsBigcategory> getGsBigcategory(Integer parentId) {
		TypedQuery<GsBigcategory> query = entityManager().createQuery("SELECT o FROM GsBigcategory o where parentId=:parentId and enabled=1 ORDER BY sort ", GsBigcategory.class);
		query.setParameter("parentId", parentId);
        return query.getResultList();
    }
	public static List<GsBigcategory> getSid(Integer id) {
		TypedQuery<GsBigcategory> query = entityManager().createQuery("SELECT o FROM GsBigcategory o where id=:id and enabled=1 ORDER BY sort", GsBigcategory.class);
		query.setParameter("id", id);
        return query.getResultList();
    }
	public static List<GsBigcategory> getList() {
		TypedQuery<GsBigcategory> query = entityManager().createQuery("SELECT o FROM GsBigcategory o where parentId=0 AND  enabled=1 ORDER BY sort", GsBigcategory.class);
	
        return query.getResultList();
    }
}
