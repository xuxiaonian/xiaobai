package com.huazhuo.shop.web;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;

import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.huazhuo.shop.domain.ShoppingCategories;
import com.huazhuo.shop.domain.ShoppingProducts;
import com.huazhuo.shop.domain.ShoppingProductsSpec;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.pojo.History;
import com.huazhuo.shop.pojo.ZListPromotion;
import com.huazhuo.shop.pojo.ZListReward;
import com.huazhuo.shop.query.ShoppingProductQuery;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;


@RequestMapping("/offerReward")
@Controller
@RooWebScaffold(path = "offerReward", formBackingObject = Shops.class)
@SessionAttributes({ "offerRewardManagement", "shop","CurrentUser",  "sessionShopId" })
public class OfferRewardController {

    @ModelAttribute("subtree")
    public void createSubtreet(HttpServletRequest httpServletRequest) {
        httpServletRequest.getSession().setAttribute("subtree", "offerRewardManagement");
    }
//list的展示页面
    @RequestMapping(produces = "text/html")
    public String list(@ModelAttribute("sessionShopId") Integer shop, 
    		@RequestParam(value = "page", required = false) Integer page,
    		@RequestParam(value = "name", required = false) String name,
    		@RequestParam(value = "status", required = false) String status,
    		@RequestParam(value = "size", required = false) Integer size, Model uiModel) {
    	if(page==null){
    		page=1;
    	}
    	if(name==null){
    		name="";
    	}
    	if(status==null){
    		status="";
    	}

		String str = HttpRequest.sendGet(H5UrlUtil.SERVICE_ZREWARDLIST_URL ,"startPage="+page+"&pageSize=10&shopId="+shop+"&rewardStatus="+status+"&queryType=NAEM&productName="+name);
		JSONObject fjs = JSONObject.parseObject(str);
	    
    	JSONObject data = fjs.getJSONObject("data");
    	Integer pageSize=data.getInteger("pageSize");
    	Integer totalRow=data.getInteger("totalRow");
    	Integer currentPage=data.getInteger("currentPage");
    	JSONArray datas = data.getJSONArray("dataList");
    	   List<ZListReward> list = new ArrayList<ZListReward>();
    	if(datas!=null){
    	 	for(Object jb:datas){
    	 		ZListReward  zListReward=new ZListReward();
    	    		JSONObject jo = (JSONObject) jb;
    	    		zListReward.setId(jo.getInteger("id"));
    	    		zListReward.setProductId(jo.getInteger("productId"));
    	    		zListReward.setProductName(jo.getString("productName"));
    	    		zListReward.setRewardRatio(jo.getInteger("rewardRatio"));
    	    		zListReward.setStartTime(jo.getDate("startTime"));
    	    		zListReward.setEndTime(jo.getDate("endTime"));
    	    		zListReward.setCreateTime(jo.getDate("createTime"));
    	    		zListReward.setRewardStatus(jo.getString("rewardStatus"));
    	    		
    	    		list.add(zListReward);

    	    		
    	    	}
    	}
			float nrOfPages = (float)Math.ceil( (double)totalRow / (double)pageSize);
			uiModel.addAttribute("maxPages",nrOfPages);
		    uiModel.addAttribute("list", nrOfPages);
		    uiModel.addAttribute("page", currentPage);
 
             uiModel.addAttribute("dataList",list);
        return "offerReward/list";
    }
//到达新增的页面
 @RequestMapping(value = "/{id}", produces = "text/html", params = "page")
	
    public String page(@Valid ShoppingProductQuery shoppingProductQuery,
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "page", required = false) Integer page,
			 @RequestParam(value = "shoppingCategoryId", required = false) String shoppingCategoryId,
			
			 @RequestParam(value = "content", required = false) String content,
			 @RequestParam(value = "state", required = false) String state,
				
