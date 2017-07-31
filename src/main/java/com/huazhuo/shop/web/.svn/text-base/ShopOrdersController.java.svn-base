package com.huazhuo.shop.web;

import java.io.ByteArrayInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;
import org.apache.commons.io.FilenameUtils;
import org.apache.poi.ss.usermodel.DateUtil;
import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.google.gson.Gson;
import com.huazhuo.shop.domain.Message;
import com.huazhuo.shop.domain.ShopOrderRetrun;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.LogisticsCompany;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.model.OrderExcel;
import com.huazhuo.shop.pojo.ApiResult;
import com.huazhuo.shop.pojo.DicItem;
import com.huazhuo.shop.pojo.LogisticsPoJo;
import com.huazhuo.shop.quartz.QuartzService;
import com.huazhuo.shop.quartz.QuartzTaskFactoryInit;
import com.huazhuo.shop.quartz.ScheduleJob;
import com.huazhuo.shop.query.ShopOrdersQuery;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.service.ShopOrdersService;
import com.huazhuo.shop.sms.JavaSmsApi;
import com.huazhuo.shop.util.CronExpression;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.MessageUtils;
import com.huazhuo.shop.util.StringUtils;
import com.huazhuo.shop.util.SysLogUtil;
import com.sun.xml.internal.messaging.saaj.util.ByteInputStream;

@RequestMapping("/shoporderses")
@Controller
@RooWebScaffold(path = "shoporderses", formBackingObject = ShopOrders.class)
@SessionAttributes({ "shoporder", "shop", "CurrentUser", "sessionShopId" })
public class ShopOrdersController {

	public static final Integer STAY_PAY = 1;

	public static final Integer STAY_SEND = 2;

	public static final Integer SEND = 3;

	public static final Integer SUCCESS = 4;

	public static final Integer FAIL = 5;

	public static final Integer SHOPSYSLOGTYPE = 1;

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;
	@Autowired
	private ShopOrdersService shopOrdersService;

	@ModelAttribute("subtree")
	public void createSubtreet(HttpServletRequest httpServletRequest) {
		httpServletRequest.getSession().setAttribute("subtree", "shoporder");
	}

