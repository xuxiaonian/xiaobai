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
import javax.persistence.criteria.Predicate;
import javax.persistence.criteria.Root;
import javax.validation.constraints.Digits;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import com.huazhuo.shop.city.Cities;
import com.huazhuo.shop.city.Provinces;
import com.huazhuo.shop.query.ShoppingProductQuery;
import com.huazhuo.shop.util.FileUploadUtil;
import com.huazhuo.shop.util.ListWithAddElementModifier;
import com.huazhuo.shop.util.RandomUtils;
import com.huazhuo.shop.util.StringUtils;
import com.huazhuo.shop.util.UpaiYunStatic;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(identifierType = Integer.class, table = "shopping_products")
public class ShoppingProducts {

	private String name;// 名称

	private String sysNumber;// 平台货号

	private String productNumber;// 商家货号

	@Size(max = 255)
	private String orgPrice;// 原价格

	// TODO 价格修改成 BigDecimal
	private String price;// 价格 销售

	private Integer stock;// 库存

	private Integer stockWarning;// 库存预警

	@Size(max = 1000)
	private String recommendReason;// 推荐理由

	@ManyToOne
	@JoinColumn(name = "provinces", referencedColumnName = "id")
	private Provinces provinces;// 省

	@ManyToOne
	@JoinColumn(name = "cityId", referencedColumnName = "id")
	private Cities cityId;// 市

	private String details;// 详情

	@ManyToOne
	@JoinColumn(name = "shoppingCategoryId", referencedColumnName = "id")
	private ShoppingCategories shoppingCategoryId;// 一级、二级分类外键

	private String shoppingCategoryName;

	@ManyToOne
	@JoinColumn(name = "productBrandId", referencedColumnName = "id")
	private ProductBrand productBrandId;// 品牌ID

	private String shoppingProductMarkName;// 商品标签显示

	@Digits(integer = 8, fraction = 2)
	private BigDecimal cost;// 固定费用

	@ManyToOne
	@JoinColumn(name = "shopFreightTemplate", referencedColumnName = "id")
	private ShopFreightTemplate shopFreightTemplate;// 模板ID

	private Boolean isCost;// 是否固定费用

	private Boolean invoice;// 是否开具发票

	private String heading;// 标题
	private String subheading;// 副标题
	private String headImage;// 标题图片
	private String endImage;// 结尾图片
	private Integer status;// 是否显示在主页
	private Integer weight;// 权重
	private Integer shoppingSpecialCategoryId;// 专题外键
	private Integer address;// 商品关联的地址
	@DateTimeFormat(style = "MM")
	private Date createdAt;//

	@DateTimeFormat(style = "MM")
	private Date updatedAt;//
	private Integer onSale;// 是否上架 0未上架 1上架
	private Integer count;// 点赞数
	private Integer artificialCount;// 人工点赞数
	private Integer deleteStatus;// 删除状态: 0是未删除， 1是删除

	private Integer shopId;// 商店ID

	private Boolean store;// 是否在仓库

	@DateTimeFormat(style = "MM")
	private Date onSaleDate;// 上线销售时间

	private Integer review;// 是否审核 0待审核 1审核通过 2审核未通过

	@DateTimeFormat(style = "MM")
	private Date reviewDate;// 提审时间

	private String reviewReason;// 审核失败原因

	private Boolean isPostage;//附加包邮条件
	private Integer wrapPostageNum;//包邮数量
	private Boolean isExpect;//是否是预售商品
	
	private Boolean is_send_st;
	private Boolean is_customer;
	
