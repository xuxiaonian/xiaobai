package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.domain.ShopAddress;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.SysLogUtil;

@RequestMapping("/shopaddresses")
@Controller
@RooWebScaffold(path = "shopaddresses", formBackingObject = ShopAddress.class)
@SessionAttributes({ "shopAddress", "shop", "CurrentUser", "sessionShopId" })
public class ShopAddressController {

    @ModelAttribute("subtree")
    public void createSubtreet(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().setAttribute("subtree", "shopAddress");
    }

    @Transactional
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String update(@Valid ShopAddress shopAddress, @RequestParam(value = "shopAddressId", required = false) Integer shopAddressId, @ModelAttribute("sessionShopId") Integer shop, @ModelAttribute("CurrentUser") BackUser user, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopAddress);
            return "shopaddresses/update";
        }
        ShopAddress address = ShopAddress.findShopAddress(shopAddressId);
        shopAddress.setId(shopAddressId);
        shopAddress.setShopId(address.getShopId());
        shopAddress.setReturnProduct(address.getReturnProduct());
        shopAddress.setSendProduct(address.getSendProduct());
        shopAddress.setCreatedAt(address.getCreatedAt());
        Date date = new Date();
        shopAddress.setUpdatedAt(date);
        uiModel.asMap().clear();
        shopAddress.merge();
        SysLog sysLog = SysLog.getSysLog(SysLogUtil.UPDATE_SHOP_ADDRESS, user.getUserName());
        sysLog.persist();
        return "redirect:/shopaddresses?form";
    }

    @Transactional
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid ShopAddress shopAddress, @ModelAttribute("sessionShopId") Integer shop,@RequestParam(value = "productId", required = false) Integer productId, @ModelAttribute("CurrentUser") BackUser user, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
    	
    	if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopAddress);
            return "shopaddresses/create";
        }
        uiModel.asMap().clear();
        Date date = new Date();
        Long saCount = ShopAddress.countShopAddressesByShopId(shop);
        if (saCount > 0) {
            shopAddress.setSendProduct(false);
            shopAddress.setReturnProduct(false);
        } else {
            shopAddress.setSendProduct(true);
            shopAddress.setReturnProduct(true);
        }
        shopAddress.setShopId(shop);
        shopAddress.setCreatedAt(date);
        shopAddress.setUpdatedAt(date);
        shopAddress.persist();
        SysLog sysLog = SysLog.getSysLog(SysLogUtil.ADD_SHOP_ADDRESS, user.getUserName());
        sysLog.persist();
        if (productId == null) {
        	  return "redirect:/shopaddresses?form";
			
		} else {
			return "redirect:/shoppingproductses/"+productId+"?form";
		}
      
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@ModelAttribute("sessionShopId") Integer shop,@RequestParam(value = "productId", required = false) Integer productId, Model uiModel) {
        uiModel.addAttribute("shopaddresses", ShopAddress.findAllShopAddressesByShopId(shop));
        uiModel.addAttribute("productId", productId);
        return "shopaddresses/create";
    }

    @RequestMapping(value = "/{shopAddressId}", params = "form", produces = "text/html")
    public String updateForm(@PathVariable("shopAddressId") Integer shopAddressId, @ModelAttribute("sessionShopId") Integer shop, Model uiModel) {
        uiModel.addAttribute("shopAddress", ShopAddress.findShopAddress(shopAddressId));
        uiModel.addAttribute("shopaddresses", ShopAddress.findAllShopAddressesByShopId(shop));
        return "shopaddresses/update";
    }

    @Transactional
    @RequestMapping(produces = "text/html", params = "method=updateSendProduct", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> updateSendProduct(@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "shopAddressId", required = false) Integer shopAddressId, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopAddress shopAddress = ShopAddress.findShopAddress(shopAddressId);
        if (shopAddress.getShopId() == shop) {
            List<ShopAddress> sas = ShopAddress.findAllShopAddressesByShopIdAndSendProduct(shop, true);
            for (ShopAddress sa : sas) {
                sa.setSendProduct(false);
                sa.merge();
            }
            shopAddress.setSendProduct(true);
            shopAddress.merge();
        } else {
            outStr = "false";
        }
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(produces = "text/html", params = "method=updateReturnProduct", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> updateReturnProduct(@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "shopAddressId", required = false) Integer shopAddressId, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopAddress shopAddress = ShopAddress.findShopAddress(shopAddressId);
        if (shopAddress.getShopId() == shop) {
            List<ShopAddress> sas = ShopAddress.findAllShopAddressesByShopIdAndReturnProduct(shop, true);
            for (ShopAddress sa : sas) {
                sa.setReturnProduct(false);
                sa.merge();
            }
            shopAddress.setReturnProduct(true);
            shopAddress.merge();
        } else {
            outStr = "false";
        }
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    @Transactional
    @RequestMapping(value = "/{shopAddressId}", method = RequestMethod.DELETE, produces = "text/html")
    public String delete(@PathVariable("shopAddressId") Integer shopAddressId, @ModelAttribute("sessionShopId") Integer shop, @ModelAttribute("CurrentUser") BackUser user, Model uiModel) {
        ShopAddress shopAddress = ShopAddress.findShopAddress(shopAddressId);
        if (shopAddress.getShopId() == shop) {
            if (!shopAddress.getReturnProduct() && !shopAddress.getSendProduct()) {
                shopAddress.remove();
                SysLog sysLog = SysLog.getSysLog(SysLogUtil.DEL_SHOP_ADDRESS, user.getUserName());
                sysLog.persist();
            }
        }
        return "redirect:/shopaddresses?form";
    }
}
