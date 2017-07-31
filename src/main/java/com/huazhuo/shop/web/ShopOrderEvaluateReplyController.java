package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.huazhuo.shop.domain.ShopOrderEvaluateReply;

@RequestMapping("/shoporderevaluatereplys")
@Controller
@RooWebScaffold(path = "shoporderevaluatereplys", formBackingObject = ShopOrderEvaluateReply.class)
public class ShopOrderEvaluateReplyController {

    @RequestMapping(produces = "text/html", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> create(@Valid ShopOrderEvaluateReply shopOrderEvaluateReply, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        Date date = new Date();
        shopOrderEvaluateReply.setCreatedAt(date);
        shopOrderEvaluateReply.setUpdatedAt(date);
        shopOrderEvaluateReply.persist();
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
