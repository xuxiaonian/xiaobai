package com.huazhuo.shop.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.domain.Shops;

@RequestMapping("/shopses")
@Controller
@RooWebScaffold(path = "shopses", formBackingObject = Shops.class)
@SessionAttributes({ "shoptree", "shop", "sessionShopId" })
public class ShopsController {

    @ModelAttribute("subtree")
    public void createSubtreet(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().setAttribute("subtree", "shoptree");
    }

    @RequestMapping(produces = "text/html")
    public String list(@ModelAttribute("sessionShopId") Integer shop, Model uiModel) {
        uiModel.addAttribute("shop", Shops.findShops(shop));
        return "shopses/show";
    }

    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid Shops shops, @ModelAttribute("shop") Shops shop, Model uiModel, HttpServletRequest httpServletRequest) {
        shop.setPersion(shops.getPersion());
        shop.setPhone(shops.getPhone());
        shop.setServicePhone(shops.getServicePhone());

        uiModel.asMap().clear();
        shop.merge();
  
        return "redirect:/shopses";
    }
}
