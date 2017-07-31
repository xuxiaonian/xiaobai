package com.huazhuo.shop.billenum;

public enum BillShowEnum {
	generate(0, "\u5DF2\u751F\u6210"), 
	enter(1, "\u5DF2\u786E\u8BA4"),
	settle(2, "\u5DF2\u7ED3\u7B97"),
	exceptional(3, "\u5DF2\u751F\u6210(\u5F02\u5E38)"),
	exceptionalChange(4, "\u5DF2\u751F\u6210(\u5DF2\u66F4\u6539)");
	private int value;
	private String name;

	private BillShowEnum(int value, String name) {
		this.value = value;
		this.name = name;
	}

	public int getValue() {
		return this.value;
	}

	public String getName() {
		return this.name;
	}
}
