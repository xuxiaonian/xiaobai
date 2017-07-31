package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.enumtype.LogisticsCompany;

@RequestMapping("/logisticscompanys")
@Controller
@RooWebScaffold(path = "logisticscompanys", formBackingObject = LogisticsCompany.class)
public class LogisticsCompanyController {
}
