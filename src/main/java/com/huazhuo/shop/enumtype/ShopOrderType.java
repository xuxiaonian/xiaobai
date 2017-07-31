package com.huazhuo.shop.enumtype;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
/**
 * 交易状态枚举表
 * @author Administrator
 *
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_order_type")
public class ShopOrderType {
	
	private String name;//状态名称
	
	/**
	 * 状态值 所有查询根据状态值进行 
	 * 1:待付款
	 * 2:待发货
	 * 3:已发货
	 * 4:交易成功
	 * 5:交易失败
	 */
	private Integer state;  
	
}
