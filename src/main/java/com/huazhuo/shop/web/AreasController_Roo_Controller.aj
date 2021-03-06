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

import com.huazhuo.shop.city.Areas;

privileged aspect AreasController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AreasController.create(@Valid Areas areas, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, areas);
            return "areases/create";
        }
        uiModel.asMap().clear();
        areas.persist();
        return "redirect:/areases/" + encodeUrlPathSegment(areas.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AreasController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Areas());
        return "areases/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String AreasController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("areas", Areas.findAreas(id));
        uiModel.addAttribute("itemId", id);
        return "areases/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AreasController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("areases", Areas.findAreasEntries(firstResult, sizeNo));
            float nrOfPages = (float) Areas.countAreases() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("areases", Areas.findAllAreases());
        }
        return "areases/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AreasController.update(@Valid Areas areas, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, areas);
            return "areases/update";
        }
        uiModel.asMap().clear();
        areas.merge();
        return "redirect:/areases/" + encodeUrlPathSegment(areas.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String AreasController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, Areas.findAreas(id));
        return "areases/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String AreasController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Areas areas = Areas.findAreas(id);
        areas.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/areases";
    }
    
    void AreasController.populateEditForm(Model uiModel, Areas areas) {
        uiModel.addAttribute("areas", areas);
    }
    
    String AreasController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
