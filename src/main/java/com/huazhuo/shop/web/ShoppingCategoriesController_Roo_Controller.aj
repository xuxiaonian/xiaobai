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

import com.huazhuo.shop.domain.ShoppingCategories;

privileged aspect ShoppingCategoriesController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShoppingCategoriesController.create(@Valid ShoppingCategories shoppingCategories, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shoppingCategories);
            return "shoppingcategorieses/create";
        }
        uiModel.asMap().clear();
        shoppingCategories.persist();
        return "redirect:/shoppingcategorieses/" + encodeUrlPathSegment(shoppingCategories.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShoppingCategoriesController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShoppingCategories());
        return "shoppingcategorieses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShoppingCategoriesController.show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shoppingcategories", ShoppingCategories.findShoppingCategories(id));
        uiModel.addAttribute("itemId", id);
        return "shoppingcategorieses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShoppingCategoriesController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoppingcategorieses", ShoppingCategories.findShoppingCategoriesEntries(firstResult, sizeNo));
            float nrOfPages = (float) ShoppingCategories.countShoppingCategorieses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoppingcategorieses", ShoppingCategories.findAllShoppingCategorieses());
        }
        addDateTimeFormatPatterns(uiModel);
        return "shoppingcategorieses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShoppingCategoriesController.update(@Valid ShoppingCategories shoppingCategories, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shoppingCategories);
            return "shoppingcategorieses/update";
        }
        uiModel.asMap().clear();
        shoppingCategories.merge();
        return "redirect:/shoppingcategorieses/" + encodeUrlPathSegment(shoppingCategories.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShoppingCategoriesController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, ShoppingCategories.findShoppingCategories(id));
        return "shoppingcategorieses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShoppingCategoriesController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShoppingCategories shoppingCategories = ShoppingCategories.findShoppingCategories(id);
        shoppingCategories.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoppingcategorieses";
    }
    
    void ShoppingCategoriesController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("shoppingCategories_createdat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
        uiModel.addAttribute("shoppingCategories_updatedat_date_format", DateTimeFormat.patternForStyle("MM", LocaleContextHolder.getLocale()));
    }
    
    void ShoppingCategoriesController.populateEditForm(Model uiModel, ShoppingCategories shoppingCategories) {
        uiModel.addAttribute("shoppingCategories", shoppingCategories);
        addDateTimeFormatPatterns(uiModel);
    }
    
    String ShoppingCategoriesController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
