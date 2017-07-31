package com.huazhuo.shop.security;

import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;

public class CustomerUser extends User {
	private static final long serialVersionUID = 13452134L;

	public CustomerUser(String username, String password, boolean enabled, boolean accountNonExpired, boolean credentialsNonExpired,
			boolean accountNonLocked, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, enabled, accountNonExpired, credentialsNonExpired, accountNonLocked, authorities);
	}

	public boolean isPossessAuthority(String authName) {
		for (GrantedAuthority ga : getAuthorities()) {
			if (ga.getAuthority().equals(authName)) {
				return true;
			}
		}
		return false;
	}
}
