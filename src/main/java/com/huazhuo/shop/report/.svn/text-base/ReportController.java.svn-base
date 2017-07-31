package com.huazhuo.shop.report;

import java.io.IOException;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.apache.poi.hssf.usermodel.HSSFCell;
import org.apache.poi.hssf.usermodel.HSSFCellStyle;
import org.apache.poi.hssf.usermodel.HSSFFont;
import org.apache.poi.hssf.usermodel.HSSFRichTextString;
import org.apache.poi.hssf.usermodel.HSSFRow;
import org.apache.poi.hssf.usermodel.HSSFSheet;
import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.hssf.util.CellRangeAddress;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.bill.ShopBill;
import com.huazhuo.shop.bill.ShopBillDetail;
import com.huazhuo.shop.domain.ShopOrderList;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.query.ShopBillQuery;
import com.huazhuo.shop.util.DateUtils;

@RequestMapping("/report")
@Controller
@SessionAttributes({ "subtree", "shop","sessionShopId" })
public class ReportController {

	@RequestMapping(produces = "text/html", params = "expExcel", method = RequestMethod.GET)
	public void expExcel(@Valid ShopBillQuery shopBillQuery, @ModelAttribute("sessionShopId") Integer shop,Model uiModel, HttpServletRequest request, HttpServletResponse response) throws IOException {
		ShopOrderType shopOrderType = ShopOrderType.findShopOrderType(4);
		List<ShopOrders> shopOrders = ShopOrders.findShopOrder(shopBillQuery.getBillStart(), shopBillQuery.getBillEnd(), shopOrderType, true,shop);
		ShopBill shopBill = ShopBill.getShopBill(shopBillQuery.getBillStart(), shopBillQuery.getBillEnd(), shopOrders,shop);

		// 生成提示信息，
		response.setContentType("application/vnd.ms-excel");
		String codedFileName = DateUtils.getDateFromString(shopBill.getBillStart())+"-"+DateUtils.getDateFromString(shopBill.getBillEnd())+"\u8D26\u5355\u8868\uFF08\u672A\u7ED3\u7B97\uFF09";
		OutputStream fOut = null;
		try {
			// 进行转码，使其支持中文文件名
			codedFileName = java.net.URLEncoder.encode(codedFileName, "UTF-8");
			response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
			// response.addHeader("Content-Disposition",
			// "attachment;   filename=" + codedFileName + ".xls");
			// 产生工作簿对象
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 产生工作表对象
			HSSFSheet sheet = workbook.createSheet();
			sheet.setColumnWidth(0, 5000);
			sheet.setColumnWidth(1, 5000);
			sheet.setColumnWidth(2, 4000);
			sheet.setColumnWidth(3, 6000);
			sheet.setColumnWidth(4, 4000);
			sheet.setColumnWidth(5, 4000);
			HSSFFont headfont = workbook.createFont();
			headfont.setFontHeightInPoints((short) 16);// 字体大小
			headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗

			HSSFFont headfont1 = workbook.createFont();
			headfont1.setFontHeightInPoints((short) 16);// 字体大小

			HSSFCellStyle headstyle = workbook.createCellStyle();
			headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
			headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
			headstyle.setLocked(true);
			headstyle.setWrapText(true);// 自动换行

			// 第一行
			HSSFRichTextString richString = new HSSFRichTextString("\u8D26\u5355\u8868\uFF08\u672A\u7ED3\u7B97\uFF09");
			HSSFRow row0 = sheet.createRow((int) 0);
			row0.setHeight((short) 500);
			HSSFCell cell0 = row0.createCell((int) 0);// 创建一列
			cell0.setCellType(HSSFCell.CELL_TYPE_STRING);
			richString.applyFont(0, 3, headfont);
			richString.applyFont(3, 8, headfont1);
			cell0.setCellValue(richString);
			cell0.setCellStyle(headstyle);
			CellRangeAddress cra = new CellRangeAddress(0, 0, 0, 5);
			sheet.addMergedRegion(cra);

			HSSFCellStyle headstyle1 = workbook.createCellStyle();
			headstyle1.setAlignment(HSSFCellStyle.ALIGN_RIGHT);// 左右居右
			headstyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
			headstyle1.setLocked(true);
			headstyle1.setWrapText(true);// 自动换行

			// 第二行
			HSSFRow row1 = sheet.createRow((int) 1);
			HSSFCell cell1 = row1.createCell((int) 0);// 创建一列
			row1.setHeight((short) 400);
			cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell1.setCellValue("\u8D26\u5355\u65E5\u671F\uFF1A\u4ECE" + DateUtils.getDateFromString(shopBill.getBillStart()) + "\u5230"
					+ DateUtils.getDateFromString(shopBill.getBillEnd()) + "  \u8D26\u5355\u91D1\u989D¥" + shopBill.getBillCost()
					+ "   \u7ED3\u7B97\u91D1\u989D¥" + shopBill.getSettleCost());
			cell1.setCellStyle(headstyle1);
			cra = new CellRangeAddress(1, 1, 0, 5);
			sheet.addMergedRegion(cra);

			// 第三行
			HSSFRow row2 = sheet.createRow((int) 2);
			row2.setHeight((short) 300);
			HSSFCell cell2 = row2.createCell((int) 0);// 创建一列
			cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell2.setCellValue("\u8BA2\u5355/\u9000\u6B3E\u7F16\u53F7");
			cell2.setCellStyle(headstyle);

			HSSFCell cell21 = row2.createCell((int) 1);// 创建一列
			cell21.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell21.setCellValue("\u5546\u54C1\u4FE1\u606F");
			cell21.setCellStyle(headstyle);

			HSSFCell cell22 = row2.createCell((int) 2);// 创建一列
			cell22.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell22.setCellValue("\u6536\u5165\u7C7B\u578B");
			cell22.setCellStyle(headstyle);

			HSSFCell cell23 = row2.createCell((int) 3);// 创建一列
			cell23.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell23.setCellValue("\u8BA2\u5355\u5B8C\u7ED3\u65F6\u95F4");
			cell23.setCellStyle(headstyle);

			HSSFCell cell24 = row2.createCell((int) 4);// 创建一列
			cell24.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell24.setCellValue("\u8BA2\u5355\u91D1\u989D");
			cell24.setCellStyle(headstyle);

			HSSFCell cell25 = row2.createCell((int) 5);// 创建一列
			cell25.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell25.setCellValue("\u7ED3\u7B97\u91D1\u989D");
			cell25.setCellStyle(headstyle);
			int i = 3;
			for (ShopBillDetail sbd : shopBill.getShopBillDetails()) {
				HSSFRow row3 = sheet.createRow((int) i);
				row3.setHeight((short) 300);
				HSSFCell cell3 = row3.createCell((int) 0);// 创建一列
				cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell3.setCellValue(sbd.getShopOrders().getOrderNumber());
				cell3.setCellStyle(headstyle);

				HSSFCell cell31 = row3.createCell((int) 1);// 创建一列
				cell31.setCellType(HSSFCell.CELL_TYPE_STRING);
				String str = "";
				int y = 1;
				for (ShopOrderList sol : sbd.getShopOrders().getShopOrderList()) {
					row3.setHeight((short) (250 * y));
					str = str + sol.getProductName() + ";";
					y++;
				}

				cell31.setCellValue(str);
				cell31.setCellStyle(headstyle);
				HSSFCell cell32 = row3.createCell((int) 2);// 创建一列
				cell32.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell32.setCellValue(sbd.getBillEnumDetail().getName());
				cell32.setCellStyle(headstyle);

				HSSFCell cell33 = row3.createCell((int) 3);// 创建一列
				cell33.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell33.setCellValue(DateUtils.getDateFromString(sbd.getShopOrders().getEndTime()));
				cell33.setCellStyle(headstyle);

				HSSFCell cell34 = row3.createCell((int) 4);// 创建一列
				cell34.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell34.setCellValue(sbd.getOrderCost().toString());
				cell34.setCellStyle(headstyle);

				HSSFCell cell35 = row3.createCell((int) 5);// 创建一列
				cell35.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell35.setCellValue(sbd.getOrderSettleCost().toString());
				cell35.setCellStyle(headstyle);
				i++;
			}

			// 最后一行
			HSSFRow rowlast = sheet.createRow((int) (4+shopBill.getShopBillDetails().size()));
			HSSFCell cellLast = rowlast.createCell((int) 0);// 创建一列
			rowlast.setHeight((short) 250);
			cellLast.setCellType(HSSFCell.CELL_TYPE_STRING);
			cellLast.setCellValue("\u8D26\u5355\u8868\u6253\u5370\u4E8E   "+DateUtils.getDateFromStringHHMMSS(new Date()));
			cellLast.setCellStyle(headstyle1);
			cra = new CellRangeAddress(4+shopBill.getShopBillDetails().size(), 4+shopBill.getShopBillDetails().size(), 0, 5);
			sheet.addMergedRegion(cra);

			fOut = response.getOutputStream();
			workbook.write(fOut);
		} catch (UnsupportedEncodingException e1) {
		} catch (Exception e) {
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (IOException e) {
			}
		}
	}

