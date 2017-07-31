package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

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
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.google.gson.Gson;
import com.huazhuo.shop.domain.Message;
import com.huazhuo.shop.domain.ShopOrderRetrun;
import com.huazhuo.shop.domain.ShopOrderReturnConsult;
import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.pojo.ApiResult;
import com.huazhuo.shop.pojo.DicItem;
import com.huazhuo.shop.quartz.QuartzService;
import com.huazhuo.shop.quartz.QuartzTaskFactoryInit;
import com.huazhuo.shop.quartz.ScheduleJob;
import com.huazhuo.shop.util.CronExpression;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.MessageUtils;

import net.sf.json.JSONObject;

@RequestMapping("/shoporderreturnconsults")
@Controller
@RooWebScaffold(path = "shoporderreturnconsults", formBackingObject = ShopOrderReturnConsult.class)
public class ShopOrderReturnConsultController {
	private static Logger logger= LoggerFactory.getLogger(ShopOrderReturnConsultController.class);
	
    @Autowired
	private SchedulerFactoryBean schedulerFactoryBean;
    
    @RequestMapping(params = "form", produces = "text/html")
    public String createForm(@RequestParam(value = "returnId", required = false) Integer returnId, Model uiModel) {
    	String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/dicItem", "dicType="+6);
    	Gson gson = new Gson();
    	ApiResult<DicItem> api = gson.fromJson(str, ApiResult.class);
    	uiModel.addAttribute("dicItem", api.getDate());
        uiModel.addAttribute("returnId", returnId);
        return "shoporderreturnconsults/create";
    }

    @Transactional
    @RequestMapping(produces = "text/html", method = RequestMethod.POST)
    public ResponseEntity<java.lang.String> create(@Valid ShopOrderReturnConsult shopOrderReturnConsult, @RequestParam(value = "selectContent", required = false) String selectContent, Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException, SchedulerException {
        String outStr = "true";
        Date date = new Date();
        shopOrderReturnConsult.setContent(selectContent + "," + shopOrderReturnConsult.getContent());
        shopOrderReturnConsult.setCreatedAt(date);
        shopOrderReturnConsult.setUpdatedAt(date);
        shopOrderReturnConsult.setIsShop(true);
        shopOrderReturnConsult.persist();
        ShopOrderRetrun shopOrderRetrun = ShopOrderRetrun.findShopOrderRetrun(shopOrderReturnConsult.getShopOrderRetrunId().getId());
        if (shopOrderRetrun.getShopOrderRetrunType().getId() == 3) {
            shopOrderRetrun.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(6));
        }
        shopOrderRetrun.merge();
        
        
        //创建自动收货定时任务
        if(DateUtils.addtDay(shopOrderRetrun.getShopOrderId().getPayedAt(), 10).compareTo(date)==1){
        	 ScheduleJob job = new ScheduleJob();
             //job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(shopOrders.getSendTime(),10)));
             job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(shopOrderRetrun.getShopOrderId().getPayedAt(), 10)));
             job.setEndNumber(1);
             job.setJobdesc("1");
             job.setJobGroup("order");
             job.setJobName("orderSucc"+shopOrderRetrun.getShopOrderId().getId());
             job.setJobNumber(shopOrderRetrun.getShopOrderId().getId());
             job.setJobStatus("1");
             job.setVersion(0);
             job.setCronDate(DateUtils.addtDay(shopOrderRetrun.getShopOrderId().getPayedAt(), 10));
             job.persist();
             QuartzService qs = new QuartzService();
             qs.addLazy(job, schedulerFactoryBean, QuartzTaskFactoryInit.class);
        }else{
        	shopOrderRetrun.getShopOrderId().setEndTime(date);
        	shopOrderRetrun.getShopOrderId().setOrderStatus(ShopOrderType.findShopOrderType(4));
        	shopOrderRetrun.getShopOrderId().merge();
        }
        
        //拒绝退款
        Message message = new Message();
        message.setCreateTime(new Date());
        message.setMessage("\u60A8\u7684\u8BA2\u5355"+shopOrderRetrun.getShopOrderId().getOrderNumber()+",\u5546\u5BB6\u5DF2\u9A8C\u6536\u5E76\u62D2\u7EDD\u9000\u6B3E");
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
        SysLog sys = new SysLog();
		sys.setProcessId(shopOrderReturnConsult.getShopOrderRetrunId().getId());
		sys.setSysLogType(SysLogType.findSysLogType(1));
		sys.setContent("商家验货后拒绝退款，退款失败,"+selectContent + "," + shopOrderReturnConsult.getContent());
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		sys.persist();
		//==================调用分享服务=====================================
		if(shopOrderRetrun.getShopOrderId().getOrderStatus().getId()==4 ||shopOrderRetrun.getShopOrderId().getOrderStatus().getId()==6){
			transferActiveServer(H5UrlUtil.SERVICE_BASE_URL+"unfreeze",String.valueOf(shopOrderRetrun.getShopOrderId().getId()));
			transferActiveServer(H5UrlUtil.SERVICE_PAYMENT_URL+"unfreezeScore",String.valueOf(shopOrderRetrun.getShopOrderId().getId()));
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
    /**
     * 调用服务
     * @param url unfreeze
     * @param id
     */
    private void transferActiveServer(String url,String orderId){
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
