package com.huazhuo.shop.web.security;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.security.BackGroupMembers;

@RequestMapping("/backgroupmemberses")
@Controller
@RooWebScaffold(path = "backgroupmemberses", formBackingObject = BackGroupMembers.class)
public class BackGroupMembersController {
}
