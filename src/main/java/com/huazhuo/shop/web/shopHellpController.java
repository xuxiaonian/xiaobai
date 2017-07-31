package com.huazhuo.shop.web;

import java.text.ParseException;


import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.bill.ShopBill;
import com.huazhuo.shop.domain.ShopOrderRetrun;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.domain.ShoppingProducts;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.pojo.IndexPoJo;
import com.huazhuo.shop.util.DateUtils;

@RequestMapping("/shopHellp")
@Controller
@SessionAttributes({ "shopHelp", "shop" })
public class shopHellpController {

	
	@ModelAttribute("subtree")
	public void createSubtreet(HttpServletRequest httpServletRequest) {
		httpServletRequest.getSession().setAttribute("subtree", "shopHelp");
	}
	
	@RequestMapping(produces = "text/html")
    public String indexForm() throws ParseException {

		
        return "shopHellp";
    } 
}
