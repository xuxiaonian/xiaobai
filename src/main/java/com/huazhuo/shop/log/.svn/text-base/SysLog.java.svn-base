package com.huazhuo.shop.log;

import java.util.Date;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.TypedQuery;
import javax.persistence.criteria.CriteriaBuilder;
import javax.persistence.criteria.CriteriaQuery;
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.enumtype.SysLogType;
import com.huazhuo.shop.query.SysLogQuery;
import com.huazhuo.shop.util.StringUtils;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "sys_log")
public class SysLog {

	private String content;// 内容

	private String operator;// 操作人

	private Integer processId;// 流程ID
	private Integer operatorType;
	private String ip;

	@ManyToOne
	@JoinColumn(name = "sysLogType", referencedColumnName = "id")
	private SysLogType sysLogType;

	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//

	private Boolean state;// 操作成功标志

	public static List<SysLog> findAllSysLogsByprocessIdAndSysLogType(Integer processId, SysLogType sysLogType) {
		TypedQuery<SysLog> query = entityManager()
				.createQuery("SELECT o FROM SysLog o where o.processId=:processId and o.sysLogType=:sysLogType", SysLog.class);
		query.setParameter("processId", processId);
		query.setParameter("sysLogType", sysLogType);
		return query.getResultList();
	}

	public static List<SysLog> findAllSysLogsByOperator(String operator) {
		TypedQuery<SysLog> query = entityManager().createQuery("SELECT o FROM SysLog o where o.operator=:operator", SysLog.class);
		query.setParameter("operator", operator);
		return query.getResultList();
	}

	public static List<SysLog> findAllSysLogsByOperatorEntries(String operator, int firstResult, int maxResults) {
		TypedQuery<SysLog> query = entityManager().createQuery("SELECT o FROM SysLog o where o.operator=:operator", SysLog.class);
		query.setParameter("operator", operator);
		return query.setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static Long searchCount(SysLogQuery sysLogQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<SysLog> root = cq.from(SysLog.class);

		Predicate p = prepareQuery(sysLogQuery, cb, root);
		cq.select(cb.count(root)).where(p);

		return entityManager().createQuery(cq).getSingleResult().longValue();
	}

	public static List<SysLog> search(SysLogQuery sysLogQuery, int firstResult, int maxResults) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<SysLog> cq = cb.createQuery(SysLog.class);
		Root<SysLog> root = cq.from(SysLog.class);
		Predicate p = prepareQuery(sysLogQuery, cb, root);
		cq.orderBy(cb.desc(root.get("id")));
		cq.select(root).where(p);
		return entityManager().createQuery(cq).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<SysLog> search(SysLogQuery sysLogQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<SysLog> cq = cb.createQuery(SysLog.class);
		Root<SysLog> root = cq.from(SysLog.class);
		Predicate p = prepareQuery(sysLogQuery, cb, root);
		cq.select(root).where(p);
		return entityManager().createQuery(cq).getResultList();
	}

	/**
	 * 查询条件
	 * 
	 * @param sysLogQuery
	 * @param cb
	 * @param root
	 * @return
	 */
	private static Predicate prepareQuery(SysLogQuery sysLogQuery, CriteriaBuilder cb, Root<SysLog> root) {
		Predicate p = cb.conjunction();
		// 时间 开始
		if (sysLogQuery.getStartDate() != null) {
			p = cb.and(p, cb.greaterThanOrEqualTo(root.<Date> get("createdAt"), sysLogQuery.getStartDate()));
		}
		// 时间 结束
		if (sysLogQuery.getEndDate() != null) {
			p = cb.and(p, cb.lessThan(root.<Date> get("createdAt"), sysLogQuery.getEndDate()));
		}
		// 日志内容
		if (!StringUtils.isBlank(sysLogQuery.getContent())) {
			p = cb.and(p, cb.like(root.<String> get("content"), "%" + sysLogQuery.getContent() + "%"));
		}
		// 账号
		if (!StringUtils.isBlank(sysLogQuery.getOperator())) {
			p = cb.and(p, cb.equal(root.<String> get("operator"), sysLogQuery.getOperator()));
		}
		//流程ID 为空
		p = cb.and(p, cb.isNull(root.<String> get("processId")));
		return p;
	}
	/**
	 * 构建系统日志
	 * @param content
	 * @param operator
	 * @return
	 */
	public static SysLog getSysLog(String content,String operator){
		Date date = new Date();
		SysLog sys = new SysLog();
		sys.setContent(content);
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator(operator);
		return sys;
	}
	
	/**
	 * 构建订单日志
	 * @param content
	 * @param operator
	 * @return
	 */
	public static SysLog getOrderSysLog(String content,String operator,Integer processId,Integer logType){
		Date date = new Date();
		SysLog sys = new SysLog();
		sys.setProcessId(processId);
		sys.setSysLogType(SysLogType.findSysLogType(logType));
		sys.setContent(content);
		sys.setCreatedAt(date);
		sys.setUpdatedAt(date);
		sys.setState(true);
		sys.setOperator("商家");
		return sys;
	}
}