	@RequestMapping(value = "/{id}", produces = "text/html", params = "send")
	public String showSend(@PathVariable("id") Integer id, Model uiModel) {
		uiModel.addAttribute("itemId", id);
		uiModel.addAttribute("logisticsCompanies", LogisticsCompany.findAllLogisticsCompanysByCompanyType(1));
		return "shoporderses/send";
	}
	@RequestMapping(value = "/{id}", produces = "text/html", params = "update")
	public String showUpdate(
			@PathVariable("id") Integer id, Model uiModel) {
	    List<ShopOrders> order=ShopOrders.findOrderNumber(id);
	  String number=  order.get(0).getLogisticsNumber();
	  String company= order.get(0).getLogisticsCompany().getLogisticsName();
	
    	uiModel.addAttribute("itemId", id);
    	uiModel.addAttribute("number", number);
     	uiModel.addAttribute("company", company);
		uiModel.addAttribute("logisticsCompanies", LogisticsCompany.findAllLogisticsCompanysByCompanyType(1));
		return "shoporderses/update";
	}
	@RequestMapping(value = "/{id}", produces = "text/html", params = "cancel")
	public String showCancel(@PathVariable("id") Integer id, Model uiModel) {
		uiModel.addAttribute("id", id);
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING + "/dicItem", "dicType=" + 8);
		Gson gson = new Gson();
		ApiResult<DicItem> api = gson.fromJson(str, ApiResult.class);
		uiModel.addAttribute("dicItem", api.getDate());
		return "shoporderses/cancel";
	}

	@Transactional
	@RequestMapping(produces = "text/html", params = "method=updateOrderStatus", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> updateOrderStatus(@ModelAttribute("sessionShopId") Integer shop,
			@ModelAttribute("CurrentUser") BackUser user,
			@RequestParam(value = "orderId", required = false) Integer orderId,
			@RequestParam(value = "update", required = false) Integer update,
			@RequestParam(value = "logisticsCompanyId", required = false) LogisticsCompany logisticsCompanyId,
			@RequestParam(value = "logisticsNumber", required = false) String logisticsNumber, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException, SchedulerException {
		String outStr = "true";
		ShopOrders shopOrders = ShopOrders.findShopOrders(orderId);
		ShopOrderType shopOrderType = ShopOrderType.findShopOrderType(SEND);
		shopOrders.setOrderStatus(shopOrderType);
		shopOrders.setLogisticsNumber(logisticsNumber);
		shopOrders.setLogisticsCompany(logisticsCompanyId);
		shopOrders.setSendTime(new Date());
		shopOrders.merge();
		if(update==1111){
			SysLog sysLog = SysLog.getOrderSysLog("修改物流。快递公司：" + logisticsCompanyId.getLogisticsName()
			+ SysLogUtil.SEND_ORDER_NUMBER + logisticsNumber, user.getUserName(), orderId, 1);	
			sysLog.persist();
		}else{
			SysLog sysLog = SysLog.getOrderSysLog(SysLogUtil.SEND_ORDER_NAME + logisticsCompanyId.getLogisticsName()
			+ SysLogUtil.SEND_ORDER_NUMBER + logisticsNumber, user.getUserName(), orderId, 1);
			sysLog.persist();
	
		}
		if(shopOrders.getAtt2().length()>10){
			String userid=shopOrders.getAtt1();
			String orderNumber=shopOrders.getAtt3();
			String company=logisticsCompanyId.getLogisticsName();
			String ss=logisticsNumber;
		
//			String tpl_value = URLEncoder.encode("#number#", JavaSmsApi.ORDER_TPLID) + "=" + URLEncoder.encode(orderReturn.getReturnNumber(), JavaSmsApi.ORDER_TPLID);
//			String str = JavaSmsApi.tplSendSms(JavaSmsApi.APIKEY, JavaSmsApi.ORDER_TPLID, tpl_value,shopOrders.getAtt2());
		}

		ScheduleJob job = new ScheduleJob();
		// job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(shopOrders.getSendTime(),10)));
		job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(shopOrders.getSendTime(), 10)));
		job.setEndNumber(1);
		job.setJobdesc("1");
		job.setJobGroup("order");
		job.setJobName("orderSucc" + shopOrders.getId());
		job.setJobNumber(shopOrders.getId());
		job.setJobStatus("1");
		job.setVersion(0);
		job.setCronDate(DateUtils.addtDay(shopOrders.getSendTime(), 10));
		job.persist();
		QuartzService qs = new QuartzService();
		qs.addLazy(job, schedulerFactoryBean, QuartzTaskFactoryInit.class);
		Message message = new Message();
		message.setCreateTime(new Date());
		message.setMessage("\u60A8\u7684\u8BA2\u5355" + shopOrders.getOrderNumber() + "\u5DF2\u53D1\u8D27");
		message.setOperation("\u67E5\u770B\u8BE6\u60C5");
		message.setType0(1);
		message.setType1(shopOrders.getId());
		message.setMobileUserId(shopOrders.getMobileUserId().getId());
		message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
		message.setStatus(0);
		message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
		message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
		message.persist();
		MessageUtils.sendMessage(message);

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}

	@Transactional
	@RequestMapping(produces = "text/html", params = "method=deleteOrder", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> deleteOrder(@ModelAttribute("sessionShopId") Integer shop,
			@ModelAttribute("CurrentUser") BackUser user,
			@RequestParam(value = "orderId", required = false) Integer orderId,
			@RequestParam(value = "reason", required = false) String reason, Model uiModel, HttpServletRequest request,
			HttpServletResponse response) throws IOException, SchedulerException {
		String outStr = "true";
		ShopOrders shopOrders = ShopOrders.findShopOrders(orderId);
		shopOrders.setOrderStatus(ShopOrderType.findShopOrderType(7));
		shopOrders.merge();
		Date date = new Date();
		SysLog sys = new SysLog();
		sys.setProcessId(orderId);
		sys.setSysLogType(SysLogType.findSysLogType(1));
		sys.setContent("商家取消订单:" + reason);
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		sys.persist();
		Message message = new Message();
		message.setCreateTime(new Date());
		message.setMessage("\u60A8\u7684\u5F85\u4ED8\u6B3E\u8BA2\u5355" + shopOrders.getOrderNumber()
				+ ",\u5546\u5BB6\u5DF2\u7ECF\u53D6\u6D88\u8BA2\u5355,\u4EA4\u6613\u5DF2\u5173\u95ED,\u5982\u7591\u95EE\u8BF7\u8054\u7CFB\u5546\u5BB6");
		message.setOperation("\u67E5\u770B\u8BE6\u60C5");
		message.setType0(1);
		message.setType1(shopOrders.getId());
		message.setMobileUserId(shopOrders.getMobileUserId().getId());
		message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
		message.setStatus(0);
		message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
		message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
		message.persist();
		MessageUtils.sendMessage(message);

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}

	@RequestMapping(produces = "text/html", params = "method=showLogistics")
	public String showLogistics(
			@RequestParam(value = "logisticsCompanyId", required = false) LogisticsCompany logisticsCompanyId,
			@RequestParam(value = "logisticsNumber", required = false) String logisticsNumber, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {

		logisticsNumber = logisticsNumber.trim();
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING_WU,
				"logisticsCode=" + logisticsCompanyId.getLogisticsCode() + "&logisticsNumber=" + logisticsNumber);
		Gson gson = new Gson();
		LogisticsPoJo lp = gson.fromJson(str, LogisticsPoJo.class);
		uiModel.addAttribute("LogisticsPoJo", lp);
		if (!StringUtils.isBlank(lp.getShipperCode())) {
			List<LogisticsCompany> logisticsCompanys = LogisticsCompany
					.findAllLogisticsCompanysByLogisticsCode(lp.getShipperCode());
			if (logisticsCompanys.size() > 0) {
				uiModel.addAttribute("logisticsCompany", logisticsCompanys.get(0));
			}
		}
		return "shoporderses/showLogistics";
	}
	
	@RequestMapping(produces = "text/html", params = "method=exportExcel")
    public  ResponseEntity<java.lang.String> exportExcel( @ModelAttribute("sessionShopId") Integer shop,HttpServletRequest request, HttpServletResponse response) throws Exception{
		String type=request.getParameter("type")==null?"0":request.getParameter("type");
		
		String selectDate=request.getParameter("selectDate")==null?"":request.getParameter("selectDate");
		String postDateStart=request.getParameter("postDateStart")==null?"":request.getParameter("postDateStart");
		String postDateEnd=request.getParameter("postDateEnd")==null?"":request.getParameter("postDateEnd");
		
		String inputNumber=request.getParameter("inputNumber")==null?"":request.getParameter("inputNumber");
		String postText=request.getParameter("postText")==null?"":request.getParameter("postText");
		
		
		String url=shopOrdersService.findShopOrdersList(type,shop,request,selectDate,postDateStart,postDateEnd,inputNumber,postText);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(url);
		out.flush();
		out.close();
		return null;
    }
	@RequestMapping(produces = "text/html", params = "method=importExcel")
	public ResponseEntity<java.lang.String> importExcel(HttpServletRequest request, HttpServletResponse response,
			@ModelAttribute("CurrentUser") BackUser user ) throws Exception{
	        MultipartHttpServletRequest multipartRequest = (MultipartHttpServletRequest) request;   
	        // 获得文件：   
	        MultipartFile file = multipartRequest.getFile("file_excel"); 
	        String fpath="";
	        // 获得文件名：   
	        String filename = file.getOriginalFilename(); 
	        if(filename.indexOf(".xls")==-1){
	        	fpath="0";
	        }else{
		        File fileServer=new File(shopOrdersService.upload(file, request));
		        if(!fileServer.exists()){
		        	fpath="0";
		        	throw new RuntimeException("文件不存在");
		        }else{
		        	fpath=shopOrdersService.importExcel(new FileInputStream(fileServer),user,request);
		        }
	        }
	        PrintWriter out = response.getWriter();
			out.print(fpath);
			out.flush();
			out.close();
	        return null;
	}
	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") Integer id, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		SysLogType sysLogType = SysLogType.findSysLogType(SHOPSYSLOGTYPE);
		ShopOrders shopOrders = ShopOrders.findShopOrders(id);
		uiModel.addAttribute("shoporders", shopOrders);
		uiModel.addAttribute("itemId", id);
		uiModel.addAttribute("sysLogs", SysLog.findAllSysLogsByprocessIdAndSysLogType(id, sysLogType));
		List<ShopOrderRetrun> shopOrderRetruns = ShopOrderRetrun.findShopOrderRetrunsByshopOrderId(shopOrders);
		if (shopOrderRetruns.size() > 0) {
			uiModel.addAttribute("shopOrderRetrun", shopOrderRetruns.get(0));
		}
		return "shoporderses/show";
	}

	@RequestMapping(produces = "text/html")
	public String list(@Valid ShopOrdersQuery shopOrdersQuery, @ModelAttribute("sessionShopId") Integer shop,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
	
		
	
		shopOrdersQuery.setShopId(shop);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
		List<ShopOrders>	shopOrder =	ShopOrders.search(shopOrdersQuery, firstResult, sizeNo);
			uiModel.addAttribute("shoporderses",shopOrder );
			float nrOfPages = (float) ShopOrders.searchCount(shopOrdersQuery) / sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			uiModel.addAttribute("shoporderses", ShopOrders.search(shopOrdersQuery));
		}
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("shopOrdersQuery", shopOrdersQuery);
		uiModel.addAttribute("list", shopOrdersQuery.toQueryString());
		uiModel.addAttribute("page", page);
	
		return "shoporderses/list";
	}

	@RequestMapping(produces = "text/html", params = "listIndex")
	public String listIndex(@Valid ShopOrdersQuery shopOrdersQuery, @ModelAttribute("sessionShopId") Integer shop,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
		shopOrdersQuery.setShopId(shop);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
			uiModel.addAttribute("shoporderses",
					ShopOrders.findShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shopOrdersQuery.getShopId(),
							shopOrdersQuery.getOrderTimeStart(), shopOrdersQuery.getOrderTimeEnd(), firstResult,
							sizeNo));
			float nrOfPages = (float) ShopOrders.countShopOrdersesByShopAndShopOrderTypeAndCreatedAt(
					shopOrdersQuery.getShopId(), shopOrdersQuery.getOrderTimeStart(), shopOrdersQuery.getOrderTimeEnd())
					/ sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			uiModel.addAttribute("shoporderses",
					ShopOrders.findShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shopOrdersQuery.getShopId(),
							shopOrdersQuery.getOrderTimeStart(), shopOrdersQuery.getOrderTimeEnd()));
		}
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("shopOrdersQuery", shopOrdersQuery);
		uiModel.addAttribute("page", page);
		return "shoporderses/list";
	}
	
}
