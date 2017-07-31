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

import com.huazhuo.shop.domain.ShopOrderEvaluate;
import com.huazhuo.shop.domain.ShopOrderEvaluateReply;

privileged aspect ShopOrderEvaluateReplyController_Roo_Controller {
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShopOrderEvaluateReplyController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShopOrderEvaluateReply());
        return "shoporderevaluatereplys/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShopOrderEvaluateReplyController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shoporderevaluatereply", ShopOrderEvaluateReply.findShopOrderEvaluateReply(id));
        uiModel.addAttribute("itemId", id);
        return "shoporderevaluatereplys/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShopOrderEvaluateReplyController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoporderevaluatereplys", ShopOrderEvaluateReply.findShopOrderEvaluateReplyEntries(firstResult, sizeNo));
            float nrOfPages = (float) ShopOrderEvaluateReply.countShopOrderEvaluateReplys() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoporderevaluatereplys", ShopOrderEvaluateReply.findAllShopOrderEvaluateReplys());
        }
        addDateTimeFormatPatterns(uiModel);
        return "shoporderevaluatereplys/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShopOrderEvaluateReplyController.update(@Valid ShopOrderEvaluateReply shopOrderEvaluateReply, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shopOrderEvaluateReply);
            return "shoporderevaluatereplys/update";
        }
        uiModel.asMap().clear();
        shopOrderEvaluateReply.merge();
        return "redirect:/shoporderevaluatereplys/" + encodeUrlPathSegment(shopOrderEvaluateReply.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShopOrderEvaluateReplyController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, ShopOrderEvaluateReply.findShopOrderEvaluateReply(id));
        return "shoporderevaluatereplys/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShopOrderEvaluateReplyController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShopOrderEvaluateReply shopOrderEvaluateReply = ShopOrderEvaluateReply.findShopOrderEvaluateReply(id);
        shopOrderEvaluateReply.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoporderevaluatereplys";
    }
    
    void ShopOrderEvaluateReplyController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("shopOrderEvaluateReply_createdat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("shopOrderEvaluateReply_updatedat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ShopOrderEvaluateReplyController.populateEditForm(Model uiModel, ShopOrderEvaluateReply shopOrderEvaluateReply) {
        uiModel.addAttribute("shopOrderEvaluateReply", shopOrderEvaluateReply);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shoporderevaluates", ShopOrderEvaluate.findAllShopOrderEvaluates());
    }
    
    String ShopOrderEvaluateReplyController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
