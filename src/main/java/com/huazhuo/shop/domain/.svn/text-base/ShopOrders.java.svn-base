package com.huazhuo.shop.domain;

import java.math.BigDecimal;
import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
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

import org.springframework.context.annotation.Lazy;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.enumtype.LogisticsCompany;
import com.huazhuo.shop.enumtype.ShopOrderType;
import com.huazhuo.shop.query.ShopOrdersQuery;
import com.huazhuo.shop.util.DateUtils;
import com.huazhuo.shop.util.ListWithAddElementModifier;
import com.huazhuo.shop.util.StringUtils;

@Lazy
@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_orders")
public class ShopOrders {

	private String orderNumber;// 订单编号

	@ManyToOne(cascade=(CascadeType.ALL))
	@JoinColumn(name = "orderStatus", referencedColumnName = "id")
	private ShopOrderType orderStatus;// 订单状态

	private String remarks;// 留言

	@ManyToOne(cascade=(CascadeType.ALL))
	@JoinColumn(name = "mobileUserId", referencedColumnName = "id")
	private MobileUsers mobileUserId;// 用户编号

	private Integer shopId;// 商店ID

	@DateTimeFormat(style = "MM")
	private Date orderTime;// 订单时间

	@DateTimeFormat(style = "MM")
	private Date payedAt;// 支付时间

	@DateTimeFormat(style = "MM")
	private Date sendTime;// 发货时间

	@DateTimeFormat(style = "MM")
	private Date endTime;// 订单完结时间

	private String logisticsNumber;// 物流编号

	private String tripleOrderNumber;// 支付编号

	@ManyToOne(cascade=(CascadeType.ALL))
	@JoinColumn(name = "logisticsCompany", referencedColumnName = "id")
	private LogisticsCompany logisticsCompany;// 快递

	private Integer deleteStatus;// 删除状态0-未删除，1-已删除

	@Digits(integer = 8, fraction = 2)
	private BigDecimal collect;// 订单合计费用

	// private String collect;// 订单合计费用

	private String address;// 邮递地址

	@ManyToOne(cascade=(CascadeType.ALL))
	@JoinColumn(name = "fastMailId", referencedColumnName = "id")
	private ShopFastMail fastMailId;// 快递

	private String mailCost;// 费用

	private String shopOrderscol;//

	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//

	private Boolean isReturn; // 是否退货

	private Boolean isReturnSucc; // 是否退货成功

	private String att1;// 收货人

	private String att2;// 收货电话

	private String att3;//

	private String att4;//

	private String att5;//

