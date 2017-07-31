package com.huazhuo.shop.pojo;

import java.math.BigDecimal;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

/*
 * 首页显示类
 */
public class IndexPoJo {
	
	private Long staySend;//	待发货
	
	private Long stayPay;//	待付款
	
	private Long stayReturnPay;//	待处理退款申请
	
	private Long onSale;//	销售中商品
	
	private Long noSale;//	仓库中商品
	
	private Long stayStatus;//	待审核
	
	private Long generateBill;//	待确定账单
	@DateTimeFormat(style = "M-")
	private Date yesterDateStart;//昨日时间
	@DateTimeFormat(style = "M-")
	private Date yesterDateEnd;//昨日时间
	@DateTimeFormat(style = "M-")
	private Date lastWeekDateStart;//上周时间
	@DateTimeFormat(style = "M-")
	private Date lastWeekDateEnd;//上周时间
	@DateTimeFormat(style = "M-")
	private Date lastMonthDateStart;//上月时间
	@DateTimeFormat(style = "M-")
	private Date lastMonthDateEnd;//上月时间
	
	private Integer yesterDay;//	昨日订单量
	
	private BigDecimal yesterDayCost;//	昨日订单金额
	
	private Integer lastWeek;//	周销量
	
	private BigDecimal lastWeekCost;//	周销量金额
	
	private Integer lastMonth;// 月销量
	
	private BigDecimal lastMonthCost;// 月销量金额

	public String getYesterDateStart() {
		if(this.yesterDateStart == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        return format.format(yesterDateStart); 
		
	}

	public void setYesterDateStart(Date yesterDateStart) {
		this.yesterDateStart = yesterDateStart;
	}

	public String getYesterDateEnd() {
		if(this.yesterDateEnd == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        return format.format(yesterDateEnd); 
	}

	public void setYesterDateEnd(Date yesterDateEnd) {
		this.yesterDateEnd = yesterDateEnd;
	}

	public String getLastWeekDateStart() {
		if(this.lastWeekDateStart == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        return format.format(lastWeekDateStart); 
		
	}

	public void setLastWeekDateStart(Date lastWeekDateStart) {
		this.lastWeekDateStart = lastWeekDateStart;
	}

	public String getLastWeekDateEnd() {
		if(this.lastWeekDateEnd == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        return format.format(lastWeekDateEnd); 
	}

	public void setLastWeekDateEnd(Date lastWeekDateEnd) {
		this.lastWeekDateEnd = lastWeekDateEnd;
	}

	public String getLastMonthDateStart() {
		if(this.lastMonthDateStart == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        return format.format(lastMonthDateStart); 
	}

	public void setLastMonthDateStart(Date lastMonthDateStart) {
		this.lastMonthDateStart = lastMonthDateStart;
	}

	public String getLastMonthDateEnd() {
		if(this.lastMonthDateEnd == null){
			return null;
		}
        DateFormat format = new SimpleDateFormat("yyyy-MM-dd");  
        return format.format(lastMonthDateEnd); 
	}

	public void setLastMonthDateEnd(Date lastMonthDateEnd) {
		this.lastMonthDateEnd = lastMonthDateEnd;
	}

	public Long getGenerateBill() {
		return generateBill;
	}

	public void setGenerateBill(Long generateBill) {
		this.generateBill = generateBill;
	}

	public Long getStaySend() {
		return staySend;
	}

	public void setStaySend(Long staySend) {
		this.staySend = staySend;
	}

	public Long getStayPay() {
		return stayPay;
	}

	public void setStayPay(Long stayPay) {
		this.stayPay = stayPay;
	}

	public Long getStayReturnPay() {
		return stayReturnPay;
	}

	public void setStayReturnPay(Long stayReturnPay) {
		this.stayReturnPay = stayReturnPay;
	}

	public Long getOnSale() {
		return onSale;
	}

	public void setOnSale(Long onSale) {
		this.onSale = onSale;
	}

	public Long getNoSale() {
		return noSale;
	}

	public void setNoSale(Long noSale) {
		this.noSale = noSale;
	}

	public Long getStayStatus() {
		return stayStatus;
	}

	public void setStayStatus(Long stayStatus) {
		this.stayStatus = stayStatus;
	}

	public Integer getYesterDay() {
		return yesterDay;
	}

	public void setYesterDay(Integer yesterDay) {
		this.yesterDay = yesterDay;
	}

	public BigDecimal getYesterDayCost() {
		return yesterDayCost;
	}

	public void setYesterDayCost(BigDecimal yesterDayCost) {
		this.yesterDayCost = yesterDayCost;
	}

	public Integer getLastWeek() {
		return lastWeek;
	}

	public void setLastWeek(Integer lastWeek) {
		this.lastWeek = lastWeek;
	}

	public BigDecimal getLastWeekCost() {
		return lastWeekCost;
	}

	public void setLastWeekCost(BigDecimal lastWeekCost) {
		this.lastWeekCost = lastWeekCost;
	}

	public Integer getLastMonth() {
		return lastMonth;
	}

	public void setLastMonth(Integer lastMonth) {
		this.lastMonth = lastMonth;
	}

	public BigDecimal getLastMonthCost() {
		return lastMonthCost;
	}

	public void setLastMonthCost(BigDecimal lastMonthCost) {
		this.lastMonthCost = lastMonthCost;
	}
	
}
