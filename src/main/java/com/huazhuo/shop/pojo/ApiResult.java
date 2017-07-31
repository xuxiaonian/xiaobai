package com.huazhuo.shop.pojo;

public class ApiResult<T> {
	
	private Header header;
	
	private T date;

	public ApiResult(){
		
	}
	
	public ApiResult(T date){
		this.date=date;
	}
	
	
	public ApiResult(Integer code){
		Header header = new Header();
		header.setCode(code);
		this.header=header;
	}
	
	public ApiResult(Integer code,String message){
		Header header = new Header();
		header.setCode(code);
		header.setMessage(message);
		this.header=header;
	}
	
	public ApiResult(Integer code,T date){
		Header header = new Header();
		header.setCode(code);
		this.header=header;
		this.date=date;
	}
	
	public Header getHeader() {
		return header;
	}

	public void setHeader(Header header) {
		this.header = header;
	}

	public T getDate() {
		return date;
	}

	public void setDate(T date) {
		this.date = date;
	}
	
}
