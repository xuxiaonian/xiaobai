// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.huazhuo.shop.web;

import java.io.UnsupportedEncodingException;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

import com.huazhuo.shop.domain.ShoppingProducts;
import com.huazhuo.shop.domain.ShoppingProductsSpec;

privileged aspect ShoppingProductsSpecController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ShoppingProductsSpecController.create(@Valid ShoppingProductsSpec shoppingProductsSpec, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shoppingProductsSpec);
            return "shoppingproductsspecs/create";
        }
        uiModel.asMap().clear();
        shoppingProductsSpec.persist();
        return "redirect:/shoppingproductsspecs/" + encodeUrlPathSegment(shoppingProductsSpec.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ShoppingProductsSpecController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ShoppingProductsSpec());
        return "shoppingproductsspecs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ShoppingProductsSpecController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("shoppingproductsspec", ShoppingProductsSpec.findShoppingProductsSpec(id));
        uiModel.addAttribute("itemId", id);
        return "shoppingproductsspecs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ShoppingProductsSpecController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoppingproductsspecs", ShoppingProductsSpec.findShoppingProductsSpecEntries(firstResult, sizeNo));
            float nrOfPages = (float) ShoppingProductsSpec.countShoppingProductsSpecs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoppingproductsspecs", ShoppingProductsSpec.findAllShoppingProductsSpecs());
        }
        return "shoppingproductsspecs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ShoppingProductsSpecController.update(@Valid ShoppingProductsSpec shoppingProductsSpec, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, shoppingProductsSpec);
            return "shoppingproductsspecs/update";
        }
        uiModel.asMap().clear();
        shoppingProductsSpec.merge();
        return "redirect:/shoppingproductsspecs/" + encodeUrlPathSegment(shoppingProductsSpec.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ShoppingProductsSpecController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, ShoppingProductsSpec.findShoppingProductsSpec(id));
        return "shoppingproductsspecs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ShoppingProductsSpecController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ShoppingProductsSpec shoppingProductsSpec = ShoppingProductsSpec.findShoppingProductsSpec(id);
        shoppingProductsSpec.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/shoppingproductsspecs";
    }
    
    void ShoppingProductsSpecController.populateEditForm(Model uiModel, ShoppingProductsSpec shoppingProductsSpec) {
        uiModel.addAttribute("shoppingProductsSpec", shoppingProductsSpec);
        uiModel.addAttribute("shoppingproductses", ShoppingProducts.findAllShoppingProductses());
    }
    
    String ShoppingProductsSpecController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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