package com.huazhuo.shop.domain;

import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_evaluate_reply")
public class ShopOrderEvaluateReply {
	
	private String content;// 评价回复内容
	
	@ManyToOne
	@JoinColumn(name = "shopOrderEvaluate", referencedColumnName = "id")
	private ShopOrderEvaluate shopOrderEvaluate;// 

	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//
}
