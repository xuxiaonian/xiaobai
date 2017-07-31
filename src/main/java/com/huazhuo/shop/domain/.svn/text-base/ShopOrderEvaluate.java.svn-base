package com.huazhuo.shop.domain;

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

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.query.ShopOrderEvaluateQuery;
import com.huazhuo.shop.util.ListWithAddElementModifier;
import com.huazhuo.shop.util.StringUtils;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_evaluate")
public class ShopOrderEvaluate {

	private String content;// 评价内容

	private Integer grade;// 评价等级

	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//

	@ManyToOne
	@JoinColumn(name = "mobileUserId", referencedColumnName = "id")
	private MobileUsers mobileUserId;// 用户

	@ManyToOne
	@JoinColumn(name = "shoppingProductsId", referencedColumnName = "id")
	private ShoppingProducts shoppingProductsId;// 商品

	@ManyToOne
	@JoinColumn(name = "shopOrder", referencedColumnName = "id")
	private ShopOrders shopOrder;// 订单
	
	
	@OneToMany(targetEntity = ShopOrderEvaluateReply.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopOrderEvaluate")
	private List<ShopOrderEvaluateReply> shopOrderEvaluateReplies = new ListWithAddElementModifier<ShopOrderEvaluateReply, ShopOrderEvaluate>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShopOrderEvaluateReply child, ShopOrderEvaluate parent) {
			child.setShopOrderEvaluate(parent);
		}
	};
	
	
	public static List<ShopOrderEvaluate> findShopOrderEvaluateEntriesByShopId(Integer shopId, int firstResult, int maxResults) {
		TypedQuery<ShopOrderEvaluate> query = entityManager().createQuery("SELECT o FROM ShopOrderEvaluate o where o.shopOrder.shopId=:shopId",
				ShopOrderEvaluate.class);
		query.setParameter("shopId", shopId);
		return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static Long searchCount(ShopOrderEvaluateQuery shopOrderEvaluateQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<ShopOrderEvaluate> root = cq.from(ShopOrderEvaluate.class);

		Predicate p = prepareQuery(shopOrderEvaluateQuery, cb, root);
		cq.select(cb.count(root)).where(p);

		return entityManager().createQuery(cq).getSingleResult().longValue();
	}

	public static List<ShopOrderEvaluate> search(ShopOrderEvaluateQuery shopOrderEvaluateQuery, int firstResult, int maxResults) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopOrderEvaluate> cq = cb.createQuery(ShopOrderEvaluate.class);
		Root<ShopOrderEvaluate> root = cq.from(ShopOrderEvaluate.class);
		Predicate p = prepareQuery(shopOrderEvaluateQuery, cb, root);
		cq.select(root).where(p);
		return entityManager().createQuery(cq).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<ShopOrderEvaluate> search(ShopOrderEvaluateQuery shopOrderEvaluateQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShopOrderEvaluate> cq = cb.createQuery(ShopOrderEvaluate.class);
		Root<ShopOrderEvaluate> root = cq.from(ShopOrderEvaluate.class);
		Predicate p = prepareQuery(shopOrderEvaluateQuery, cb, root);
		cq.select(root).where(p);
		return entityManager().createQuery(cq).getResultList();
	}

	/**
	 * 查询条件
	 * 
	 * @param shopOrderEvaluateQuery
	 * @param cb
	 * @param root
	 * @return
	 */
	private static Predicate prepareQuery(ShopOrderEvaluateQuery shopOrderEvaluateQuery, CriteriaBuilder cb, Root<ShopOrderEvaluate> root) {
		Predicate p = cb.conjunction();
		// 商店Id
		if (shopOrderEvaluateQuery.getShopId() != null) {
			Join<ShopOrderRetrun, ShopOrders> join = root.join("shopOrder");
			p = cb.and(p, cb.equal(join.<String> get("shopId"), shopOrderEvaluateQuery.getShopId()));
		}
		// 评价内容
		if (!StringUtils.isBlank(shopOrderEvaluateQuery.getContent())) {
			p = cb.and(p, cb.like(root.<String> get("content"), "%" + shopOrderEvaluateQuery.getContent() + "%"));
		}
		// 商品名称
		if (!StringUtils.isBlank(shopOrderEvaluateQuery.getName())) {
			Join<ShopOrderEvaluate, ShoppingProducts> join = root.join("shoppingProductsId");
			p = cb.and(p, cb.like(join.<String> get("name"), "%" + shopOrderEvaluateQuery.getName() + "%"));
		}
		// 订单编号
		if (!StringUtils.isBlank(shopOrderEvaluateQuery.getOrderNumber())) {
			Join<ShopOrderEvaluate, ShopOrders> join = root.join("shopOrder");
			p = cb.and(p, cb.like(join.<String> get("orderNumber"), "%" + shopOrderEvaluateQuery.getOrderNumber() + "%"));
		}
		// 评论时间 开始
		if (shopOrderEvaluateQuery.getEvaluateStart() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("createdAt"), shopOrderEvaluateQuery.getEvaluateStart()));
		}
		// 评论时间 结束
		if (shopOrderEvaluateQuery.getEvaluateEnd() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("createdAt"), shopOrderEvaluateQuery.getEvaluateEnd()));
		}
		return p;
	}
}
