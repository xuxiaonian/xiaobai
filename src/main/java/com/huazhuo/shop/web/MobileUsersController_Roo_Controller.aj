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

import com.huazhuo.shop.domain.MobileUsers;

privileged aspect MobileUsersController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String MobileUsersController.create(@Valid MobileUsers mobileUsers, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, mobileUsers);
            return "mobileuserses/create";
        }
        uiModel.asMap().clear();
        mobileUsers.persist();
        return "redirect:/mobileuserses/" + encodeUrlPathSegment(mobileUsers.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String MobileUsersController.createForm(Model uiModel) {
        populateEditForm(uiModel, new MobileUsers());
        return "mobileuserses/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String MobileUsersController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("mobileusers", MobileUsers.findMobileUsers(id));
        uiModel.addAttribute("itemId", id);
        return "mobileuserses/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String MobileUsersController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("mobileuserses", MobileUsers.findMobileUsersEntries(firstResult, sizeNo));
            float nrOfPages = (float) MobileUsers.countMobileUserses() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("mobileuserses", MobileUsers.findAllMobileUserses());
        }
        return "mobileuserses/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String MobileUsersController.update(@Valid MobileUsers mobileUsers, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, mobileUsers);
            return "mobileuserses/update";
        }
        uiModel.asMap().clear();
        mobileUsers.merge();
        return "redirect:/mobileuserses/" + encodeUrlPathSegment(mobileUsers.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String MobileUsersController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, MobileUsers.findMobileUsers(id));
        return "mobileuserses/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String MobileUsersController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        MobileUsers mobileUsers = MobileUsers.findMobileUsers(id);
        mobileUsers.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/mobileuserses";
    }
    
    void MobileUsersController.populateEditForm(Model uiModel, MobileUsers mobileUsers) {
        uiModel.addAttribute("mobileUsers", mobileUsers);
    }
    
    String MobileUsersController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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