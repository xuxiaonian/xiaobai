package com.huazhuo.shop.web;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;
import java.util.List;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;

import org.springframework.http.ResponseEntity;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.city.Locality;
import com.huazhuo.shop.domain.ProductBrand;
import com.huazhuo.shop.domain.ShopFreightFreeShipping;
import com.huazhuo.shop.domain.ShopFreightFreeShippingCity;
import com.huazhuo.shop.domain.ShopFreightTemplate;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.enumtype.ShopFreightTemplateType;
import com.huazhuo.shop.pojo.Freight;

@RequestMapping("/shopfreighttemplates")
@Controller
@RooWebScaffold(path = "shopfreighttemplates", formBackingObject = ShopFreightTemplate.class)
@SessionAttributes({ "freightTemplate", "shop", "CurrentUser", "sessionShopId" })
public class ShopFreightTemplateController {

	@ModelAttribute("subtree")
	public void createSubtreet(HttpServletRequest httpServletRequest) {
		httpServletRequest.getSession().setAttribute("subtree", "freightTemplate");
	}

	@RequestMapping(params = "form", produces = "text/html")
	public String createForm(@RequestParam(value = "productId", required = false) Integer productId, Model uiModel) {
		populateEditForm(uiModel, new ShopFreightTemplate());
		uiModel.addAttribute("productId", 3);
		return "shopfreighttemplates/create";
	}

	@RequestMapping(value = "/{id}", params = "form", produces = "text/html")
	public String updateForm(@PathVariable("id") Integer id,
			@ModelAttribute("sessionShopId") Integer shop,Model uiModel) {
		ShopFreightTemplate sft=ShopFreightTemplate.findShopFreightTemplate(id);
		if(sft.getTemplateType()==0){
			if(sft.getMode()==0){
				populateEditForm(uiModel, sft);
				return "shopfreighttemplates/update";
			}else{
				populateEditForm(uiModel, sft);
				return "shopfreighttemplates/update1";
			}
		
		}else{
		populateEditForm(uiModel, sft);
		 List<ShopFreightTemplate>	shopFreightTemplate	=ShopFreightTemplate.findShopId(shop);
		   String city="";	
		   for(ShopFreightTemplate ss : shopFreightTemplate){
		   	
		   	List<ShopFreightFreeShippingCity> cc=	ShopFreightFreeShippingCity.findShopId(ss.getShopFreightFreeShipping().get(0));
		   for(ShopFreightFreeShippingCity aa :cc){
			   city=city+aa.getProvinces().getId()+",";
		   }
		   }
		   if(city.length()>0){
			   city=city.substring(0,city.length()-1);
		   }
		   uiModel.addAttribute("city", city);
		return "shopfreighttemplates/update2";
		}
	}

