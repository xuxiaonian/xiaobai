package com.huazhuo.shop.quartz;

import java.util.Date;
import java.util.List;

import javax.persistence.TypedQuery;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class)
public class ScheduleJob {

	/** 任务名称 */
	private String jobName;
	/** 任务分组 */
	private String jobGroup;
	/** 任务状态 0禁用 1启用 2删除 */
	private String jobStatus;
	/** 任务运行时间表达式 */
	private String cronExpression;
	/** 任务描述 */
	private String jobdesc;
	/** 结束时间 **/
	private int jobNumber;

	private int endNumber;
	
	private int eventId;
	
	@DateTimeFormat(style = "MM")
	private Date cronDate;//

	public static List<ScheduleJob> findAllScheduleJobsByJobStatus(String jobStatus) {
		TypedQuery<ScheduleJob> query = entityManager().createQuery("SELECT o FROM ScheduleJob o where jobStatus=:jobStatus", ScheduleJob.class);
		query.setParameter("jobStatus", jobStatus);
		return query.getResultList();
	}

	public static List<ScheduleJob> findAllScheduleJobsByJobNameAndJobNumber(String jobName,Integer jobNumber) {
		TypedQuery<ScheduleJob> query = entityManager().createQuery("SELECT o FROM ScheduleJob o where jobName=:jobName and jobNumber=:jobNumber", ScheduleJob.class);
		query.setParameter("jobName", jobName);
		query.setParameter("jobNumber", jobNumber);
		return query.getResultList();
	}
	
	public static List<ScheduleJob> findAllScheduleJobsByCronDate(Date cronDate) {
		TypedQuery<ScheduleJob> query = entityManager().createQuery("SELECT o FROM ScheduleJob o where cronDate>cronDate", ScheduleJob.class);
		query.setParameter("cronDate", cronDate);
		return query.getResultList();
	}
	
	public static List<ScheduleJob> findAllScheduleJobsByJobGroup(String jobGroup) {
		TypedQuery<ScheduleJob> query = entityManager().createQuery("SELECT o FROM ScheduleJob o where jobGroup=:jobGroup", ScheduleJob.class);
		query.setParameter("jobGroup", jobGroup);
		return query.getResultList();
	}
}
