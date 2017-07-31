package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.huazhuo.shop.domain.ShoppingCategories;

@RequestMapping("/shoppingcategorieses")
@Controller
@RooWebScaffold(path = "shoppingcategorieses", formBackingObject = ShoppingCategories.class)
public class ShoppingCategoriesController {

    @RequestMapping(produces = "text/html", params = "method=selectCategories", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> selectCategories(@RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "false";
        List<ShoppingCategories> shoppingCategories = ShoppingCategories.findAllShoppingCategoriesesByParentId(id);
        Gson gson = new Gson();
        outStr = gson.toJson(shoppingCategories);
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(produces = "text/html", params = "method=selectParentCategories", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> selectParentCategories(@RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "";
        ShoppingCategories shoppingCategories = ShoppingCategories.findShoppingCategories(id);
        outStr = shoppingCategories.getName();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }
}
