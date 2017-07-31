package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.domain.ShoppingCategorySpecialMarks;

@RequestMapping("/shoppingcategoryspecialmarkses")
@Controller
@RooWebScaffold(path = "shoppingcategoryspecialmarkses", formBackingObject = ShoppingCategorySpecialMarks.class)
public class ShoppingCategorySpecialMarksController {
}
