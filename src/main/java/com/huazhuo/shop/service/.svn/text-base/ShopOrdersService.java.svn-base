package com.huazhuo.shop.service;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.quartz.SchedulerException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import com.huazhuo.shop.domain.Message;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.LogisticsCompany;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.excel.ExportImportResultError;
import com.huazhuo.shop.excel.ShopOrderExport;
import com.huazhuo.shop.excel.ShopOrderReadExcel;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.mapper.LogisticsCompanyMapper;
import com.huazhuo.shop.mapper.ShoppingOrdersMapper;
import com.huazhuo.shop.model.OrderExcel;
import com.huazhuo.shop.quartz.QuartzService;
import com.huazhuo.shop.quartz.QuartzTaskFactoryInit;
import com.huazhuo.shop.quartz.ScheduleJob;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.CronExpression;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.MessageUtils;
import com.huazhuo.shop.util.SysLogUtil;
import com.huazhuo.shop.web.ShopOrdersController;

@Service
public class ShopOrdersService {
	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;
	
	@Autowired
	private LogisticsCompanyMapper logisticsCompanyMapper;
	
	@Autowired
	private ShoppingOrdersMapper shoppingOrdersMapper;
	public String findShopOrdersList(String type, Integer shopId, HttpServletRequest request, String selectDate,
			String postDateStart, String postDateEnd, String inputNumber, String postText) throws  IOException {
		Map<String,Object> map=new HashMap<String, Object>();
		map.put("type",type);
		map.put("shopId", shopId);
		map.put("selectDate", selectDate);
		map.put("postDateStart", postDateStart);
		map.put("postDateEnd", postDateEnd);
		map.put("inputNumber", inputNumber);
		map.put("postText", postText);
		List<Map<String,Object>> list =shoppingOrdersMapper.findShopOrdersList(map); 
		if(list==null || list.isEmpty()){
			return "0";
		}
		String path=request.getRealPath("/");
		List<Map<String,Object>> orderList=null;
		String productMsg="";
		/*for(Map<String,Object> mapList:list){
			orderList=shoppingOrdersMapper.findShopOrdersListDetial(mapList.get("id").toString());
			if(orderList!=null && !orderList.isEmpty()){
				productMsg="";
				for(Map<String,Object> detailMap:orderList){
					productMsg+=detailMap.get("product_name") +"*"+detailMap.get("buy_couts")+"  ";
				}
			}
			mapList.put("productMsg", productMsg);
		}*/
		return ShopOrderExport.exportExcelRecommendation(list, Integer.valueOf(type), path);
	}
	public String  importExcel(FileInputStream fileInputStream,BackUser user,HttpServletRequest request) throws Exception {
		ShopOrderReadExcel sre=new ShopOrderReadExcel(fileInputStream);
		List <OrderExcel> list=sre.readExcel(); 
		LogisticsCompany lcy=null;
		List<OrderExcel> errorOeS=new ArrayList<OrderExcel>();
		OrderExcel  errorOe=null;
		int success=0;
		if(list!=null && !list.isEmpty()){
			for(OrderExcel oe:list){
				List<Map<String,Object>> lm=findOrderById(oe.getOrderId());
				if(lm==null || lm.isEmpty() || lm.size()>1){
					errorOe=oe;
					errorOe.setOrderId(oe.getOrderId()+"，该订单不存在/或不唯一");
					errorOeS.add(errorOe);
					continue;
				}else if(((Integer)lm.get(0).get("order_status"))!=2){
				   errorOe=oe;
				   errorOe.setOrderId(oe.getOrderId()+"，该订单不是待发货状态");
				   errorOeS.add(errorOe);
				   continue;
				}
				lcy=findAllLogisticsCompanysByName(oe.getDelivery());
				if(lcy==null  ){
					errorOe=oe;
					errorOe.setDelivery(oe.getDelivery()+"，该快递公司不存在");
					errorOeS.add(errorOe);
					continue;
				}
				try {
					sendGoods(String.valueOf(lm.get(0).get("id")),oe.getDeliveryId(),lcy,user);
					success++;
				} catch (Exception e) {
					errorOe=oe;
					errorOe.setDelivery(oe.getOrderId()+"，导入失败");
					errorOeS.add(errorOe);
					e.printStackTrace();
				}
			}
		}
		String path=request.getRealPath("/");
		Integer errorNum=errorOeS==null || errorOeS.isEmpty()?0:errorOeS.size();
		String html="导入成功:"+success+"条, 导入失败："+String.valueOf(errorNum)+"条 ";
		if(errorNum >0){
			html+=":请点击下载导入错误的订单#"+importResult(errorOeS,path);
		}
		return html;
	}
	private String importResult(List<OrderExcel> errorOeS,String path) throws IOException{
		if(errorOeS==null || errorOeS.isEmpty()){
			return null;
		}
		String url=ExportImportResultError.exportExcelRecommendation(errorOeS,path);
		return url;
		
	}
	private List<Map<String,Object>> findOrderById(String orderNum){
		if(orderNum==null || orderNum.equals("")){
			return null;
		}
		List<Map<String,Object>> lsit=logisticsCompanyMapper.findOrderById(orderNum);
		return lsit;
	}
	/**
	 * 验证快递公司
	 * @param name
	 * @return
	 */
	private LogisticsCompany findAllLogisticsCompanysByName(String name){
		List<LogisticsCompany> list=LogisticsCompany.findAllLogisticsCompanysByName(name);
		if(list!=null && !list.isEmpty()){
			return list.get(0);
		}
		return null;
	}
	@Transactional
	private String sendGoods(String orderId,String logisticsNumber,LogisticsCompany logisticsCompanyId,BackUser user) throws Exception{
		String outStr = "true";
		ShopOrders shopOrders = ShopOrders.findShopOrders(Integer.valueOf(orderId));
		ShopOrderType shopOrderType = ShopOrderType.findShopOrderType(ShopOrdersController.SEND);
		shopOrders.setOrderStatus(shopOrderType);
		shopOrders.setLogisticsNumber(logisticsNumber);
		shopOrders.setLogisticsCompany(logisticsCompanyId);
		shopOrders.setSendTime(new Date());
		shopOrders.merge();
		SysLog sysLog = SysLog.getOrderSysLog(SysLogUtil.SEND_ORDER_NAME + logisticsCompanyId.getLogisticsName()
		+ SysLogUtil.SEND_ORDER_NUMBER + logisticsNumber, user.getUserName(), Integer.valueOf(orderId), 1);
		sysLog.persist();
		if(shopOrders.getAtt2().length()>10){
			String userid=shopOrders.getAtt1();
			String orderNumber=shopOrders.getAtt3();
			String company=logisticsCompanyId.getLogisticsName();
			String ss=logisticsNumber;
		
//			String tpl_value = URLEncoder.encode("#number#", JavaSmsApi.ORDER_TPLID) + "=" + URLEncoder.encode(orderReturn.getReturnNumber(), JavaSmsApi.ORDER_TPLID);
//			String str = JavaSmsApi.tplSendSms(JavaSmsApi.APIKEY, JavaSmsApi.ORDER_TPLID, tpl_value,shopOrders.getAtt2());
		}

		ScheduleJob job = new ScheduleJob();
		//job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(shopOrders.getSendTime(),10)));
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
		return outStr;
	}
	public boolean findCgReturnGoods(Integer productsId) {
	    List<Map<String,Object>> map=shoppingOrdersMapper.findCgReturnGoods(productsId);
	    if(map==null || map.isEmpty()){
	    	return false;
	    }
		return map.get(0).get("return_goods")==null?false:Boolean.valueOf(map.get(0).get("return_goods").toString());
	}
	public boolean findCategoryId(Integer categoryId) {
		return shoppingOrdersMapper.findCategoryId(categoryId);
	}
	public String upload(MultipartFile file,HttpServletRequest request) throws IOException{
        String path = request.getSession().getServletContext().getRealPath("upload");  
        String fileName = file.getOriginalFilename();  
        File targetFile = new File(path, fileName);  
        if(!targetFile.exists()){  
            targetFile.mkdirs();  
        }  
        try {  
            file.transferTo(targetFile);  
        } catch (Exception e) { 
        	System.out.println("文件上传异常");
            e.printStackTrace();  
        }  
        String fileUrl=path+"/"+fileName;
        if(fileUrl==null || fileUrl.equals("")){
           throw new RuntimeException("文件路径错误");
        }
	    return fileUrl;
   }

}