	@OneToMany(targetEntity = ShopOrderRetrun.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopOrderId")
	private List<ShopOrderRetrun> shopOrderRetruns = new ListWithAddElementModifier<ShopOrderRetrun, ShopOrders>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShopOrderRetrun child, ShopOrders parent) {
			child.setShopOrderId(parent);
		}
	};
	
	@OneToMany(targetEntity = ShopOrderList.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopOrderId")
	private List<ShopOrderList> shopOrderList = new ListWithAddElementModifier<ShopOrderList, ShopOrders>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShopOrderList child, ShopOrders parent) {
			child.setShopOrderId(parent);
		}
	};

	public static Long searchCount(ShopOrdersQuery shopOrders) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<ShopOrders> root = cq.from(ShopOrders.class);

		Predicate p = prepareQuery(shopOrders, cb, root);
		cq.select(cb.count(root)).where(p);

		return entityManager().createQuery(cq).getSingleResult().longValue();
	}

	public static List<ShopOrders> search(ShopOrdersQuery shopOrders, int firstResult, int maxResults) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopOrders> cq = cb.createQuery(ShopOrders.class);
		Root<ShopOrders> root = cq.from(ShopOrders.class);
		Predicate p = prepareQuery(shopOrders, cb, root);
		cq.orderBy(cb.desc(root.get("id")));
		cq.select(root).where(p);
		return entityManager().createQuery(cq).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<ShopOrders> search(ShopOrdersQuery shopOrders) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopOrders> cq = cb.createQuery(ShopOrders.class);
		Root<ShopOrders> root = cq.from(ShopOrders.class);
		Predicate p = prepareQuery(shopOrders, cb, root);
		cq.orderBy(cb.desc(root.get("id")));
		cq.select(root).where(p);
		return entityManager().createQuery(cq).getResultList();
	}

	/**
	 * 查询条件
	 * 
	 * @param shopOrders
	 * @param cb
	 * @param root
	 * @return
	 */
	private static Predicate prepareQuery(ShopOrdersQuery shopOrders, CriteriaBuilder cb, Root<ShopOrders> root) {
		Predicate p = cb.conjunction();
		// 商户ID
		if (shopOrders.getShopId() != null) {
			p = cb.and(p, cb.equal(root.<String> get("shopId"), shopOrders.getShopId()));
		}
		// 订单时间 开始
		if (shopOrders.getOrderTimeStart() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("orderTime"), shopOrders.getOrderTimeStart()));
		}
		// 订单时间 结束
		if (shopOrders.getOrderTimeEnd() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("orderTime"), shopOrders.getOrderTimeEnd()));
		}
		// 支付时间 开始
		if (shopOrders.getPayedAtStart() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("payedAt"), shopOrders.getPayedAtStart()));
		}
		// 支付时间 结束
		if (shopOrders.getPayedAtEnd() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("payedAt"), shopOrders.getPayedAtEnd()));
		}
		// 发货时间 开始
		if (shopOrders.getSendTimeStart() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("sendTime"), shopOrders.getSendTimeStart()));
		}
		// 发货时间 结束
		if (shopOrders.getSendTimeEnd() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("sendTime"), shopOrders.getSendTimeEnd()));
		}
		// 订单编号
		if (!StringUtils.isBlank(shopOrders.getOrderNumber())) {
			p = cb.and(p, cb.like(root.<String> get("orderNumber"), "%" + shopOrders.getOrderNumber() + "%"));
		}
		// 收货人
		if (!StringUtils.isBlank(shopOrders.getAtt1())) {
			p = cb.and(p, cb.like(root.<String> get("att1"), "%" + shopOrders.getAtt1() + "%"));
		}
		// 收货人联系方式
		if (!StringUtils.isBlank(shopOrders.getAtt2())) {
			p = cb.and(p, cb.like(root.<String> get("att2"), "%" + shopOrders.getAtt2() + "%"));
		}
		// 商品名称
		if (!StringUtils.isBlank(shopOrders.getProductName())) {
			Join<ShopOrders, ShopOrderList> join = root.join("shopOrderList");
			p = cb.and(p, cb.like(join.<String> get("productName"), "%" + shopOrders.getProductName() + "%"));
		}
		// 订单状态
		if (shopOrders.getOrderStatus() != null) {
			if(shopOrders.getOrderStatus().getId()==5){
				p = cb.and(p, root.<ShopOrderType> get("orderStatus").in(5,7,8));
			}else{
				p = cb.and(p, cb.equal(root.<ShopOrderType> get("orderStatus"), shopOrders.getOrderStatus()));
			}
			
		}
		return p;
	}

	public static List<ShopOrders> findShopOrdersEntries(Integer shopId, int firstResult, int maxResults) {
		EntityManager em = entityManager();
		TypedQuery<ShopOrders> query = em.createQuery("SELECT o FROM ShopOrders o where o.shopId=:shopId", ShopOrders.class);
		query.setParameter("shopId", shopId);
		return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static long countShopOrdersesByShopAndShopOrderType(Integer shopId, ShopOrderType shopOrderType) {
		TypedQuery<Long> query = entityManager().createQuery("SELECT COUNT(o) FROM ShopOrders o where o.shopId=:shopId and o.orderStatus=:orderStatus",
				Long.class);
		query.setParameter("shopId", shopId);
		query.setParameter("orderStatus", shopOrderType);
		return query.getSingleResult();
	}
	
	/**
	 * 首页查询订单量 按时间 和 付款时间不等于 null
	 * @param shopId
	 * @param start
	 * @param end
	 * @return
	 */
	public static long countShopOrdersesByShopAndShopOrderTypeAndCreatedAt(Integer shopId, Date start, Date end) {
		TypedQuery<Long> query = entityManager().createQuery(
				"SELECT count(o) FROM ShopOrders o where o.shopId=:shopId and o.payedAt is not null and o.orderTime between :start and :end", Long.class);
		query.setParameter("shopId", shopId);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		return query.getSingleResult();
	}

	
	public static BigDecimal sumShopOrdersesByShopAndShopOrderTypeAndCreatedAt(Integer shopId, Date start, Date end) {
		TypedQuery<BigDecimal> query = entityManager().createQuery(
				"SELECT round(sum(o.collect),2) FROM ShopOrders o where o.shopId=:shopId and o.payedAt is not null and o.orderTime between :start and :end", BigDecimal.class);
		query.setParameter("shopId", shopId);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		return query.getSingleResult();
	}
	
	
	public static List<ShopOrders> findShopOrdersesByShopAndShopOrderTypeAndCreatedAt(Integer shopId, Date start, Date end) {
		TypedQuery<ShopOrders> query = entityManager().createQuery(
				"SELECT o FROM ShopOrders o where o.shopId=:shopId and o.payedAt is not null and o.orderTime between :start and :end", ShopOrders.class);
		query.setParameter("shopId", shopId);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		return query.getResultList();
	}
	
	public static List<ShopOrders> findShopOrdersesByShopAndShopOrderTypeAndCreatedAt(Integer shopId, Date start, Date end,int firstResult, int maxResults) {
		TypedQuery<ShopOrders> query = entityManager().createQuery(
				"SELECT o FROM ShopOrders o where o.shopId=:shopId and o.payedAt is not null and o.orderTime between :start and :end", ShopOrders.class);
		query.setParameter("shopId", shopId);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}
	
	/**
	 * 按日期查询订单金额总和
	 * 
	 * @param start
	 * @param end
	 * @param orderStatus
	 * @param isReturnSucc
	 * @return
	 */
	public static BigDecimal sumShopOrder(Date start, Date end, ShopOrderType orderStatus) {
		TypedQuery<BigDecimal> query = entityManager().createQuery(
				"SELECT sum(o.collect) FROM ShopOrders o where o.orderStatus=:orderStatus and o.endTime between :start and :end", BigDecimal.class);
		query.setParameter("orderStatus", orderStatus);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		return query.getSingleResult();
	}

	/**
	 * 按日期查询订单金额总和
	 * 
	 * @param start
	 * @param end
	 * @param orderStatus
	 * @param isReturnSucc
	 * @return
	 */
	public static BigDecimal sumShopOrderReturn(Date start, Date end, Boolean isReturnSucc) {
		TypedQuery<BigDecimal> query = entityManager().createQuery(
				"SELECT sum(o.collect) FROM ShopOrders o where o.isReturnSucc=:isReturnSucc and o.endTime between :start and :end", BigDecimal.class);
		query.setParameter("isReturnSucc", isReturnSucc);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		return query.getSingleResult();
	}

	public static List<ShopOrders> findShopOrder(Date start, Date end, ShopOrderType orderStatus, Boolean isReturnSucc,int shopId, int firstResult, int maxResults) {
		TypedQuery<ShopOrders> query = entityManager().createQuery(
				"SELECT o FROM ShopOrders o where (o.orderStatus=:orderStatus or o.isReturnSucc=:isReturnSucc) and shopId=:shopId and o.endTime between :start and :end",
				ShopOrders.class);
		query.setParameter("orderStatus", orderStatus);
		query.setParameter("isReturnSucc", isReturnSucc);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		query.setParameter("shopId", shopId);
		return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<ShopOrders> findShopOrder(Date start, Date end, ShopOrderType orderStatus, Boolean isReturnSucc,int shopId) {
		TypedQuery<ShopOrders> query = entityManager().createQuery(
				"SELECT o FROM ShopOrders o where (o.orderStatus=:orderStatus or o.isReturnSucc=:isReturnSucc) and shopId=:shopId and o.endTime between :start and :end",
				ShopOrders.class);
		query.setParameter("orderStatus", orderStatus);
		query.setParameter("isReturnSucc", isReturnSucc);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		query.setParameter("shopId", shopId);
		return query.getResultList();
	}

	public static long countShopOrder(Date start, Date end, ShopOrderType orderStatus, Boolean isReturnSucc,int shopId) {
		TypedQuery<Long> query = entityManager().createQuery(
				"SELECT count(o) FROM ShopOrders o where (o.orderStatus=:orderStatus or o.isReturnSucc=:isReturnSucc) and shopId=:shopId and o.endTime between :start and :end",
				Long.class);
		query.setParameter("orderStatus", orderStatus);
		query.setParameter("isReturnSucc", isReturnSucc);
		query.setParameter("start", DateUtils.getStartTime(start));
		query.setParameter("end", DateUtils.getEndTime(end));
		query.setParameter("shopId", shopId);
		return query.getSingleResult();

	}
	/**
	 * 获取快递的单号
	 * @param orderNumber

	 */
	public static List<ShopOrders> findOrderNumber(Integer  id) {
		TypedQuery<ShopOrders> query = entityManager().createQuery(
				"SELECT o FROM ShopOrders o where o.id=:id and o.orderStatus=3 or o.orderStatus=4 ", ShopOrders.class);
		query.setParameter("id", id);
		
		return query.getResultList();
	
	}
}
