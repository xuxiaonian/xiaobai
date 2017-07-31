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
public class MobileUsersAuthLicePic {
	private Integer mobileUsersAuthId;
	private String licePic;
	private Date createtime;
	private Date updatetime;
	public static List<MobileUsersAuthLicePic> AuthId( Integer mobileUsersAuthId) {
		TypedQuery<MobileUsersAuthLicePic> query =entityManager().createQuery("SELECT o FROM MobileUsersAuthLicePic o where o.mobileUsersAuthId=:mobileUsersAuthId", MobileUsersAuthLicePic.class);
		query.setParameter("mobileUsersAuthId", mobileUsersAuthId);
        return query.getResultList();
    }
}
