package com.huazhuo.shop.query;

import com.huazhuo.shop.util.StringUtils;

public class ShoppingProductQuery {

	private Integer shoppingCategoryId;// 分类

	private String name;// 商品名称

	private String productNumber;// 商家货号

	private String sysNumber;// 平台货号

	private Integer shopId;// 商店ID

	private Integer onSale;// 是否上架 0未上架 1上架

	private Integer review;// 是否审核 0待审核 1审核通过 2仓库 3审核未通过

	private Integer noReview;// 是否审核 0待审核 1审核通过 2仓库 3审核未通过

	private Boolean store;//是否在仓库
	
	private Boolean isExpect;//是否是预售商品
	

	public Boolean getStore() {
		return store;
	}

	public void setStore(Boolean store) {
		this.store = store;
	}

	public Integer getNoReview() {
		return noReview;
	}

	public void setNoReview(Integer noReview) {
		this.noReview = noReview;
	}

	public Integer getReview() {
		return review;
	}

	public void setReview(Integer review) {
		this.review = review;
	}

	public Integer getOnSale() {
		return onSale;
	}

	public void setOnSale(Integer onSale) {
		this.onSale = onSale;
	}

	public Integer getShopId() {
		return shopId;
	}

	public void setShopId(Integer shopId) {
		this.shopId = shopId;
	}

	public Integer getShoppingCategoryId() {
		return shoppingCategoryId;
	}

	public void setShoppingCategoryId(Integer shoppingCategoryId) {
		this.shoppingCategoryId = shoppingCategoryId;
	}

	public String getName() {
		return name;
	}

	public Boolean getIsExpect() {
		return isExpect;
	}

	public void setIsExpect(Boolean isExpect) {
		this.isExpect = isExpect;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getProductNumber() {
		return productNumber;
	}

	public void setProductNumber(String productNumber) {
		this.productNumber = productNumber;
	}

	public String getSysNumber() {
		return sysNumber;
	}

	public void setSysNumber(String sysNumber) {
		this.sysNumber = sysNumber;
	}

	public String toQueryString() {
		String str = "";

		if (!StringUtils.isBlank(this.name)) {
			str = str + "name=" + this.name + "&";
		}
		if (!StringUtils.isBlank(this.productNumber)) {
			str = str + "productNumber=" + this.productNumber + "&";
		}
		if (!StringUtils.isBlank(this.sysNumber)) {
			str = str + "sysNumber=" + this.sysNumber + "&";
		}
		if (this.shoppingCategoryId != null) {
			str = str + "shoppingCategoryId=" + this.shoppingCategoryId + "&";
		}
		if (this.onSale != null) {
			str = str + "onSale=" + this.onSale + "&";
		}
		if (this.review != null) {
			str = str + "review=" + this.review + "&";
		}
		if (this.noReview != null) {
			str = str + "noReview=" + this.noReview + "&";
		}
		if (this.store != null) {
			str = str + "store=" + this.store + "&";
		}
		if (this.isExpect != null) {
			str = str + "isExpect=" + this.isExpect + "&";
		}
		return str;
	}

	@Override
	public String toString() {
		return "ShoppingProductQuery [shoppingCategoryId=" + shoppingCategoryId + ", name=" + name + ", productNumber="
				+ productNumber + ", sysNumber=" + sysNumber + ", shopId=" + shopId + ", onSale=" + onSale + ", review="
				+ review + ", noReview=" + noReview + ", store=" + store + ", isExpect=" + isExpect + "]";
	}

}
