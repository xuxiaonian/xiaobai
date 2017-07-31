package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.quartz.ScheduleJob;

@RequestMapping("/schedulejobs")
@Controller
@RooWebScaffold(path = "schedulejobs", formBackingObject = ScheduleJob.class)
public class ScheduleJobController {
}
