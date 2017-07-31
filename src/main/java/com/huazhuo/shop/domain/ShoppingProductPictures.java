package com.huazhuo.shop.domain;

import java.util.Date;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Transient;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_product_pictures")
public class ShoppingProductPictures {

	private String image;
	
	private String name;
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//
	
	@Transient
	private CommonsMultipartFile attachment;
	
	@ManyToOne
	@JoinColumn(name = "shoppingProductId", referencedColumnName = "id")
	private ShoppingProducts shoppingProductId;//品牌ID
	
	public boolean isEmpty() {
		if (this.image != null || (this.attachment !=null && !this.attachment.isEmpty())) {
			return false;
		} else {
			return true;
		}
	}
}
