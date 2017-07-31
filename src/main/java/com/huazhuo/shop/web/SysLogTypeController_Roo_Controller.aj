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

import com.huazhuo.shop.enumtype.SysLogType;

privileged aspect SysLogTypeController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String SysLogTypeController.create(@Valid SysLogType sysLogType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sysLogType);
            return "syslogtypes/create";
        }
        uiModel.asMap().clear();
        sysLogType.persist();
        return "redirect:/syslogtypes/" + encodeUrlPathSegment(sysLogType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String SysLogTypeController.createForm(Model uiModel) {
        populateEditForm(uiModel, new SysLogType());
        return "syslogtypes/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String SysLogTypeController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("syslogtype", SysLogType.findSysLogType(id));
        uiModel.addAttribute("itemId", id);
        return "syslogtypes/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String SysLogTypeController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("syslogtypes", SysLogType.findSysLogTypeEntries(firstResult, sizeNo));
            float nrOfPages = (float) SysLogType.countSysLogTypes() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("syslogtypes", SysLogType.findAllSysLogTypes());
        }
        return "syslogtypes/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String SysLogTypeController.update(@Valid SysLogType sysLogType, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, sysLogType);
            return "syslogtypes/update";
        }
        uiModel.asMap().clear();
        sysLogType.merge();
        return "redirect:/syslogtypes/" + encodeUrlPathSegment(sysLogType.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String SysLogTypeController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, SysLogType.findSysLogType(id));
        return "syslogtypes/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String SysLogTypeController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        SysLogType sysLogType = SysLogType.findSysLogType(id);
        sysLogType.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/syslogtypes";
    }
    
    void SysLogTypeController.populateEditForm(Model uiModel, SysLogType sysLogType) {
        uiModel.addAttribute("sysLogType", sysLogType);
    }
    
    String SysLogTypeController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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