package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Join;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.constraints.Digits;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.enumtype.ShopOrderRetrunType;
import com.huazhuo.shop.query.ShopOrderRetrunQuery;
import com.huazhuo.shop.util.ListWithAddElementModifier;
import com.huazhuo.shop.util.StringUtils;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_order_retrun")
public class ShopOrderRetrun {

	private String returnNumber;// 退款编号

	@DateTimeFormat(style = "MM")
	private Date returnTime;// 退款时间  	商家确定退款时间

	@ManyToOne
	@JoinColumn(name = "shopOrderId", referencedColumnName = "id")
	private ShopOrders shopOrderId;// 订单ID

	@Digits(integer = 8, fraction = 2)
	private BigDecimal returnCost;// 费用

	@ManyToOne
	@JoinColumn(name = "shopOrderRetrunType", referencedColumnName = "id")
	private ShopOrderRetrunType shopOrderRetrunType;// 退货状态

	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//

	private String logisticsCode;
	
	private String logisticsNumber;
	
	private Boolean isDel;
	
	@DateTimeFormat(style = "MM")
	private Date shopAgreeTime;//
	
	private String shopOrderReturnReason;// 
	
	@OneToMany(targetEntity = ShopOrderReturnConsult.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopOrderRetrunId")
	private List<ShopOrderReturnConsult> shopOrderReturnConsults = new ListWithAddElementModifier<ShopOrderReturnConsult, ShopOrderRetrun>(this) {
		private static final long serialVersionUID = 1L;
		@Override
		public void addElementModifyHook(ShopOrderReturnConsult child, ShopOrderRetrun parent) {
			child.setShopOrderRetrunId(parent);
		}
	};

	
	public static Long searchCount(ShopOrderRetrunQuery shopOrderRetrunQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<ShopOrderRetrun> root = cq.from(ShopOrderRetrun.class);

		Predicate p = prepareQuery(shopOrderRetrunQuery, cb, root);
		cq.select(cb.count(root)).where(p);

		return entityManager().createQuery(cq).getSingleResult().longValue();
	}

	public static List<ShopOrderRetrun> search(ShopOrderRetrunQuery shopOrderRetrunQuery, int firstResult, int maxResults) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopOrderRetrun> cq = cb.createQuery(ShopOrderRetrun.class);
		Root<ShopOrderRetrun> root = cq.from(ShopOrderRetrun.class);
		Predicate p = prepareQuery(shopOrderRetrunQuery, cb, root);
		cq.orderBy(cb.desc(root.get("id")));
		cq.select(root).where(p);
		return entityManager().createQuery(cq).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<ShopOrderRetrun> search(ShopOrderRetrunQuery shopOrderRetrunQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopOrderRetrun> cq = cb.createQuery(ShopOrderRetrun.class);
		Root<ShopOrderRetrun> root = cq.from(ShopOrderRetrun.class);
		Predicate p = prepareQuery(shopOrderRetrunQuery, cb, root);
		cq.select(root).where(p);
		return entityManager().createQuery(cq).getResultList();
	}

	/**
	 * 查询条件
	 * 
	 * @param shopOrderRetrunQuery
	 * @param cb
	 * @param root
	 * @return
	 */
	private static Predicate prepareQuery(ShopOrderRetrunQuery shopOrderRetrunQuery, CriteriaBuilder cb, Root<ShopOrderRetrun> root) {
		Predicate p = cb.conjunction();
		p = cb.and(p, cb.equal(root.<Boolean> get("isDel") , false));
		// 退款状态
		if (shopOrderRetrunQuery.getShopOrderRetrunType() != null) {
			p = cb.and(p, cb.equal(root.<ShopOrderRetrunType> get("shopOrderRetrunType"), shopOrderRetrunQuery.getShopOrderRetrunType()));
		}
		// 订单时间 开始
		if (shopOrderRetrunQuery.getOrderTimeStart() != null) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrderId");
			p = cb.and(p, cb.greaterThanOrEqualTo(join.<Date> get("orderTime"), shopOrderRetrunQuery.getOrderTimeStart()));
		}
		// 订单时间 结束
		if (shopOrderRetrunQuery.getOrderTimeEnd() != null) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrderId");
			p = cb.and(p, cb.lessThan(join.<Date> get("orderTime"), shopOrderRetrunQuery.getOrderTimeEnd()));
		}
		// 支付时间 开始
		if (shopOrderRetrunQuery.getPayedAtStart() != null) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrderId");
			p = cb.and(p, cb.greaterThanOrEqualTo(join.<Date> get("payedAt"), shopOrderRetrunQuery.getPayedAtStart()));
		}
		// 支付时间 结束
		if (shopOrderRetrunQuery.getPayedAtEnd() != null) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrderId");
			p = cb.and(p, cb.lessThan(join.<Date> get("payedAt"), shopOrderRetrunQuery.getPayedAtEnd()));
		}
		// 退款申请时间 开始
		if (shopOrderRetrunQuery.getReturnAtStart() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("createdAt"), shopOrderRetrunQuery.getReturnAtStart()));
		}
		// 退款申请时间 结束
		if (shopOrderRetrunQuery.getReturnAtEnd() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("createdAt"), shopOrderRetrunQuery.getReturnAtEnd()));
		}
		// 订单编号
		if (!StringUtils.isBlank(shopOrderRetrunQuery.getOrderNumber())) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrderId");
			p = cb.and(p, cb.like(join.<String> get("orderNumber"), "%" + shopOrderRetrunQuery.getOrderNumber() + "%"));
		}
		// 商店Id
		if (shopOrderRetrunQuery.getShopId()!=null) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrderId");
			p = cb.and(p, cb.equal(join.<String> get("shopId"), shopOrderRetrunQuery.getShopId()));
			p = cb.and(p, cb.equal(join.<Boolean> get("isReturn"), true));
		}
		// 退款编号
		if (!StringUtils.isBlank(shopOrderRetrunQuery.getReturnNumber())) {
			p = cb.and(p, cb.like(root.<String> get("returnNumber"), "%" + shopOrderRetrunQuery.getReturnNumber() + "%"));
		}

		return p;
	}

	public static long countShopOrderRetrunsByShopIdAndShopOrderRetrunType(Integer shopId, ShopOrderRetrunType shopOrderRetrunType) {
		TypedQuery<Long> query = entityManager().createQuery("SELECT COUNT(o) FROM ShopOrderRetrun o where o.shopOrderId.shopId=:shopId and o.shopOrderRetrunType=:shopOrderRetrunType and isDel=false", Long.class);
		query.setParameter("shopId", shopId);
    	query.setParameter("shopOrderRetrunType", shopOrderRetrunType);
		return query.getSingleResult();
	}
	public static List<ShopOrderRetrun> getShopOrderRetrunsByShopIdAndShopOrderRetrunType(Integer shopId, ShopOrderRetrunType shopOrderRetrunType) {
		TypedQuery<ShopOrderRetrun> query = entityManager().createQuery("SELECT o FROM ShopOrderRetrun o where o.shopOrderId.shopId=:shopId and o.shopOrderRetrunType=:shopOrderRetrunType", ShopOrderRetrun.class);
		query.setParameter("shopId", shopId);
    	query.setParameter("shopOrderRetrunType", shopOrderRetrunType);
		return query.getResultList();
	}
	
	//通过订单查询退款单
	public static List<ShopOrderRetrun> findShopOrderRetrunsByshopOrderId(ShopOrders shopOrderId) {
		TypedQuery<ShopOrderRetrun> query = entityManager().createQuery("SELECT o FROM ShopOrderRetrun o where o.shopOrderId=:shopOrderId and isDel=false", ShopOrderRetrun.class);
		query.setParameter("shopOrderId", shopOrderId);
		return query.getResultList();
	}
}
