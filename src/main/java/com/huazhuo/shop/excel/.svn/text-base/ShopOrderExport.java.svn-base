package com.huazhuo.shop.excel;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFDataFormat;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.util.CellRangeAddress;

public class ShopOrderExport {
	public static String exportExcelRecommendation(List<Map<String,Object>> mapData,Integer type,String path) throws IOException{
		  //创建HSSFWorkbook对象(excel的文档对象)  
	      HSSFWorkbook wkb = new HSSFWorkbook();  
	      HSSFCellStyle cellStyle = wkb.createCellStyle(); 
	      cellStyle.setAlignment(HSSFCellStyle.ALIGN_CENTER); // 居中
		  //建立新的sheet对象（excel的表单）  
		  HSSFSheet sheet=wkb.createSheet(exportType(type));  
		  //在sheet里创建第一行，参数为行索引(excel的行)，可以是0～65535之间的任何一个  
		  HSSFRow row1=sheet.createRow(0);
		  row1.setHeightInPoints(20);  
		  //创建单元格（excel的单元格，参数为列索引，可以是0～255之间的任何一个  
		  HSSFCell cell=row1.createCell(0);  
	      //设置单元格内容  
		  cell.setCellValue("订单列表"); 
		  cell.setCellStyle(cellStyle);
		  //合并单元格CellRangeAddress构造参数依次表示起始行，截至行，起始列， 截至列  
		  sheet.addMergedRegion(new CellRangeAddress(0,0,0,11));  
		  sheet.setColumnWidth(0, 20 * 300); 
		  sheet.setColumnWidth(1, 20 * 300); 
		  sheet.setColumnWidth(2, 20 * 200); 
		  sheet.setColumnWidth(3, 20 * 300); 
		  sheet.setColumnWidth(4, 20 * 300); 
		  sheet.setColumnWidth(5, 20 * 300); 
		  sheet.setColumnWidth(6, 20 * 300); 
		  sheet.setColumnWidth(7, 20 * 300); 
		  sheet.setColumnWidth(8, 20 * 300); 
		  sheet.setColumnWidth(9, 20 * 300); 
		  sheet.setColumnWidth(10, 20 * 300);
		  sheet.setColumnWidth(11, 20 * 300); 
			//在sheet里创建第二行  
	      HSSFRow row2=sheet.createRow(1); 
	      row2.setHeightInPoints(20);  
	      //订单号	 商铺名称	订单金额	订单状态	平台总佣金	推荐人佣金	提现状态	提现时间	操作人
	      //创建单元格并设置单元格内容   setCellType(HSSFCell.CELL_TYPE_STRING);
	      row2.createCell(0).setCellValue("订单编号"); 
	      row2.createCell(1).setCellValue("商品名称");      
	      row2.createCell(2).setCellValue("规格");  
	      row2.createCell(3).setCellValue("付款时间");  
	      row2.createCell(4).setCellValue("收件人");
	      row2.createCell(5).setCellValue("电话");
	      row2.createCell(6).setCellValue("地址");
	      row2.createCell(7).setCellValue("购买数量");
	      row2.createCell(8).setCellValue("商品单价");
	      row2.createCell(9).setCellValue("买家留言");
	      row2.createCell(10).setCellValue("交易状态");      
	      row2.createCell(11).setCellValue("退款状态");    
	      //在sheet里创建第三行  
	      HSSFRow row3=null;
	      String fileName=null;
    	  fileName="Excel/"+UUID.randomUUID()+".xls";
    	  int m=0;
    	  HSSFCell cell2 = null;
    	  //新增的四句话，设置CELL格式为文本格式  
          HSSFCellStyle cellStyle2 = wkb.createCellStyle();  
          HSSFDataFormat format = wkb.createDataFormat();  
          cellStyle2.setDataFormat(format.getFormat("@"));  
    	  for(Map<String,Object>map:mapData){
    		  row3=sheet.createRow(2+m);  
	    	  row3.setHeightInPoints(20);  
	    	  cell2 = row3.createCell(0);
	    	  cell2.setCellStyle(cellStyle2);  
	    	  cell2.setCellValue(map.get("order_number").toString()+"");   
	    	  cell2.setCellType(HSSFCell.CELL_TYPE_STRING); 
	    	  //row3.createCell(0).setCellValue(map.get("order_number").toString()+"");  
	    	  row3.createCell(1).setCellValue(map.get("product_name").toString());  
	    	  row3.createCell(2).setCellValue(map.get("product_property")==null?"":map.get("product_property").toString());      
	    	  row3.createCell(3).setCellValue(map.get("payedAt")==null?"":map.get("payedAt").toString()); 
	    	  row3.createCell(4).setCellValue(map.get("att1")==null?"":map.get("att1").toString());
	    	  row3.createCell(5).setCellValue(map.get("att2")==null?"":map.get("att2").toString());
	    	  row3.createCell(6).setCellValue(map.get("address")==null?"":map.get("address").toString());
	    	  row3.createCell(7).setCellValue((Long)map.get("buy_couts"));
	    	  row3.createCell(8).setCellValue(map.get("price")==null?"":map.get("price").toString());
	    	  row3.createCell(9).setCellValue(map.get("remarks")==null?"":map.get("remarks").toString());
	    	  row3.createCell(10).setCellValue(business(Integer.valueOf(map.get("order_status").toString()))); 
	    	  Integer shop_order_retrun_type=(Integer) (map.get("shop_order_retrun_type")==null?0:map.get("shop_order_retrun_type"));
	    	  row3.createCell(11).setCellValue(retrunType(shop_order_retrun_type));
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
	/**
	 * 导出类型
	 * @param type
	 * @return
	 */
	private static String exportType(Integer type){
		String str="";
		switch (type) {
		case 0:
		    str="全部";
		    break;
		case 1:
		    str="待付款";
		    break;
		case 2:
		    str="待发货";
		    break;
		case 3:
		    str="已发货";
		    break; 
		case 4:
		    str="交易成功";
		    break; 
		case 5:
		    str="交易失败";
		    break; 
		}
		return str;
	}
	private static String retrunType(Integer orderStatus){
		String str="";
		switch (orderStatus) {
		case 0:
		    str="";
		    break;
		case 1:
		    str="已申请待处理";
		    break;
		case 2:
		    str="等待买家寄回退货";
		    break;
		case 3:
		    str="待商家验货处理";
		    break; 
		case 4:
		    str="待平台退款";
		    break; 
		case 5:
		    str="退款成功";
		    break; 
		case 6:
		    str="退款关闭";
		    break; 
		}
		return str;
	}
	private static String business(Integer orderStatus){
		String str="";
		switch (orderStatus) {
		case 0:
		    str="全部";
		    break;
		case 1:
		    str="待付款";
		    break;
		case 2:
		    str="待发货";
		    break;
		case 3:
		    str="已发货";
		    break; 
		case 4:
		    str="交易成功";
		    break; 
		case 5:
		    str="交易失败";
		    break;
		case 6:
		    str="已评价";
		    break;
		case 7:
		    str="交易失败";
		    break;
		case 8:
		    str="交易失败";
		    break; 
		}
		return str;
	}
	
	
	public static void main(String[] args) throws IOException {
		System.out.println(ShopOrderExport.exportExcelRecommendation(new ArrayList<Map<String,Object>>(),1,"E:/"));
	}
}