	@RequestMapping(value = "/{id}",produces = "text/html", params = "expExcelShopBill", method = RequestMethod.GET)
	public void expExcelShopBill(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		ShopBill shopBill = ShopBill.findShopBill(id);
		// 生成提示信息，
		response.setContentType("application/vnd.ms-excel");
		String codedFileName = DateUtils.getDateFromString(shopBill.getBillStart())+"-"+DateUtils.getDateFromString(shopBill.getBillEnd())+"\u8D26\u5355\u8868\uFF08\u5DF2\u7ED3\u7B97\uFF09";
		OutputStream fOut = null;
		try {
			// 进行转码，使其支持中文文件名
			codedFileName = java.net.URLEncoder.encode(codedFileName, "UTF-8");
			response.setHeader("content-disposition", "attachment;filename=" + codedFileName + ".xls");
			// response.addHeader("Content-Disposition",
			// "attachment;   filename=" + codedFileName + ".xls");
			// 产生工作簿对象
			HSSFWorkbook workbook = new HSSFWorkbook();
			// 产生工作表对象
			HSSFSheet sheet = workbook.createSheet();
			sheet.setColumnWidth(0, 5000);
			sheet.setColumnWidth(1, 5000);
			sheet.setColumnWidth(2, 4000);
			sheet.setColumnWidth(3, 6000);
			sheet.setColumnWidth(4, 4000);
			sheet.setColumnWidth(5, 4000);
			HSSFFont headfont = workbook.createFont();
			headfont.setFontHeightInPoints((short) 16);// 字体大小
			headfont.setBoldweight(HSSFFont.BOLDWEIGHT_BOLD);// 加粗

			HSSFFont headfont1 = workbook.createFont();
			headfont1.setFontHeightInPoints((short) 16);// 字体大小

			HSSFFont headfont2 = workbook.createFont();
			headfont1.setFontHeightInPoints((short) 12);// 字体大小
			
			HSSFCellStyle headstyle = workbook.createCellStyle();
			headstyle.setAlignment(HSSFCellStyle.ALIGN_CENTER);// 左右居中
			headstyle.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
			headstyle.setLocked(true);
			headstyle.setWrapText(true);// 自动换行

			// 第一行
			HSSFRichTextString richString = new HSSFRichTextString("\u8D26\u5355\u8868\uFF08\u5DF2\u7ED3\u7B97\uFF09 \u672C\u8D26\u5355\u7ED3\u7B97\u4E0E"+DateUtils.getDateFromString(shopBill.getCreateDate()));
			HSSFRow row0 = sheet.createRow((int) 0);
			row0.setHeight((short) 500);
			HSSFCell cell0 = row0.createCell((int) 0);// 创建一列
			cell0.setCellType(HSSFCell.CELL_TYPE_STRING);
			richString.applyFont(0, 3, headfont);
			richString.applyFont(3, 8, headfont1);
			richString.applyFont(8,richString.length(),headfont2);
			cell0.setCellValue(richString);
			cell0.setCellStyle(headstyle);
			CellRangeAddress cra = new CellRangeAddress(0, 0, 0, 5);
			sheet.addMergedRegion(cra);

			HSSFCellStyle headstyle1 = workbook.createCellStyle();
			headstyle1.setAlignment(HSSFCellStyle.ALIGN_RIGHT);// 左右居右
			headstyle1.setVerticalAlignment(HSSFCellStyle.VERTICAL_CENTER);// 上下居中
			headstyle1.setLocked(true);
			headstyle1.setWrapText(true);// 自动换行

			// 第二行
			HSSFRow row1 = sheet.createRow((int) 1);
			HSSFCell cell1 = row1.createCell((int) 0);// 创建一列
			row1.setHeight((short) 400);
			cell1.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell1.setCellValue("\u8D26\u5355\u65E5\u671F\uFF1A\u4ECE" + DateUtils.getDateFromString(shopBill.getBillStart()) + "\u5230"
					+ DateUtils.getDateFromString(shopBill.getBillEnd()) + "  \u8D26\u5355\u91D1\u989D¥" + shopBill.getBillCost()
					+ "   \u7ED3\u7B97\u91D1\u989D¥" + shopBill.getCreateDate());
			cell1.setCellStyle(headstyle1);
			cra = new CellRangeAddress(1, 1, 0, 5);
			sheet.addMergedRegion(cra);

			// 第三行
			HSSFRow row2 = sheet.createRow((int) 2);
			row2.setHeight((short) 300);
			HSSFCell cell2 = row2.createCell((int) 0);// 创建一列
			cell2.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell2.setCellValue("\u8BA2\u5355/\u9000\u6B3E\u7F16\u53F7");
			cell2.setCellStyle(headstyle);

			HSSFCell cell21 = row2.createCell((int) 1);// 创建一列
			cell21.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell21.setCellValue("\u5546\u54C1\u4FE1\u606F");
			cell21.setCellStyle(headstyle);

			HSSFCell cell22 = row2.createCell((int) 2);// 创建一列
			cell22.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell22.setCellValue("\u6536\u5165\u7C7B\u578B");
			cell22.setCellStyle(headstyle);

			HSSFCell cell23 = row2.createCell((int) 3);// 创建一列
			cell23.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell23.setCellValue("\u8BA2\u5355\u5B8C\u7ED3\u65F6\u95F4");
			cell23.setCellStyle(headstyle);

			HSSFCell cell24 = row2.createCell((int) 4);// 创建一列
			cell24.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell24.setCellValue("\u8BA2\u5355\u91D1\u989D");
			cell24.setCellStyle(headstyle);

			HSSFCell cell25 = row2.createCell((int) 5);// 创建一列
			cell25.setCellType(HSSFCell.CELL_TYPE_STRING);
			cell25.setCellValue("\u7ED3\u7B97\u91D1\u989D");
			cell25.setCellStyle(headstyle);
			int i = 3;
			for (ShopBillDetail sbd : shopBill.getShopBillDetails()) {
				HSSFRow row3 = sheet.createRow((int) i);
				row3.setHeight((short) 300);
				HSSFCell cell3 = row3.createCell((int) 0);// 创建一列
				cell3.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell3.setCellValue(sbd.getShopOrders().getOrderNumber());
				cell3.setCellStyle(headstyle);

				HSSFCell cell31 = row3.createCell((int) 1);// 创建一列
				cell31.setCellType(HSSFCell.CELL_TYPE_STRING);
				String str = "";
				int y = 1;
				for (ShopOrderList sol : sbd.getShopOrders().getShopOrderList()) {
					row3.setHeight((short) (250 * y));
					str = str + sol.getProductName() + ";";
					y++;
				}

				cell31.setCellValue(str);
				cell31.setCellStyle(headstyle);
				HSSFCell cell32 = row3.createCell((int) 2);// 创建一列
				cell32.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell32.setCellValue(sbd.getBillEnumDetail().getName());
				cell32.setCellStyle(headstyle);

				HSSFCell cell33 = row3.createCell((int) 3);// 创建一列
				cell33.setCellType(HSSFCell.CELL_TYPE_STRING);
				if(sbd.getShopOrders().getEndTime()==null){
					cell33.setCellValue(DateUtils.getDateFromString(new Date()));
				}else{
					cell33.setCellValue(DateUtils.getDateFromString(sbd.getShopOrders().getEndTime()));
				}
				
				cell33.setCellStyle(headstyle);

				HSSFCell cell34 = row3.createCell((int) 4);// 创建一列
				cell34.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell34.setCellValue(sbd.getOrderCost().toString());
				cell34.setCellStyle(headstyle);

				HSSFCell cell35 = row3.createCell((int) 5);// 创建一列
				cell35.setCellType(HSSFCell.CELL_TYPE_STRING);
				cell35.setCellValue(sbd.getOrderSettleCost().toString());
				cell35.setCellStyle(headstyle);
				i++;
			}
			
			// 最后一行
			HSSFRow rowlast = sheet.createRow((int) (4+shopBill.getShopBillDetails().size()));
			HSSFCell cellLast = rowlast.createCell((int) 0);// 创建一列
			rowlast.setHeight((short) 250);
			cellLast.setCellType(HSSFCell.CELL_TYPE_STRING);
			cellLast.setCellValue("\u8D26\u5355\u8868\u6253\u5370\u4E8E   "+DateUtils.getDateFromStringHHMMSS(new Date()));
			cellLast.setCellStyle(headstyle1);
			cra = new CellRangeAddress(4+shopBill.getShopBillDetails().size(), 4+shopBill.getShopBillDetails().size(), 0, 5);
			sheet.addMergedRegion(cra);

			fOut = response.getOutputStream();
			workbook.write(fOut);
		} catch (UnsupportedEncodingException e1) {
		} catch (Exception e) {
		} finally {
			try {
				fOut.flush();
				fOut.close();
			} catch (IOException e) {
			}
		}
	}
}
