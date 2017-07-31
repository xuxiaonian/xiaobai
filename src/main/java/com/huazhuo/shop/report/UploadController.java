package com.huazhuo.shop.report;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileUploadException;
import org.json.simple.JSONObject;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.huazhuo.shop.util.FileUploadUtil;
import com.huazhuo.shop.util.OperateImage;
import com.huazhuo.shop.util.RandomUtils;
import com.huazhuo.shop.util.UpaiYunStatic;

@RequestMapping("/uploadFile")
@Controller
public class UploadController {

	@RequestMapping(params = "upload", produces = "text/html")
	public ResponseEntity<java.lang.String> createCategoryForm(@RequestParam(value = "imgFile", required = false) CommonsMultipartFile imgFile,
			HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
		// 定义允许上传的文件扩展名 imgFile CommonsMultipartFile attachment
		Date date = new Date();
		String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
		Boolean result = FileUploadUtil.upload(imgFile, fileName);
		if (result) {
			String url = UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR + fileName;
			JSONObject obj = new JSONObject();
			obj.put("error", 0);
			obj.put("url", url);
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			String str = obj.toJSONString();
			out.print(str);
			out.flush();
			out.close();
			return null;
		}
		return null;
	}

	@RequestMapping(params = "updateImg", produces = "text/html")
	public ResponseEntity<java.lang.String> updateImg(@RequestParam(value = "imgFile", required = false) CommonsMultipartFile imgFile,
			HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
		// 定义允许上传的文件扩展名 imgFile CommonsMultipartFile attachment
		Date date = new Date();
		String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
		
		Boolean result = FileUploadUtil.upload(imgFile, fileName);
		
		if (result) {
			String url = UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR +fileName;
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.print(url);
			out.flush();
			out.close();
			return null;
		}
		return null;
	}

	
//	多图上传的
	@RequestMapping(params = "updateImgs", produces = "text/html")
	public ResponseEntity<java.lang.String> updateImgs(@RequestParam(value = "imgFile", required = false) CommonsMultipartFile imgFile,
			HttpServletRequest request, HttpServletResponse response) throws FileUploadException, IOException {
		// 定义允许上传的文件扩展名 imgFile CommonsMultipartFile attachment
		Date date = new Date();
		String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
		
		Boolean result = FileUploadUtil.upload(imgFile, fileName);
		
		String name=imgFile.getFileItem().getName();
		if (result) {
			String url = UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR +fileName;
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.print(url+"**********"+name);
			out.flush();
			out.close();
			return null;
		}
		return null;
	}
	@RequestMapping(params = "updateImgCut", produces = "text/html")
	public ResponseEntity<java.lang.String> updateImgCut(@RequestParam(value = "imgFile", required = false) String imgFile,
			@RequestParam(value = "x", required = false) double x, @RequestParam(value = "y", required = false) double y,
			@RequestParam(value = "w", required = false) double w, @RequestParam(value = "h", required = false) double h, HttpServletRequest request,
			HttpServletResponse response) throws FileUploadException, IOException {
		byte[] b = OperateImage.imageToBytes(OperateImage.cut(imgFile, (int)x, (int)y, (int)w, (int)h), "png");
		Date date = new Date();
		String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
		Boolean result = FileUploadUtil.upload(b, fileName);
		if (result) {
			String url = UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR + fileName;
			request.setCharacterEncoding("utf-8");
			response.setContentType("text/html;charset=utf-8");
			response.setHeader("Cache-Control", "no-cache");
			PrintWriter out = response.getWriter();
			out.print(url);
			out.flush();
			out.close();
			return null;
		}
		return null;
	}
}
