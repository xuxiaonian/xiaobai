package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.ShopFreightTemplateDetail;

@RequestMapping("/shopfreighttemplatedetails")
@Controller
@RooWebScaffold(path = "shopfreighttemplatedetails", formBackingObject = ShopFreightTemplateDetail.class)
public class ShopFreightTemplateDetailController {
}
