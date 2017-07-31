package com.huazhuo.shop.web;


import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.json.JSONArray;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.huazhuo.shop.domain.GsBigcategory;
import com.huazhuo.shop.domain.GsBigcategoryGoodsRela;
import com.huazhuo.shop.domain.GsBigcategoryGoodscategoryRela;
import com.huazhuo.shop.domain.ProductBrand;
import com.huazhuo.shop.domain.ShopAddress;
import com.huazhuo.shop.domain.ShopCategoryCommissionRela;
import com.huazhuo.shop.domain.ShopFreightTemplate;
import com.huazhuo.shop.domain.ShoppingCategories;
import com.huazhuo.shop.domain.ShoppingProductMark;
import com.huazhuo.shop.domain.ShoppingProductPictures;
import com.huazhuo.shop.domain.ShoppingProducts;
import com.huazhuo.shop.domain.ShoppingProductsContent;
import com.huazhuo.shop.domain.ShoppingProductsDetail;
import com.huazhuo.shop.domain.ShoppingProductsExpect;
import com.huazhuo.shop.domain.ShoppingProductsSpec;
import com.huazhuo.shop.domain.SpecialMarks;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.pojo.ApiResultStore;
import com.huazhuo.shop.query.ShoppingProductQuery;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.service.ShopOrdersService;
import com.huazhuo.shop.util.ForbiddenWordUtils;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.JsonUtil;
import com.huazhuo.shop.util.StringUtils;
import com.huazhuo.shop.util.SysLogUtil;

@RequestMapping("/shoppingproductses")
@Controller
@RooWebScaffold(path = "shoppingproductses", formBackingObject = ShoppingProducts.class)
@SessionAttributes({ "shoppingproductNoSale", "shop", "CurrentUser", "sessionShopId" })
public class ShoppingProductsController {
    @Autowired 
    public ShopOrdersService shopOrdersService;
	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(Model uiModel, @ModelAttribute("sessionShopId") Integer shop) {
		populateEditForm(uiModel, new ShoppingProducts(), shop);
	
		return "shoppingproductses/create";
	}

