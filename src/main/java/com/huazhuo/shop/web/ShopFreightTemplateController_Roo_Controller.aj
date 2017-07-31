// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;

import org.joda.time.format.DateTimeFormat;
import org.springframework.context.i18n.LocaleContextHolder;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.huazhuo.shop.domain.ShopFreightTemplate;

privileged aspect ShopFreightTemplateController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShopFreightTemplateController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shopfreighttemplate", ShopFreightTemplate.findShopFreightTemplate(id));
        uiModel.addAttribute("itemId", id);
        return "shopfreighttemplates/show";
    }
    
    void ShopFreightTemplateController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("shopFreightTemplate_createdat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("shopFreightTemplate_updatedat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    String ShopFreightTemplateController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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