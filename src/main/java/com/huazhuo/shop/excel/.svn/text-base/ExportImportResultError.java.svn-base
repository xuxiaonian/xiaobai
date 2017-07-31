package com.huazhuo.shop.excel;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.UUID;

import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;

import com.huazhuo.shop.model.OrderExcel;

public class ExportImportResultError {
	public static String exportExcelRecommendation(List<OrderExcel> mapData,String path) throws IOException{
		  //创建HSSFWorkbook对象(excel的文档对象)  
	      HSSFWorkbook wkb = new HSSFWorkbook();  
	      HSSFCellStyle cellStyle = wkb.createCellStyle(); 
	      cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
		  //建立新的sheet对象（excel的表单）  
		  HSSFSheet sheet=wkb.createSheet("导入错误结果");  
		  //在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个  
		  HSSFRow row1=sheet.createRow(0);
		  row1.setHeightInPoints(20);  
		  
		  sheet.setColumnWidth(0, 20 * 300); 
		  sheet.setColumnWidth(1, 20 * 300); 
		  sheet.setColumnWidth(2, 20 * 200); 
			//在sheet里创建第二行  
	     // HSSFRow row2=sheet.createRow(1); 
	     // row2.setHeightInPoints(20);  
	      //订单号	 商铺名称	订单金额	订单状态	平台总佣金	推荐人佣金	提现状态	提现时间	操作人
	      //创建单元格并设置单元格内容  
	      row1.createCell(0).setCellValue("订单编号"); 
	      row1.createCell(1).setCellValue("快递名称");      
	      row1.createCell(2).setCellValue("快递单号");   
	      HSSFRow row2=null;
	      String fileName=null;
	  	  fileName="Excel/"+UUID.randomUUID()+".xls";
	  	  int m=0;
	  	  for(OrderExcel oe:mapData){
	  		  	row2=sheet.createRow(1+m);  
				row2.setHeightInPoints(20);  
				row2.createCell(0).setCellValue(" "+oe.getOrderId()+"");  
				row2.createCell(1).setCellValue(" "+oe.getDelivery()+"");  
				row2.createCell(2).setCellValue(" "+oe.getDeliveryId()+"");      
    	    	m++;
	  	  }
	      //.....省略部分代码  
	       //输出Excel文件  
	      FileOutputStream output=new FileOutputStream(path+"/"+fileName);  
	      wkb.write(output);
	      output.flush();
	      output.close();
		  return fileName;
	}
}