	@RequestMapping(params = "Jcrop", produces = "text/html")
	public String createJcrop(Model uiModel, @ModelAttribute("sessionShopId") Integer shop) {

		return "shoppingproductses/Jcrop";
	}

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
	public String updateForm(@PathVariable("id") Integer id, Model uiModel,
			@ModelAttribute("sessionShopId") Integer shop) throws Exception {
		ShoppingProducts product = ShoppingProducts.findShoppingProducts(id);
		ShoppingProducts shoppingproducts = ShoppingProducts.findShoppingProducts(id);

		List<SpecialMarks> specialMarks = SpecialMarks.findSpecialMarksByGood(product.getShoppingCategoryId().getId());
		uiModel.addAttribute("specialMarks", specialMarks);
		List<ShoppingProductsContent> shoppingProductsContent = ShoppingProductsContent.getShoppingId(shoppingproducts);
		List<ShoppingProductsDetail> shoppingProductsDetail = ShoppingProductsDetail.getShoppingId(shoppingproducts);
		List<GsBigcategoryGoodsRela> getId = GsBigcategoryGoodsRela.getId(id);
		ShoppingProductsContent con=new ShoppingProductsContent();
		ShoppingProductsContent content=new ShoppingProductsContent();
		con.setContent("");
		con.setType(1);
		List<ShoppingProductsContent> shoppingContent = new ArrayList<ShoppingProductsContent>();
		if(shoppingProductsContent.size()<1){
			shoppingProductsContent.add(0, con);
		}else{
			if(shoppingProductsContent.get(0).getType()!=1){
				shoppingProductsContent.add(0, con);
//				int aq=1;
//				for(ShoppingProductsContent as:shoppingProductsContent ){
//					shoppingContent.add(aq++, as);
//				}
//				shoppingProductsContent=shoppingContent;
			}
		}
				Integer pId = getId.get(0).getGsBigcategoryId();

		List<GsBigcategory> gsBigcategory = GsBigcategory.getGsBigcategory(pId);
		uiModel.addAttribute("gsBigcategory", gsBigcategory);
		
		
		List<ShoppingProductsDetail> de2=new ArrayList<ShoppingProductsDetail>();
		int qq=0;
		for(GsBigcategory s:gsBigcategory){
		
			ShoppingProductsDetail de=new ShoppingProductsDetail();
			de.setType(1);
			de.setGsBigcategoryId(s.getId());
			de.setBigcategoryName(s.getName());
			de.setBigcategoryImage(s.getTempPic());
			ShoppingProductsDetail de1=new ShoppingProductsDetail();
			de1.setType(2);
			de1.setContent("../img/default_avatar_male.png");
			de1.setGsBigcategoryId(s.getId());
			de1.setBigcategoryName(s.getName());
			de1.setBigcategoryImage(s.getTempPic());
			de2.add(qq, de);
			qq++;
			de2.add(qq, de1);
			qq++;
		}
		
		for(ShoppingProductsDetail d2:de2 ){
			for(ShoppingProductsDetail dd:shoppingProductsDetail){
				if(d2.getType()==dd.getType() ){
					if(d2.getGsBigcategoryId()==dd.getGsBigcategoryId()){
					d2.setId(dd.getId());
					d2.setContent(dd.getContent());
				}}
			}
		}
		
		List<ShoppingProductsDetail> de3=de2;
		
		List<ShopAddress> shopAddress = ShopAddress.findAllShopAddressesByShopId(shop);
		uiModel.addAttribute("shopaddresses", shopAddress);
		uiModel.addAttribute("shoppingProductsContent", shoppingProductsContent);
		uiModel.addAttribute("shoppingProductsDetail", de2);

		//查询预售信息
		List<ShoppingProductsExpect> shoppingProductsExpects=ShoppingProductsExpect.findproductsId(shoppingproducts);
		if(shoppingProductsExpects!=null && !shoppingProductsExpects.isEmpty()){
			uiModel.addAttribute("shoppingProductsExpects", shoppingProductsExpects.get(0));
		}else{
			uiModel.addAttribute("shoppingProductsExpects", null);
		}
		List<ProductBrand> productbrands=ProductBrand.findBrandShop(shop);
		uiModel.addAttribute("product", productbrands);
		String www="../img/default_avatar_male.png";
		uiModel.addAttribute("www", www);
		uiModel.addAttribute("gsBig", GsBigcategory.getList());
		uiModel.addAttribute("shoppingproducts", shoppingproducts);
		uiModel.addAttribute("shoppingproducts_isPostage", shoppingproducts.isPostage());//是否包邮
		//判断是否展示h5的数据
	    uiModel.addAttribute("ss", 222);
		populateEditForm(uiModel, shoppingproducts, shop);
		uiModel.addAttribute("is_return_goods",shopOrdersService.findCgReturnGoods(id));
		List<ShopFreightTemplate> shopFreightTemplate=ShopFreightTemplate.findShId(shop);
		uiModel.addAttribute("shopFreight", shopFreightTemplate);
		return "shoppingproductses/update";
	}

//	@RequestMapping(value = "/{id}", params = "form1", produces = "text/html")
//	public String updateForm1(@PathVariable("id") Integer id, Model uiModel,
//			@ModelAttribute("sessionShopId") Integer shop) {
//		ShoppingProducts product = ShoppingProducts.findShoppingProducts(id);
//		ShoppingProducts shoppingproducts = ShoppingProducts.findShoppingProducts(id);
//
//		List<SpecialMarks> specialMarks = SpecialMarks.findSpecialMarksByGood(product.getShoppingCategoryId().getId());
//		uiModel.addAttribute("specialMarks", specialMarks);
//		List<ShoppingProductsContent> shoppingProductsContent = ShoppingProductsContent.getShoppingId(shoppingproducts);
//		List<ShoppingProductsDetail> shoppingProductsDetail = ShoppingProductsDetail.getShoppingId(shoppingproducts);
//		List<ShopAddress> shopAddress = ShopAddress.findAllShopAddressesByShopId(shop);
//		uiModel.addAttribute("shopaddresses", shopAddress);
//		uiModel.addAttribute("shoppingProductsContent", shoppingProductsContent);
//		uiModel.addAttribute("shoppingProductsDetail", shoppingProductsDetail);
//		
//		for (int i = 0; i < shoppingProductsContent.size(); i++) {
//			if (shoppingProductsContent.get(i).getType() == 2) {
//				uiModel.addAttribute("fileUploadc" + i + "Img", shoppingProductsContent.get(i).getContent());
//			}
//		}
//		//商品基础的展示
//		List<ShoppingCategories> getId = ShoppingCategories.getId(product.getShoppingCategoryId().getId());
//		Integer pId = getId.get(0).getParentId();
//		if (pId != 0) {
//			//pId =product.getShoppingCategoryId().getId();
//		}else{
//			pId=product.getShoppingCategoryId().getId();
//		}
//		List<GsBigcategoryGoodscategoryRela> gsBigcategoryGoodscategoryRela = GsBigcategoryGoodscategoryRela
//				.findShopId(pId);
//		Integer sid = gsBigcategoryGoodscategoryRela.get(0).getGsBigcategoryId();
//		List<GsBigcategory> gsBigcategory = GsBigcategory.getGsBigcategory(sid);
//		uiModel.addAttribute("gsBigcategory", gsBigcategory);
//        List<ShoppingProductsDetail>newdetails=  Foundation.Add(sid, shoppingproducts);
//		shoppingproducts.setShoppingProductsDetail(newdetails);
//		for (int ww = 0; ww < newdetails.size(); ww++) {
//			if (newdetails.get(ww).getType() == 2) {
//				uiModel.addAttribute("fileUploadd" + ww + "Img", newdetails.get(ww).getContent());
//			}
//		}
//		uiModel.addAttribute("shoppingproducts", shoppingproducts);
//		//判断是否展示h5的数据
//	    uiModel.addAttribute("ss", 222);
//	    String qq = H5UrlUtil.APPTOURING_ZHAN + id;
//	    uiModel.addAttribute("zhan", qq);
//		populateEditForm(uiModel, shoppingproducts, shop);
//		return "shoppingproductses/update";
//	}
	@RequestMapping(value = "/{id}", produces = "text/html")
	public String show(@PathVariable("id") Integer id, Model uiModel) {
		addDateTimeFormatPatterns(uiModel);
		ShoppingProducts shoppingproducts = ShoppingProducts.findShoppingProducts(id);
		uiModel.addAttribute("shoppingproducts", shoppingproducts);
		Integer adders = shoppingproducts.getAddress();
		List<ShoppingProductsContent> shoppingProductsContent = ShoppingProductsContent.getShoppingId(shoppingproducts);
		List<ShoppingProductsDetail> shoppingProductsDetail = ShoppingProductsDetail.getShoppingId(shoppingproducts);
		List<ShoppingProductsDetail> ss= new ArrayList<ShoppingProductsDetail>();
	
		//查询预售信息
		List<ShoppingProductsExpect> shoppingProductsExpects=ShoppingProductsExpect.findproductsId(shoppingproducts);
		if(shoppingProductsExpects!=null && !shoppingProductsExpects.isEmpty()){
			uiModel.addAttribute("shoppingProductsExpects", shoppingProductsExpects.get(0));
		}else{
			uiModel.addAttribute("shoppingProductsExpects", null);
		}
		
		
		int oo=0;
		for(ShoppingProductsDetail aa : shoppingProductsDetail){
			if(aa.getType()==1){
			ss.add(oo, aa);
			oo++;
			}
		}
		int nn=ss.size();
		for(ShoppingProductsDetail aa : shoppingProductsDetail){
			if(aa.getType()==2){
			ss.add(nn, aa);
			oo++;
			}
		}
		uiModel.addAttribute("shopaddresses", ShopAddress.findAllShopAddressesById(adders));
		uiModel.addAttribute("itemId", id);
		uiModel.addAttribute("shoppingProductsContent", shoppingProductsContent);
		uiModel.addAttribute("shoppingProductsDetail", ss);
		uiModel.addAttribute("sysLogs",SysLog.findAllSysLogsByprocessIdAndSysLogType(id, SysLogType.findSysLogType(2)));
		if(shoppingProductsDetail.size()>0){
			int sid=shoppingProductsDetail.get(0).getGsBigcategoryId();
			 List<GsBigcategory> getSid = GsBigcategory.getSid(sid);
			 int ssid=getSid.get(0).getParentId();
		 List<GsBigcategory> gsBigcategory = GsBigcategory.getGsBigcategory(ssid);
		uiModel.addAttribute("gsBigcategory", gsBigcategory);
		
		}
		int cc=	shoppingproducts.getId(); 
		String qq=H5UrlUtil.APPTOURING_ZHAN+cc;
		uiModel.addAttribute("qq", qq);
		uiModel.addAttribute("is_return_goods",shopOrdersService.findCgReturnGoods(id));
		return "shoppingproductses/show";
	}

