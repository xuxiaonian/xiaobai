package com.huazhuo.shop.bill;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Enumerated;
import javax.persistence.FetchType;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.constraints.Digits;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.google.gson.Gson;
import com.huazhuo.shop.billenum.BillEnum;
import com.huazhuo.shop.billenum.BillEnumDetail;
import com.huazhuo.shop.billenum.BillShowEnum;
import com.huazhuo.shop.domain.ShopOrders;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.pojo.ShopsSettlement;
import com.huazhuo.shop.query.ShopBillQuery;
import com.huazhuo.shop.util.H5UrlUtil;
import com.huazhuo.shop.util.HttpRequest;
import com.huazhuo.shop.util.ListWithAddElementModifier;
import com.huazhuo.shop.util.StringUtils;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_bill")
public class ShopBill {

	private String billNumber;// 账单编号

	@DateTimeFormat(style = "MM")
	private Date billStart;// 周期开始时间

	@DateTimeFormat(style = "MM")
	private Date billEnd;// 周期结束时间

	@DateTimeFormat(style = "MM")
	private Date createDate;// 生成时间

	@DateTimeFormat(style = "MM")
	private Date shopEnterDate;// 确认时间

	@DateTimeFormat(style = "MM")
	private Date operFinancialManagerSettleTime;// 确认时间
	
	@DateTimeFormat(style = "MM")
	private Date settleDate;// 确认时间

	@Digits(integer = 8, fraction = 2)
	private BigDecimal billCost;// 账单金额

	@Digits(integer = 8, fraction = 2)
	private BigDecimal settleCost;// 结算金额

	private Integer billEnum;// 账单状态

	private Integer billShowEnum;// 账单实际状态

	private Integer shopId;// 商店ID
	
	private String auditNotThroughReason;//拒绝原因
	
	private String auditPerson;//拒绝原因
	
	@DateTimeFormat(style = "MM")
	private Date auditTime;//拒绝原因
	
	private Integer auditRole;//拒绝原因

