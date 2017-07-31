package com.huazhuo.shop.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class History {
	@DateTimeFormat(style = "M-")
	private Date time;       //开始时间 
  
	private String name;   //操作人
	private String operation;   //操作
	private String remarks;   //备注
	public String getTime() {
		if(this.time == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss ");  
        return format.format(time); 
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getOperation() {
		return operation;
	}
	public void setOperation(String operation) {
		this.operation = operation;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}
	
}
