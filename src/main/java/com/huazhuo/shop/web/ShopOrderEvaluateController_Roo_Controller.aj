// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.huazhuo.shop.domain.MobileUsers;
import com.huazhuo.shop.domain.ShopOrderEvaluate;
import com.huazhuo.shop.domain.ShopOrderEvaluateReply;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.domain.ShoppingProducts;

privileged aspect ShopOrderEvaluateController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShopOrderEvaluateController.create(@Valid ShopOrderEvaluate shopOrderEvaluate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrderEvaluate);
            return "shoporderevaluates/create";
        }
        uiModel.asMap().clear();
        shopOrderEvaluate.persist();
        return "redirect:/shoporderevaluates/" + encodeUrlPathSegment(shopOrderEvaluate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShopOrderEvaluateController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shoporderevaluate", ShopOrderEvaluate.findShopOrderEvaluate(id));
        uiModel.addAttribute("itemId", id);
        return "shoporderevaluates/show";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShopOrderEvaluateController.update(@Valid ShopOrderEvaluate shopOrderEvaluate, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrderEvaluate);
            return "shoporderevaluates/update";
        }
        uiModel.asMap().clear();
        shopOrderEvaluate.merge();
        return "redirect:/shoporderevaluates/" + encodeUrlPathSegment(shopOrderEvaluate.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShopOrderEvaluateController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, ShopOrderEvaluate.findShopOrderEvaluate(id));
        return "shoporderevaluates/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShopOrderEvaluateController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShopOrderEvaluate shopOrderEvaluate = ShopOrderEvaluate.findShopOrderEvaluate(id);
        shopOrderEvaluate.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoporderevaluates";
    }
    
    void ShopOrderEvaluateController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("shopOrderEvaluate_createdat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("shopOrderEvaluate_updatedat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ShopOrderEvaluateController.populateEditForm(Model uiModel, ShopOrderEvaluate shopOrderEvaluate) {
        uiModel.addAttribute("shopOrderEvaluate", shopOrderEvaluate);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("mobileuserses", MobileUsers.findAllMobileUserses());
        uiModel.addAttribute("shoporderevaluatereplys", ShopOrderEvaluateReply.findAllShopOrderEvaluateReplys());
        uiModel.addAttribute("shoporderses", ShopOrders.findAllShopOrderses());
        uiModel.addAttribute("shoppingproductses", ShoppingProducts.findAllShoppingProductses());
    }
    
    String ShopOrderEvaluateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
