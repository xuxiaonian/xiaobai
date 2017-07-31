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

import com.huazhuo.shop.quartz.ScheduleJob;

privileged aspect ScheduleJobController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String ScheduleJobController.create(@Valid ScheduleJob scheduleJob, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scheduleJob);
            return "schedulejobs/create";
        }
        uiModel.asMap().clear();
        scheduleJob.persist();
        return "redirect:/schedulejobs/" + encodeUrlPathSegment(scheduleJob.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String ScheduleJobController.createForm(Model uiModel) {
        populateEditForm(uiModel, new ScheduleJob());
        return "schedulejobs/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String ScheduleJobController.show(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("schedulejob", ScheduleJob.findScheduleJob(id));
        uiModel.addAttribute("itemId", id);
        return "schedulejobs/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String ScheduleJobController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("schedulejobs", ScheduleJob.findScheduleJobEntries(firstResult, sizeNo));
            float nrOfPages = (float) ScheduleJob.countScheduleJobs() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("schedulejobs", ScheduleJob.findAllScheduleJobs());
        }
        return "schedulejobs/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String ScheduleJobController.update(@Valid ScheduleJob scheduleJob, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, scheduleJob);
            return "schedulejobs/update";
        }
        uiModel.asMap().clear();
        scheduleJob.merge();
        return "redirect:/schedulejobs/" + encodeUrlPathSegment(scheduleJob.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String ScheduleJobController.updateForm(@PathVariable("id") Integer id, Model uiModel) {
        populateEditForm(uiModel, ScheduleJob.findScheduleJob(id));
        return "schedulejobs/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String ScheduleJobController.delete(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        ScheduleJob scheduleJob = ScheduleJob.findScheduleJob(id);
        scheduleJob.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/schedulejobs";
    }
    
    void ScheduleJobController.populateEditForm(Model uiModel, ScheduleJob scheduleJob) {
        uiModel.addAttribute("scheduleJob", scheduleJob);
    }
    
    String ScheduleJobController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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