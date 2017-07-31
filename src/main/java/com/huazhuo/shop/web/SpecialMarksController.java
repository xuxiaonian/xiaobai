package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.SpecialMarks;

@RequestMapping("/specialmarkses")
@Controller
@RooWebScaffold(path = "specialmarkses", formBackingObject = SpecialMarks.class)
public class SpecialMarksController {
}
