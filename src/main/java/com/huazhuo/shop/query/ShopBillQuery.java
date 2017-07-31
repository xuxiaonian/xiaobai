package com.huazhuo.shop.query;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.StringUtils;

public class ShopBillQuery {

	@DateTimeFormat(style = "M-")
	private Date billStart;//

	@DateTimeFormat(style = "M-")
	private Date billEnd;//

	@DateTimeFormat(style = "M-")
	private Date createDateStart;//

	@DateTimeFormat(style = "M-")
	private Date createDateEnd;//

	private String billNumber;// 账单编号

	private Integer billEnum;// 账单状态

	private Integer billShowEnum;// 账单实际状态
	
	private Integer shopId;// 商店ID
	
	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Date getBillStart() {
		return billStart;
	}

	public void setBillStart(Date billStart) {
		this.billStart = billStart;
	}

	public Date getBillEnd() {
		if(billEnd!=null)
			return DateUtils.getEndTime(billEnd);
		return billEnd;
	}

	public void setBillEnd(Date billEnd) {
		this.billEnd = billEnd;
	}

	public Date getCreateDateStart() {
		return createDateStart;
	}

	public void setCreateDateStart(Date createDateStart) {
		this.createDateStart = createDateStart;
	}

	public Date getCreateDateEnd() {
		return createDateEnd;
	}

	public void setCreateDateEnd(Date createDateEnd) {
		this.createDateEnd = createDateEnd;
	}

	public String getBillNumber() {
		return billNumber;
	}

	public void setBillNumber(String billNumber) {
		this.billNumber = billNumber;
	}

	
	public Integer getBillEnum() {
		return billEnum;
	}

	public void setBillEnum(Integer billEnum) {
		this.billEnum = billEnum;
	}

	public Integer getBillShowEnum() {
		return billShowEnum;
	}

	public void setBillShowEnum(Integer billShowEnum) {
		this.billShowEnum = billShowEnum;
	}

	public String toQueryString(){
		String str="";
		if(this.billStart != null){
			str = str +"billStart="+DateUtils.getDateFromString(this.billStart)+"&";
		}
		if(this.billEnd != null){
			str = str +"billEnd="+DateUtils.getDateFromString(this.billEnd)+"&";
		}
		if(this.createDateStart!=null){
			str = str +"createDateStart="+DateUtils.getDateFromString(this.createDateStart)+"&";
		}
		if(this.createDateEnd!=null){
			str = str +"createDateEnd="+DateUtils.getDateFromString(this.createDateEnd)+"&";
		}
		if(!StringUtils.isBlank(this.billNumber)){
			str = str +"billNumber="+this.billNumber+"&";
		}
		if(this.billEnum!=null){
			str = str +"billEnum="+this.billEnum+"&";
		}
		return str;
	}
}
