package com.huazhuo.shop.quartz;

import java.util.Date;
import java.util.List;

import org.quartz.Job;
import org.quartz.JobExecutionContext;
import org.quartz.JobExecutionException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import com.huazhuo.shop.domain.Message;
import com.huazhuo.shop.domain.ShopOrderRetrun;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.util.CronExpression;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.MessageUtils;
import com.huazhuo.shop.web.ShopOrderRetrunController;

import net.sf.json.JSONObject;

public class QuartzTaskFactoryInit implements Job {
	private static Logger logger= LoggerFactory.getLogger(QuartzTaskFactoryInit.class);
	/**
	 * 定时执行
	 */
	@Override
	public void execute(JobExecutionContext context) throws JobExecutionException {
		ScheduleJob job = (ScheduleJob) context.getMergedJobDataMap().get("scheduleJob");
		Date date = new Date();
		// 发货后 系统默认确认交易完成
		List<ScheduleJob> listJobs = ScheduleJob.findAllScheduleJobsByJobNameAndJobNumber("orderSucc" + job.getJobNumber(), job.getJobNumber());
		if (listJobs.size() > 0) {
			if (job.getJobName().equals("orderSucc" + job.getJobNumber())) {
				ShopOrders order = ShopOrders.findShopOrders(job.getJobNumber());
				if (order.getOrderStatus().getId() == 3) {
					order.setOrderStatus(ShopOrderType.findShopOrderType(4));
					order.setEndTime(new Date());
					order.merge();
				}
				listJobs.get(0).remove();
				Message message = new Message();
				message.setCreateTime(date);
				message.setMessage("\u7CFB\u7EDF\u9ED8\u8BA4\u786E\u8BA4\u8BA4\u6536\u8D27,\u60A8\u7684\u8BA2\u5355"
						+ order.getOrderNumber()
						+ "\u5DF2\u5B8C\u6210\u4EA4\u6613,\u611F\u8C22\u60A8\u7684\u652F\u6301,\u671F\u5F85\u60A8\u5BF9\u672C\u6B21\u8D2D\u7269\u7684\u8BC4\u4EF7");
				message.setOperation("\u9A6C\u4E0A\u8BC4\u4EF7");
				message.setType0(2);
				message.setType1(order.getId());
				message.setMobileUserId(order.getMobileUserId().getId());
				message.setMessageType("\u7CFB\u7EDF\u6D88\u606F");
				message.setStatus(0);
				message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
				message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
				message.persist();
				MessageUtils.sendMessage(message);
				SysLog sys = new SysLog();
				sys.setProcessId(order.getId());
				sys.setSysLogType(SysLogType.findSysLogType(1));
				sys.setContent("系统默认买家确认收货，交易成功");
				sys.setCreatedAt(date);
				sys.setUpdatedAt(date);
				sys.setState(true);
				sys.setOperator("平台");
				sys.persist();
				if(order.getOrderStatus().getId()==4 || order.getOrderStatus().getId()==6 ){
					transferActiveServer(H5UrlUtil.SERVICE_BASE_URL+"confirmShareOrder",String.valueOf(order.getId()));
					transferActiveServer(H5UrlUtil.SERVICE_PAYMENT_URL+"confirmScore",String.valueOf(order.getId()));
				}
			}
		}

		if (job.getJobName().equals("closeReturn" + job.getJobNumber())) {
			ShopOrders order = ShopOrders.findShopOrders(job.getJobNumber());
			ShopOrderRetrun orderReturn = ShopOrderRetrun.findShopOrderRetrun(job.getEventId());
			if (order.getIsReturn() && !orderReturn.getIsDel() && orderReturn.getShopOrderRetrunType().getId() == 2) {
				Message message = new Message();
				message.setCreateTime(date);
				message.setMessage("您的订单" + order.getOrderNumber() + ",由于您未在规定时间内寄回退货，系统默认您放弃退款，退款已关闭");
				message.setOperation("");
				message.setType0(0);
				message.setType1(order.getId());
				message.setMobileUserId(order.getMobileUserId().getId());
				message.setMessageType("系统消息");
				message.setStatus(0);
				message.setTime(DateUtils.getDateFromStringHHMM(message.getCreateTime()));
				message.setDate(DateUtils.getDateFromString(message.getCreateTime()));
				message.persist();
				MessageUtils.sendMessage(message);
				orderReturn.setShopOrderRetrunType(ShopOrderRetrunType.findShopOrderRetrunType(6));
				orderReturn.merge();
				SysLog sys = new SysLog();
				sys.setProcessId(order.getId());
				sys.setSysLogType(SysLogType.findSysLogType(1));
				sys.setContent("规定时间内买家未寄回退货，退款失败");
				sys.setCreatedAt(date);
				sys.setUpdatedAt(date);
				sys.setState(true);
				sys.setOperator("平台");
				sys.persist();
				
				//==================调用分享服务=====================================
				if(order.getOrderStatus().getId()==4 || order.getOrderStatus().getId()==6){
					transferActiveServer(H5UrlUtil.SERVICE_BASE_URL+"unfreeze",String.valueOf(order.getId()));
					transferActiveServer(H5UrlUtil.SERVICE_PAYMENT_URL+"unfreezeScore",String.valueOf(order.getId()));
				}
				
				//
				if(DateUtils.addtDay(order.getPayedAt(), 5).compareTo(date)==1){
					ScheduleJob newjob = new ScheduleJob();
					// job.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(date,5)));
					newjob.setCronExpression(CronExpression.getCronExpression(DateUtils.addtDay(order.getPayedAt(),5)));
					newjob.setJobGroup("order");
					newjob.setJobName("orderSucc"+orderReturn.getShopOrderId().getId());
					newjob.setJobNumber(orderReturn.getShopOrderId().getId());
					newjob.setEventId(order.getId());
					newjob.setVersion(0);
					newjob.setCronDate(DateUtils.addtDay(order.getPayedAt(),5));
					newjob.persist();
				}else{
					order.setEndTime(date);
					order.setOrderStatus(ShopOrderType.findShopOrderType(4));
					order.setIsReturn(false);
					order.merge();
					orderReturn.setIsDel(true);
					orderReturn.merge();
				}
			}
			job.remove();
		}
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