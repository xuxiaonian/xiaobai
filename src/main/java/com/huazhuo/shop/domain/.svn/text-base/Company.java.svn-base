package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.FetchType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Size;

import org.springframework.context.annotation.Lazy;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.ListWithAddElementModifier;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "company")
public class Company {

	@Size(max = 255)
	private String name;// 企业名称

	@Size(max = 1000)
	private String imgUrl;// 企业图片

	@Size(max = 255)
	private String address;// 企业地址

	private String legalPersion;// 法人
	private String	legalPersionCard;//法人身份证
	@Size(max = 1000)
	private String remark;// 描述

	@DateTimeFormat(style = "MM")
	private Date createdAt;// 注册时间

	@DateTimeFormat(style = "MM")
	private Date updatedAt;
	
	private String contactPerson;// 联系人
	private String phone;// 手机号
	private String email;// 邮箱
	@DateTimeFormat(style = "MM")
	private Date auditTime;// 审核通过时间
	
	@ManyToOne(fetch=FetchType.LAZY)
	@JoinColumn(name = "backUser", referencedColumnName = "id")
	private BackUser backUser;// 用户
	private Integer audit;

	private String creditCode;
	private Integer mobileUsersAuthId;
	
	@OneToMany(targetEntity = Shops.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "company")
	private List<Shops> shops = new ListWithAddElementModifier<Shops, Company>(this) {
		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(Shops child, Company parent) {
			child.setCompany(parent);
		}
	};
	
	public static List<Company> findAllCompanysByUser(BackUser backUser) {
		TypedQuery<Company> query =entityManager().createQuery("SELECT o FROM Company o where o.backUser=:backUser", Company.class);
		query.setParameter("backUser", backUser);
        return query.getResultList();
    }
	public static List<Company> findMoId(Integer mobileUsersAuthId) {
		TypedQuery<Company> query =entityManager().createQuery("SELECT o FROM Company o where o.mobileUsersAuthId=:mobileUsersAuthId", Company.class);
		query.setParameter("mobileUsersAuthId", mobileUsersAuthId);
        return query.getResultList();
    }
	public static List<Company> findId(Integer id) {
		TypedQuery<Company> query =entityManager().createQuery("SELECT o FROM Company o where o.id=:id", Company.class);
		query.setParameter("id", id);
        return query.getResultList();
    }

	
}
