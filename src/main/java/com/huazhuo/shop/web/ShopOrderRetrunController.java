package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.quartz.SchedulerException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.domain.Message;
import com.huazhuo.shop.domain.ShopOrderRetrun;
import com.huazhuo.shop.domain.ShopOrderReturnConsult;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.LogisticsCompany;
import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.quartz.QuartzService;
import com.huazhuo.shop.quartz.QuartzTaskFactoryInit;
import com.huazhuo.shop.quartz.ScheduleJob;
import com.huazhuo.shop.query.ShopOrderRetrunQuery;
import com.huazhuo.shop.util.CronExpression;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.MessageUtils;
import com.huazhuo.shop.util.StringUtils;

import net.sf.json.JSONObject;

@RequestMapping("/shoporderretruns")
@Controller
@RooWebScaffold(path = "shoporderretruns", formBackingObject = ShopOrderRetrun.class)
@SessionAttributes({ "subtreeOrder", "shop", "sessionShopId" })
public class ShopOrderRetrunController {
	private static Logger logger= LoggerFactory.getLogger(ShopOrderRetrunController.class);


    @Autowired
	private SchedulerFactoryBean schedulerFactoryBean;
    
    @ModelAttribute("subtreeOrder")
    public void createSubtreet(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().setAttribute("subtreeOrder", "shoporderretrun");
    }

    @RequestMapping(value = "/{id}", produces = "text/html", params = "orderToShow")
    public String orderToShow(@PathVariable("id") Integer id, Model uiModel) {
        ShopOrders shopOrders = ShopOrders.findShopOrders(id);
        ShopOrderRetrun shopOrderRetrun = new ShopOrderRetrun();
        List<ShopOrderRetrun> shopOrderRetruns = ShopOrderRetrun.findShopOrderRetrunsByshopOrderId(shopOrders);
        if (shopOrderRetruns.size() > 0) {
            shopOrderRetrun = shopOrderRetruns.get(0);
        }
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shoporderretrun", shopOrderRetrun);
        if (!StringUtils.isBlank(shopOrderRetrun.getLogisticsCode())) {
            List<LogisticsCompany> logisticsCompanys = LogisticsCompany.findAllLogisticsCompanysByLogisticsCode(shopOrderRetrun.getLogisticsCode());
            if (logisticsCompanys.size() > 0) {
                uiModel.addAttribute("logisticsCompany", logisticsCompanys.get(0));
            }
        }
        SysLogType sysLogType = SysLogType.findSysLogType(1);
        uiModel.addAttribute("sysLogs", SysLog.findAllSysLogsByprocessIdAndSysLogType(id, sysLogType));
        uiModel.addAttribute("itemId", id);
        return "shoporderretruns/show";
    }

    @RequestMapping(value = "/{id}", produces = "text/html")
    public String show(@PathVariable("id") Integer id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(id);
        uiModel.addAttribute("shoporderretrun", shopOrderRetrun);
        if (!StringUtils.isBlank(shopOrderRetrun.getLogisticsCode())) {
            List<LogisticsCompany> logisticsCompanys = LogisticsCompany.findAllLogisticsCompanysByLogisticsCode(shopOrderRetrun.getLogisticsCode());
            if (logisticsCompanys.size() > 0) {
                uiModel.addAttribute("logisticsCompany", logisticsCompanys.get(0));
            }
        }
        SysLogType sysLogType = SysLogType.findSysLogType(1);
        uiModel.addAttribute("sysLogs", SysLog.findAllSysLogsByprocessIdAndSysLogType(id, sysLogType));
        uiModel.addAttribute("itemId", id);
        return "shoporderretruns/show";
    }

