package com.huazhuo.shop.domain;

import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.security.BackUser;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "mobile_users")
public class MobileUsers {
	private String password;
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	private String userName;
	public static List<MobileUsers> findAllMobileUsersName(String userName) {
		TypedQuery<MobileUsers> query = entityManager().createQuery("SELECT o FROM MobileUsers o where o.userName=:userName", MobileUsers.class);
		query.setParameter("userName", userName);
		return query.getResultList();
	}

}
