package com.huazhuo.shop.enumtype;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

/**
 * 退货状态 枚举表
 * @author Administrator
 *
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_order_return_type")
public class ShopOrderRetrunType {

	private String name;
}
