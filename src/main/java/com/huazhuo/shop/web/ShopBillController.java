package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.quartz.SchedulerException;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.huazhuo.shop.bill.ShopBill;
import com.huazhuo.shop.bill.ShopBillDetail;
import com.huazhuo.shop.billenum.BillEnum;
import com.huazhuo.shop.domain.Message;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.pojo.ApiResult;
import com.huazhuo.shop.pojo.ShopOrderProof;
import com.huazhuo.shop.pojo.ShopsSettlement;
import com.huazhuo.shop.query.ShopBillQuery;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.MessageUtils;

@RequestMapping("/shopbills")
@Controller
@RooWebScaffold(path = "shopbills", formBackingObject = ShopBill.class)
@SessionAttributes({ "shopBill", "shop", "CurrentUser", "sessionShopId" })
public class ShopBillController {

    @RequestMapping(produces = "text/html")
    public String list(@Valid ShopBillQuery shopBillQuery, @ModelAttribute("sessionShopId") Integer shop,@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, HttpServletRequest httpServletRequest, Model uiModel) {
        httpServletRequest.getSession().setAttribute("subtree", "shopBill");
        shopBillQuery.setShopId(shop);
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shopbills", ShopBill.search(shopBillQuery, firstResult, sizeNo));
            float nrOfPages = (float) ShopBill.searchCount(shopBillQuery) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shopbills", ShopBill.search(shopBillQuery));
        }
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("billenums", Arrays.asList(BillEnum.values()));
        uiModel.addAttribute("shopBillQuery", shopBillQuery);
        uiModel.addAttribute("list", shopBillQuery.toQueryString());
        uiModel.addAttribute("page", page);
        return "shopbills/list";
    }

    @RequestMapping(produces = "text/html", params = "method=thisList")
    public String thislist(@Valid ShopBillQuery shopBillQuery,@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, HttpServletRequest httpServletRequest, Model uiModel) {
        httpServletRequest.getSession().setAttribute("subtree", "shopBillThis");
        Date startDate = shopBillQuery.getBillStart();
        Date endDate = DateUtils.getEndTime(shopBillQuery.getBillEnd());
        if (shopBillQuery.getBillStart() == null) startDate = DateUtils.getReportEndDay(new Date());
        if (shopBillQuery.getBillEnd() == null) endDate = new Date();
        if(shopBillQuery.getBillEnd()!=null){
        	SimpleDateFormat df=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            Date  d = endDate;     
             Calendar cal=Calendar.getInstance();
            cal.setTime(d);
            cal.add(Calendar.DATE, -1);  //减1天
             
            endDate=cal.getTime(); 
//            System.out.println(df.format(cal.getTime()));
        }
        
        ShopOrderType shopOrderType = ShopOrderType.findShopOrderType(4);
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            List<ShopOrders> shopOrders = ShopOrders.findShopOrder(startDate, endDate, shopOrderType, true,shop, firstResult, sizeNo);
            float nrOfPages = (float) ShopOrders.countShopOrder(startDate, endDate, shopOrderType, true,shop) / sizeNo;
          if(nrOfPages==0){
        	  uiModel.addAttribute("maxPages",0);
          }else{
        	  uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
               
          }
            ShopBill shopBill = ShopBill.getShopBill(startDate, endDate, shopOrders,shop);
            if(shopBill==null ){
            shopBill =new ShopBill();
            }
            uiModel.addAttribute("shopBill", shopBill);
            uiModel.addAttribute("shopBillQuery", shopBillQuery);
            uiModel.addAttribute("list", shopBillQuery.toQueryString());
            uiModel.addAttribute("page", page);
        }
        return "shopbills/thislist";
    }

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Integer id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            addDateTimeFormatPatterns(uiModel);
            ShopBill shopBill = ShopBill.findShopBill(id);
            List<ShopBillDetail> shopBillDetails = ShopBillDetail.findShopBillDetailByShopBillEntries(shopBill, firstResult, sizeNo);
            float nrOfPages = (float) ShopBillDetail.countShopBillDetailByShopBillEntries(shopBill) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
            shopBill.setShopBillDetails(shopBillDetails);
            uiModel.addAttribute("shopbill", shopBill);
            uiModel.addAttribute("page", page);
        }
        uiModel.addAttribute("itemId", id);
        return "shopbills/show";
    }
    
    @RequestMapping(value = "/showPro", produces = "text/html")
    public String showPro(@RequestParam(value = "id", required = false) Integer id,Model uiModel) {
        String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING + "/shopOrderProof", "billId=" + id);
		Gson gson = new Gson();
		ApiResult<List<ShopOrderProof>> api = gson.fromJson(str, ApiResult.class);
		 uiModel.addAttribute("api", api.getDate().get(0));
        uiModel.addAttribute("itemId", id);
        return "shopbills/showPro";	
    }
    @RequestMapping(value = "/sdd", produces = "text/html")
    public String update(@RequestParam(value = "ids", required = false) String ids,Model uiModel) {
    	String[] idss=ids.split(",");
    	for(int i=0,len=idss.length;i<len;i++){
    	Integer id=Integer.valueOf(idss[i]);	
    	ShopBill shopBill = ShopBill.findShopBill(id);
        if(shopBill.getBillEnum()==5){
        	shopBill.setBillEnum(6);
        	shopBill.setShopEnterDate(new Date());
        	shopBill.merge();
        }
    	}
    	String returnUrl = "";
    	returnUrl = "redirect:/shopbills?page=1";
        return returnUrl;	
    }
    
    @RequestMapping(produces = "text/html", params = "method=enter", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> enter(@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopBill shopBill = ShopBill.findShopBill(id);
        if(shopBill.getBillEnum()==5){
        	shopBill.setBillEnum(6);
        	shopBill.setShopEnterDate(new Date());
        	shopBill.merge();
        }
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(produces = "text/html", params = "method=noEnter", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> noEnter(@ModelAttribute("CurrentUser") BackUser user,@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopBill shopBill = ShopBill.findShopBill(id);
        if(shopBill.getBillEnum()==1){
        	shopBill.setBillEnum(0);
        	shopBill.setBillShowEnum(3);
        	shopBill.setAuditNotThroughReason("\u5546\u5BB6\u62D2\u7EDD");
        	shopBill.setAuditPerson(user.getUserName());
        	shopBill.setAuditTime(new Date());
        	shopBill.setAuditRole(2);
        	shopBill.merge();
        }
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
