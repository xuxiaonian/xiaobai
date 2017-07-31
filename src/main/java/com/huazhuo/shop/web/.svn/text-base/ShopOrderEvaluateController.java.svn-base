package com.huazhuo.shop.web;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.domain.ShopOrderEvaluate;
import com.huazhuo.shop.domain.ShopOrderEvaluateReply;
import com.huazhuo.shop.query.ShopOrderEvaluateQuery;

@RequestMapping("/shoporderevaluates")
@Controller
@RooWebScaffold(path = "shoporderevaluates", formBackingObject = ShopOrderEvaluate.class)
@SessionAttributes({ "shoporderevaluates", "shop", "CurrentUser", "sessionShopId" })
public class ShopOrderEvaluateController {

    @ModelAttribute("subtree")
    public void createSubtreet(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().setAttribute("subtree", "shoporderevaluates");
    }

    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "id", required = false) Integer id, Model uiModel) {
        uiModel.addAttribute("id", id);
        return "shoporderevaluates/create";
    }
    //删除
    @RequestMapping(params = "fm", produces = "text/html")
    public String deleteForm(@RequestParam(value = "id", required = false) Integer id, Model uiModel) {
    	ShopOrderEvaluate evaluate = ShopOrderEvaluate.findShopOrderEvaluate(id);
    	for(ShopOrderEvaluateReply reply :evaluate.getShopOrderEvaluateReplies()){
    		reply.getShopOrderEvaluate().clear();
    		reply.remove();
    	}
    	return  "redirect:/shoporderevaluates?page=1";
    }
    @RequestMapping(produces = "text/html")
    public String list(@Valid ShopOrderEvaluateQuery shopOrderEvaluateQuery, @ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel,HttpServletRequest httpServletRequest) {
        shopOrderEvaluateQuery.setShopId(shop);
        String delete = httpServletRequest.getParameter("delete");
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoporderevaluates", ShopOrderEvaluate.search(shopOrderEvaluateQuery, firstResult, sizeNo));
            float nrOfPages = (float) ShopOrderEvaluate.searchCount(shopOrderEvaluateQuery) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoporderevaluates", ShopOrderEvaluate.search(shopOrderEvaluateQuery));
        }
        uiModel.addAttribute("page", page);
        uiModel.addAttribute("shopOrderEvaluateQuery", shopOrderEvaluateQuery);
        uiModel.addAttribute("list", shopOrderEvaluateQuery.toQueryString());
        addDateTimeFormatPatterns(uiModel);
        String returnUrl = "";
        if(delete!=null){
        	returnUrl = "redirect:/shoporderevaluates?fm&id="+delete;
        }else{
        	returnUrl = "shoporderevaluates/list";
        }
		return returnUrl;
    }
}
