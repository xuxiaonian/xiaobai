package com.huazhuo.shop.domain;

import java.util.Date;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.util.ListWithAddElementModifier;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shop_order_return_consult")
public class ShopOrderReturnConsult {
	
	private String content;//内容
	
	@DateTimeFormat(style = "MM")
	private Date createdAt;//   
	
	@DateTimeFormat(style = "MM")
	private Date updatedAt;//   
	
	private Boolean isShop;//是否商家协商
	
	@ManyToOne
	@JoinColumn(name = "shopOrderRetrunId", referencedColumnName = "id")
	private ShopOrderRetrun shopOrderRetrunId;//   退货ID
	
	
	@OneToMany(targetEntity = ShopOrderReturnImg.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shopOrderReturnConsultId")
	private List<ShopOrderReturnImg> shopOrderReturnImgs = new ListWithAddElementModifier<ShopOrderReturnImg, ShopOrderReturnConsult>(this) {
		private static final long serialVersionUID = 1L;
		@Override
		public void addElementModifyHook(ShopOrderReturnImg child, ShopOrderReturnConsult parent) {
			child.setShopOrderReturnConsultId(parent);
		}
	};
}
