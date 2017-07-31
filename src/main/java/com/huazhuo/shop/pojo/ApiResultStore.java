package com.huazhuo.shop.pojo;

import java.util.List;

import com.huazhuo.shop.domain.ProductBrand;

public class ApiResultStore {
	
	private Header header;
	
	private List<ProductBrand> date;

	public Header getHeader() {
		return header;
	}

	public void setHeader(Header header) {
		this.header = header;
	}

	public List<ProductBrand> getDate() {
		return date;
	}

	public void setDate(List<ProductBrand> date) {
		this.date = date;
	}

	
	
}
