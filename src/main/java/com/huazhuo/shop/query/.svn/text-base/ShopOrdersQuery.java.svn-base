package com.huazhuo.shop.query;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.StringUtils;
/**
 * 订单查询条件
 * @author Administrator
 *
 */
public class ShopOrdersQuery {
	
	@DateTimeFormat(style = "M-")
	private Date orderTimeStart;//   订单开始时间
	
	@DateTimeFormat(style = "M-")
	private Date orderTimeEnd;//   订单结束时间
	
	@DateTimeFormat(style = "M-")
	private Date payedAtStart;//   支付开始时间
	
	@DateTimeFormat(style = "M-")
	private Date payedAtEnd;//   支付结束时间
	
	@DateTimeFormat(style = "M-")
	private Date sendTimeStart;//   发货时间
	
	@DateTimeFormat(style = "M-")
	private Date sendTimeEnd;//   发货时间
	
	private String orderNumber;//   订单编号
	
	private String productName;//   商品名称
	
	private String att1;//  收货人 
	
	private String att2;//   收货电话
	
	private ShopOrderType orderStatus;//   订单状态

	private Integer shopId;
	
	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Date getOrderTimeStart() {
		return orderTimeStart;
	}

	public void setOrderTimeStart(Date orderTimeStart) {
		this.orderTimeStart = orderTimeStart;
	}

	public Date getOrderTimeEnd() {
		if(orderTimeEnd!=null)
			return DateUtils.getEndTime(orderTimeEnd);
		return orderTimeEnd;
	}

	public void setOrderTimeEnd(Date orderTimeEnd) {
		this.orderTimeEnd = orderTimeEnd;
	}

	public Date getPayedAtStart() {
		return payedAtStart;
	}

	public void setPayedAtStart(Date payedAtStart) {
		this.payedAtStart = payedAtStart;
	}

	public Date getPayedAtEnd() {
		if(payedAtEnd!=null)
			return DateUtils.getEndTime(payedAtEnd);
		return payedAtEnd;
	}

	public void setPayedAtEnd(Date payedAtEnd) {
		this.payedAtEnd = payedAtEnd;
	}

	public Date getSendTimeStart() {
		return sendTimeStart;
	}

	public void setSendTimeStart(Date sendTimeStart) {
		this.sendTimeStart = sendTimeStart;
	}

	public Date getSendTimeEnd() {
		if(sendTimeEnd!=null)
			return DateUtils.getEndTime(sendTimeEnd);
		return sendTimeEnd;
	}

	public void setSendTimeEnd(Date sendTimeEnd) {
		this.sendTimeEnd = sendTimeEnd;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getAtt1() {
		return att1;
	}

	public void setAtt1(String att1) {
		this.att1 = att1;
	}

	public String getAtt2() {
		return att2;
	}

	public void setAtt2(String att2) {
		this.att2 = att2;
	}

	public ShopOrderType getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(ShopOrderType orderStatus) {
		this.orderStatus = orderStatus;
	}

	public String toQueryString(){
		String str="";
		if(this.orderTimeStart != null){
			str = str +"orderTimeStart="+DateUtils.getDateFromString(this.orderTimeStart)+"&";
		}
		if(this.orderTimeEnd != null){
			str = str +"orderTimeEnd="+DateUtils.getDateFromString(this.orderTimeEnd)+"&";
		}
		if(this.payedAtStart!=null){
			str = str +"payedAtStart="+DateUtils.getDateFromString(this.payedAtStart)+"&";
		}
		if(this.payedAtEnd!=null){
			str = str +"payedAtEnd="+DateUtils.getDateFromString(this.payedAtEnd)+"&";
		}
		if(this.sendTimeStart!=null){
			str = str +"sendTimeStart="+DateUtils.getDateFromString(this.sendTimeStart)+"&";
		}
		if(this.sendTimeEnd!=null){
			str = str +"sendTimeEnd="+DateUtils.getDateFromString(this.sendTimeEnd)+"&";
		}
		if(!StringUtils.isBlank(this.orderNumber)){
			str = str +"orderNumber="+this.orderNumber+"&";
		}
		if(!StringUtils.isBlank(this.productName)){
			str = str +"productName="+this.productName+"&";
		}
		if(!StringUtils.isBlank(this.att1)){
			str = str +"att1="+this.att1+"&";
		}
		if(!StringUtils.isBlank(this.att2)){
			str = str +"att2="+this.att2+"&";
		}
		if(this.orderStatus!=null){
			str = str +"orderStatus="+this.orderStatus.getId()+"&";
		}
		return str;
	}
	
}
