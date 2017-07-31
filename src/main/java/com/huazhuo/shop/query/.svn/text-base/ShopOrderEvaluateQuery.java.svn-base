package com.huazhuo.shop.query;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.StringUtils;

public class ShopOrderEvaluateQuery {

	private String name;

	@DateTimeFormat(style = "M-")
	private Date evaluateStart;// 评价开始时间

	@DateTimeFormat(style = "M-")
	private Date evaluateEnd;// 评价结束时间

	private Integer shopId;

	private String orderNumber;

	private String content;// 评价内容

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getEvaluateStart() {
		return evaluateStart;
	}

	public void setEvaluateStart(Date evaluateStart) {
		this.evaluateStart = evaluateStart;
	}

	public Date getEvaluateEnd() {
		if(evaluateEnd!=null)
			return DateUtils.getEndTime(evaluateEnd);
		return evaluateEnd;
	}

	public void setEvaluateEnd(Date evaluateEnd) {
		this.evaluateEnd = evaluateEnd;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public String getOrderNumber() {
		return orderNumber;
	}

	public void setOrderNumber(String orderNumber) {
		this.orderNumber = orderNumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String toQueryString() {
		String str = "";
		if (this.evaluateStart != null) {
			str = str + "evaluateStart=" + DateUtils.getDateFromString(this.evaluateStart) + "&";
		}
		if (this.evaluateEnd != null) {
			str = str + "evaluateEnd=" + DateUtils.getDateFromString(this.evaluateEnd) + "&";
		}

		if (!StringUtils.isBlank(this.name)) {
			str = str + "name=" + this.name + "&";
		}

		if (!StringUtils.isBlank(this.orderNumber)) {
			str = str + "orderNumber=" + this.orderNumber + "&";
		}

		if (!StringUtils.isBlank(this.content)) {
			str = str + "content=" + this.content + "&";
		}
		return str;
	}

}
