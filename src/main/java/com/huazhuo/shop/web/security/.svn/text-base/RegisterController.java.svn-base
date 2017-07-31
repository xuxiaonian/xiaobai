package com.huazhuo.shop.web.security;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.UUID;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.h2.engine.User;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import com.google.gson.Gson;
import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;
import com.huazhuo.shop.domain.Company;
import com.huazhuo.shop.domain.MobileUsers;
import com.huazhuo.shop.domain.MobileUsersAuth;
import com.huazhuo.shop.domain.MobileUsersAuthLicePic;
import com.huazhuo.shop.domain.ProductBrand;
import com.huazhuo.shop.domain.ProductBrandShoppingCategoriesRela;
import com.huazhuo.shop.domain.ShopAddress;
import com.huazhuo.shop.domain.ShopCategoryCommissionRela;
import com.huazhuo.shop.domain.ShoppingCategories;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.log.SysLog;
import com.huazhuo.shop.pojo.ApiResult;
import com.huazhuo.shop.pojo.Lists;
import com.huazhuo.shop.pojo.Register;
import com.huazhuo.shop.pojo.Settlement;
import com.huazhuo.shop.pojo.seet;
import com.huazhuo.shop.security.BackGroupMembers;
import com.huazhuo.shop.security.BackGroups;
import com.huazhuo.shop.security.BackUser;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.MD5;
import com.huazhuo.shop.util.MD5Util;
import com.huazhuo.shop.util.MessageUtils;
import com.huazhuo.shop.util.Transcoding;



@RequestMapping("/register")
@Controller
public class RegisterController {
	//注册的页面
	@RequestMapping(produces = "text/html")
	public String registerForm(Model uiModel) {
		return "register/register";
	}
	
