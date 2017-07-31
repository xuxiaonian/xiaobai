package com.huazhuo.shop.util;

import java.io.IOException;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.google.gson.Gson;
import com.huazhuo.shop.domain.Company;
import com.huazhuo.shop.domain.MobileUsersAuth;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.pojo.MobileUsersAuthPoJo;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.security.CustomerUser;
import com.huazhuo.shop.security.UserDetailsServiceImpl;

public class LoginSuccessHandler implements AuthenticationSuccessHandler {

	@Autowired
	private UserDetailsServiceImpl userDetailsServiceImpl;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response, Authentication auth) throws IOException, ServletException {
		HttpSession session = request.getSession();
		CustomerUser customerUser = UserUtils.getCurrentUser();
		BackUser user = BackUser.findUsersByUserNameEquals(customerUser.getUsername()).getSingleResult();
		List<Company> company=Company.findAllCompanysByUser(user);
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(user.getId());
		
		Integer dsStatus=sd.get(0).getSignatureStatus();
		Integer bSignatureNot =sd.get(0).getBSignatureNot();
		Integer dsId=Integer.valueOf(sd.get(0).getAuthStatus());
		if(dsId==0){
			//待审核页面
			response.sendRedirect(request.getContextPath() +"/register/"+sd.get(0).getId()+"?pendingAudit");
		}
		if(dsId==100){
			if(dsStatus ==2 | dsStatus ==0 ){
				//修改申请成功   注册成功的页面
				response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?updateSuccess");
			}
			if(dsStatus==4){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?financialRejectionUpdate");
					}
			if(dsStatus==8){
				response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?updateSurrender");
				}
			if(dsStatus==9){
				response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?updateOverdue");
			
				}
		}
		
		if(dsId==99){
				//合同拒绝
				if(dsStatus==2){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?contractFail");
					}
				if(dsStatus==4){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?financialRejection");
					}
		}
		if(dsId==3){
				//待审核失败页面
				response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?fail");
			    
		}
			
			
		if(dsId==2){
			//下架
			List<Shops> shops=Shops.findAllShopsesByCompany(company.get(0));
			Integer enled =shops.get(0).getEnabled();
			if(enled==0){
//				锁定
				if(dsStatus==3){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?surrender");
					}
//				运营申请解约
				if(dsStatus==5){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?surrender");
					}
//				财务解约
				if(dsStatus==6){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?surrender");
					}
//				合同过期
				if(dsStatus==7){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?overdue");
					}
				
				
		    }else{
				if(dsStatus==0){
					//合同页面
					if(bSignatureNot==0){
						response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?Success");
					}
					if(bSignatureNot==1){
						response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?NoSuccess");
					}
					
				}
				if(dsStatus==2){
					response.sendRedirect(request.getContextPath() +"/register/"+user.getId()+"?updatess");
				}
				if(dsStatus==1){
				response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?contractSuccess");
				}
				

				

				if(dsStatus==3){
		// List<Shops> shops =
		// Shops.findAllShopsesByCompanyId(companys.get(0).getId());
		// 默认取第一个放入session 以后可以会出现 企业对商品出现 oneToMany 问题 在此处进行修改
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING_V2+"/mobileUsersAuth/shop", "id=" + user.getId());
		Gson gson = new Gson();
		MobileUsersAuthPoJo pojo = gson.fromJson(str, MobileUsersAuthPoJo.class);
		Shops shop = new Shops();
		// 个人
		if (!StringUtils.isBlank(pojo.getRole()) && pojo.getRole().equals("1")) {
			shop = Shops.findShops(pojo.getShopId());
			if (shop != null) {
				session.setAttribute("CurrentUser", user);
				session.setAttribute("shop", shop);
				session.setAttribute("sessionShopId", shop.getId());
				// 权限放入session
				for (GrantedAuthority ga : customerUser.getAuthorities()) {
					String authName = ga.getAuthority();
					if (!authName.startsWith("/"))
						session.setAttribute(authName, authName);
				}
				SysLog sysLog = SysLog.getSysLog(SysLogUtil.LOGIN_LOG, user.getUserName());
				sysLog.persist();
				if(	user.getLastLoginTime()==null){
					user.setLastLoginTime(new Date());
					user.merge();
					response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?fistSuccess");
//					user.setLastLoginTime(new Date());
//					user.merge();
				}else{
					user.setLastLoginTime(new Date());
					user.merge();
					response.sendRedirect(request.getContextPath() + "/index");
				}
				} else {
				
				response.sendRedirect(request.getContextPath() + "/login");
			}
		} else {
			List<Company> companys = Company.findAllCompanysByUser(user);
			if (companys.size() > 0) {
//				List<Shops> shops = Shops.findAllShopsesByCompanyId(companys.get(0).getId());
				if (shops.get(0).getEnabled() != 1 || companys.get(0).getAudit() != 1) {
					response.sendRedirect(request.getContextPath() + "/login");
				}
				{
					
					session.setAttribute("CurrentUser", user);
//					http://localhost:8080/shop/register/2144?information14232323434
					session.setAttribute("shop", shops.get(0));
					session.setAttribute("sessionShopId", shops.get(0).getId());
					// 权限放入session
					for (GrantedAuthority ga : customerUser.getAuthorities()) {
						String authName = ga.getAuthority();
						if (!authName.startsWith("/"))
							session.setAttribute(authName, authName);
					}
					SysLog sysLog = SysLog.getSysLog(SysLogUtil.LOGIN_LOG, user.getUserName());
					sysLog.persist();
					if(	user.getLastLoginTime()==null){
						user.setLastLoginTime(new Date());
						user.merge();
						response.sendRedirect(request.getContextPath() +"/register/"+user.getUserName()+"?fistSuccess");
//						user.setLastLoginTime(new Date());
//						user.merge();
					}else{
						user.setLastLoginTime(new Date());
						user.merge();
						response.sendRedirect(request.getContextPath() + "/index");
					}
				}
			} else {
				response.sendRedirect(request.getContextPath() + "/login");
			}
		}}
}}
}}