    @RequestMapping(produces = "text/html")
    public String list(@Valid ShopOrderRetrunQuery shopOrderRetrunQuery, @ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        shopOrderRetrunQuery.setShopId(shop);
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("shoporderretruns", ShopOrderRetrun.search(shopOrderRetrunQuery, firstResult, sizeNo));
            float nrOfPages = (float) ShopOrderRetrun.searchCount(shopOrderRetrunQuery) / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("shoporderretruns", ShopOrderRetrun.search(shopOrderRetrunQuery));
        }
        populateList(uiModel);
        uiModel.addAttribute("page", page);
        uiModel.addAttribute("shopOrderRetrunQuery", shopOrderRetrunQuery);
        uiModel.addAttribute("list", shopOrderRetrunQuery.toQueryString());
        addDateTimeFormatPatterns(uiModel);
        return "shoporderretruns/list";
    }

    @RequestMapping(produces = "text/html", params = "method=returnOrder", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> returnOrder(@RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException, SchedulerException {
        String outStr = "true";
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(id);
        if (shopOrderRetrun.getShopOrderRetrunType().getId() == 1) {
            if (shopOrderRetrun.getShopOrderId().getOrderStatus().getId() <= 2) {
            	shopOrderRetrun.setReturnTime(new Date());
                shopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(4));
                HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/shopOrders/remindRefund", "orderId="+id);
            } else {
                shopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(2));
            }
        }
        shopOrderRetrun.setShopAgreeTime(new Date());
        shopOrderRetrun.merge();
        //创建7天 不退货定时任务
        ScheduleJob job = new ScheduleJob();
        job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(shopOrderRetrun.getShopAgreeTime(),7)));
        // job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtMinute(shopOrderRetrun.getShopAgreeTime(),1)));
        job.setEndNumber(1);
        job.setJobdesc("1");
        job.setJobGroup("order");
        job.setJobName("closeReturn"+shopOrderRetrun.getShopOrderId().getId());
        job.setJobNumber(shopOrderRetrun.getShopOrderId().getId());
        job.setEventId(shopOrderRetrun.getId());
        job.setJobStatus("1");
        job.setVersion(0);
        job.setCronDate(DateUtils.addtDay(shopOrderRetrun.getShopAgreeTime(),7));
        job.persist();
        QuartzService qs = new QuartzService();
        qs.addLazy(job, schedulerFactoryBean, QuartzTaskFactoryInit.class);
        
        //退款
        Message message = new Message();
        message.setCreateTime(new Date());
        if(shopOrderRetrun.getShopOrderId().getOrderStatus().getId()==3 ||shopOrderRetrun.getShopOrderId().getOrderStatus().getId()==4 ||shopOrderRetrun.getShopOrderId().getOrderStatus().getId()==6){
        	 message.setMessage("\u60A8\u7684\u8BA2\u5355"+shopOrderRetrun.getShopOrderId().getOrderNumber()+",\u5546\u5BB6\u5DF2\u540C\u610F\u9000\u6B3E,\u8BF7\u5728\u671F\u9650\u65F6\u95F4\u5185\u5BC4\u56DE\u9000\u8D27");
        }else{
        	 message.setMessage("\u60A8\u7684\u8BA2\u5355"+shopOrderRetrun.getShopOrderId().getOrderNumber()+",\u5546\u5BB6\u5DF2\u540C\u610F\u9000\u6B3E,\u5F85\u5E73\u53F0\u9000\u6B3E\u7ED9\u60A8");
        }
        message.setOperation("\u67E5\u770B\u8BE6\u60C5");
        message.setType0(3);
        message.setType1(shopOrderRetrun.getShopOrderId().getId());
        message.setMobileUserId(shopOrderRetrun.getShopOrderId().getMobileUserId().getId());
        message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
        message.setStatus(0);
        message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
        message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
        message.persist();
        MessageUtils.sendMessage(message);
        Date date = new Date();
        SysLog sys = new SysLog();
		sys.setProcessId(shopOrderRetrun.getShopOrderId().getId());
		sys.setSysLogType(SysLogType.findSysLogType(1));
		sys.setContent("商家同意退款");
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		sys.persist();
        
		ShopOrderReturnConsult consult = new ShopOrderReturnConsult();
		consult.setContent("商家同意退款");
		consult.setCreatedAt(date);
		consult.setUpdatedAt(date);
		consult.setVersion(0);
		consult.setIsShop(true);
		consult.setShopOrderRetrunId(shopOrderRetrun);
		consult.persist();
		
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(produces = "text/html", params = "method=disagreeReturnOrder", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> disagreeReturnOrder(@RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(id);
        if (shopOrderRetrun.getShopOrderRetrunType().getId() == 1) {
            shopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(6));
            shopOrderRetrun.setIsDel(false);
        }
        ShopOrders shopOrder = shopOrderRetrun.getShopOrderId();
        shopOrder.setIsReturn(true);
        shopOrder.setIsReturnSucc(false);
        shopOrderRetrun.setShopOrderId(shopOrder);
        shopOrderRetrun.merge();
        
        //继续发货
        Message message = new Message();
        message.setCreateTime(new Date());
        message.setMessage("\u60A8\u7684\u8BA2\u5355"+shopOrderRetrun.getShopOrderId().getOrderNumber()+",\u5546\u5BB6\u62D2\u7EDD,\u9000\u6B3E\u5173\u95ED,\u5982\u6709\u7591\u95EE\u8BF7\u8054\u7CFB\u5546\u5BB6,\u6216\u60A8\u60F3\u7EE7\u7EED\u7533\u8BF7\u9000\u6B3E,\u53EF\u8FDB\u5165\u8BA2\u5355\u8BE6\u60C5\u64CD\u4F5C");
        message.setOperation("");
        message.setType0(0);//0表示没有操作按钮
        message.setType1(shopOrderRetrun.getShopOrderId().getId());
        message.setMobileUserId(shopOrderRetrun.getShopOrderId().getMobileUserId().getId());
        message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
        message.setStatus(0);
        message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
        message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
        message.persist();
        MessageUtils.sendMessage(message);
        Date date = new Date();
        SysLog sys = new SysLog();
		sys.setProcessId(shopOrderRetrun.getShopOrderId().getId());
		sys.setSysLogType(SysLogType.findSysLogType(1));
		sys.setContent("商家拒绝退款");
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		sys.persist();
		
		//==================调用分享服务=====================================
		if(shopOrder.getOrderStatus().getId()==4 || shopOrder.getOrderStatus().getId()==6){
			transferActiveServer(H5UrlUtil.SERVICE_BASE_URL+"unfreeze",String.valueOf(shopOrder.getId()));
			transferActiveServer(H5UrlUtil.SERVICE_PAYMENT_URL+"unfreezeScore",String.valueOf(shopOrder.getId()));
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

    @RequestMapping(value = "/{id}", produces = "text/html", params = "send")
    public String showSend(@PathVariable("id") Integer id, Model uiModel) {
        uiModel.addAttribute("itemId", id);
        uiModel.addAttribute("logisticsCompanies", LogisticsCompany.findAllLogisticsCompanysByCompanyType(1));
        return "shoporderretruns/send";
    }
    
    @RequestMapping(produces = "text/html", params = "method=disagreeReturnOrderSend", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> disagreeReturnOrderSend(@RequestParam(value = "id", required = false) Integer id,@RequestParam(value = "logisticsCompanyId", required = false) LogisticsCompany logisticsCompanyId, @RequestParam(value = "logisticsNumber", required = false) String logisticsNumber, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(id);
        if (shopOrderRetrun.getShopOrderRetrunType().getId() == 1) {
            shopOrderRetrun.setShopOrderRetrunType(null);
            shopOrderRetrun.setIsDel(true);
        }
        ShopOrders shopOrder = shopOrderRetrun.getShopOrderId();
        shopOrder.setIsReturn(false);
        shopOrder.setIsReturnSucc(false);
        shopOrderRetrun.setShopOrderId(shopOrder);
        shopOrderRetrun.merge();
        
        ShopOrders shopOrders = ShopOrders.findShopOrders(shopOrderRetrun.getShopOrderId().getId());
        ShopOrderType shopOrderType = ShopOrderType.findShopOrderType(3);
        shopOrders.setOrderStatus(shopOrderType);
        shopOrders.setLogisticsNumber(logisticsNumber);
        shopOrders.setLogisticsCompany(logisticsCompanyId);
        shopOrders.setSendTime(new Date());
        shopOrders.merge();
        //继续发货
        Message message = new Message();
        message.setCreateTime(new Date());
        message.setMessage("\u60A8\u7684\u8BA2\u5355"+shopOrderRetrun.getShopOrderId().getOrderNumber()+",\u5546\u5BB6\u7EE7\u7EED\u53D1\u8D27,\u9000\u6B3E\u5173\u95ED,\u5982\u6709\u7591\u95EE\u8BF7\u8054\u7CFB\u5546\u5BB6,\u6216\u60A8\u60F3\u7EE7\u7EED\u7533\u8BF7\u9000\u6B3E,\u53EF\u8FDB\u5165\u8BA2\u5355\u8BE6\u60C5\u64CD\u4F5C");
        message.setOperation("");
        message.setType0(0);//0表示没有操作按钮
        message.setType1(shopOrderRetrun.getShopOrderId().getId());
        message.setMobileUserId(shopOrderRetrun.getShopOrderId().getMobileUserId().getId());
        message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
        message.setStatus(0);
        message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
        message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
        message.persist();
        MessageUtils.sendMessage(message);
        Date date = new Date();
        SysLog sys = new SysLog();
		sys.setProcessId(shopOrderRetrun.getShopOrderId().getId());
		sys.setSysLogType(SysLogType.findSysLogType(1));
		sys.setContent("商家拒绝退款,继续发货");
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		sys.persist();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }
    
    @RequestMapping(produces = "text/html", params = "method=goodsReturnOrder", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> goodsReturnOrder(@RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(id);
        if (shopOrderRetrun.getShopOrderRetrunType().getId() == 3) {
            shopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(4));
            HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/shopOrders/remindRefund", "orderId="+id);
        }
        shopOrderRetrun.setReturnTime(new Date());
        shopOrderRetrun.setShopAgreeTime(shopOrderRetrun.getReturnTime());
        shopOrderRetrun.merge();
        //确定收货并同意退款
        Message message = new Message();
        message.setCreateTime(new Date());
        message.setMessage("\u60A8\u7684\u8BA2\u5355"+shopOrderRetrun.getShopOrderId().getOrderNumber()+",\u5546\u5BB6\u5DF2\u9A8C\u6536\u9000\u8D27\u5E76\u540C\u610F\u9000\u6B3E,\u5F85\u5E73\u53F0\u9000\u6B3E\u7ED9\u60A8");
        message.setOperation("");
        message.setType0(3);
        message.setType1(shopOrderRetrun.getShopOrderId().getId());
        message.setMobileUserId(shopOrderRetrun.getShopOrderId().getMobileUserId().getId());
        message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
        message.setStatus(0);
        message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
        message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
        message.persist();
        MessageUtils.sendMessage(message);
        Date date = new Date();
        SysLog sys = new SysLog();
		sys.setProcessId(shopOrderRetrun.getShopOrderId().getId());
		sys.setSysLogType(SysLogType.findSysLogType(1));
		sys.setContent("商家验货后同意退款");
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		sys.persist();
		
		ShopOrderReturnConsult consult = new ShopOrderReturnConsult();
		consult.setContent("商家验货后同意退款");
		consult.setCreatedAt(date);
		consult.setUpdatedAt(date);
		consult.setVersion(0);
		consult.setIsShop(true);
		consult.setShopOrderRetrunId(shopOrderRetrun);
		consult.persist();
		
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    @RequestMapping(produces = "text/html", params = "method=goodsDisagreeReturnOrder", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> goodsDisagreeReturnOrder(@RequestParam(value = "id", required = false) Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
        String outStr = "true";
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(id);
        if (shopOrderRetrun.getShopOrderRetrunType().getId() == 3) {
            shopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(6));
        }
        ShopOrders shopOrder = shopOrderRetrun.getShopOrderId();
        shopOrder.setIsReturnSucc(true);
        shopOrderRetrun.setShopOrderId(shopOrder);
        shopOrderRetrun.merge();
        request.setCharacterEncoding("utf-8");
        response.setContentType("text/html;charset=utf-8");
        response.setHeader("Cache-Control", "no-cache");
        PrintWriter out = response.getWriter();
        out.print(outStr);
        out.flush();
        out.close();
        return null;
    }

    void populateList(Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("shoporderretruntypes", ShopOrderRetrunType.findAllShopOrderRetrunTypes());
    }
    /**
     * 调用服务
     * @param url unfreeze
     * @param id
     */
    public void transferActiveServer(String url,String orderId){
    	try {
    		String json=HttpRequest.sendGet(url, "orderId="+orderId);
    		JSONObject object = JSONObject.fromObject(json); 
    		if(object==null || object.get("code") ==null || !object.get("code").toString().equals("0")){
    			logger.error("调用服务异常："+url+"?orderI="+orderId);
    		}
		} catch (Exception e) {
			e.printStackTrace();
			logger.error("服务异常："+e.getMessage());
		}
    }
}
