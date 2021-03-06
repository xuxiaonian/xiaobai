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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.huazhuo.shop.city.Areas;
import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;
import com.huazhuo.shop.domain.ShopAddress;

privileged aspect ShopAddressController_Roo_Controller {
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShopAddressController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shopaddress", ShopAddress.findShopAddress(id));
        uiModel.addAttribute("itemId", id);
        return "shopaddresses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShopAddressController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shopaddresses", ShopAddress.findShopAddressEntries(firstResult, sizeNo));
            float nrOfPages = (float) ShopAddress.countShopAddresses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shopaddresses", ShopAddress.findAllShopAddresses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "shopaddresses/list";
    }
    
    void ShopAddressController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("shopAddress_createdat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("shopAddress_updatedat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ShopAddressController.populateEditForm(Model uiModel, ShopAddress shopAddress) {
        uiModel.addAttribute("shopAddress", shopAddress);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("areases", Areas.findAllAreases());
        uiModel.addAttribute("citieses", Cities.findAllCitieses());
        uiModel.addAttribute("provinceses", Provinces.findAllProvinceses());
    }
    
    String ShopAddressController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
