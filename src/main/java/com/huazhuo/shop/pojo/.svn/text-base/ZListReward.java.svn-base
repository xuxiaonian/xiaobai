package com.huazhuo.shop.pojo;

import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ZListReward {
	private Integer id;     
	private Integer productId;        //商品id
	private String productName;   //商品名称
	
	private Integer rewardRatio;   //悬赏比例

	@DateTimeFormat(style = "M-")
	private Date startTime;       //开始时间
	@DateTimeFormat(style = "M-")
	private Date endTime;         //结束时间
	@DateTimeFormat(style = "M-")
	private Date createTime;        //创建时间
	private String rewardStatus; //活动状态
	
	private String remarks; //备注
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public String getProductName() {
		return productName;
	}
	public void setProductName(String productName) {
		this.productName = productName;
	}
	public Integer getRewardRatio() {
		return rewardRatio;
	}
	public void setRewardRatio(Integer rewardRatio) {
		this.rewardRatio = rewardRatio;
	}
	public String getStartTime() {
		if(this.startTime == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  
        return format.format(startTime); 
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		if(this.endTime == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  
        return format.format(endTime); 
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getCreateTime() {
		if(this.createTime == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  
        return format.format(createTime); 
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public String getRewardStatus() {
		return rewardStatus;
	}
	public void setRewardStatus(String rewardStatus) {
		this.rewardStatus = rewardStatus;
	}
	public String getRemarks() {
		return remarks;
	}
	public void setRemarks(String remarks) {
		this.remarks = remarks;
	}

	
	
	
}
