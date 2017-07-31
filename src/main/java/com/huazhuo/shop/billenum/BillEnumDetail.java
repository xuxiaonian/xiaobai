package com.huazhuo.shop.billenum;

public enum BillEnumDetail {
	

	income(0, "\u6536\u5165"), 
	out(1, "\u652F\u51FA");
	private int value;
	private String name;

	private BillEnumDetail(int value, String name) {
		this.value = value;
		this.name = name;
	}

	public int value() {
		return this.value;
	}

	public String getName() {
		return this.name;
	}
}
