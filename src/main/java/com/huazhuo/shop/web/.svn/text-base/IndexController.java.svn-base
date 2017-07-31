package com.huazhuo.shop.web;

import java.text.ParseException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.huazhuo.shop.bill.ShopBill;
import com.huazhuo.shop.domain.ShopOrderRetrun;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.domain.ShoppingProducts;
import com.huazhuo.shop.domain.Shops;
import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.pojo.IndexPoJo;
import com.huazhuo.shop.util.DateUtils;

@RequestMapping("/index")
@Controller
@SessionAttributes({ "index", "shop" })
public class IndexController {

	public static final Integer STAY_PAY = 1;

	public static final Integer STAY_SEND = 2;

	public static final Integer SEND = 3;

	public static final Integer SUCCESS = 4;

	public static final Integer FAIL = 5;
	
	@ModelAttribute("subtree")
	public void createSubtreet(HttpServletRequest httpServletRequest) {
		httpServletRequest.getSession().setAttribute("subtree", "index");
	}
	
	@RequestMapping(produces = "text/html")
    public String indexForm(@ModelAttribute("shop") Shops shop,Model uiModel) throws ParseException {
		IndexPoJo index = new IndexPoJo();
		ShopOrderType ShopOrderTypeSTAY_SEND = ShopOrderType.findShopOrderType(STAY_SEND);
		ShopOrderType ShopOrderTypeSTAY_PAY = ShopOrderType.findShopOrderType(STAY_PAY);
		//待发货
		index.setStaySend(ShopOrders.countShopOrdersesByShopAndShopOrderType(shop.getId(), ShopOrderTypeSTAY_SEND));
		//待付款
		index.setStayPay(ShopOrders.countShopOrdersesByShopAndShopOrderType(shop.getId(), ShopOrderTypeSTAY_PAY));
		//待处理退款申请
		index.setStayReturnPay(ShopOrderRetrun.countShopOrderRetrunsByShopIdAndShopOrderRetrunType(shop.getId(), ShopOrderRetrunType.findShopOrderRetrunType(1)));
		//销售中的商品
		index.setOnSale(ShoppingProducts.countShoppingProductsesByShopIdAndOnSale(shop.getId(), 1));
		//仓库中的商品
		index.setNoSale(ShoppingProducts.countShoppingProductsesByShopIdAndOnSaleAndStore(shop.getId(), 0,true));
		//等待审核的商品
		index.setStayStatus(ShoppingProducts.countShoppingProductsesByShopIdAndReview(shop.getId(), 0));
		//待确认账单
		index.setGenerateBill(ShopBill.countShopBillsByBillEnum(1,shop.getId()));
		
		
		//昨日订单量
		Long count = ShopOrders.countShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shop.getId(), DateUtils.addtDay(DateUtils.getNowDateShort(),-1), DateUtils.addtDay(DateUtils.getNowDateShort(),-1));
		//7日销量
		Long count7 = ShopOrders.countShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shop.getId(), DateUtils.lastMonday(), DateUtils.lastSunday());
		//30日销量
		Long count30 = ShopOrders.countShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shop.getId(), DateUtils.lastMonthFirst(), DateUtils.lastMonthLast());
		
		index.setYesterDay(count.intValue());
		index.setLastWeek(count7.intValue());
		index.setLastMonth(count30.intValue());
		
		index.setYesterDateStart(DateUtils.addtDay(-2));
		index.setYesterDateEnd(DateUtils.addtDay(-1));
		
		index.setLastWeekDateStart(DateUtils.lastMonday());
		index.setLastWeekDateEnd(DateUtils.lastSunday());
		
		index.setLastMonthDateStart(DateUtils.lastMonthFirst());
		index.setLastMonthDateEnd(DateUtils.lastMonthLast());
				
		index.setYesterDayCost(ShopOrders.sumShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shop.getId(), DateUtils.addtDay(DateUtils.getNowDateShort(),-1), DateUtils.addtDay(DateUtils.getNowDateShort(),-1)));
		index.setLastWeekCost(ShopOrders.sumShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shop.getId(), DateUtils.lastMonday(), DateUtils.lastSunday()));
		index.setLastMonthCost(ShopOrders.sumShopOrdersesByShopAndShopOrderTypeAndCreatedAt(shop.getId(), DateUtils.lastMonthFirst(), DateUtils.lastMonthLast()));
		uiModel.addAttribute("index", index);
		
        return "index";
    }
}
