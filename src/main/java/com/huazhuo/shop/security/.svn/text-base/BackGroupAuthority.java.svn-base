package com.huazhuo.shop.security;

import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.NotNull;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "back_group_authorities")
public class BackGroupAuthority {

	@NotNull
	@ManyToOne
	@JoinColumn(name = "group_id")
	private BackGroups permissionGroup;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "authority", referencedColumnName = "authority_name")
	private BackAuthority authority;

	public static List<BackGroupAuthority> findByTmsUser(BackUser backUser) {
		TypedQuery<BackGroupAuthority> query = entityManager().createQuery(
				"SELECT auth from BackGroupAuthority auth, BackGroupMembers m where auth.permissionGroup = m.permissionGroup and m.tmsUser = :user", BackGroupAuthority.class);
		query.setParameter("user", backUser);
		return query.getResultList();
	}

	public static List<BackGroupAuthority> findByPermissionGroup(BackGroups permissionGroup) {
		TypedQuery<BackGroupAuthority> query = entityManager().createQuery("SELECT m from GroupAuthority m where m.permissionGroup=:permissionGroup", BackGroupAuthority.class);
		query.setParameter("permissionGroup", permissionGroup);
		return query.getResultList();
	}
}
