package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.city.Provinces;

@RequestMapping("/provinceses")
@Controller
@RooWebScaffold(path = "provinceses", formBackingObject = Provinces.class)
public class ProvincesController {
}
