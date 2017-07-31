package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.google.gson.Gson;
import com.huazhuo.shop.city.Areas;
import com.huazhuo.shop.city.Cities;

@RequestMapping("/citieses")
@Controller
@RooWebScaffold(path = "citieses", formBackingObject = Cities.class)
public class CitiesController {

    @RequestMapping(produces = "text/html", params = "method=city", method = RequestMethod.GET)
    public ResponseEntity<java.lang.String> updateOrderStatus(Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        String outStr1 = "";
        Gson g = new Gson();
        List<Cities> cities = Cities.findAllCitieses();
        for (Cities p : cities) {
            List<Areas> areas = Areas.findAllAreasesBycityId(p.getId().toString());
            Map<Integer, Object> context = new HashMap<Integer, Object>();
            for (Areas c : areas) {
                context.put(c.getId(), c.getAreaName());
                outStr = g.toJson(context);
            }
            outStr1 = outStr1 + p.getId() + ":" + outStr + ",";
        }
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr1);
        out.flush();
        out.close();
        return null;
    }
}
