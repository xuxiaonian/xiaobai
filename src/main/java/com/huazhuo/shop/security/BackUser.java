package com.huazhuo.shop.security;

import java.io.Serializable;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.EntityManager;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.domain.MobileUsers;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "back_user")
public class BackUser implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@NotNull
	@Column(name = "username", unique = true)
	@Size(max = 25)
	private String userName;

	@Size(max = 255)
	private String fullName;
	
	private String smsToken;
	
	@NotNull
	@Size(max = 4000)
	private String password;

	private String companyName;
	
	private Integer provincesId;//省
	
	private Integer citiesId;//市
	
	@Size(max = 4000)
	private String address;
	
	@Size(max = 255)
	private String contact;
	
	@Size(max = 255)
	private String email;
	
	private String phone;
	
	private Boolean enabled;//是否启用

	@DateTimeFormat(style = "MM")
	private Date createdTime;// 注册时间
	
	@DateTimeFormat(style = "MM")
	private Date lastLoginTime;// 最后登录时间
	
	@DateTimeFormat(style = "MM")
	private Date enabledTime;// 注册时间
	
	public static TypedQuery<BackUser> findUsersByUserNameEquals(String userName) {
		if (userName == null || userName.length() == 0)
			throw new IllegalArgumentException("The userName argument is required");
		EntityManager em = BackUser.entityManager();
		TypedQuery<BackUser> q = em.createQuery("SELECT o FROM BackUser AS o WHERE o.userName = :userName", BackUser.class);
		q.setParameter("userName", userName);
		return q;
	}

	public static List<BackUser> findAllUsersByUserName(String userName) {
		TypedQuery<BackUser> query = entityManager().createQuery("SELECT o FROM BackUser o where o.userName=:userName", BackUser.class);
		query.setParameter("userName", userName);
		return query.getResultList();
	}

	public static List<BackUser> findAllUsersByUserNameAndPassWord(String userName,String password) {
		TypedQuery<BackUser> query = entityManager().createQuery("SELECT o FROM BackUser o where o.userName=:userName and o.password=:password", BackUser.class);
		query.setParameter("userName", userName);
		query.setParameter("password", password);
		return query.getResultList();
	}

	public static List<BackUser> findId(Integer id) {
		TypedQuery<BackUser> query = entityManager().createQuery("SELECT o FROM BackUser o where o.id=:id ", BackUser.class);
		query.setParameter("id", id);
		
		return query.getResultList();
	}
	
}
