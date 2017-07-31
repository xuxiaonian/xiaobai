package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.security.BackUser;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class MobileUsersAuth {
	
	private Integer userId;
	private String authStatus;
	private String authRole;
	private Integer relaOtherUserId;
	private String authName;
	private Integer authProvince;
	private Integer authCity;
	private Integer bSignatureNot;
	private String authorAddress;
	private Date createTime;
	private String authReasion;
	private Integer signatureStatus;
	private Date bSignatureTime;
	private String signatureRejectReason;
	private Date b_submitApplyTime;
	private Date lastContractUpdateTime;
	private String	recommondPhone;
	private Integer authCounty;
	public static List<MobileUsersAuth> findUserId(Integer userId) {
		TypedQuery<MobileUsersAuth> query = entityManager().createQuery("SELECT o FROM MobileUsersAuth o where o.userId=:userId", MobileUsersAuth.class);
		query.setParameter("userId", userId);
		return query.getResultList();
	}
	public static List<MobileUsersAuth> findId(Integer id) {
		TypedQuery<MobileUsersAuth> query = entityManager().createQuery("SELECT o FROM MobileUsersAuth o where o.id=:id", MobileUsersAuth.class);
		query.setParameter("id", id);
		return query.getResultList();
	}
	public static List<MobileUsersAuth> findRelaId(Integer relaOtherUserId) {
		TypedQuery<MobileUsersAuth> query = entityManager().createQuery("SELECT o FROM MobileUsersAuth o where o.relaOtherUserId=:relaOtherUserId", MobileUsersAuth.class);
		query.setParameter("relaOtherUserId", relaOtherUserId);
		return query.getResultList();
	}
}
