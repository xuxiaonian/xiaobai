package com.huazhuo.shop.web;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.huazhuo.shop.bill.ShopBillDetail;

@RequestMapping("/shopbilldetails")
@Controller
@RooWebScaffold(path = "shopbilldetails", formBackingObject = ShopBillDetail.class)
public class ShopBillDetailController {
}
