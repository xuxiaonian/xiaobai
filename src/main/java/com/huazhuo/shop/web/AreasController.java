package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.city.Areas;

@RequestMapping("/areases")
@Controller
@RooWebScaffold(path = "areases", formBackingObject = Areas.class)
public class AreasController {
}