	//  商品预售
	@OneToMany(targetEntity = ShoppingProductsExpect.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "productsId")
	private List<ShoppingProductsExpect> shoppingProductsExpect = new ListWithAddElementModifier<ShoppingProductsExpect, ShoppingProducts>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductsExpect child, ShoppingProducts parent) {
			child.setProductsId(parent);
		}
	};
	
	
	// 商品详情
	@OneToMany(targetEntity = ShoppingProductsContent.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProductsId")
	private List<ShoppingProductsContent> shoppingProductsContent = new ListWithAddElementModifier<ShoppingProductsContent, ShoppingProducts>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductsContent child, ShoppingProducts parent) {
			child.setShoppingProductsId(parent);
		}
	};

	// 商品详情
	@OneToMany(targetEntity = ShoppingProductsDetail.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProductsId")
	private List<ShoppingProductsDetail> shoppingProductsDetail = new ListWithAddElementModifier<ShoppingProductsDetail, ShoppingProducts>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductsDetail child, ShoppingProducts parent) {
			child.setShoppingProductsId(parent);
		}
	};
	// // 商品模板
	// @OneToMany(targetEntity = GsBigcategoryGoodsRela.class, cascade =
	// CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProductsId")
	// private List<GsBigcategoryGoodsRela> gsBigcategoryGoodsRela = new
	// ListWithAddElementModifier<GsBigcategoryGoodsRela,
	// ShoppingProducts>(this) {
	//
	// private static final long serialVersionUID = 1L;
	//
	// @Override
	// public void addElementModifyHook(GsBigcategoryGoodsRela child,
	// ShoppingProducts parent) {
	// child.setGoodsId(parent);
	// }
	// };
	// 商品销售规格
	@OneToMany(targetEntity = ShoppingProductsSpec.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProducts")
	private List<ShoppingProductsSpec> shoppingProductsSpecs = new ListWithAddElementModifier<ShoppingProductsSpec, ShoppingProducts>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductsSpec child, ShoppingProducts parent) {
			child.setShoppingProducts(parent);
		}
	};

	// 商品销主图
	@OneToMany(targetEntity = ShoppingProductPictures.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProductId")
	private List<ShoppingProductPictures> shoppingProductPictures = new ListWithAddElementModifier<ShoppingProductPictures, ShoppingProducts>(this) {

		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductPictures child, ShoppingProducts parent) {
			child.setShoppingProductId(parent);
		}
	};

	// 商品参数
	@OneToMany(targetEntity = ShoppingProductsParameter.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProducts")
	private List<ShoppingProductsParameter> shoppingProductsParameters = new ListWithAddElementModifier<ShoppingProductsParameter, ShoppingProducts>(this) {
		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductsParameter child, ShoppingProducts parent) {
			child.setShoppingProducts(parent);
		}
	};

	// 商品标签
	@OneToMany(targetEntity = ShoppingProductMark.class, cascade = CascadeType.ALL, orphanRemoval = true, mappedBy = "shoppingProducts")
	private List<ShoppingProductMark> shoppingProductMarks = new ListWithAddElementModifier<ShoppingProductMark, ShoppingProducts>(this) {
		private static final long serialVersionUID = 1L;

		@Override
		public void addElementModifyHook(ShoppingProductMark child, ShoppingProducts parent) {
			child.setShoppingProducts(parent);
		}
	};

	/**
	 * 文件上传到云盘处理
	 * 
	 * @throws Exception
	 */
	public void saveAttachment() throws Exception {
		for (ShoppingProductPictures file : this.shoppingProductPictures) {
			if (file.getAttachment() == null)
				continue;
			Date date = new Date();
			String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
			if (file.getId() == null) {
				Boolean result = FileUploadUtil.upload(file.getAttachment(), fileName);
				if (result) {
					file.setImage(UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR + fileName);
					file.setCreatedAt(date);
					file.setUpdatedAt(date);
					file.setName(fileName);
				}
			}
		}
	}

	/**
	 * 文件上传到云盘处理更多填写
	 * 
	 * @throws Exception
	 */
	public void saveAttachmentContent() throws Exception {
		for (ShoppingProductsContent file : this.shoppingProductsContent) {
			if (file.getAttachment() == null)
				continue;
			Date date = new Date();
			String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
			if (file.getContent() == null) {

			} else {
				if (file.getType() == 2) {
					Boolean result = FileUploadUtil.upload(file.getAttachment(), fileName);
					if (result) {
						file.setContent(UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR + fileName);
					}
				}
			}
		}
	}

	public void removeEmptyProductContent() {
		List<ShoppingProductsContent> shoppingProductsContent = this.shoppingProductsContent;
		int shoppingProductPicturesSize = shoppingProductsContent.size();
		for (int i = shoppingProductPicturesSize - 1; i >= 0; i--) {
			ShoppingProductsContent file = shoppingProductsContent.get(i);
			if (StringUtils.isBlank(file.getContent())) {
				shoppingProductsContent.remove(file);
			}

		}
	}

	/**
	 * 文件上传到云盘处理商品详情
	 * 
	 * @throws Exception
	 */
	public void saveAttachmentDetail() throws Exception {
		for (ShoppingProductsDetail file : this.shoppingProductsDetail) {
			if (file.getAttachment() == null)
				continue;
			Date date = new Date();
			String fileName = date.getTime() + "" + RandomUtils.getRandom(999);
			if (file.getContent() == null) {

			} else {
				if (file.getType() == 2) {
					Boolean result = FileUploadUtil.upload(file.getAttachment(), fileName);
					if (result) {
						file.setContent(UpaiYunStatic.SERVER_URL + UpaiYunStatic.MOBILE_USER_ICON_DIR + fileName);
					}
				}
			}
		}
	}

	public void removeEmptyProductDetail() {
		List<ShoppingProductsDetail> shoppingProductsDetail = this.shoppingProductsDetail;
		int shoppingProductPicturesSize = shoppingProductsDetail.size();
		for (int i = shoppingProductPicturesSize - 1; i >= 0; i--) {
			ShoppingProductsDetail file = shoppingProductsDetail.get(i);
			// if(file.getType()==2){
			// if (file.getAttachment() == null) {
			// shoppingProductsDetail.remove(file);
			// }
			// if (file.getContent() == null) {
			// shoppingProductsDetail.remove(file);
			// }
			// }else{
			// if (file.getContent() == null) {
			// shoppingProductsDetail.remove(file);
			// }
			// }
			if (StringUtils.isBlank(file.getContent())) {
				shoppingProductsDetail.remove(file);
			}
		}
	}

	public void removeEmptyDetail() {
		List<ShoppingProductPictures> shoppingProductPictures = this.shoppingProductPictures;
		int shoppingProductPicturesSize = shoppingProductPictures.size();
		for (int i = shoppingProductPicturesSize - 1; i >= 0; i--) {
			ShoppingProductPictures file = shoppingProductPictures.get(i);
			if (file.isEmpty()) {
				shoppingProductPictures.remove(file);
			}
		}
	}

	public void removeEmptyDetailMark() {
		List<ShoppingProductMark> marks = this.shoppingProductMarks;
		int shoppingProductPicturesSize = shoppingProductMarks.size();
		for (int i = shoppingProductPicturesSize - 1; i >= 0; i--) {
			ShoppingProductMark file = marks.get(i);
			if (StringUtils.isBlank(file.getName())) {
				shoppingProductMarks.remove(file);
			}
		}
	}

	public static List<ShoppingCategories> findAllShoppingProductsesDistink(Integer shopId) {
		TypedQuery<ShoppingCategories> query = entityManager().createQuery(
				"SELECT distinct o.shoppingCategoryId FROM ShoppingProducts o where o.shopId=:shopId", ShoppingCategories.class);
		query.setParameter("shopId", shopId);
		return query.getResultList();
	}

	public static long countShoppingProductsesByShopIdAndOnSale(Integer shopId, Integer onSale) {
		TypedQuery<Long> query = entityManager().createQuery(
				"SELECT COUNT(o) FROM ShoppingProducts o where o.shopId=:shopId and o.onSale=:onSale and deleteStatus=0", Long.class);
		query.setParameter("shopId", shopId);
		query.setParameter("onSale", onSale);
		return query.getSingleResult();
	}

	public static long countShoppingProductsesByShopIdAndOnSaleAndStore(Integer shopId, Integer onSale, Boolean store) {
		TypedQuery<Long> query = entityManager().createQuery(
				"SELECT COUNT(o) FROM ShoppingProducts o where o.shopId=:shopId and o.onSale=:onSale and store=:store and deleteStatus=0", Long.class);
		query.setParameter("shopId", shopId);
		query.setParameter("onSale", onSale);
		query.setParameter("store", store);
		return query.getSingleResult();
	}

	public static long countShoppingProductsesByShopIdAndReview(Integer shopId, Integer review) {
		TypedQuery<Long> query = entityManager().createQuery(
				"SELECT COUNT(o) FROM ShoppingProducts o where o.shopId=:shopId and o.review=:review and deleteStatus=0 and store=false", Long.class);
		query.setParameter("shopId", shopId);
		query.setParameter("review", review);
		return query.getSingleResult();
	}

	public static Long searchCount(ShoppingProductQuery shoppingProductQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<Long> cq = cb.createQuery(Long.class);
		Root<ShoppingProducts> root = cq.from(ShoppingProducts.class);

		Predicate p = prepareQuery(shoppingProductQuery, cb, root);
		cq.select(cb.count(root)).where(p);

		return entityManager().createQuery(cq).getSingleResult().longValue();
	}

	public static List<ShoppingProducts> search(ShoppingProductQuery shoppingProductQuery, int firstResult, int maxResults) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShoppingProducts> cq = cb.createQuery(ShoppingProducts.class);
		Root<ShoppingProducts> root = cq.from(ShoppingProducts.class);
		Predicate p = prepareQuery(shoppingProductQuery, cb, root);
		cq.orderBy(cb.desc(root.get("id")));
		cq.select(root).where(p);
		return entityManager().createQuery(cq).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
	}

	public static List<ShoppingProducts> search(ShoppingProductQuery shoppingProductQuery) {
		CriteriaBuilder cb = entityManager().getCriteriaBuilder();
		CriteriaQuery<ShoppingProducts> cq = cb.createQuery(ShoppingProducts.class);
		Root<ShoppingProducts> root = cq.from(ShoppingProducts.class);
		Predicate p = prepareQuery(shoppingProductQuery, cb, root);
		cq.orderBy(cb.desc(root.get("id")));
		cq.select(root).where(p);
		return entityManager().createQuery(cq).getResultList();
	}

	/**
	 * 查询条件
	 * 
	 * @param shoppingProductQuery
	 * @param cb
	 * @param root
	 * @return
	 */
	private static Predicate prepareQuery(ShoppingProductQuery shoppingProductQuery, CriteriaBuilder cb, Root<ShoppingProducts> root) {
		Predicate p = cb.conjunction();
		// 商户ID
		if (shoppingProductQuery.getShopId() != null) {
			p = cb.and(p, cb.equal(root.<String> get("shopId"), shoppingProductQuery.getShopId()));
		}
		// 分类
		if (shoppingProductQuery.getShoppingCategoryId() != null) {
			p = cb.and(p, cb.equal(root.<String> get("shoppingCategoryId"), shoppingProductQuery.getShoppingCategoryId()));
		}
		// 商品名称
		if (!StringUtils.isBlank(shoppingProductQuery.getName())) {
			p = cb.and(p, cb.like(root.<String> get("name"), "%" + shoppingProductQuery.getName() + "%"));
		}
		// 商品货号
		if (!StringUtils.isBlank(shoppingProductQuery.getProductNumber())) {
			p = cb.and(p, cb.like(root.<String> get("productNumber"), "%" + shoppingProductQuery.getProductNumber() + "%"));
		}
		// 平台货号
		if (!StringUtils.isBlank(shoppingProductQuery.getSysNumber())) {
			p = cb.and(p, cb.like(root.<String> get("sysNumber"), "%" + shoppingProductQuery.getSysNumber() + "%"));
		}
		// 是否上架
		if (shoppingProductQuery.getOnSale() != null) {
			p = cb.and(p, cb.equal(root.<String> get("onSale"), shoppingProductQuery.getOnSale()));
		}
		// 是否审核
		if (shoppingProductQuery.getReview() != null) {
			p = cb.and(p, cb.equal(root.<String> get("review"), shoppingProductQuery.getReview()));
		}
		// 非审核不通过
		if (shoppingProductQuery.getNoReview() != null) {
			p = cb.and(p, cb.notEqual(root.<String> get("review"), shoppingProductQuery.getNoReview()));
		}
		// 是否在仓库
		if (shoppingProductQuery.getStore() != null) {
			p = cb.and(p, cb.equal(root.<Boolean> get("store"), shoppingProductQuery.getStore()));
		}
		// 是否在仓库
		if (shoppingProductQuery.getIsExpect() != null) {
			p = cb.and(p, cb.equal(root.<Boolean> get("isExpect"), shoppingProductQuery.getIsExpect()));
		}
		
		// 未删除状态
		p = cb.and(p, cb.equal(root.<String> get("deleteStatus"), 0));
		return p;
	}

	public Integer getAddress() {
		return address;
	}

	public void setAddress(Integer address) {
		this.address = address;
	}

	public Boolean isPostage() {
		return isPostage;
	}

	public void setPostage(Boolean isPostage) {
		this.isPostage = isPostage;
	}

	public Integer getWrapPostageNum() {
		return wrapPostageNum;
	}

	public void setWrapPostageNum(Integer wrapPostageNum) {
		this.wrapPostageNum = wrapPostageNum;
	}

	public Boolean getIsExpect() {
		return isExpect;
	}

	public void setIsExpect(Boolean isExpect) {
		this.isExpect = isExpect;
	}

	public Boolean getIs_send_st() {
		return is_send_st;
	}

	public void setIs_send_st(Boolean is_send_st) {
		this.is_send_st = is_send_st;
	}

	public Boolean getIs_customer() {
		return is_customer;
	}

	public void setIs_customer(Boolean is_customer) {
		this.is_customer = is_customer;
	}



}
