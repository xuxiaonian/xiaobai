package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "special_marks")
public class SpecialMarks {
	
	private String name;
	
	private Integer markCategoryCodeGoods;//分类ID
	
	private Integer markRangeCodeGoods;//3商品标签
	
	private Integer enabled;//1启用
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;// 
	
	public static List<SpecialMarks> findSpecialMarksByGood(Integer markCategoryCodeGoods) {
		TypedQuery<SpecialMarks> query =entityManager().createQuery("SELECT o FROM SpecialMarks o where markCategoryCodeGoods=:markCategoryCodeGoods and markRangeCodeGoods=3 and enabled=1", SpecialMarks.class);
		query.setParameter("markCategoryCodeGoods", markCategoryCodeGoods);
        return query.getResultList();
    }
	
	public static List<SpecialMarks> findSpecialMarksByGoodAndName(Integer markCategoryCodeGoods ,String name) {
		TypedQuery<SpecialMarks> query =entityManager().createQuery("SELECT o FROM SpecialMarks o where markCategoryCodeGoods=:markCategoryCodeGoods and markRangeCodeGoods=3 and enabled=1 and name=:name", SpecialMarks.class);
		query.setParameter("markCategoryCodeGoods", markCategoryCodeGoods);
		query.setParameter("name", name);
        return query.getResultList();
    }
}