	@RequestMapping(params = "createCategoryFrom", produces = "text/html")
	public String createCategoryForm(@ModelAttribute("sessionShopId") Integer shop,
			HttpServletRequest httpServletRequest, Model uiModel) {
		httpServletRequest.getSession().setAttribute("subtree", "shoppingproductCreate");
	
		List<ShoppingCategories> shoppingCategories = new ArrayList<ShoppingCategories>();
		  List <ShopCategoryCommissionRela> shopcateg= ShopCategoryCommissionRela.findShopId(shop);
		  for(ShopCategoryCommissionRela dd:shopcateg ){
			  List<ShoppingCategories> shoppingCategorie = ShoppingCategories.getId(dd.getCategoryId());  
			  shoppingCategories.add(shoppingCategorie.get(0));
		  }
		uiModel.addAttribute("shoppingCategories", shoppingCategories);
		List<ShoppingCategories> shopShoppingCategories = ShoppingProducts.findAllShoppingProductsesDistink(shop);
		uiModel.addAttribute("shopShoppingCategories", shopShoppingCategories);
		return "shoppingproductses/createCategory";
	}

	@RequestMapping(value = "/{id}", params = "updateCategoryFrom", produces = "text/html")
	public String updateCategoryFrom(@PathVariable("id") Integer id, Model uiModel) {
		List<ShoppingCategories> shoppingCategories = ShoppingCategories.findAllShoppingCategoriesesByParentId();
		uiModel.addAttribute("shoppingCategories", shoppingCategories);
		uiModel.addAttribute("id", id);
		return "shoppingproductses/updateCategory";
	}

	@RequestMapping(params = "method=updateCategory", produces = "text/html")
	public String updateCategory(@ModelAttribute("sessionShopId") Integer shop,
			@RequestParam(value = "productId", required = false) Integer productId,
			@RequestParam(value = "categoryId", required = false) Integer categoryId,
			@RequestParam(value = "shoppingCategoryName", required = false) String shoppingCategoryName,
			Model uiModel) {
		ShoppingProducts sp = ShoppingProducts.findShoppingProducts(productId);
		sp.setShoppingCategoryId(ShoppingCategories.findShoppingCategories(categoryId));
		sp.setShoppingCategoryName(shoppingCategoryName);
		sp.setShopId(shop);
		ShoppingCategories.findShoppingCategories(categoryId);
		List<SpecialMarks> specialMarks = SpecialMarks.findSpecialMarksByGood(categoryId);
		uiModel.addAttribute("specialMarks", specialMarks);
		List<ShopAddress> shopAddress = ShopAddress.findAllShopAddressesByShopId(shop);
		uiModel.addAttribute("gsBig", GsBigcategory.getList());
		uiModel.addAttribute("shopaddresses", shopAddress);
		populateEditForm(uiModel, sp, shop);
		return "shoppingproductses/update";
	}
	//切换模板的ajax 调用的方法
	@RequestMapping(params = "updateFoundation", produces = "text/html")
	public 	List<GsBigcategory> updateFoundation(
			HttpServletRequest request, HttpServletResponse response) throws  Exception {
		Integer sid=Integer.parseInt(request.getParameter("sid"));
		
		List<GsBigcategory> gsBigcategory = GsBigcategory.getGsBigcategory(sid);
		 JSONArray json = new JSONArray();
         for(GsBigcategory a : gsBigcategory){
             JSONObject jo = new JSONObject();
             jo.put("id", a.getId());
             jo.put("name", a.getName());
             jo.put("isRequired", a.getIsRequired());
             jo.put("tempPic", a.getTempPic());
             
             json.put(jo);
         }
		PrintWriter out = response.getWriter();
		out.print(json);
		out.flush();
		out.close();
		return null;
	}
	@RequestMapping(params = "method=createCategory", produces = "text/html")
	public String createCategory(@ModelAttribute("sessionShopId") Integer shop,
			@RequestParam(value = "categoryId", required = false) Integer categoryId,
			@RequestParam(value = "shoppingCategoryName", required = false) String shoppingCategoryName,
			Model uiModel) {
		ShoppingProducts sp = new ShoppingProducts();

		sp.setShoppingCategoryId(ShoppingCategories.findShoppingCategories(categoryId));
		sp.setShoppingCategoryName(shoppingCategoryName);
		sp.setShopId(shop);
		ShoppingCategories.findShoppingCategories(categoryId);
		List<SpecialMarks> specialMarks = SpecialMarks.findSpecialMarksByGood(categoryId);
		uiModel.addAttribute("specialMarks", specialMarks);
		List<ShoppingCategories> getId = ShoppingCategories.getId(categoryId);
		Integer pId = getId.get(0).getParentId();
		uiModel.addAttribute("is_return_goods",shopOrdersService.findCategoryId(categoryId));
		if (pId != 0) {
			categoryId = pId;
		}
		List<GsBigcategoryGoodscategoryRela> gsBigcategoryGoodscategoryRela = GsBigcategoryGoodscategoryRela
				.findShopId(categoryId);
		List<ProductBrand> productbrands=ProductBrand.findBrandShop(shop);
		List<ShopFreightTemplate> shopFreightTemplate=ShopFreightTemplate.findShId(shop);
		Integer sid = gsBigcategoryGoodscategoryRela.get(0).getGsBigcategoryId();
		List<GsBigcategory> gsBigcategory = GsBigcategory.getGsBigcategory(sid);
		uiModel.addAttribute("gsBigcategory", gsBigcategory);
		List<ShopAddress> shopAddress = ShopAddress.findAllShopAddressesByShopId(shop);
		uiModel.addAttribute("gsBig", GsBigcategory.getList());
		uiModel.addAttribute("shopaddresses", shopAddress);
		uiModel.addAttribute("product", productbrands);
		uiModel.addAttribute("shopFreight", shopFreightTemplate);
		populateEditForm(uiModel, sp, shop);
		return "shoppingproductses/create";
	}
   //处理商品标签
	
	
	
