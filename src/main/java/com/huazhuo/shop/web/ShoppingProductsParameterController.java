package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.ShoppingProductsParameter;

@RequestMapping("/shoppingproductsparameters")
@Controller
@RooWebScaffold(path = "shoppingproductsparameters", formBackingObject = ShoppingProductsParameter.class)
public class ShoppingProductsParameterController {
}