	/**
	 * //提交入住信息的保存
	 * @param register
	 * @param bindingResult
	 * @param uiModel
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(produces = "text/html" ,params = "information")
	public String registerForms(HttpServletRequest request, HttpServletResponse response,@Valid Register register,
		BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		List<MobileUsersAuth> mua=MobileUsersAuth.findId(register.getMoId());
		List<BackUser> backUsers =BackUser.findId(mua.get(0).getRelaOtherUserId());
		BackUser backUser=backUsers.get(0);
		Provinces p = Provinces.findProvinces(register.getProvincesId());
		Cities cities = Cities.findCities(register.getCitiesId());
        String ss=		p.getProvinceName();
        String ss1=	 cities.getName() ;	
        Date date = new Date();
//      backUser 的信息回填
        backUser.setAddress(register.getShopAddress());
        backUser.setCitiesId(register.getCitiesId());
        backUser.setProvincesId(register.getProvincesId());
        backUser.setPhone(register.getShopPhone());
        backUser.setEmail(register.getEmail());
        backUser.setFullName(register.getContactPerson());
        backUser.setContact(register.getLegalPersion());
        backUser.merge();
      //企业信息
    Company com= Company.findMoId(register.getMoId()).get(0);
    com.setBackUser(backUser);
    com.setName(register.getName());
    com.setAudit(11);
    com.setCreatedAt(date);
    com.setAddress(register.getAddress());
    com.setLegalPersion(register.getLegalPersion());
    com.setLegalPersionCard(register.getLegalPersionCard());
    com.setContactPerson(register.getContactPerson());
    com.setPhone(register.getPhone());
    com.setEmail(register.getEmail());
    com.setCreditCode(register.getCreditCode());
    com.merge();
//    店铺
    List<Company> coms =Company.findAllCompanysByUser(backUser);
    Shops shops =new Shops();
    shops.setName(register.getShopName());
    shops.setUrl(register.getShopsImg());
    shops.setAddress(ss+ss1+register.getShopAddress());
    shops.setPhone(register.getShopPhone());
    shops.setServicePhoneExt(register.getShopsPhone());
    shops.setCreatedAt(date);
    shops.setCompany(coms.get(0));
    shops.setEnabled(1);
    shops.setAudit(11);
    shops.setPersion(register.getShopPersion());
    shops.setServicePhone(register.getShopServicePhone());
    shops.setContent(register.getShopContent());
    shops.persist();
  List<Shops> shoppp=  Shops.findAllShopsesByCompanyId(coms.get(0).getId());
   //运营分类
    List<Shops> shop =Shops.findAllShopsesByCompany(coms.get(0));
   String yunying= register.getShopCategoryCommissionRela();
   String[]  strs=yunying.split(",");
   for(int i=0,len=strs.length;i<len;i++){
	   ShopCategoryCommissionRela shc= new ShopCategoryCommissionRela();
	   shc.setCategoryId(Integer.parseInt(strs[i]));
	   shc.setShopId(shop.get(0).getId());
	   shc.setCreateTime(date);
	   shc.persist();
   }

//    账户信息
    HttpRequest.sendPost(H5UrlUtil.APPZHANGHU,
			"openBank=" +register.getOpenBank()  + "&shopId=" + shop.get(0).getId()+ "&accountName=" +register.getAccountName()+ "&accountNumber=" +register.getAccountNumber()); 
   
    
//     默认地址
    ShopAddress  shopAddress =new ShopAddress();
    shopAddress.setAddress(ss+ss1+register.getShopAddress());
    shopAddress.setPhoneNumber(register.getShopPhone());
    shopAddress.setContact(register.getShopPersion());
    shopAddress.setCities(cities);
    shopAddress.setProvinces(p);
    boolean aa=true;
    shopAddress.setReturnProduct(aa);
    shopAddress.setSendProduct(aa);
    shopAddress.setShopId(shoppp.get(0).getId());
    shopAddress.setCreatedAt(date);
    shopAddress.setUpdatedAt(date);
    shopAddress.persist();
if(register.getMobileUsersAuthLicePic()==null){}else{
//    企业资质
    for (MobileUsersAuthLicePic mPic : register.getMobileUsersAuthLicePic()) {
    	if(mPic.getLicePic()==null){
    		
    	}else{
    	mPic.setCreatetime(date);
    	mPic.setMobileUsersAuthId(mua.get(0).getId());
    	mPic.persist();
    }}
}
    MobileUsersAuth mobile =mua.get(0);
    mobile.setLastContractUpdateTime (date);
    mobile.setAuthStatus("0");
    mobile.setVersion(1);
    mobile.setBSignatureNot(0);
    mobile.setB_submitApplyTime(date);
    mobile.merge();
    try {
    	response.sendRedirect(request.getContextPath() +"/register/"+mobile.getId()+"?pendingAudit");
	} catch (IOException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
  SysLog sysLog= new SysLog();
  sysLog.setContent("shop提交审核");
  sysLog.setCreatedAt(date);
  sysLog.setState(true);
  sysLog.setSysLogType(SysLogType.findSysLogType(6));
  sysLog.setOperatorType(1);
  sysLog.setProcessId(com.getId());
  sysLog.setOperator(backUser.getUserName());
  sysLog.merge();
	return null;	
	}
	//提交入住信息的修改保存
		@RequestMapping(produces = "text/html" ,params = "update")
		public String updteForms(HttpServletRequest request, HttpServletResponse response, @Valid Register register,
			BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
			List<MobileUsersAuth> mua=MobileUsersAuth.findId(register.getMoId());
	        Date date = new Date();
	        List<BackUser> backUsers =BackUser.findId(mua.get(0).getRelaOtherUserId());
			BackUser backUser=backUsers.get(0);
			Provinces p = Provinces.findProvinces(register.getProvincesId());
			Cities cities = Cities.findCities(register.getCitiesId());
	        String ss=		p.getProvinceName();
	        String ss1=	 cities.getName() ;	
//	    backUser 的信息回填
        backUser.setAddress(register.getShopAddress());
        backUser.setCitiesId(register.getCitiesId());
        backUser.setProvincesId(register.getProvincesId());
        backUser.setPhone(register.getShopPhone());
        backUser.setEmail(register.getEmail());
        backUser.setFullName(register.getContactPerson());
        backUser.setContact(register.getLegalPersion());
        backUser.merge();
        //企业信息
	    Company com= Company.findCompany(register.getcId());
	    com.setName(register.getName());
	    com.setAudit(11);
	    com.setAddress(register.getAddress());
	    com.setLegalPersion(register.getLegalPersion());
	    com.setLegalPersionCard(register.getLegalPersionCard());
	    com.setContactPerson(register.getContactPerson());
	    com.setPhone(register.getPhone());
	    com.setEmail(register.getEmail());
	    com.setCreditCode(register.getCreditCode());   
	    com.merge();
//	    店铺
	
	    Shops shops = Shops.findShops(register.getsId());
	    
	    shops.setUrl(register.getShopsImg());
	    shops.setName(register.getShopName());
	    shops.setAddress(ss+ss1+register.getShopAddress());
	    shops.setPhone(register.getShopPhone());
	    shops.setServicePhoneExt(register.getShopsPhone());
	    shops.setCreatedAt(date);
	  
	    shops.setEnabled(1);
	    shops.setAudit(11);
	    shops.setPersion(register.getShopPersion());
	    shops.setServicePhone(register.getShopServicePhone());
	    shops.setContent(register.getShopContent());
	    shops.merge();
	 
	   //运营分类
	   String yunying= register.getShopCategoryCommissionRela();
	   List <ShopCategoryCommissionRela> shopcateg= ShopCategoryCommissionRela.findShopId(register.getsId());
	   for(ShopCategoryCommissionRela sdd:shopcateg){
		   sdd.remove();
	   }
	   String[]  strs=yunying.split(",");
	   for(int i=0,len=strs.length;i<len;i++){
		   ShopCategoryCommissionRela shc= new ShopCategoryCommissionRela();
		   shc.setCategoryId(Integer.parseInt(strs[i]));
		   shc.setShopId(register.getsId());
		   shc.setCreateTime(date);
		   shc.merge();
	   }
////	    品牌信息
//	   if(register.getProductBrand()==null){}else{
//	    for (ProductBrand brand : register.getProductBrand()) {
//	    	String categoryId =brand.getCategoryId();
//	    	String[]  str=categoryId.split(",");
//	          String ccc="";
//	    	  for(int i=0,len=str.length;i<len;i++){
//	    		  List<ShoppingCategories> shopList=  ShoppingCategories.getId(Integer.valueOf(str[i]));
//	    		 
//	    		  ccc=ccc+ shopList.get(0).getName()+",";
//	    	  }
//	    	  if(ccc==null){}
//	    	  else{
//	    		  ccc = ccc.substring(0,ccc.length() - 1); 
//	    	  }
//	    	  
//	    	 brand.setCategoryName(ccc);
//	    	 brand.setCreatedAt(date);
//	    	 brand.setUpdatedAt(date);
//	    	 brand.setUuid(UUID.randomUUID().toString());
//	    	 brand.setBrandShop(register.getsId());
//	    	 ProductBrand product=brand;
//	    	if( brand.getId()!=null){
//	    	 brand.remove();
//	    	}
//	    	 product.merge();
//	    	
//	    	List<ProductBrand> as =ProductBrand.findId(brand.getUuid());
//	    	ProductBrandShoppingCategoriesRela   pbscr= new ProductBrandShoppingCategoriesRela();
//	    	
//	    	 //删除原来的  重新添加  
//	    	List<ProductBrandShoppingCategoriesRela> productBrand=ProductBrandShoppingCategoriesRela.deleteproductBrandId(as.get(0).getId());
//	    	
//	    	if(productBrand.size()>0){
//	    	for(ProductBrandShoppingCategoriesRela dd: productBrand){
//	    		dd.remove();
//	    	}
//	    	}
//	    	 
//	    	   for(int i=0,len=str.length;i<len;i++){
//	    		   pbscr.setProductBrandId(as.get(0).getId()); 
//	    		   pbscr.setShoppingCategoriesId(Integer.parseInt(str[i]));
//	    		   pbscr.merge();
//	    	   }
//	    	
//	    }
//	   }
//	    账户信息
	   String sssss= HttpRequest.sendPost(H5UrlUtil.APPZHANGHUUPDATE,
	    		"id=" +register.getShId() + "&openBank=" +register.getOpenBank()  + "&shopId=" + register.getsId()+ "&accountName=" +register.getAccountName()+ "&accountNumber=" +register.getAccountNumber()); 
	   List<ShopAddress>  shopAddre =ShopAddress.findAllShopAddressesByShopId(shops.getId());
	   ShopAddress shopAddress=new ShopAddress();
	   if(shopAddre.size()>0){
		   shopAddress=shopAddre.get(0);
	  }
	  
	    shopAddress.setAddress(ss+ss1+register.getShopAddress());
	    shopAddress.setPhoneNumber(register.getShopPhone());
	    shopAddress.setContact(register.getShopPersion());
	    shopAddress.setCities(cities);
	    shopAddress.setProvinces(p);
	    boolean aa=true;
	    shopAddress.setReturnProduct(aa);
	    shopAddress.setSendProduct(aa);
	    shopAddress.setShopId(shops.getId());
	    shopAddress.setCreatedAt(date);
	    shopAddress.setUpdatedAt(date);
	    shopAddress.merge();
	    
	    MobileUsersAuth mobile =mua.get(0);
	    mobile.setLastContractUpdateTime (date);
	    mobile.setAuthStatus("0");
	    mobile.setVersion(1);
	    mobile.setBSignatureNot(0);
//	    mobile.setBSignatureTime(date);
	    mobile.setB_submitApplyTime(date);
	   
	    mobile.merge();
//	    企业资质
	  //删除原来的  重新添加 
	   List<MobileUsersAuthLicePic>  mobileUsersAuthLicePic=MobileUsersAuthLicePic.AuthId(register.getMoId());
	   if(mobileUsersAuthLicePic.size()>0){
	   for(MobileUsersAuthLicePic pic:mobileUsersAuthLicePic){
		   pic.remove();
	   }
	   }
	   if(register.getMobileUsersAuthLicePic()!=null){
	    for (MobileUsersAuthLicePic mPic : register.getMobileUsersAuthLicePic()) {
	    	if(mPic.getLicePic()==null){
	    		
	    	}else{
	    	mPic.setCreatetime(date);
	    	mPic.setMobileUsersAuthId(mobile.getId());
	    	mPic.persist();
	    	}
	    	}
	   }
		try {
			response.sendRedirect(request.getContextPath() +"/register/"+mobile.getId()+"?pendingAudit");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 SysLog sysLog= new SysLog();
		  sysLog.setContent("shop提交审核");
		  sysLog.setCreatedAt(date);
		  sysLog.setState(true);
		  sysLog.setSysLogType(SysLogType.findSysLogType(6));
		  sysLog.setOperatorType(1);
		  sysLog.setProcessId(com.getId());
		  sysLog.setOperator(backUser.getUserName());
		  sysLog.merge();
		return null;	
		}
		
		
		
		
	//提交入住信息的页面
	@RequestMapping(value = "/{id}", produces = "text/html", params = "information")
	public String showSend(@PathVariable("id") Integer id,Model uiModel) {
          uiModel.addAttribute("id", id);
          List<ShoppingCategories> shopping = ShoppingCategories.findAllShoppingCategoriesesByParentId();
          List<ShoppingCategories> shoppingss = ShoppingCategories.findAllShoppingCategoriesestId();
 
          uiModel.addAttribute("shoppingss",shoppingss);
          uiModel.addAttribute("shopping",shopping);
		return "register/registrationInformation";
	}
	
	
	
	
	
	//合同的页面
	@RequestMapping(value = "/{id}", produces = "text/html", params = "contract")
	public String showContract(@PathVariable("id") String id,Model uiModel) {
     	List<BackUser> users = BackUser.findAllUsersByUserName(id);
    	List<MobileUsersAuth> mo=MobileUsersAuth.findRelaId(users.get(0).getId());
//	公司
    	List<Company> company =Company.findAllCompanysByUser(users.get(0));
//	商铺
		List<Shops> shops =Shops.findAllShopsesByCompanyId(company.get(0).getId());
////		品牌
//    	List<ProductBrand> productBrand=ProductBrand.findSid(shops.get(0).getId());
    	String ssid=shops.get(0).getId().toString();
    	//    	合同费用
    	String ss=  HttpRequest.sendPost(H5UrlUtil.SERVICE_ZOL_URL,"sellerId="+mo.get(0).getId());
    	 Gson gson1 = new Gson();
    	 seet  lps = gson1.fromJson(ss, seet.class);
    	
    	List expense= new ArrayList();
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
//    	uiModel.addAttribute("productBrand",productBrand);
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
   
    	
		return "register/registrContract";
		
	}
	/**
	 * 修改页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
		@RequestMapping(value = "/{id}", produces = "text/html", params = "update")
		public String updateSend(@PathVariable("id") String id,Model uiModel) {
			  List<ShoppingCategories> shopping = ShoppingCategories.findAllShoppingCategoriesesByParentId();
	          List<ShoppingCategories> shoppingss = ShoppingCategories.findAllShoppingCategoriesestId();
              
	        
			List<BackUser> users = BackUser.findAllUsersByUserName(id);
			List<Company> company =Company.findAllCompanysByUser(users.get(0));
		
			List<Shops> shops =Shops.findAllShopsesByCompanyId(company.get(0).getId());
			List<MobileUsersAuth> mo=MobileUsersAuth.findRelaId(users.get(0).getId());
			Integer moId=mo.get(0).getId();
//	         运营
			  List<ShopCategoryCommissionRela> shopCategoryCommissionRela=ShopCategoryCommissionRela.findShopId(shops.get(0).getId());
              String shopCategoryCommission = "";
			  for(ShopCategoryCommissionRela sh:shopCategoryCommissionRela){
				  shopCategoryCommission=shopCategoryCommission+sh.getCategoryId()+",";
               }
			  if( shopCategoryCommission == ""){}else{
				  String ss= shopCategoryCommission.substring(0,shopCategoryCommission.length()-1);
					 uiModel.addAttribute("shopCategoryCommissionRela",ss); 
			  }
			  
			  
			  String settlement=	HttpRequest.sendGet(H5UrlUtil.SERVICE_QUERY_URL,"shopId="+shops.get(0).getId());

		    	 Gson gson = new Gson();
		         Settlement lp=null;
				try {
					lp = gson.fromJson(settlement, Settlement.class);
				} catch (Exception e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
		    	
				uiModel.addAttribute("settlement",lp);
			  //	          DELETE FROM Table z WHERE z.name = :name
			List<ProductBrand> productBrand=ProductBrand.findSid(shops.get(0).getId());
			List<MobileUsersAuthLicePic> mobileUsersAuthLicePic =MobileUsersAuthLicePic.AuthId(moId);
//		省
			Provinces p = Provinces.findProvinces(users.get(0).getProvincesId());
//			市
			Cities cities = Cities.findCities(users.get(0).getCitiesId());
	        String city=p.getProvinceName();
	        String cityName=cities.getName() ;
	        uiModel.addAttribute("city",city);
			uiModel.addAttribute("cityName",cityName);
			uiModel.addAttribute("cityAddress",users.get(0).getAddress());
			uiModel.addAttribute("shoppingss",shoppingss);
			  uiModel.addAttribute("moId",moId);
	          uiModel.addAttribute("shopping",shopping);
			uiModel.addAttribute("shops",shops.get(0));
			uiModel.addAttribute("company",company.get(0));
			uiModel.addAttribute("productBrand",productBrand);
			uiModel.addAttribute("mobileUsersAuthLicePic",mobileUsersAuthLicePic);
			Integer productBrandSize=productBrand.size();
			uiModel.addAttribute("productBrandSize",productBrandSize);
		
			return "register/registerUpdate";
		}

	
		/**
		 * //注册的保存
		 * @param backUser
		 * @param smsToken
		 * @param userNamess
		 * @param bindingResult
		 * @param uiModel
		 * @param httpServletRequest
		 * @return
		 */
	@Transactional
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String register(@Valid BackUser backUser,
			@RequestParam(value = "smsToken", required = false) String smsToken, 
			@RequestParam(value = "userNamess", required = false) String userNamess, 
			BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
		List<BackUser> users = BackUser.findAllUsersByUserName(backUser.getUserName());
		if (users.size() > 0) {
			return "login";
		}
	
		Date date = new Date();
		// 注册登录用户
		backUser.setEnabled(true);// TODO
		String pass = backUser.getPassword();
		backUser.setPassword(MD5.sha256(backUser.getPassword()));
		backUser.setFullName("as");
		backUser.setCreatedTime(date);
	
		backUser.persist();
		List<BackUser> user = BackUser.findAllUsersByUserName(backUser.getUserName());
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING+"/mobileUsers/register", "userName=" +backUser.getUserName()+"&passWord="+pass+"&sms="+smsToken);
//		MobileUsers mu=new MobileUsers();
//		mu.setUserName(backUser.getUserName());
//		mu.setUserName(backUser.getUserName());
//		mu.setPassword(	MD5Util.string2MD5(pass));
//		mu.persist();
		MobileUsersAuth  mua=new MobileUsersAuth();
		List<MobileUsers> mobileUser = MobileUsers.findAllMobileUsersName(backUser.getUserName());
		mua.setUserId(mobileUser.get(0).getId());
		mua.setAuthStatus("100");
		mua.setAuthRole("2");
		mua.setRelaOtherUserId(user.get(0).getId());
	    mua.setCreateTime( date);
		mua.setSignatureStatus(0);
		mua.setLastContractUpdateTime (date);
		mua.setRecommondPhone(userNamess);
		mua.persist();
		
