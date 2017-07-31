package com.huazhuo.shop.security;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import org.springframework.jdbc.core.RowMapper;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.AuthorityUtils;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.jdbc.JdbcDaoImpl;

import com.huazhuo.shop.domain.MobileUsersAuth;



public class UserDetailsServiceImpl extends JdbcDaoImpl {

	@Override
	protected List<UserDetails> loadUsersByUsername(String username) {

		return getJdbcTemplate().query(getUsersByUsernameQuery(), new String[] { username }, new RowMapper<UserDetails>() {
			public UserDetails mapRow(ResultSet rs, int rowNum) throws SQLException {
				String username = rs.getString(1);
				String password = rs.getString(2);
				boolean enabled = rs.getBoolean(3);
				return new CustomerUser(username, password, enabled,  true, true, true, AuthorityUtils.NO_AUTHORITIES);
				
				
			}
		});
	}                                            

	@Override
	protected UserDetails createUserDetails(String username, UserDetails userFromUserQuery, List<GrantedAuthority> combinedAuthorities) {
		CustomerUser user = (CustomerUser) userFromUserQuery;

		String returnUsername = userFromUserQuery.getUsername();

		if (isUsernameBasedPrimaryKey()) {
			returnUsername = username;
		}

		return new CustomerUser(returnUsername, userFromUserQuery.getPassword(), userFromUserQuery.isEnabled(),
				true, true, true, combinedAuthorities);
	}
}