	@RequestMapping(params = "city", produces = "text/html")
	public String cityForm(Model uiModel) {
		List<Locality> localities = Locality.findAllLocalitys();
		uiModel.addAttribute("localities", localities);
		return "shopfreighttemplates/city";
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
	public String create(@Valid ShopFreightTemplate shopFreightTemplate, @RequestParam(value = "productId", required = false) Integer productId,
			@ModelAttribute("sessionShopId") Integer shop, Model uiModel, HttpServletRequest httpServletRequest) {
		Date date = new Date();
		if(shopFreightTemplate.getTemplateType()==null){
		shopFreightTemplate.setTemplateType(0);
		}
		if(shopFreightTemplate.getPrior()==null){
			shopFreightTemplate.setPrior(0);
		}
		
		shopFreightTemplate.setShopId(shop);
		shopFreightTemplate.setUpdatedAt(date);
		shopFreightTemplate.setCreatedAt(date);
		shopFreightTemplate.setCreatedAt(date);
		shopFreightTemplate.removeEmptyDetail();
		shopFreightTemplate.persist();

		if (productId == null) {
			return "redirect:/shopfreighttemplates";
		} else {
			if(shopFreightTemplate.getTemplateType()==0){
				return "redirect:/shopfreighttemplates/"+productId+"?form";
			}else{
				return "redirect:/shopfreighttemplates/"+productId+"?listShop";
			}
			
		}
	}

	@RequestMapping(method = RequestMethod.PUT, produces = "text/html")
	public String update(@Valid ShopFreightTemplate shopFreightTemplate, Model uiModel, HttpServletRequest httpServletRequest) {
		Date date = new Date();
		ShopFreightTemplate oldShopFreightTemplate = ShopFreightTemplate.findShopFreightTemplate(shopFreightTemplate.getId());
		shopFreightTemplate.setShopId(oldShopFreightTemplate.getShopId());
		shopFreightTemplate.setUpdatedAt(date);
		shopFreightTemplate.setCreatedAt(oldShopFreightTemplate.getCreatedAt());
		shopFreightTemplate.removeEmptyDetail();
		shopFreightTemplate.removeShipping();
		uiModel.asMap().clear();
		shopFreightTemplate.merge();
		
		return "redirect:/shopfreighttemplates";
	}
//dan pin
	@RequestMapping(produces = "text/html")
	public String list(@ModelAttribute("sessionShopId") Integer shop, Model uiModel) {
		uiModel.addAttribute("shopfreighttemplates", ShopFreightTemplate.findShIds(shop));
		return "shopfreighttemplates/list";
	}

	@RequestMapping(method = RequestMethod.POST, produces = "text/html", params = "method=cope")
	public String cope(@RequestParam("templateId") Integer templateId, @ModelAttribute("sessionShopId") Integer shop, Model uiModel,
			HttpServletRequest httpServletRequest) {
		ShopFreightTemplate shopFreightTemplate = ShopFreightTemplate.findShopFreightTemplate(templateId);
		if (shopFreightTemplate.getShopId() == shop) {
			ShopFreightTemplate newShopFreightTemplate = ShopFreightTemplate.getNewShopFreightTemplate(shopFreightTemplate);
			newShopFreightTemplate.persist();
		}
		return "redirect:/shopfreighttemplates";
	}

	@RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
	public ResponseEntity<java.lang.String> delete(@PathVariable("id") Integer id, Model uiModel, HttpServletRequest request, HttpServletResponse response)
			throws IOException {
		String str = "true";
		PrintWriter out = response.getWriter();
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		response.setHeader("Cache-Control", "no-cache");
		ShopFreightTemplate shopFreightTemplate = ShopFreightTemplate.findShopFreightTemplate(id);
		try {
			shopFreightTemplate.remove();
		} catch (Exception e) {
			//e.printStackTrace();
			str="false";
		} finally {
			
		} 
		uiModel.asMap().clear();
		out.print(str);
		out.flush();
		out.close();
		return null;
	}

	void populateEditForm(Model uiModel, ShopFreightTemplate shopFreightTemplate) {
		uiModel.addAttribute("shopFreightTemplate", shopFreightTemplate);
		addDateTimeFormatPatterns(uiModel);
		uiModel.addAttribute("shopfreighttemplatetypes", ShopFreightTemplateType.findAllShopFreightTemplateTypes());
	}
	 //新增
    @RequestMapping(value = "/{sid}", produces = "text/html", params = "shops")
   	
       public String shops(	@RequestParam(value = "productId", required = false) Integer productId, 
    		   @ModelAttribute("sessionShopId") Integer shop,
    		   @RequestParam(value = "sid", required = false) Integer sid,Model uiModel) {
   		populateEditForm(uiModel, new ShopFreightTemplate());
   		uiModel.addAttribute("productId", shop);
   List<ShopFreightTemplate>	shopFreightTemplate	=ShopFreightTemplate.findShopId(shop);
   String city="";	
   for(ShopFreightTemplate ss : shopFreightTemplate){
   	
   	List<ShopFreightFreeShippingCity> cc=	ShopFreightFreeShippingCity.findShopId(ss.getShopFreightFreeShipping().get(0));
   for(ShopFreightFreeShippingCity aa :cc){
	   city=city+aa.getProvinces().getId()+",";
   }
   }
   if(city.length()>0){
	   city=city.substring(0,city.length()-1);
   }
   uiModel.addAttribute("city", city);
   return "shopfreighttemplates/createShops";
    }
    //计算模式
    @RequestMapping(value = "/{sid}", produces = "text/html", params = "calculation")
   	
       public String calculation(	@ModelAttribute("sessionShopId") Integer shop,
    		   @RequestParam(value = "calculationModel", required = false) Integer calculationModel,
    		   @RequestParam(value = "sid", required = false) Integer sid,Model uiModel) {
    	List<Shops> shops=Shops.finId(shop);
    	Shops shopse=shops.get(0);
    	if(calculationModel!=null){
    		shopse.setCalculationModel(calculationModel);
    		shopse.merge();
       }
    	List<Shops> shopss=Shops.finId(shop);
         uiModel.addAttribute("shops",shopss.get(0));

   		return "shopfreighttemplates/calculation";
    }
  //dian pu
    @RequestMapping(value = "/{sid}",produces = "text/html" , params = "listShop")
    public String listShop(@ModelAttribute("sessionShopId") Integer shop, Model uiModel) {
    	uiModel.addAttribute("shopfreighttemplates", ShopFreightTemplate.findShIdss(shop));
    	return "shopfreighttemplates/listShop";
    }
}
