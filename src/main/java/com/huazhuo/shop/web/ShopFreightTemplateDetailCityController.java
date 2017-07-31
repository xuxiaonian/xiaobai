package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.ShopFreightTemplateDetailCity;

@RequestMapping("/shopfreighttemplatedetailcitys")
@Controller
@RooWebScaffold(path = "shopfreighttemplatedetailcitys", formBackingObject = ShopFreightTemplateDetailCity.class)
public class ShopFreightTemplateDetailCityController {
}
