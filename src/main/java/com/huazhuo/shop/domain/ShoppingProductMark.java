package com.huazhuo.shop.domain;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.util.StringUtils;

/**
 * 商品标签
 * @author Administrator
 *
 */
@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_products_mark")
public class ShoppingProductMark {

	@ManyToOne
	@JoinColumn(name = "shoppingProducts", referencedColumnName = "id")
	private ShoppingProducts shoppingProducts;//商品ID
	
	private String name;
	
	private Integer specialMarkCategoryId;
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   
	
	/**
	 * 构造ShoppingProductMarkList
	 * @param shoppingProducts
	 * @return
	 */
	public static List<ShoppingProductMark> getListShoppingProductMark(ShoppingProducts shoppingProducts){
		 String[] mark = StringUtils.getStrType(shoppingProducts.getShoppingProductMarkName(), "[;；]");
		 List<ShoppingProductMark> spms = new ArrayList<ShoppingProductMark>();
	        for(String m:mark){
	        	ShoppingProductMark spm = new ShoppingProductMark();
	        	spm.setName(m);
	        	spm.setShoppingProducts(shoppingProducts);
	        	spm.setCreatedAt(shoppingProducts.getCreatedAt());
	        	spm.setUpdatedAt(shoppingProducts.getCreatedAt());
	        	spms.add(spm);
	        	List<SpecialMarks> sMarkList = SpecialMarks.findSpecialMarksByGoodAndName(shoppingProducts.getShoppingCategoryId().getId(), m);
	        	if(sMarkList.size()<=0){
	        		SpecialMarks sMark = new SpecialMarks();
		        	sMark.setCreatedAt(new Date());
		        	sMark.setEnabled(1);
		        	sMark.setMarkCategoryCodeGoods(shoppingProducts.getShoppingCategoryId().getId());
		        	sMark.setMarkRangeCodeGoods(3);
		        	sMark.setName(m);
		        	sMark.setUpdatedAt(new Date());
		        	sMark.persist();
	        	}
	        }
			return spms;
	}
}