			@RequestParam(value = "size", required = false) Integer size, HttpServletRequest httpServletRequest,Boolean is_Expect,
			Model uiModel) {
		    httpServletRequest.getSession().setAttribute("subtree", "offerRewardManagement");
	     	shoppingProductQuery.setShopId(shop);
		     shoppingProductQuery.setOnSale(1);
		    if(content!=null){
		    	 shoppingProductQuery.setName(content);	
		    }
		     if(size==null){
		    	 size=10;
		     }
		if (page != null || size != null) {
			int sizeNo = size == null ? 10 : size.intValue();
			final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
			List<ShoppingProducts> shoppingProducts=ShoppingProducts.search(shoppingProductQuery, firstResult, sizeNo);
			uiModel.addAttribute("shoppingproductses",shoppingProducts);
			float nrOfPages = (float) ShoppingProducts.searchCount(shoppingProductQuery) / sizeNo;
			uiModel.addAttribute("maxPages",(int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
			
		} 
		uiModel.addAttribute("shoppingProductQuery", shoppingProductQuery);
		uiModel.addAttribute("page", page);
		uiModel.addAttribute("shoppingCategories", ShoppingCategories.findAllShoppingCategorieses());
		if(state!=null){
		Integer stat=Integer.valueOf(state);
		if(stat==7){
			uiModel.addAttribute("state", stat);
		}
		}else{
			uiModel.addAttribute("state", 1);

		}
		return "offerReward/add";
	}
////异步获取规格
// @RequestMapping( produces = "text/html", params = "addSpec")
//	
//    public String addSpec( @ModelAttribute("sessionShopId") Integer shop, 
//			@RequestParam(value = "obj", required = false) String obj, 
//			HttpServletRequest request, HttpServletResponse response,
//			Model uiModel) throws IOException {
//	Integer shopId=Integer.valueOf(obj);
//	  ShoppingProducts shoppingProducts=ShoppingProducts.findShoppingProducts(shopId);
//    List<ShoppingProductsSpec> shoppingProductsSpec= ShoppingProductsSpec.findShopId(shoppingProducts);
//    JSONArray json = new JSONArray();
//    for(ShoppingProductsSpec a : shoppingProductsSpec){
//        JSONObject jo = new JSONObject();
//        jo.put("id", a.getId());
//        jo.put("orgPrice", a.getPrice());
//        jo.put("specName", a.getSpecName());
//        jo.put("productsNum", a.getProductsNum());
//  
//        json.add(jo);
//    }
// 
//    
//	request.setCharacterEncoding("utf-8");
//		
//	response.setContentType("text/html;charset=utf-8");
//	response.setHeader("Cache-Control", "no-cache");
//	PrintWriter out = response.getWriter();
//	String str = json.toJSONString();
//	out.print(str);
//	out.flush();
//	out.close();
//	return null;
//	
//	}
//新增
 @RequestMapping( produces = "text/html", params = "addsss")
	
    public String addsss(@Valid ZListReward zListReward,@ModelAttribute("sessionShopId") Integer shop,
    		
    		@RequestParam(value = "rebateNames", required = false) String rebateNames,	
    		 @RequestParam(value = "Start", required = false) String Start,	
   		        @RequestParam(value = "End", required = false) String End,	
   		     @RequestParam(value = "rewardRatio", required = false) Integer rewardRatio,
    		  @RequestParam(value = "partake", required = false) Integer partake,	
    		  @RequestParam(value = "productsSpecId", required = false) String productsSpecId,
    		  
	      HttpServletRequest httpServletRequest,	Model uiModel) {
	       Shops ss=Shops.findShops(shop);
	       String shopNmae= ss.getName();
		    httpServletRequest.getSession().setAttribute("subtree", "promotionManagement");
//           
//		    if(partake==1){
//		    	
//		    }
		    zListReward.setRewardRatio(0);
		    HttpRequest.sendPost(H5UrlUtil.SERVICE_ZREWARDADD_URL ,
		    "shopId="+shop+
		    "&shopName="+ss.getName()+
		    "&productSysNumber=1111&productId="+zListReward.getProductId()+
		    "&productName="+zListReward.getProductName()+
		
		    "&startTime="+Start+
		    "&endTime="+End+
		     "&rewardRatio="+rewardRatio+
		     "&remarks="+zListReward.getRemarks()
		 
		    );
		    
		    String returnUrl = "";
			returnUrl = "redirect:/offerReward" ;
			return returnUrl;	
	}
 /**
  * 查看(暂时不做)
  * @param shop
  * @param id
  * @param httpServletRequest
  * @param is_Expect
  * @param uiModel
  * @return
  */
 @RequestMapping(value = "/{id}", produces = "text/html", params = "look")
	
 public String look(
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "id", required = false) Integer id,
			 HttpServletRequest httpServletRequest,Boolean is_Expect,
			Model uiModel) {
		    httpServletRequest.getSession().setAttribute("subtree", "promotionManagement");
		   
		    String str = HttpRequest.sendGet(H5UrlUtil. SERVICE_ZREWARDLOOK_URL ,"id="+id);
		
	
		    JSONObject fjs = JSONObject.parseObject(str);
			
			JSONObject jo = fjs.getJSONObject("data");
			 ZListPromotion  zListPromotion=new ZListPromotion();
			    zListPromotion.setId(jo.getInteger("id"));
				zListPromotion.setRebateName(jo.getString("rebateName"));
				zListPromotion.setPrice(jo.getBigDecimal("price"));
				zListPromotion.setRebatePrice(jo.getBigDecimal("rebatePrice"));
				zListPromotion.setProductNum(jo.getInteger("productNum"));
				zListPromotion.setCreateTime(jo.getDate("createTime"));
				zListPromotion.setStartTime(jo.getDate("startTime"));
				zListPromotion.setEndTime(jo.getDate("endTime"));
				zListPromotion.setIsDeleted(jo.getInteger("isDeleted"));
				zListPromotion.setRebateStatus(jo.getString("rebateStatus"));
				zListPromotion.setProductsSpecId(jo.getInteger("productsSpecId"));
				zListPromotion.setProductLimit(jo.getByte("productLimit"));
				zListPromotion.setRewardRatio(jo.getInteger("rewardRatio"));
				
		        uiModel.addAttribute("zListPromotion", zListPromotion);
		    	Integer productId=jo.getInteger("productId");
				
				  ShoppingProducts shoppingProducts=ShoppingProducts.findShoppingProducts(productId);
				    List<ShoppingProductsSpec> shoppingProductsSpec= ShoppingProductsSpec.findShopId(shoppingProducts);
		        uiModel.addAttribute("zListPromotion", zListPromotion);
		        uiModel.addAttribute("shoppingProducts", shoppingProducts);
//		        uiModel.addAttribute("list", list);
		        uiModel.addAttribute("shoppingProductsSpec", shoppingProductsSpec);
		        return "offerReward/look";
	}
 /**
  * 修改
  * @param shop
  * @param id
  * @param httpServletRequest
  * @param is_Expect
  * @param uiModel
  * @return
  */
 @RequestMapping(value = "/{id}", produces = "text/html", params = "update")
	
 public String update(
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "id", required = false) Integer id,
			 HttpServletRequest httpServletRequest,Boolean is_Expect,
			Model uiModel) {
		    httpServletRequest.getSession().setAttribute("subtree", "promotionManagement");
		   
		    String str = HttpRequest.sendGet(H5UrlUtil. SERVICE_ZLOOK_URL ,"id="+id);
			JSONObject fjs = JSONObject.parseObject(str);
			
			JSONObject jo = fjs.getJSONObject("data");
			 ZListPromotion  zListPromotion=new ZListPromotion();
			    zListPromotion.setId(jo.getInteger("id"));
				zListPromotion.setRebateName(jo.getString("rebateName"));
				zListPromotion.setPrice(jo.getBigDecimal("price"));
				zListPromotion.setRebatePrice(jo.getBigDecimal("rebatePrice"));
				zListPromotion.setProductNum(jo.getInteger("productNum"));
				zListPromotion.setCreateTime(jo.getDate("createTime"));
				zListPromotion.setStartTime(jo.getDate("startTime"));
				zListPromotion.setEndTime(jo.getDate("endTime"));
				zListPromotion.setIsDeleted(jo.getInteger("isDeleted"));
				zListPromotion.setRebateStatus(jo.getString("rebateStatus"));
				zListPromotion.setProductsSpecId(jo.getInteger("productsSpecId"));
				zListPromotion.setProductId(jo.getInteger("productId"));
				zListPromotion.setRewardRatio(jo.getInteger("rewardRatio"));
				zListPromotion.setProductLimit(jo.getByte("productLimit"));
				Integer productId=jo.getInteger("productId");
				Integer rewardRatio=jo.getInteger("rewardRatio");
		    	Integer partake=1;
				if(rewardRatio==0){
					  partake=1;
				    }else{
				    	 partake=0;
				    }
				SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
				String da=zListPromotion.getCreateTime().toString();
				String da1=zListPromotion.getEndTime().toString();
				java.util.Date startTime;
				java.util.Date endTime;
				try {
					startTime = sdf.parse(da);
					  uiModel.addAttribute("startTime", startTime);
					  endTime = sdf.parse(da1);
					  uiModel.addAttribute("endTime", endTime);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				} 
			
				  ShoppingProducts shoppingProducts=ShoppingProducts.findShoppingProducts(productId);
				    List<ShoppingProductsSpec> shoppingProductsSpec= ShoppingProductsSpec.findShopId(shoppingProducts);
		     List shuzi = new ArrayList();
		     for(int i=0;i<10;i++){
		    	 shuzi.add(i);
		     }
		     uiModel.addAttribute("shuzi", shuzi);
		        uiModel.addAttribute("zListPromotion", zListPromotion);
		        uiModel.addAttribute("partake", partake);
		        uiModel.addAttribute("shoppingProducts", shoppingProducts);
		        uiModel.addAttribute("shoppingProductsSpec", shoppingProductsSpec);
		      return "offerReward/update";
	}
 /**
  * 删除
  * @param shop
  * @param id
  * @param httpServletRequest
  * @param is_Expect
  * @param uiModel
  * @return
  */
 @RequestMapping(value = "/{id}", produces = "text/html", params = "delete")
	
 public String delete(
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "id", required = false) Integer id,
			 HttpServletRequest httpServletRequest,Boolean is_Expect,
			Model uiModel) {
		    httpServletRequest.getSession().setAttribute("subtree", "promotionManagement");
		   
		     HttpRequest.sendGet(H5UrlUtil. SERVICE_ZREWARDDELATE_URL ,"id="+id);
			
			String returnUrl = "";
			returnUrl = "redirect:/offerReward" ;
			return returnUrl;	
 }
 /**
  * 修改的的保存
  * @param shop
  * @param id
  * @param httpServletRequest
  * @param is_Expect
  * @param uiModel
  * @return
  */
 @RequestMapping(value = "/{id}", produces = "text/html", params = "updateKept")
	
 public String updateKept(@Valid ZListPromotion zListPromotion,@ModelAttribute("sessionShopId") Integer shop,
		  @RequestParam(value = "Start", required = false) String Start,	
		  @RequestParam(value = "End", required = false) String End,
		  @RequestParam(value = "partake", required = false) Integer partake,
		  
		  @RequestParam(value = "productsSpecId", required = false) String productsSpecId,
		  
HttpServletRequest httpServletRequest,	Model uiModel) {

	    httpServletRequest.getSession().setAttribute("subtree", "promotionManagement");
        Integer rewardRatio=0;
//	    if(partake==1){
//	    	rewardRatio=0;
//} else{
//	     rewardRatio=zListPromotion.getRewardRatio();
//}
	    
	   String ss= HttpRequest.sendPost(H5UrlUtil.SERVICE_ZUPDATE_URL ,
	    "id="+zListPromotion.getId()+
	    "&rebateName="+zListPromotion.getRebateName()+
//	    "&shopId="+shop+
	    "&productId="+zListPromotion.getProductId()+
	    "&productsSpecId="+zListPromotion.getProductsSpecId()+
	    "&price="+zListPromotion.getPrice()+
	    "&rebatePrice="+zListPromotion.getRebatePrice()+
	    "&startTime="+Start+
	    "&endTime="+End+
        "&productNum="+zListPromotion.getProductNum()+
        "&productLimit="+zListPromotion.getProductLimit()+
	    "&rewardRatio="+rewardRatio
	    );
	    String returnUrl = "";
		returnUrl = "redirect:/offerReward" ;
		return returnUrl;	
}
 
 /**
  * 暂停
  * @param shop
  * @param id
  * @param httpServletRequest
  * @param is_Expect
  * @param uiModel
  * @return
  */
 @RequestMapping(value = "/{id}", produces = "text/html", params = "stop")
	
 public String stop(
			@ModelAttribute("sessionShopId") Integer shop, @RequestParam(value = "id", required = false) Integer id,
			 HttpServletRequest httpServletRequest,Boolean is_Expect,
			Model uiModel) {
		    httpServletRequest.getSession().setAttribute("subtree", "promotionManagement");
		   
		     HttpRequest.sendGet(H5UrlUtil. SERVICE_ZREWARDSTOP_URL ,"id="+id);
			
			String returnUrl = "";
			returnUrl = "redirect:/offerReward" ;
			return returnUrl;	
 }
}