	@Transactional
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid ShoppingProducts shoppingProducts,
			@RequestParam(value = "gsBigcategoryId", required = false) Integer gsBigcategoryId,
			@ModelAttribute("sessionShopId") Integer shop, @ModelAttribute("CurrentUser") BackUser user, Model uiModel,
			HttpServletRequest httpServletRequest) throws Exception {
		String returnUrl = "";
		String template = httpServletRequest.getParameter("template");
		String address = httpServletRequest.getParameter("address");
		String sut = httpServletRequest.getParameter("sut");
		String expectTimeBegin =httpServletRequest.getParameter("expectTimeBegin");
		String expectTimeEnd =httpServletRequest.getParameter("expectTimeEnd"); 
		String sendGoodsTime =httpServletRequest.getParameter("sendGoodsTime");
		String is_expect_goods =httpServletRequest.getParameter("is_expect_goods");
		String isCommon =httpServletRequest.getParameter("isCommon");
		String isPostage=httpServletRequest.getParameter("isPostage");
		String wrapPostageNum= httpServletRequest.getParameter("wrapPostageNum");
		
		
		
		if (StringUtils.isBlank(template)) {
			shoppingProducts.setShopId(shop);
			if (!shoppingProducts.getStore()) {
				shoppingProducts.setReviewDate(new Date());
			}
		}
		int a = 0;
		if (address != null) {
			a = Integer.parseInt(address);
		}
		Date date = new Date();
		shoppingProducts.setAddress(a);
		List<ShoppingProductsSpec> sssdd =new ArrayList<ShoppingProductsSpec>();
		List<ShoppingProductsSpec> ss=shoppingProducts.getShoppingProductsSpecs();
		for(ShoppingProductsSpec shoppingProductsSpec : ss){
			if(shoppingProductsSpec.getSpecName()==null){
				
			}else{
				sssdd.add(shoppingProductsSpec);
			}
			
		}
		shoppingProducts.setPrice(ShoppingProductsSpec.getLowestPrice(sssdd));
		shoppingProducts.setOrgPrice(ShoppingProductsSpec.getLowestOrgPrice(sssdd));
		shoppingProducts.setHeading(shoppingProducts.getName());
		shoppingProducts.setCreatedAt(date);
		shoppingProducts.setUpdatedAt(date);
		shoppingProducts.setOnSale(0);
		shoppingProducts.setDeleteStatus(0);
		shoppingProducts.setReview(0);
	    shoppingProducts.removeEmptyDetailMark();
		List<ShoppingProductMark> markList = ShoppingProductMark.getListShoppingProductMark(shoppingProducts);
	
		List<ShoppingProductsDetail> shoppingProductsDetail = shoppingProducts.getShoppingProductsDetail();

		for (ShoppingProductsDetail m : shoppingProductsDetail) {

			m.setCreateTime(date);
			m.setVersion(0);
		}
		shoppingProducts.removeEmptyProductDetail();
		//shoppingProducts.saveAttachmentContent();
		List<ShoppingProductsContent> shoppingProductsContent = shoppingProducts.getShoppingProductsContent();
		for (ShoppingProductsContent m : shoppingProductsContent) {

			m.setCreateTime(date);
			m.setVersion(0);
		}
		shoppingProducts.removeEmptyProductContent();
		//==========markList.addAll(shoppingProducts.getShoppingProductMarks())===== 重复=============;
		System.out.println("markList.size():"+markList.size());
		shoppingProducts.setShoppingProductMarks(markList);
		shoppingProducts.removeEmptyDetail();

		shoppingProducts.saveAttachment();
		List<ShoppingProductPictures> listPictures = shoppingProducts.getShoppingProductPictures();
		if (listPictures.size() > 0) {
			shoppingProducts.setHeadImage(listPictures.get(0).getImage());
			shoppingProducts.setEndImage(listPictures.get(listPictures.size() - 1).getImage());
		}

		uiModel.asMap().clear();
		//======================包邮条件参数============================
		if(isPostage!=null && isPostage.equals("true") && wrapPostageNum!=null && Integer.valueOf(wrapPostageNum)>0){
			shoppingProducts.setWrapPostageNum(Integer.valueOf(wrapPostageNum==null || wrapPostageNum.equals("") ?"0":wrapPostageNum));
			shoppingProducts.setPostage(Boolean.valueOf(isPostage));
		}else{
			shoppingProducts.setWrapPostageNum(0);
			shoppingProducts.setPostage(false);
		}
		//======================是预售商品============================
		if(is_expect_goods!=null && is_expect_goods.equals("1")){//是预售商品
			shoppingProducts.setIsExpect(true);
			shoppingProducts.setIs_send_st(false);
		}else{
			shoppingProducts.setIsExpect(false);
			shoppingProducts.setIs_send_st(true);
		}
		shoppingProducts.setIs_customer(true);
		shoppingProducts.persist();
		GsBigcategoryGoodsRela rela = new GsBigcategoryGoodsRela();
		rela.setCreateTime(new Date());
		rela.setGoodsId(shoppingProducts.getId());
		rela.setGsBigcategoryId(gsBigcategoryId);
		rela.setIsTemp(true);
		rela.persist();
		
		//======================是预售商品============================
		if(is_expect_goods!=null && is_expect_goods.equals("1")){
			ShoppingProductsExpect shoppingProductsExpect =new ShoppingProductsExpect();
			if(expectTimeBegin!=null && !expectTimeBegin.equals("")){
				shoppingProductsExpect.setExpectTimeBegin(strToDate(expectTimeBegin,"yyyy-MM-dd"));
			}
			if(expectTimeEnd!=null && !expectTimeEnd.equals("")){
				shoppingProductsExpect.setExpectTimeEnd(strToDate(expectTimeEnd,"yyyy-MM-dd"));
			}else{//如果为空发货日期为结束日期
				shoppingProductsExpect.setExpectTimeEnd(strToDate(sendGoodsTime,"yyyy-MM-dd"));
			}
			if(sendGoodsTime!=null && !sendGoodsTime.equals("")){
				shoppingProductsExpect.setSendGoodsTime(strToDate(sendGoodsTime,"yyyy-MM-dd"));
			}
			shoppingProductsExpect.setIsCommon(Integer.valueOf(isCommon==null?"0":isCommon));
			shoppingProductsExpect.setProductsId(shoppingProducts);
			shoppingProductsExpect.persist();
		}
		
		
		if (StringUtils.isBlank(template)) {
			if (sut != null) {
				returnUrl = "redirect:/shoppingproductses/" + shoppingProducts.getId().toString() + "?form1";
			}else{
			returnUrl = "redirect:/shoppingproductses/"
					+ encodeUrlPathSegment(shoppingProducts.getId().toString(), httpServletRequest);
			}
			} else {
			if (address == null) {
				returnUrl = "redirect:/shopfreighttemplates?form&productId=" + shoppingProducts.getId().toString();
			} else {
				 
					returnUrl = "redirect:/shopaddresses?form&productId=" + shoppingProducts.getId().toString();
			
			}

		}
		return returnUrl;
	}

	@Transactional
	@RequestMapping(method = RequestMethod.POST, produces = "text/html", params = "method=update")
	public String update(@Valid ShoppingProducts shoppingProducts, @ModelAttribute("sessionShopId") Integer shop,
			Model uiModel, HttpServletRequest httpServletRequest) throws Exception {
		ShoppingProducts old = ShoppingProducts.findShoppingProducts(shoppingProducts.getId());
		String returnUrl = "";
		String template = httpServletRequest.getParameter("template");
		String address = httpServletRequest.getParameter("address");
		String sut = httpServletRequest.getParameter("sut");
		
		String expectTimeBegin =httpServletRequest.getParameter("expectTimeBegin");
		String expectTimeEnd =httpServletRequest.getParameter("expectTimeEnd"); 
		String sendGoodsTime =httpServletRequest.getParameter("sendGoodsTime");
		String is_expect_goods =httpServletRequest.getParameter("is_expect_goods");
		String isCommon =httpServletRequest.getParameter("isCommon");
		String shoppingProductsExpect_id =httpServletRequest.getParameter("shoppingProductsExpect_id");
		String shoppingProductsExpect_version =httpServletRequest.getParameter("shoppingProductsExpect_version");
		
		String isPostage=httpServletRequest.getParameter("isPostage");
		String wrapPostageNum= httpServletRequest.getParameter("wrapPostageNum");
		
		if (StringUtils.isBlank(template)) {
			shoppingProducts.setShopId(shop);
			if (!shoppingProducts.getStore()) {
				shoppingProducts.setReviewDate(new Date());
			}
		}
		int a = 0;
		if (address != null) {
			a = Integer.parseInt(address);
		}
		shoppingProducts.setShopId(shop);
		if (StringUtils.isBlank(template)) {
			if (!shoppingProducts.getStore()) {
				shoppingProducts.setReviewDate(new Date());
			}
		} else {
			shoppingProducts.setStore(old.getStore());
		}
		Date date = new Date();
		List<ShoppingProductsSpec> sssdd =new ArrayList<ShoppingProductsSpec>();
		List<ShoppingProductsSpec> ss=shoppingProducts.getShoppingProductsSpecs();
		for(ShoppingProductsSpec shoppingProductsSpec : ss){
			if(shoppingProductsSpec.getSpecName()==null){
			
			}else{
				sssdd.add(shoppingProductsSpec);
			}
			
		}
		shoppingProducts.setPrice(ShoppingProductsSpec.getLowestPrice(sssdd));
		shoppingProducts.setOrgPrice(ShoppingProductsSpec.getLowestOrgPrice(sssdd));
		shoppingProducts.setSysNumber(old.getSysNumber());
		shoppingProducts.setHeading(shoppingProducts.getName());
		shoppingProducts.setCreatedAt(old.getCreatedAt());
		shoppingProducts.setUpdatedAt(date);
		shoppingProducts.setOnSale(0);
		shoppingProducts.setDeleteStatus(0);
		shoppingProducts.setReview(0);

		shoppingProducts.removeEmptyDetailMark();
		List<ShoppingProductMark> markList = ShoppingProductMark.getListShoppingProductMark(shoppingProducts);
		for (ShoppingProductMark m : shoppingProducts.getShoppingProductMarks()) {
			shoppingProducts.setShoppingProductMarkName(shoppingProducts.getShoppingProductMarkName() + ";" + m.getName());
		}

		// markList.addAll(shoppingProducts.getShoppingProductMarks());
		
//		shoppingProducts.saveAttachmentDetail();
		List<ShoppingProductsDetail> shoppingProductsDetail = shoppingProducts.getShoppingProductsDetail();
		for (ShoppingProductsDetail m : shoppingProductsDetail) {
			m.setCreateTime(date);
		}
		shoppingProducts.removeEmptyProductDetail();
        shoppingProducts.saveAttachmentContent();
        List<GsBigcategoryGoodsRela>dd=  GsBigcategoryGoodsRela.getId(shoppingProducts.getId());
        GsBigcategoryGoodsRela cc=dd.get(0);
        List<GsBigcategory> ff=GsBigcategory.getSid(shoppingProductsDetail.get(0).getGsBigcategoryId());
      
        cc.setGsBigcategoryId(ff.get(0).getParentId());
        cc.merge();
		List<ShoppingProductsContent> shoppingProductsContent = shoppingProducts.getShoppingProductsContent();
		for (ShoppingProductsContent m : shoppingProductsContent) {
	
			m.setCreateTime(date);
		}
		shoppingProducts.removeEmptyProductContent();
		shoppingProducts.setShoppingProductMarks(markList);

		shoppingProducts.removeEmptyDetail();
		shoppingProducts.saveAttachment();
		List<ShoppingProductPictures> listPictures = shoppingProducts.getShoppingProductPictures();
		if (listPictures.size() > 0) {
			shoppingProducts.setHeadImage(listPictures.get(0).getImage());
			shoppingProducts.setEndImage(listPictures.get(listPictures.size() - 1).getImage());
		}
		uiModel.asMap().clear();
		
		
		//======================包邮条件参数============================
		if(isPostage!=null && isPostage.equals("true") && wrapPostageNum!=null && Integer.valueOf(wrapPostageNum)>0){
			shoppingProducts.setWrapPostageNum(Integer.valueOf(wrapPostageNum==null || wrapPostageNum.equals("") ?"0":wrapPostageNum));
			shoppingProducts.setPostage(Boolean.valueOf(isPostage));
		}else{
			shoppingProducts.setWrapPostageNum(0);
			shoppingProducts.setPostage(false);
		}
		
		//======================是预售商品============================
		if(is_expect_goods!=null && is_expect_goods.equals("1")){//是预售商品
			shoppingProducts.setIsExpect(true);
			shoppingProducts.setIs_send_st(false);
		}else{
			shoppingProducts.setIsExpect(false);
			if(shoppingProductsExpect_id!=null && !shoppingProductsExpect_id.equals("")){
				ShoppingProductsExpect shoppingProductsExpect =new ShoppingProductsExpect();
				shoppingProductsExpect.setId(Integer.valueOf(shoppingProductsExpect_id));
				shoppingProductsExpect.remove();
			}
			shoppingProducts.setIs_send_st(true);
		}
		shoppingProducts.setIs_customer(true);
		shoppingProducts.merge();
		
		if(is_expect_goods!=null && is_expect_goods.equals("1")){//是预售商品
			ShoppingProductsExpect shoppingProductsExpect =new ShoppingProductsExpect();
			if(expectTimeBegin!=null && !expectTimeBegin.equals("")){
				shoppingProductsExpect.setExpectTimeBegin(strToDate(expectTimeBegin,"yyyy-MM-dd"));
			}
			if(expectTimeEnd!=null && !expectTimeEnd.equals("")){
				shoppingProductsExpect.setExpectTimeEnd(strToDate(expectTimeEnd,"yyyy-MM-dd"));
			}else{
				shoppingProductsExpect.setExpectTimeEnd(strToDate(sendGoodsTime,"yyyy-MM-dd"));
			}
			if(sendGoodsTime!=null && !sendGoodsTime.equals("")){
				shoppingProductsExpect.setSendGoodsTime(strToDate(sendGoodsTime,"yyyy-MM-dd"));
			}
			shoppingProductsExpect.setIsCommon(Integer.valueOf(isCommon==null?"0":isCommon));
			shoppingProductsExpect.setProductsId(shoppingProducts);
			if(shoppingProductsExpect_id!=null && !shoppingProductsExpect_id.equals("")){ //
				shoppingProductsExpect.setId(Integer.valueOf(shoppingProductsExpect_id));
			    shoppingProductsExpect.setVersion(Integer.valueOf(shoppingProductsExpect_version));
				shoppingProductsExpect.merge();
			}
		}
		
		
		if (StringUtils.isBlank(template)) {
			returnUrl = "redirect:/shoppingproductses/"
					+ encodeUrlPathSegment(shoppingProducts.getId().toString(), httpServletRequest);
		} else {
			if (address == null) {
				returnUrl = "redirect:/shopfreighttemplates?form&productId=" + shoppingProducts.getId().toString();
			} else {
				if (sut != null) {
					returnUrl = "redirect:/shoppingproductses/" + shoppingProducts.getId().toString() + "?form1";
				} else {
					returnUrl = "redirect:/shopaddresses?form&productId=" + shoppingProducts.getId().toString();
				}
			}
		}
		return returnUrl;
	}

	@RequestMapping(produces = "text/html", params = "method=noSalelist")
	public String noSalelist(@Valid ShoppingProductQuery shoppingProductQuery,
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, HttpServletRequest httpServletRequest,Boolean is_Expect,
			Model uiModel) {
		httpServletRequest.getSession().setAttribute("subtree", "shoppingproductNoSale");
		shoppingProductQuery.setShopId(shop);
		shoppingProductQuery.setOnSale(0);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
	/*		List<ShoppingProductsExpect> shoppingProductsExpect=ShoppingProductsExpect.findShoppingProducts(new Date(),firstResult, sizeNo);
			uiModel.addAttribute("shoppingproductses",shoppingProductsExpect);
			float nrOfPages = (float) ShoppingProductsExpect.countShopOrder(new Date()) / sizeNo;
			uiModel.addAttribute("maxPages",(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
			System.out.println(shoppingProductsExpect);*/
			if(is_Expect!=null && is_Expect){
				shoppingProductQuery.setIsExpect(true);
				shoppingProductQuery.setStore(false);
				uiModel.addAttribute("shoppingProduct_is_expect", is_Expect);
			}
			System.out.println(shoppingProductQuery);
			List<ShoppingProducts> shoppingProducts=ShoppingProducts.search(shoppingProductQuery, firstResult, sizeNo);
			uiModel.addAttribute("shoppingproductses",shoppingProducts);
			float nrOfPages = (float) ShoppingProducts.searchCount(shoppingProductQuery) / sizeNo;
			uiModel.addAttribute("maxPages",(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
			
		} else {
			uiModel.addAttribute("shoppingproductses", ShoppingProducts.search(shoppingProductQuery));
		}
		uiModel.addAttribute("shoppingProductQuery", shoppingProductQuery);
		uiModel.addAttribute("list", shoppingProductQuery.toQueryString());
		uiModel.addAttribute("page", page);
		uiModel.addAttribute("shoppingCategories", ShoppingCategories.findAllShoppingCategorieses());
		addDateTimeFormatPatterns(uiModel);
		return "shoppingproductses/noSalelist";
	}

	@RequestMapping(produces = "text/html")
	public String list(@Valid ShoppingProductQuery shoppingProductQuery, @ModelAttribute("sessionShopId") Integer shop,
			@RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, HttpServletRequest httpServletRequest,
			Model uiModel) {
		httpServletRequest.getSession().setAttribute("subtree", "shoppingproduct");
		shoppingProductQuery.setShopId(shop);
		shoppingProductQuery.setOnSale(1);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
			
			List<ShoppingProducts> shoppingproductses =ShoppingProducts.search(shoppingProductQuery, firstResult, sizeNo);
			for(ShoppingProducts sdd: shoppingproductses){
				Integer code=JsonUtil.replace(sdd.getId());
				sdd.setOnSale(code);
				sdd.setDeleteStatus(-1);
			}
			uiModel.addAttribute("shoppingproductses",shoppingproductses);
			float nrOfPages = (float) ShoppingProducts.searchCount(shoppingProductQuery) / sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			List<ShoppingProducts> shoppingproductses =ShoppingProducts.search(shoppingProductQuery);
			for(ShoppingProducts sdd: shoppingproductses){
				Integer code=JsonUtil.replace(sdd.getId());
				sdd.setOnSale(code);
				sdd.setDeleteStatus(-1);
				
			}
			uiModel.addAttribute("shoppingproductses", shoppingproductses );
		}
		uiModel.addAttribute("shoppingProductQuery", shoppingProductQuery);
		uiModel.addAttribute("list", shoppingProductQuery.toQueryString());
		uiModel.addAttribute("page", page);
		uiModel.addAttribute("shoppingCategories", ShoppingCategories.findAllShoppingCategorieses());
		addDateTimeFormatPatterns(uiModel);
		return "shoppingproductses/onSalelist";
	}

	@RequestMapping(produces = "text/html", params = "method=reviewlist")
	public String review(@Valid ShoppingProductQuery shoppingProductQuery,
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "page", required = false) Integer page,
			@RequestParam(value = "size", required = false) Integer size, HttpServletRequest httpServletRequest,
			Model uiModel) {
		httpServletRequest.getSession().setAttribute("subtree", "shoppingproductReview");
		shoppingProductQuery.setShopId(shop);
		shoppingProductQuery.setReview(2);
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
			uiModel.addAttribute("shoppingproductses",
					ShoppingProducts.search(shoppingProductQuery, firstResult, sizeNo));
			float nrOfPages = (float) ShoppingProducts.searchCount(shoppingProductQuery) / sizeNo;
			uiModel.addAttribute("maxPages",
					(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
		} else {
			uiModel.addAttribute("shoppingproductses", ShoppingProducts.search(shoppingProductQuery));
		}
		uiModel.addAttribute("shoppingProductQuery", shoppingProductQuery);
		uiModel.addAttribute("list", shoppingProductQuery.toQueryString());
		uiModel.addAttribute("page", page);
		uiModel.addAttribute("shoppingCategories", ShoppingCategories.findAllShoppingCategorieses());
		addDateTimeFormatPatterns(uiModel);
		return "shoppingproductses/reviewlist";
	}

	@RequestMapping(produces = "text/html", params = "method=updateOnSale", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> updateOnSale(@ModelAttribute("sessionShopId") Integer shop,
			@ModelAttribute("CurrentUser") BackUser user,
			@RequestParam(value = "productId", required = false) Integer productId, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		int flag=1;
		SysLog sysLog = new SysLog();
		ShoppingProducts shoppingProduct = ShoppingProducts.findShoppingProducts(productId);
		Integer shoop=shoppingProduct.getShopId() ;
		if (shoop.equals(shop)) {
			if (shoppingProduct.getOnSale() == 0) {
				if (shoppingProduct.getReview() == 1) {
					shoppingProduct.setOnSaleDate(new Date());
					shoppingProduct.setOnSale(1);
					shoppingProduct.setStore(false);
					sysLog = SysLog.getOrderSysLog(SysLogUtil.ON_SALE_PRODUCT + shoppingProduct.getSysNumber(),
							user.getUserName(), shoppingProduct.getId(), 2);
				} else {
					shoppingProduct.setStore(false);
					shoppingProduct.setReviewDate(new Date());
					sysLog = SysLog.getOrderSysLog(SysLogUtil.REVIEW_PRODUCT + shoppingProduct.getSysNumber(),
							user.getUserName(), shoppingProduct.getId(), 2);
				}
			} else {
				sysLog = SysLog.getOrderSysLog(SysLogUtil.NO_SALE_PRODUCT + shoppingProduct.getSysNumber(),
						user.getUserName(), shoppingProduct.getId(), 2);
				shoppingProduct.setOnSale(0);
				shoppingProduct.setStore(true);
			}
			sysLog.persist();
			int m=operShoppingProductsExpectIsBeginExpect(shoppingProduct);
			if(m==1){
				shoppingProduct.merge();
				flag = 1;
			}else{
				flag = m;
			}
		}
		//将预售商品转为开始预售
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(flag);
		out.flush();
		out.close();
		return null;
	}

	@RequestMapping(produces = "text/html", params = "method=deleteProduct", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> deleteProduct(@ModelAttribute("sessionShopId") Integer shop,
			@ModelAttribute("CurrentUser") BackUser user,
			@RequestParam(value = "productId", required = false) Integer productId, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outStr = "true";
		ShoppingProducts shoppingProduct = ShoppingProducts.findShoppingProducts(productId);
		Integer  ss=shoppingProduct.getShopId();
		if (ss.equals(shop)) {
			shoppingProduct.setDeleteStatus(1);
			SysLog sysLog = SysLog.getOrderSysLog(SysLogUtil.DEL_PRODUCT + shoppingProduct.getName(),user.getUserName(), shoppingProduct.getId(), 2);
			sysLog.persist();
		} else {
			outStr = "false";
		}
		shoppingProduct.merge();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}
	@Transactional
	@RequestMapping(produces = "text/html", params = "method=revokeProduct", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> revokeProduct(@ModelAttribute("sessionShopId") Integer shop,
			@ModelAttribute("CurrentUser") BackUser user,
			@RequestParam(value = "productId", required = false) Integer productId, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outStr = "true";
		ShoppingProducts shoppingProduct = ShoppingProducts.findShoppingProducts(productId);
		Integer sdd=shoppingProduct.getShopId();
		if ( sdd.equals(shop)) {
			shoppingProduct.setStore(true);
			SysLog sysLog = SysLog.getOrderSysLog(SysLogUtil.REVOKE_PRODUCT + shoppingProduct.getName(),
					user.getUserName(), shoppingProduct.getId(), 2);
			sysLog.persist();
		} else {
			outStr = "false";
		}
		shoppingProduct.merge();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}

	void populateEditForm(Model uiModel, ShoppingProducts shoppingProducts, Integer shopId) {
		uiModel.addAttribute("shoppingProducts", shoppingProducts);
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING + "/productBrand/categories",
				"id=" + shoppingProducts.getShoppingCategoryId().getId() + "&shopId=" + shopId);
		Gson g = new Gson();
		ApiResultStore api = g.fromJson(str, ApiResultStore.class);
		uiModel.addAttribute("productbrands", api.getDate());
		uiModel.addAttribute("shopfreighttemplates", ShopFreightTemplate.findAllShopFreightTemplatesByShopId(shopId));
	}
	/**
	* 字符串转换成日期
	* @param str
	* @return date
	*/
	private Date strToDate(String str,String type) {
	   SimpleDateFormat format = new SimpleDateFormat(type);
	   Date date = null;
	   try {
	    date = format.parse(str);
	   } catch (ParseException e) {
	    e.printStackTrace();
	   }
	   return date;
	}
	/**
	 * 根据商品Id操作预售商品开始预售
	 * @param id
	 */
	private int operShoppingProductsExpectIsBeginExpect(ShoppingProducts shoppingProductsExpectI){
		//查询预售信息
		List<ShoppingProductsExpect> shoppingProductsExpects=ShoppingProductsExpect.findproductsId(shoppingProductsExpectI);
		if(shoppingProductsExpects!=null && !shoppingProductsExpects.isEmpty()){
			if(shoppingProductsExpects.get(0).getExpectTimeEnd().getTime() <= new Date().getTime()){
				return 2;//预售已结束
			}
		}
		return 1;
	}
	
	@RequestMapping(produces = "text/html", params = "method=checkWord", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> checkWord(@RequestParam(value = "keyWord", required = true) String keyWord, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outStr = "";
		outStr=ForbiddenWordUtils.containsForbiddenWord(keyWord);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}
	@RequestMapping(produces = "text/html", params = "method=checksWord", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> checksWord(@RequestParam(value = "keysWord", required = true) Integer keysWord, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		Integer outStr = 0;
		outStr=JsonUtil.replace(keysWord);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}

}
