package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.ShoppingProductType;

@RequestMapping("/shoppingproducttypes")
@Controller
@RooWebScaffold(path = "shoppingproducttypes", formBackingObject = ShoppingProductType.class)
public class ShoppingProductTypeController {
}
