package com.huazhuo.shop.web.security;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.security.BackAuthority;

@RequestMapping("/backauthoritys")
@Controller
@RooWebScaffold(path = "backauthoritys", formBackingObject = BackAuthority.class)
public class BackAuthorityController {
}
