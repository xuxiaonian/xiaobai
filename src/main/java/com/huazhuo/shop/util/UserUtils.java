package com.huazhuo.shop.util;

import org.springframework.security.core.context.SecurityContextHolder;

import com.huazhuo.shop.security.CustomerUser;

public class UserUtils {
	public static boolean isBranchCompany() {
		CustomerUser user = getCurrentUser();
		if (user == null)
			return false;
		return true;
	}


	public static CustomerUser getCurrentUser() {
		Object obj = SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		return obj instanceof CustomerUser ? (CustomerUser) obj : null;
	}
}
