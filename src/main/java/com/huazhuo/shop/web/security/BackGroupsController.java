package com.huazhuo.shop.web.security;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.security.BackGroups;

@RequestMapping("/backgroupses")
@Controller
@RooWebScaffold(path = "backgroupses", formBackingObject = BackGroups.class)
public class BackGroupsController {
}
