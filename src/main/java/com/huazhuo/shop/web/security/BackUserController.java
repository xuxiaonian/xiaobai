package com.huazhuo.shop.web.security;

import javax.servlet.http.HttpServletRequest;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.MD5;

@RequestMapping("/backusers")
@Controller
@RooWebScaffold(path = "backusers", formBackingObject = BackUser.class)
@SessionAttributes({ "verification", "CurrentUser" })
public class BackUserController {

    @RequestMapping(params = "updatePassWord", produces = "text/html")
    public String updatePassWordForm(Model uiModel) {
        populateEditForm(uiModel, new BackUser());
        return "backusers/updatePassWord";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html", params = "method=updatePassWord")
    public String updatePassWord(@ModelAttribute("CurrentUser") BackUser user, @RequestParam(value = "oldPassWord", required = true) String oldPassWord, @RequestParam(value = "newPassWord", required = true) String newPassWord, Model uiModel, HttpServletRequest httpServletRequest) {
        if (user.getPassword().equalsIgnoreCase(MD5.sha256(oldPassWord))) {
            user.setPassword(MD5.sha256(newPassWord));
            user.merge();
        }
        return "redirect:/backusers/";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html", params = "method=forgetPassWord")
    public String forgetPassWord(@ModelAttribute("CurrentUser") BackUser user, @RequestParam(value = "oldPassWord", required = true) String oldPassWord, @RequestParam(value = "newPassWord", required = true) String newPassWord, Model uiModel, HttpServletRequest httpServletRequest) {
        if (user.getPassword().equalsIgnoreCase(MD5.sha256(oldPassWord))) {
            user.setPassword(MD5.sha256(newPassWord));
            user.merge();
        }
        return "redirect:/backusers/";
    }
}
