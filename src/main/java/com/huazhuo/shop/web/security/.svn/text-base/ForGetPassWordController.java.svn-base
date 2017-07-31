package com.huazhuo.shop.web.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.huazhuo.shop.domain.MobileUsers;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.MD5;
import com.huazhuo.shop.util.MD5Util;

@RequestMapping("/forgetPassWord")
@Controller
public class ForGetPassWordController {

	@RequestMapping(produces = "text/html")
	public String forgetPassWordForm(Model uiModel) {
		return "forgetPassWord";
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String update(@RequestParam(value = "userName", required = false) String userName,
			@RequestParam(value = "password", required = false) String password,
			Model uiModel, HttpServletRequest httpServletRequest) {
		List<BackUser> backUsers = BackUser.findAllUsersByUserName(userName);
		if(backUsers.size()>0){
			BackUser b = backUsers.get(0);
			b.setPassword(MD5.sha256(password));
			b.merge();
			List<MobileUsers> mobileUsers = MobileUsers.findAllMobileUsersName(userName);
			if(mobileUsers.size()>0){
				String pwsd=mobileUsers.get(0).getPassword();
				if(pwsd.length()>0){
				MobileUsers c = mobileUsers.get(0);
				c.setPassword(MD5Util.string2MD5(password));

				c.merge();
				}
				return "redirect:/forgetPassWord?forgetSucc";
				}else{
					return "redirect:/forgetPassWord?forgetSucc";
				}
		
		}else{
			return "redirect:/forgetPassWord?forgetError";
		}
		
	}
	
	@RequestMapping(produces = "text/html",params="forgetSucc")
	public String succ(Model uiModel) {
		return "forgetSucc";
	}
	
	@RequestMapping(produces = "text/html",params="forgetError")
	public String error(Model uiModel) {
		return "forgetError";
	}
}