	@OneToMany(targetEntity = ShopBillDetail.class, fetch = FetchType.LAZY, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopBill")
	private List<ShopBillDetail> shopBillDetails = new ListWithAddElementModifier<ShopBillDetail, ShopBill>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShopBillDetail child, ShopBill parent) {
			child.setShopBill(parent);
		}
	};

	public static ShopBill getShopBill(Date startDate, Date endDate, List<ShopOrders> shopOrders, Integer shopId) {
		String str = HttpRequest.sendGet(H5UrlUtil.APPTOURING + "/shopsSettlement", "shopId=" + shopId);
		Gson gson = new Gson();
		ShopsSettlement sett = gson.fromJson(str, ShopsSettlement.class);
		if(sett.getCommissionRate()==null){}else{
			BigDecimal brate = new BigDecimal(sett.getCommissionRate());
			BigDecimal rate = brate.divide(new BigDecimal(100));
			ShopBill shopBill = ShopBill.getShopBill(shopOrders, rate);
			BigDecimal cost = new BigDecimal(0);
			BigDecimal settleCost = new BigDecimal(0);
			for (ShopBillDetail detail : shopBill.getShopBillDetails()) {
				if (detail.getBillEnumDetail() == BillEnumDetail.income) {
					cost = cost.add(detail.getOrderCost());
					BigDecimal settleRate = detail.getOrderCost().multiply(rate);
					BigDecimal orderSettle = detail.getOrderCost().subtract(settleRate);
					settleCost = settleCost.add(orderSettle);
				} else {
					cost = cost.subtract(detail.getOrderCost());
					BigDecimal settleRate = detail.getOrderCost().multiply(rate);
					BigDecimal orderSettle = detail.getOrderCost().subtract(settleRate);
					settleCost = settleCost.subtract(orderSettle);
				}
			}

			shopBill.setBillCost(cost);
			// TODO
			shopBill.setSettleCost(cost.subtract(settleCost));
			shopBill.setBillStart(startDate);
			shopBill.setBillEnd(endDate);
			return shopBill;
		}
		return null;
	}

	/**
	 * 根据订单list 构造 帐
	 * 
	 * @param shopOrders
	 * @return ShopBill
	 */
	public static ShopBill getShopBill(List<ShopOrders> shopOrders, BigDecimal rate) {
		ShopBill shopBill = new ShopBill();
		List<ShopBillDetail> shopBillDetails = new ArrayList<ShopBillDetail>();
		for (ShopOrders s : shopOrders) {
			ShopBillDetail shopBillDetail = new ShopBillDetail();
			shopBillDetail.setShopOrders(s);
			if (s.getIsReturnSucc() == null || !s.getIsReturnSucc()) {
				shopBillDetail.setBillEnumDetail(BillEnumDetail.income);
			} else {
				shopBillDetail.setBillEnumDetail(BillEnumDetail.out);
			}
			shopBillDetail.setOrderCost(s.getCollect());
			BigDecimal settleCost = s.getCollect().multiply(rate);
			shopBillDetail.setOrderSettleCost(s.getCollect().subtract(settleCost));
			shopBillDetail.setIsAdjustBill(false);
			shopBillDetails.add(shopBillDetail);
		}
		shopBill.setShopBillDetails(shopBillDetails);
		return shopBill;
	}

	public static Long searchCount(ShopBillQuery shopBillQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<ShopBill> root = cq.from(ShopBill.class);

		Predicate p = prepareQuery(shopBillQuery, cb, root);
		cq.select(cb.count(root)).where(p);

		return entityManager().createQuery(cq).getSingleResult().longValue();
	}

	public static List<ShopBill> search(ShopBillQuery shopBillQuery, int firstResult, int maxResults) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopBill> cq = cb.createQuery(ShopBill.class);
		Root<ShopBill> root = cq.from(ShopBill.class);
		Predicate p = prepareQuery(shopBillQuery, cb, root);
		cq.select(root).where(p);
		return entityManager().createQuery(cq).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<ShopBill> search(ShopBillQuery shopBillQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopBill> cq = cb.createQuery(ShopBill.class);
		Root<ShopBill> root = cq.from(ShopBill.class);
		Predicate p = prepareQuery(shopBillQuery, cb, root);
		cq.select(root).where(p);
		return entityManager().createQuery(cq).getResultList();
	}

	/**
	 * 查询条件
	 * 
	 * @param shoppingProductQuery
	 * @param cb
	 * @param root
	 * @return
	 */
	private static Predicate prepareQuery(ShopBillQuery shopBillQuery, CriteriaBuilder cb, Root<ShopBill> root) {
		Predicate p = cb.conjunction();
		// 商户ID
		if (shopBillQuery.getShopId() != null) {
			p = cb.and(p, cb.equal(root.<String> get("shopId"), shopBillQuery.getShopId()));
		}
		// 账单生成时间 开始
		if (shopBillQuery.getCreateDateStart() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("createDate"), shopBillQuery.getCreateDateStart()));
		}
		// 账单生成时间 结束
		if (shopBillQuery.getCreateDateEnd() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("createDate"), shopBillQuery.getCreateDateEnd()));
		}
		// 账单编号
		if (!StringUtils.isBlank(shopBillQuery.getBillNumber())) {
			p = cb.and(p, cb.like(root.<String> get("billNumber"), "%" + shopBillQuery.getBillNumber() + "%"));
		}
		// 账单状态
		if (shopBillQuery.getBillEnum() != null) {
			p = cb.and(p, cb.equal(root.<String> get("billEnum"), shopBillQuery.getBillEnum()));
		}
		else{
//			p = cb.and(p, root.<ShopOrderType> get("billEnum").in(1,2,7));
//			p = cb.and(p, cb.equal(root.<String> get("billShowEnum"), 3));
		}
//		// 账单状态
//		if (shopBillQuery.getBillShowEnum() != null) {
//			p = cb.and(p, cb.equal(root.<String> get("billShowEnum"),shopBillQuery.getBillShowEnum()));
//
//		}
		return p;
	}

	public static long countShopBillsByBillEnum(Integer billEnum,Integer shopId) {
		TypedQuery<Long> query = entityManager().createQuery("SELECT COUNT(o) FROM ShopBill o where o.billEnum=:billEnum and o.shopId=:shopId", Long.class);
		query.setParameter("billEnum", billEnum);
		query.setParameter("shopId", shopId);
		return query.getSingleResult();
	}

}
