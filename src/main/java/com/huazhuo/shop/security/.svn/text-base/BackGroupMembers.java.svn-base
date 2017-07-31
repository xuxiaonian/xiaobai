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
@RooJpaActiveRecord(identifierType = Integer.class, table = "back_group_members")
public class BackGroupMembers {

	@NotNull
	@ManyToOne
	@JoinColumn(name = "group_id")
	private BackGroups permissionGroup;

	@NotNull
	@ManyToOne
	@JoinColumn(name = "username", referencedColumnName = "username")
	private BackUser user;

	public static List<BackGroupMembers> findByPermissionGroup(BackGroups permissionGroup) {
		TypedQuery<BackGroupMembers> query = entityManager().createQuery("SELECT m from BackGroupMembers m where m.permissionGroup=:permissionGroup", BackGroupMembers.class);
		query.setParameter("permissionGroup", permissionGroup);
		return query.getResultList();
	}
}
