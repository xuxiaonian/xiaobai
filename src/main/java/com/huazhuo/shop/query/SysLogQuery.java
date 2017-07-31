package com.huazhuo.shop.query;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.StringUtils;

public class SysLogQuery {

	@DateTimeFormat(style = "M-")
	private Date startDate;// 开始时间

	@DateTimeFormat(style = "M-")
	private Date endDate;// 结束时间

	private String content;// 内容

	private String operator;
	
	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		if(endDate!=null)
			return DateUtils.getEndTime(endDate);
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getOperator() {
		return operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public String toQueryString(){
		String str="";
		if(this.startDate != null){
			str = str +"startDate="+DateUtils.getDateFromString(this.startDate)+"&";
		}
		if(this.endDate != null){
			str = str +"endDate="+DateUtils.getDateFromString(this.endDate)+"&";
		}
		if(!StringUtils.isBlank(this.content)){
			str = str +"content="+this.content+"&";
		}
		if(!StringUtils.isBlank(this.operator)){
			str = str +"operator="+this.operator+"&";
		}
		return str;
	}
	
}
