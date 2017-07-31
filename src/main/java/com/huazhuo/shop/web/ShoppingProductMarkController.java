package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.ShoppingProductMark;

@RequestMapping("/shoppingproductmarks")
@Controller
@RooWebScaffold(path = "shoppingproductmarks", formBackingObject = ShoppingProductMark.class)
public class ShoppingProductMarkController {
}
