package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.city.Cities;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shops")
public class Shops {
	
	private String name;//   
	private String url;//   
	private String content;//   
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//    
	@ManyToOne
	@JoinColumn(name = "cityId", referencedColumnName = "id")
	private Cities cities;	//   城市ID
	
	private String address;//   商铺地址
	
	private String persion;//	联系人
	
	private String phone;//   商铺联系电话
	
	private String servicePhone;//	客服电话
	
	private String startYear;//   创建年代
	private String brand;//   品牌
	private String openTime;//   营业时间
	private String cost;//   
	private String lon;//   
	private String lat;//  
	private Integer enabled;
	private Integer audit;
	private String servicePhoneExt;
    private Integer calculationModel;  //	0: 叠加计算 1:取高计算
	@ManyToOne(fetch=FetchType.LAZY,optional=true)
	@JoinColumn(name = "company", referencedColumnName = "id")
	private Company company;//   企业
	
	public static List<Shops> findShopsEntries(int firstResult, int maxResults) {
		TypedQuery<Shops> query =entityManager().createQuery("SELECT o FROM Shops o", Shops.class);
        return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
	
	public static List<Shops> findAllShopsesByCompany(Company company) {
		TypedQuery<Shops> query =entityManager().createQuery("SELECT o FROM Shops o where o.company=:company", Shops.class);
		query.setParameter("company", company);
        return query.getResultList();
    }
	
	public static List<Shops> findAllShopsesByCompanyId(Integer company) {
		TypedQuery<Shops> query =entityManager().createQuery("SELECT o FROM Shops o where o.company.id=:company", Shops.class);
		query.setParameter("company", company);
        return query.getResultList();
    }
	public static List<Shops> finId(Integer id) {
		TypedQuery<Shops> query =entityManager().createQuery("SELECT o FROM Shops o where id=:id", Shops.class);
		query.setParameter("id", id);
        return query.getResultList();
    }
}