		// 给用户添加权限
		BackGroupMembers bgm = new BackGroupMembers();
		bgm.setPermissionGroup(BackGroups.findAllBackGroupses().get(0));
		bgm.setUser(backUser);
		bgm.persist();

	    List<MobileUsersAuth> mobile = MobileUsersAuth.findUserId(mobileUser.get(0).getId());
	    Company company=new Company();
	    company.setMobileUsersAuthId(mobile.get(0).getId());
	    company.setBackUser(user.get(0));
	    company.setAudit(100);
	    company.persist();
	   Integer mId=mobile.get(0).getId();
	    uiModel.addAttribute("mId", mId);
	    uiModel.addAttribute("state", 1);
	    SysLog sysLog= new SysLog();
	    sysLog.setContent("shop注册成功");
	    sysLog.setCreatedAt(date);
	    sysLog.setState(true);
	    sysLog.setSysLogType(SysLogType.findSysLogType(6));
	    sysLog.setOperatorType(1);
	    sysLog.setProcessId(company.getId());
	    sysLog.setOperator(backUser.getUserName());
	    sysLog.merge();
	    
		return "register/registerSucc";
		
	}

	@RequestMapping(produces = "text/html", params = "method=checkUser", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> checkUser(@RequestParam(value = "userName", required = true) String userName, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outStr = "true";
		List<BackUser> users = BackUser.findAllUsersByUserName(userName);
		if(users.size()>0){
			outStr="fasle";
		}
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}
	
	@RequestMapping(produces = "text/html", params = "method=sendSms", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> sendSms(@RequestParam(value = "userName", required = true) String userName, Model uiModel,
			HttpServletRequest request, HttpServletResponse response) throws IOException {
		String outStr = "true";
		MessageUtils.sendSms(userName);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}

	@RequestMapping(produces = "text/html", params = "method=checkSms", method = RequestMethod.POST)
	public ResponseEntity<java.lang.String> checkSms(@RequestParam(value = "userName", required = true) String userName,
			@RequestParam(value = "smsToken", required = true) String smsToken, Model uiModel, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String outStr = "true";
		String str = MessageUtils.checkSms(userName, smsToken);
		Gson gson = new Gson();
		ApiResult header = gson.fromJson(str, ApiResult.class);
		if (header.getHeader().getCode() != 0) {
			outStr = "false";
		}
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		PrintWriter out = response.getWriter();
		out.print(outStr);
		out.flush();
		out.close();
		return null;
	}
	/**
	 * 合同de 确认
	 * @param moId
	 * @param state
	 * @param uiModel
	 * @param httpServletRequest
	 * @return
	 */
	@RequestMapping(produces = "text/html" ,params = "contracting")
	public String contractForm(HttpServletRequest request, HttpServletResponse response,@RequestParam(value = "moId", required = true) Integer moId,@RequestParam(value = "state", required = true) Integer state,
			 @RequestParam(value = "reason", required = true) String reason,
			
	 Model uiModel, HttpServletRequest httpServletRequest) {
		 Date date =new Date();
			if(reason.length()>0){
				List<MobileUsersAuth> mos=MobileUsersAuth.findId(moId);
				MobileUsersAuth  mo=mos.get(0);
				mo.setSignatureRejectReason(reason);
				mo.setBSignatureNot(0);
				mo.setSignatureStatus(2);
				mo.setAuthStatus("99");
//				mo.setBSignatureTime(date);
				mo.setLastContractUpdateTime (date);
				mo.merge();
			
				List<Company> user=Company.findMoId(mo.getId());
				Company sdd=user.get(0);
				sdd.setAudit(99);
				sdd.merge();
				
				  try {
						response.sendRedirect(request.getContextPath() +"/register/"+mo.getId()+"?pendingAudit");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					List<BackUser> users = BackUser.findId(mo.getRelaOtherUserId());
				  SysLog sysLog= new SysLog();
				    sysLog.setContent("shop拒绝签章");
				    sysLog.setCreatedAt(date);
				    sysLog.setState(true);
				    sysLog.setSysLogType(SysLogType.findSysLogType(6));
				    sysLog.setOperatorType(1);
				    sysLog.setProcessId(sdd.getId());
				    sysLog.setOperator(users.get(0).getUserName());
				    sysLog.merge();
					return null;	
			}
			else{
				List<MobileUsersAuth> mos=MobileUsersAuth.findId(moId);
				MobileUsersAuth  mo=mos.get(0);
				mo.setSignatureStatus(state);
//				mo.setB_submitApplyTime(date);
				mo.setBSignatureTime(date);
				mo.setBSignatureNot(0);
				mo.setLastContractUpdateTime (date);
				mo.merge();
				List <Company> com =Company.findMoId(mo.getId());
				Company company=com.get(0);
				
			
				List<BackUser> users = BackUser.findId(mo.getRelaOtherUserId());
//				省
				Provinces p = Provinces.findProvinces(users.get(0).getProvincesId());
//				市
				Cities cities = Cities.findCities(users.get(0).getCitiesId());
		        String province=p.getProvinceName();
		        String cityName=cities.getName() ;
				String ss=  HttpRequest.sendPost(H5UrlUtil.SERVICE_CONTRACT_URL,
//						  "sellerId="+mo.getId()+"&certType="+mo.getAuthRole()+"&custName="+company.getLegalPersion()+"&identType=0&identNo="+company.getLegalPersionCard()+"&email="+company.getEmail()+"&telphone="+company.getPhone()+"&address="+company.getAddress()+"&org="+company.g+"&province"=北京&"&city"=北京&"&postcode"=100000&"&xPosition"=100&"&yPosition"=100
						  
						  "sellerId="+mo.getId()+
							"&certType="+0+
							"&custName="+Transcoding.urlEncode(company.getLegalPersion())+
							"&identType="+0+
							"&identNo="+Transcoding.urlEncode(company.getLegalPersionCard())+
							"&email="+company.getEmail()+
							"&telphone="+company.getPhone()+
							"&address="+Transcoding.urlEncode(company.getAddress())+
							"&org="+Transcoding.urlEncode(company.getName())+
							"&unit=''&country=CN &province="+Transcoding.urlEncode(province)+
							"&city="+Transcoding.urlEncode(cityName)+
							"&postcode=000000&xPosition=145&yPosition=510&pageNum=2"
						
						  ); 

				  try {
						response.sendRedirect(request.getContextPath() +"/register/"+mo.getId()+"?pendingAudit");
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
				  SysLog sysLog= new SysLog();
				    sysLog.setContent("shop签订合同");
				    sysLog.setCreatedAt(date);
				    sysLog.setState(true);
				    sysLog.setSysLogType(SysLogType.findSysLogType(6));
				    sysLog.setOperatorType(1);
				    sysLog.setProcessId(company.getId());
				    sysLog.setOperator(users.get(0).getUserName());
				    sysLog.merge();
					return null;	
			}
		
	}
	/**
	 * 待审核页面
	 * @param id
	 * @param uiModel
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "pendingAudit")
	public String pendingAudit(HttpServletRequest request, HttpServletResponse response,@PathVariable("id") Integer id,Model uiModel) throws IOException {
     
		uiModel.addAttribute("authStatus",0);
		  
	    uiModel.addAttribute("state", 2);
		List<MobileUsersAuth> sd=MobileUsersAuth.findId(id);
		String authStatus=sd.get(0).getAuthStatus();
		Integer aa=Integer.valueOf(authStatus);
		Integer dsStatus=sd.get(0).getSignatureStatus();
		List<BackUser> user = BackUser.findId(sd.get(0).getRelaOtherUserId());
		if(aa==0){
			return "register/registerSucc";
			
		}else{
			if(aa==3){
				response.sendRedirect(request.getContextPath() +"/register/"+user.get(0).getId()+"?fail");	
			}
			if(aa==99){
				response.sendRedirect(request.getContextPath() +"/register/"+user.get(0).getId()+"?contractFail");
			}
	         if(aa==2){
	        	 if(dsStatus==1){
	 				response.sendRedirect(request.getContextPath() +"/register/"+user.get(0).getUserName()+"?contractSuccess");
	 				}
	        	 if(dsStatus==0){
	        		 response.sendRedirect(request.getContextPath() +"/register/"+user.get(0).getId()+"?Success");
		 				}
	        	
			}
			return null;
		}
	
	}
	/**
	 * 审核失败页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "fail")
	public String fail(@PathVariable("id") Integer id,Model uiModel) {
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(id);
		String  Reason=sd.get(0).getAuthReasion();
		List<BackUser> user = BackUser.findId(id);
		uiModel.addAttribute("userId",user.get(0).getUserName());
		uiModel.addAttribute("authStatus",3);
		uiModel.addAttribute("Reason",Reason);
	    uiModel.addAttribute("state", 2);
	   
		return "register/registerSucc";
		
	}
	/**
	 * 审核成功页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "Success")
	public String Success(@PathVariable("id") Integer id,Model uiModel) {
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(id);
		String  Reason=sd.get(0).getAuthReasion();
		List<BackUser> user = BackUser.findId(id);
		uiModel.addAttribute("mId",user.get(0).getUserName());
		uiModel.addAttribute("authStatus",2);
		
	    uiModel.addAttribute("state", 2);
	   
		return "register/registerSucc";
		
	}
	/**
	 * 审核成功页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "NoSuccess")
	public String NoSuccess(@PathVariable("id") Integer id,Model uiModel) {
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(id);
		String  Reason=sd.get(0).getAuthReasion();
		List<BackUser> user = BackUser.findId(id);
		uiModel.addAttribute("mId",user.get(0).getUserName());
		uiModel.addAttribute("authStatus",7);
		
	    uiModel.addAttribute("state", 2);
	   
		return "register/registerSucc";
		
	}
	/**
	 * hetong 通过页面
	 * @param id
	 * @param uiModel
	 * @return
	 * @throws IOException 
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "contractSuccess")
	public String contractSuccess(HttpServletRequest request, HttpServletResponse response,@PathVariable("id") String id,Model uiModel) throws IOException {
		List<BackUser> user = BackUser.findAllUsersByUserName(id);
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(user.get(0).getId());
		
		Integer dsStatus=sd.get(0).getSignatureStatus();
		
		

		if(dsStatus==1){

			uiModel.addAttribute("statedd",1);
			
		    uiModel.addAttribute("state", 4);
		   
			return "register/registerSucc";
		}else{
		
			if(dsStatus==3){
				response.sendRedirect(request.getContextPath() +"/register/"+user.get(0).getUserName()+"?fistSuccess");
			}
			if(dsStatus==4){
				response.sendRedirect(request.getContextPath() +"/register/"+user.get(0).getUserName()+"?contractFail");	
			}
			return null;
		}
		
	}
	/**
	 * 审核成功页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "updatess")
	public String updatess(@PathVariable("id") Integer id,Model uiModel) {
	
		uiModel.addAttribute("authStatus",4);
		
	    uiModel.addAttribute("state", 2);
	   
		return "register/registerSucc";
		
	}
	/**
	 * 修改申请成功页面（注册成功也是这个页面）
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "updateSuccess")
	public String updateSuccess(@PathVariable("id") String id,Model uiModel) {
	
		List<BackUser> user =  BackUser.findAllUsersByUserName(id);
		List<Company> company =Company.findAllCompanysByUser(user.get(0));
		if(company.get(0).getName()==null){
			List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(user.get(0).getId());
			 uiModel.addAttribute("mId", sd.get(0).getId());
		    uiModel.addAttribute("state", 1);
		  
		}else{
		uiModel.addAttribute("authStatus",5);
		
	    uiModel.addAttribute("state", 2);
	    uiModel.addAttribute("id", id);
		}
		return "register/registerSucc";
		
	}
	/**
	 * hetong shi bai 页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "contractFail")
	public String contractFail(@PathVariable("id") Integer id,Model uiModel) {
	
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(id);
		String  Reason=sd.get(0).getSignatureRejectReason();
		List<BackUser> user = BackUser.findId(id);
		uiModel.addAttribute("userId",user.get(0).getUserName());
		
		uiModel.addAttribute("Reason",Reason);
		if(sd.get(0).getSignatureStatus()==2){
			if(Integer.valueOf(sd.get(0).getAuthStatus())==100){
				uiModel.addAttribute("state", 2);
			    uiModel.addAttribute("authStatus", 5);	
			    uiModel.addAttribute("id",user.get(0).getUserName() );	
			}else{
				uiModel.addAttribute("state", 2);
			    uiModel.addAttribute("authStatus", 4);	
			}
			
		}else{
			uiModel.addAttribute("state", 4);
		    uiModel.addAttribute("statedd", 2);	
		}
	    
	    
		return "register/registerSucc";
		
	}
	/**
	 * diyi ci deng ru
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "fistSuccess")
	public String fistSuccess(@PathVariable("id") String id,Model uiModel) {
	
	
		 uiModel.addAttribute("id", id);
	    uiModel.addAttribute("state", 5);
	 
	    
		return "register/registerSucc";
		
	}
	/**
	 * 注册成功的跳转
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "registerSuccess")
	public String registerSuccess(@PathVariable("id") Integer id,Model uiModel) {
	
	
		 uiModel.addAttribute("mId", id);
	    uiModel.addAttribute("state", 1);
	  
	 
	    
		return "register/registerSucc";
		
	}
	/**
	 * 解约
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "surrender")
	public String surrender(@PathVariable("id") Integer id,Model uiModel) {
		uiModel.addAttribute("state", 1);
		return "register/registerPrompt";
		
	}
	/**
	 * 过期
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "overdue")
	public String overdue(@PathVariable("id") Integer id,Model uiModel) {
		uiModel.addAttribute("state", 2);
		return "register/registerPrompt";
		
	}
	/**
	 * 解约续签
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "updateSurrender")
	public String updateSurrender(@PathVariable("id") String id,Model uiModel) {
		uiModel.addAttribute("state", 3);
		uiModel.addAttribute("id", id);
		return "register/registerPrompt";
		
	}
	/**
	 * 过期续签
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "updateOverdue")
	public String updateOverdue(@PathVariable("id") String id,Model uiModel) {
		uiModel.addAttribute("state", 4);
		uiModel.addAttribute("id", id);
		return "register/registerPrompt";
		
	}
	/**
	 * 财务拒绝 页面
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "financialRejection")
	public String financialRejection(@PathVariable("id") String id,Model uiModel) {
		List<BackUser> user = BackUser.findAllUsersByUserName(id);
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(user.get(0).getId());
		String  Reason=sd.get(0).getSignatureRejectReason();
		
		uiModel.addAttribute("userId",user.get(0).getUserName());
	
		uiModel.addAttribute("Reason",Reason);
	    
	    uiModel.addAttribute("state", 4);
	    uiModel.addAttribute("statedd", 2);
	    
		return "register/registerSucc";
		
	}
	/**
	 * 财务拒绝 页面  修改
	 * @param id
	 * @param uiModel
	 * @return
	 */
	@RequestMapping(value = "/{id}", produces = "text/html", params = "financialRejectionUpdate")
	public String financialRejectionUpdate(@PathVariable("id") String id,Model uiModel) {
		List<BackUser> user = BackUser.findAllUsersByUserName(id);
		List<MobileUsersAuth> sd=MobileUsersAuth.findRelaId(user.get(0).getId());
		String  Reason=sd.get(0).getSignatureRejectReason();
		
		uiModel.addAttribute("userId",user.get(0).getUserName());
	
		uiModel.addAttribute("Reason",Reason);
	    
	    uiModel.addAttribute("state", 4);
	    uiModel.addAttribute("statedd", 3);
	    
		return "register/registerSucc";
		
	}
}
