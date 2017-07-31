package com.huazhuo.shop.pojo;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class ZListPromotion {
	private Integer id;     
	private String rebateName;   //限时活动名称
	private BigDecimal price;   //售价
	private BigDecimal rebatePrice; //活动价
	@DateTimeFormat(style = "M-")
	private Date startTime;       //开始时间
	@DateTimeFormat(style = "M-")
	private Date endTime;         //结束时间
	private String rebateStatus; //活动状态
	private Integer shopId;        //店铺id
	private Integer productId;        //商品id
	private Integer productsSpecId;        //商品规格id
	private Date createTime;        //创建时间
	private Date modifyTime;        //修改时间
	private Integer position;          // 位置
	private Integer isDeleted;       // 是否删除
	private Integer productNum;    //参与数量
	private Integer rewardRatio;   //分佣比例
	private byte productLimit;   //分佣比例
	private String productsSpecName; //活动状态
//	private String operName; //当前用户
//	private Integer operId;  //当前用户Id

	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getRebateName() {
		return rebateName;
	}
	public void setRebateName(String rebateName) {
		this.rebateName = rebateName;
	}
	public BigDecimal getPrice() {
		return price;
	}
	public void setPrice(BigDecimal price) {
		this.price = price;
	}
	public BigDecimal getRebatePrice() {
		return rebatePrice;
	}
	public void setRebatePrice(BigDecimal rebatePrice) {
		this.rebatePrice = rebatePrice;
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
		if(this.startTime == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  
        return format.format(endTime); 
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	public String getRebateStatus() {
		return rebateStatus;
	}
	public void setRebateStatus(String rebateStatus) {
		this.rebateStatus = rebateStatus;
	}
	public Integer getShopId() {
		return shopId;
	}
	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}
	public Integer getProductId() {
		return productId;
	}
	public void setProductId(Integer productId) {
		this.productId = productId;
	}
	public Integer getProductsSpecId() {
		return productsSpecId;
	}
	public void setProductsSpecId(Integer productsSpecId) {
		this.productsSpecId = productsSpecId;
	}
	public String getCreateTime() {
		if(this.startTime == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss ");  
        return format.format(createTime); 
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getModifyTime() {
		return modifyTime;
	}
	public void setModifyTime(Date modifyTime) {
		this.modifyTime = modifyTime;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public Integer getIsDeleted() {
		return isDeleted;
	}
	public void setIsDeleted(Integer isDeleted) {
		this.isDeleted = isDeleted;
	}
	public Integer getProductNum() {
		return productNum;
	}
	public void setProductNum(Integer productNum) {
		this.productNum = productNum;
	}
	public Integer getRewardRatio() {
		return rewardRatio;
	}
	public void setRewardRatio(Integer rewardRatio) {
		this.rewardRatio = rewardRatio;
	}
	public byte getProductLimit() {
		return productLimit;
	}
	public void setProductLimit(byte productLimit) {
		this.productLimit = productLimit;
	}
	public String getProductsSpecName() {
		return productsSpecName;
	}
	public void setProductsSpecName(String productsSpecName) {
		this.productsSpecName = productsSpecName;
	}
	

}
