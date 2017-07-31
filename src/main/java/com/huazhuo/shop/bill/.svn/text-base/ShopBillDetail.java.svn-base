package com.huazhuo.shop.bill;

import java.math.BigDecimal;
import java.util.List;

import javax.persistence.Enumerated;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.validation.constraints.Digits;

import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.billenum.BillEnumDetail;
import com.huazhuo.shop.domain.ShopOrders;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_bill_detail")
public class ShopBillDetail {

	@ManyToOne
	@JoinColumn(name = "shopOrders", referencedColumnName = "id")
	private ShopOrders shopOrders;// 订单ID

	@ManyToOne
	@JoinColumn(name = "shopBill", referencedColumnName = "id")
	private ShopBill shopBill;// 帐ID

	@Enumerated
	private BillEnumDetail billEnumDetail;

	@Digits(integer = 8, fraction = 2)
	private BigDecimal orderCost;// 订单金额

	@Digits(integer = 8, fraction = 2)
	private BigDecimal orderSettleCost;// 结算金额

	private Boolean isAdjustBill;// 是否调整单
	
	public static List<ShopBillDetail> findShopBillDetailByShopBillEntries(ShopBill shopBill,int firstResult, int maxResults) {
		TypedQuery<ShopBillDetail> query =entityManager().createQuery("SELECT o FROM ShopBillDetail o where o.shopBill=:shopBill", ShopBillDetail.class);
		query.setParameter("shopBill", shopBill);
        return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
	
	public static long countShopBillDetailByShopBillEntries(ShopBill shopBill) {
		TypedQuery<Long> query =entityManager().createQuery("SELECT count(o) FROM ShopBillDetail o where o.shopBill=:shopBill", Long.class);
		query.setParameter("shopBill", shopBill);
        return query.getSingleResult();
    }
	
}
