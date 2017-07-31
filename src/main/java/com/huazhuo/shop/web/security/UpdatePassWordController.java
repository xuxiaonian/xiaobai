package com.huazhuo.shop.web.security;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.domain.MobileUsers;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.MD5;
import com.huazhuo.shop.util.MD5Util;


@RequestMapping("/updatePassWord")
@Controller
@SessionAttributes({"CurrentUser"})
public class UpdatePassWordController {

	@RequestMapping(produces = "text/html")
	public String updatePassWordForm(Model uiModel) {
		return "updatePassWord";
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String update(@ModelAttribute("CurrentUser") BackUser user,@RequestParam(value = "oldPassWord", required = false) String oldPassWord,
			@RequestParam(value = "password", required = false) String password,
			Model uiModel, HttpServletRequest httpServletRequest) {
		List<BackUser> backUsers = BackUser.findAllUsersByUserNameAndPassWord(user.getUserName(), MD5.sha256(oldPassWord));
		if(backUsers.size()>0){
			BackUser b = backUsers.get(0);
			b.setPassword(MD5.sha256(password));
			b.merge();
			List<MobileUsers> mobileUsers = MobileUsers.findAllMobileUsersName(user.getUserName());
			
			if(mobileUsers.size()>0){
				String pwsd=mobileUsers.get(0).getPassword();
				if(pwsd.length()>0){
				MobileUsers c = mobileUsers.get(0);
				c.setPassword(MD5Util.string2MD5(password));
				c.merge();
				}
			}else{}
			return "redirect:/forgetPassWord?forgetSucc";
		}else{
			return "redirect:/forgetPassWord?forgetError";
		}
	}
}
