package com.huazhuo.shop.web;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.google.gson.Gson;
import com.huazhuo.shop.domain.Company;
import com.huazhuo.shop.domain.MobileUsersAuth;
import com.huazhuo.shop.domain.ProductBrand;
import com.huazhuo.shop.domain.ProductBrandShoppingCategoriesRela;
import com.huazhuo.shop.domain.ShopCategoryCommissionRela;
import com.huazhuo.shop.domain.ShoppingCategories;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.pojo.Lists;
import com.huazhuo.shop.pojo.Settlement;
import com.huazhuo.shop.pojo.seet;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;


@RequestMapping("/companys")
@Controller
@RooWebScaffold(path = "companys", formBackingObject = Company.class)
@SessionAttributes({ "subtree", "CurrentUser" })
public class CompanyController {

    @RequestMapping(produces = "text/html")
    public String list(HttpServletRequest request, HttpServletResponse response,@ModelAttribute("CurrentUser") BackUser user, Model uiModel) {
    	  List<Company> companies = Company.findAllCompanysByUser(user);
    	
    	
          if (companies.size() > 0) {
              uiModel.addAttribute("company", companies.get(0));
          }
          return "companys/show"; 
    
    }
    @RequestMapping(value = "/{name}", produces = "text/html", params = "contract")
    public String contract(@ModelAttribute("CurrentUser") BackUser users, Model uiModel) {
    	
    	List<MobileUsersAuth> mo=MobileUsersAuth.findRelaId(users.getId());
//	公司
    	List<Company> company =Company.findAllCompanysByUser(users);
//	商铺
		List<Shops> shops =Shops.findAllShopsesByCompanyId(company.get(0).getId());
//		品牌
    	List<ProductBrand> productBrand=ProductBrand.findSid(shops.get(0).getId());
    	String ssid=shops.get(0).getId().toString();
    	//    	合同费用
    	String ss=  HttpRequest.sendGet(H5UrlUtil.SERVICE_ZOL_SAEALURL,"sellerId="+mo.get(0).getId());
    	 Gson gson1 = new Gson();
    	 seet  lps = gson1.fromJson(ss, seet.class);
    	
    	List<Lists> expense= new ArrayList<Lists>();
        List<ShopCategoryCommissionRela> shopCategoryCommissionRela=ShopCategoryCommissionRela.findShopId(shops.get(0).getId());
          for(ShopCategoryCommissionRela rela: shopCategoryCommissionRela){
        	  Lists list= new Lists();
        	  List<ShoppingCategories> shopList=  ShoppingCategories.getId(rela.getCategoryId());
        	list.setName(shopList.get(0).getName());
        	list.setCommissionRate(rela.getCommissionRate());
        	expense.add(list);
          }
          uiModel.addAttribute("lps",lps);
         uiModel.addAttribute("mo",mo.get(0));
    	uiModel.addAttribute("company",company.get(0));
    	uiModel.addAttribute("shops",shops.get(0));
    	uiModel.addAttribute("productBrand",productBrand);
    	uiModel.addAttribute("expense",expense);
    	 String settlement=	HttpRequest.sendGet(H5UrlUtil.SERVICE_QUERY_URL,"shopId="+ssid);

    	 Gson gson = new Gson();
         Settlement lp=null;
		try {
			lp = gson.fromJson(settlement, Settlement.class);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    	
		uiModel.addAttribute("settlement",lp);
   
    	
		return "companys/contract";
    
    }
    
    
    @RequestMapping(value = "/{name}", produces = "text/html", params = "brand")
    public String brand(@ModelAttribute("CurrentUser") BackUser users, Model uiModel) {
    	
    	List<MobileUsersAuth> mo=MobileUsersAuth.findRelaId(users.getId());
//	公司
    	List<Company> company =Company.findAllCompanysByUser(users);
//	商铺
		List<Shops> shops =Shops.findAllShopsesByCompanyId(company.get(0).getId());
//		品牌
    	List<ProductBrand> productBrand=ProductBrand.findSid(shops.get(0).getId());
    List<ShopCategoryCommissionRela> ss=	ShopCategoryCommissionRela.findShopId(shops.get(0).getId());
    List<ShoppingCategories> shoppingss = new ArrayList<ShoppingCategories>();
    for(ShopCategoryCommissionRela fff:ss){
    	 List<ShoppingCategories> shopss=ShoppingCategories.findAllShoppingCategoriesesByParentId(fff.getCategoryId());
    	 shoppingss.addAll(shopss);
    }
    
    uiModel.addAttribute("shopId",shops.get(0).getId());
    uiModel.addAttribute("shoppingss",shoppingss);
    uiModel.addAttribute("productBrand",productBrand);
    	
    	
   
    	
		return "companys/brand";
    
    }
  //新增
    @RequestMapping(value = "/{sid}", produces = "text/html", params = "addsss")
   	
       public String addsss(@Valid ProductBrand productBrand,  @RequestParam(value = "sid", required = false) Integer sid,
    		   @RequestParam(value = "shopId", required = false) Integer shopId,
    		   HttpServletRequest httpServletRequest,	Model uiModel) {
    	Date date =new Date();
    	productBrand.setUuid(UUID.randomUUID().toString());
       	String categoryId =productBrand.getCategoryId();
        String[]  str=categoryId.split(",");
        String ccc="";
      	  for(int i=0,len=str.length;i<len;i++){
      		  List<ShoppingCategories> shopList=  ShoppingCategories.getId(Integer.valueOf(str[i]));
      		 
      		  ccc=ccc+ shopList.get(0).getName()+",";
      	  }
      	  if(ccc==null){}
      	  else{
      		  ccc = ccc.substring(0,ccc.length() - 1); 
      	  }
      	productBrand.setAuditStatus(0);
      	productBrand.setCreatedAt(date);
      	productBrand.setUpdatedAt(date);
      	productBrand.setBrandShop(shopId);
      	productBrand.setCategoryName(ccc);
      	productBrand.merge();
      	if(productBrand.getId()!=null){
     List<ProductBrandShoppingCategoriesRela> rela= ProductBrandShoppingCategoriesRela.deleteproductBrandId(productBrand.getId());
     if(rela.size()>0){
    	 for(ProductBrandShoppingCategoriesRela sd :rela){
    		 sd.remove();
    	 }
    	 
     }
      	}
        List<ProductBrand> as =ProductBrand.findId(productBrand.getUuid());
        ProductBrandShoppingCategoriesRela   pbscr= new ProductBrandShoppingCategoriesRela();
        	   for(int i=0,len=str.length;i<len;i++){
        		   pbscr.setProductBrandId(as.get(0).getId()); 
        		   pbscr.setShoppingCategoriesId(Integer.parseInt(str[i]));
        		   pbscr.merge();
        	   }
        	   String returnUrl = "";
      			returnUrl = "redirect:/companys/qw?brand" ;
      			return returnUrl;
        }
       
//      修改     
    @RequestMapping(value = "/{sId}", produces = "text/html", params = "update")
    public String update(@ModelAttribute("CurrentUser") BackUser users,
    		@PathVariable(value = "sId") Integer sId,Model uiModel) {
    	
    	List<MobileUsersAuth> mo=MobileUsersAuth.findRelaId(users.getId());
//	公司
    	List<Company> company =Company.findAllCompanysByUser(users);
//	商铺
		List<Shops> shops =Shops.findAllShopsesByCompanyId(company.get(0).getId());
//		品牌
    	List<ProductBrand> productBrand=ProductBrand.findSid(shops.get(0).getId());
      List<ShopCategoryCommissionRela> ss=	ShopCategoryCommissionRela.findShopId(shops.get(0).getId());
       List<ShoppingCategories> shoppingss = new ArrayList<ShoppingCategories>();
    for(ShopCategoryCommissionRela fff:ss){
    	 List<ShoppingCategories> shopss=ShoppingCategories.findAllShoppingCategoriesesByParentId(fff.getCategoryId());
    	 shoppingss.addAll(shopss);
    }
    //xiugai
	List<ProductBrand> brand=ProductBrand.findsId(sId);
    uiModel.addAttribute("shopId",shops.get(0).getId());
    uiModel.addAttribute("brand",brand.get(0));
    uiModel.addAttribute("shoppingss",shoppingss);
    uiModel.addAttribute("productBrand",productBrand);
    	
    	
   
    	
		return "companys/brand";
    
    }	  	
    //删除
    @RequestMapping(value = "/{sId}", produces = "text/html", params = "delete")
   	
       public String delete( 
       		@PathVariable(value = "sId") Integer sId,Model uiModel) {
    	List<ProductBrand> productBrand =ProductBrand.findsId(sId);
    	ProductBrand ssd=productBrand.get(0);
    	ssd.setBrandShop(-1);
    	ssd.merge();
    	
        	   String returnUrl = "";
      			returnUrl = "redirect:/companys/qw?brand" ;
      			return returnUrl;
        }
       
}
