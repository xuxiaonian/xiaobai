package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.MobileUsers;

@RequestMapping("/mobileuserses")
@Controller
@RooWebScaffold(path = "mobileuserses", formBackingObject = MobileUsers.class)
public class MobileUsersController {
}
