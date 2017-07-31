package com.huazhuo.shop.query;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.StringUtils;

public class ShopOrderRetrunQuery {

	private ShopOrderRetrunType shopOrderRetrunType;
	
	@DateTimeFormat(style = "M-")
	private Date orderTimeStart;// 订单开始时间

	@DateTimeFormat(style = "M-")
	private Date orderTimeEnd;// 订单结束时间

	@DateTimeFormat(style = "M-")
	private Date payedAtStart;// 支付开始时间

	@DateTimeFormat(style = "M-")
	private Date payedAtEnd;// 支付结束时间
	
	@DateTimeFormat(style = "M-")
	private Date returnAtStart;// 退款申请开始时间

	@DateTimeFormat(style = "M-")
	private Date returnAtEnd;// 退款申请结束时间
	
	private String orderNumber;//	订单编号
	
	private String returnNumber;//	退款编号

	private Integer shopId;//	商户Id
	
	private Boolean isDel;//是否删除
	
	public Boolean getIsDel() {
		return isDel;
	}

	public void setIsDel(Boolean isDel) {
		this.isDel = isDel;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public ShopOrderRetrunType getShopOrderRetrunType() {
		return shopOrderRetrunType;
	}

	public void setShopOrderRetrunType(ShopOrderRetrunType shopOrderRetrunType) {
		this.shopOrderRetrunType = shopOrderRetrunType;
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

	public Date getReturnAtStart() {
		return returnAtStart;
	}

	public void setReturnAtStart(Date returnAtStart) {
		this.returnAtStart = returnAtStart;
	}

	public Date getReturnAtEnd() {
		if(returnAtEnd!=null)
			return DateUtils.getEndTime(returnAtEnd);
		return returnAtEnd;
	}

	public void setReturnAtEnd(Date returnAtEnd) {
		this.returnAtEnd = returnAtEnd;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getReturnNumber() {
		return returnNumber;
	}

	public void setReturnNumber(String returnNumber) {
		this.returnNumber = returnNumber;
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
		if(this.returnAtStart!=null){
			str = str +"returnAtStart="+DateUtils.getDateFromString(this.returnAtStart)+"&";
		}
		if(this.returnAtEnd!=null){
			str = str +"returnAtEnd="+DateUtils.getDateFromString(this.returnAtEnd)+"&";
		}
		if(!StringUtils.isBlank(this.orderNumber)){
			str = str +"orderNumber="+this.orderNumber+"&";
		}
		if(!StringUtils.isBlank(this.returnNumber)){
			str = str +"returnNumber="+this.returnNumber+"&";
		}
		if(this.shopOrderRetrunType!=null){
			str = str +"shopOrderRetrunType="+this.shopOrderRetrunType.getId()+"&";
		}
		return str;
	}
	
}
