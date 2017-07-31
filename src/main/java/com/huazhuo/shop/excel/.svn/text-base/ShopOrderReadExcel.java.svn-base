package com.huazhuo.shop.excel;



import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.poi.openxml4j.exceptions.InvalidFormatException;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellStyle;
import org.apache.poi.ss.usermodel.DataFormat;
import org.apache.poi.ss.usermodel.DateUtil;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;
import org.apache.poi.ss.usermodel.WorkbookFactory;

import com.huazhuo.shop.model.OrderExcel;



public class ShopOrderReadExcel {
	 static SimpleDateFormat sFormat = new SimpleDateFormat("yyyy-MM-dd");
	 private static Workbook book =null;
	 private static FileInputStream fis=null;
	 private static Sheet  sheet =null;
	 static Map<String,CellStyle> styleMap = new HashMap<String,CellStyle>(); //存储单元格样式的Map
	 
	 public ShopOrderReadExcel(FileInputStream fis) throws IOException {
		this.fis = fis;
		book = getExcelWorkbook();
		sheet= getSheetByNum(book,1);
	}
   public static void main(String[] args) throws IOException {
	   ShopOrderReadExcel readExcel=new ShopOrderReadExcel(new FileInputStream(new File("E:\\物流信息的导入.xls")));
	   readExcel.readExcel();
	
}
	public  List <OrderExcel> readExcel() throws IOException{
		if(sheet==null){
			System.out.println("文件不存在");
			return null;
		}
		int lastRowNum = sheet.getLastRowNum();//获取几行
		Row row = null;
		List <OrderExcel> list=new ArrayList<OrderExcel>();
		OrderExcel orderExcel=null;
		for(int i=0;i<=lastRowNum;i++){
			row = sheet.getRow(i);
			System.out.println(row);
			if(row != null && i >=1){
				System.out.println("正在读第"+(i+1)+"行：");
				int lastCellNum = row.getLastCellNum();
				if(lastCellNum!=3){
					return list;
				}
				Cell cell = null;
				StringBuilder sb = null;
				orderExcel = new OrderExcel();
				for(int j=0;j<lastCellNum;j++){
					cell = row.getCell(j);
					if(cell != null){
						sb = new StringBuilder("第"+(j+1)+"列的单元格内容是：");
						String type_cn = null;
						String type_style = cell.getCellStyle().getDataFormatString().toUpperCase();
						String type_style_cn = getCellStyleByChinese(type_style);
						int type = cell.getCellType();
						String value = "";
						switch (type) {
							case 0:
								if(DateUtil.isCellDateFormatted(cell)){
									type_cn = "NUMBER-DATE";
									Date date = cell.getDateCellValue();
									value = sFormat.format(date);
								}else {
									type_cn = "NUMBER";
									double tempValue = cell.getNumericCellValue();
									value = String.valueOf(tempValue);
								}
								break;
							case 1:
								type_cn = "STRING";
								value = cell.getStringCellValue();
								break;
							case 2:
								type_cn = "FORMULA";
								value = cell.getCellFormula();
								break;
							case 3:
								type_cn = "BLANK";
								value = cell.getStringCellValue();
								break;
							case 4:
								type_cn = "BOOLEAN";
								boolean tempValue = cell.getBooleanCellValue();
								value = String.valueOf(tempValue);
								break;
							case 5:
								type_cn = "ERROR";
								byte b = cell.getErrorCellValue();
								value = String.valueOf(b);
							default:
								break;
						}
						System.out.println(sb.toString());
						if(value!=null && value.equals("结束")){
							break;
						}
						if(j==0){
							orderExcel.setOrderId(value);
						}
						if(j==1){
							orderExcel.setDelivery(value);
						}
						if(j==2){
							orderExcel.setDeliveryId(value);
						}
					}
				}
				if(orderExcel.getOrderId()!=null){
					list.add(orderExcel);
				}
			}
		}
		return list;
	 }
	/**
	 * 根据单元格的格式 返回单元格的格式中文
	 * @param type_style
	 * @return
	 */
	private static String getCellStyleByChinese(String type_style) {
		String cell_style_cn = "";
		if(type_style.contains("GENERAL")){
			cell_style_cn = "常规";
		}else if(type_style.equals("_ * #,##0.00_ ;_ * \\-#,##0.00_ ;_ * \"-\"??_ ;_ @_ ")){
			cell_style_cn = "会计专用";
		}else if(type_style.equals("0")){
			cell_style_cn = "整数";
		}else if(type_style.contains("YYYY/MM") || type_style.contains("YYYY\\-MM")){
			cell_style_cn = "日期";
		}else if(type_style.equals("0.00%")){
			cell_style_cn = "百分比";
		}else {
			cell_style_cn = "不符合规定格式类型:"+type_style;
//			cell_style_cn = type_style;
		}
		return cell_style_cn;
	}
	/**
	 * 获取excel的Workbook
	 * @throws IOException 
	 */
	public static Workbook getExcelWorkbook() throws IOException{
		try {
			book = WorkbookFactory.create(fis);
		} catch (InvalidFormatException e) {
			e.printStackTrace();
		}
		initstyle(book);
		return book;
	}
	public static void initstyle(Workbook book){
		DataFormat hssfDF = book.createDataFormat();
		CellStyle doubleStyle = book.createCellStyle();
		doubleStyle.setDataFormat(hssfDF.getFormat("@"));  
		styleMap.put("STRING", doubleStyle);
	}
	
	
	
	/**
	 * 初始化格式Map
	 */
	public static void initStyleMap(Workbook book){
		DataFormat hssfDF = book.createDataFormat();
		CellStyle doubleStyle = book.createCellStyle(); //会计专用
		doubleStyle.setDataFormat(hssfDF.getFormat("_ * #,##0.00_ ;_ * \\-#,##0.00_ ;_ * \"-\"??_ ;_ @_ ")); //poi写入后为会计专用
		styleMap.put("DOUBLE", doubleStyle);
		CellStyle intStyle = book.createCellStyle(); //会计专用
		intStyle.setDataFormat(hssfDF.getFormat("0")); //poi写入后为会计专用
		styleMap.put("INT", intStyle);
        CellStyle yyyyMMddStyle = book.createCellStyle();//日期yyyyMMdd
        yyyyMMddStyle.setDataFormat(hssfDF.getFormat("yyyy-MM-dd"));
        styleMap.put("DATE", yyyyMMddStyle);
        CellStyle percentStyle = book.createCellStyle();//百分比
        percentStyle.setDataFormat(hssfDF.getFormat("0.00%"));
        styleMap.put("PERCENT", percentStyle);
	}
	/**
	 * 根据索引 返回Sheet
	 * @param number
	 */
	public static Sheet getSheetByNum(Workbook book,int number){
		Sheet sheet = null;
		try {
			sheet = book.getSheetAt(number-1);
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		}
		return sheet;
	}
}
