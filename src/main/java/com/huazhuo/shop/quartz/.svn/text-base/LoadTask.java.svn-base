package com.huazhuo.shop.quartz;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.quartz.SchedulerFactoryBean;

import com.huazhuo.shop.util.CronExpression;
import com.huazhuo.shop.util.DateUtils;

public class LoadTask {

	@Autowired
	private SchedulerFactoryBean schedulerFactoryBean;

	public void initTask() throws Exception {
		Date date = new Date();
		List<ScheduleJob> scheduleJobs = ScheduleJob.findAllScheduleJobsByJobGroup("order");
		for (ScheduleJob s : scheduleJobs) {
			//过期任务延迟5分钟执行 并且修改过期任务的执行时间
			if(DateUtils.compareDate1(date, s.getCronDate())==1){
				s.setCronExpression(CronExpression.getCronExpression(DateUtils.addtMinute(date, 5)));
				s.setCronDate(DateUtils.addtMinute(date, 5));
				s.merge();
			}
			QuartzService qs = new QuartzService();
			qs.addLazy(s, schedulerFactoryBean, QuartzTaskFactoryInit.class);
		}
	}
}
