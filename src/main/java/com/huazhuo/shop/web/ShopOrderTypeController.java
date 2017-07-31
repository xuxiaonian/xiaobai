package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.enumtype.ShopOrderType;

@RequestMapping("/shopordertypes")
@Controller
@RooWebScaffold(path = "shopordertypes", formBackingObject = ShopOrderType.class)
public class ShopOrderTypeController {
}
