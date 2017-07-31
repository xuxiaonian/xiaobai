package com.huazhuo.shop.security;

import java.io.Serializable;

import javax.persistence.Column;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "back_authority")
public class BackAuthority implements Serializable {

	private static final long serialVersionUID = 315702641013086580L;
	@NotNull
	@Column(name = "authority_name", unique = true)
	@Size(max = 28)
	private String authorityName;

	private String name;

	public boolean isAccessibleBy(String auth) {
		if (auth == null)
			return false;
		return this.authorityName.startsWith(auth);
	}

	public static BackAuthority findAuthorityEntries(String name) {
		TypedQuery<BackAuthority> query = entityManager().createQuery("SELECT o FROM BackAuthority o where authorityName=:authName", BackAuthority.class);
		return query.setParameter("authName", name).getSingleResult();
	}
}
