package com.huazhuo.shop.pojo;

import java.util.List;

import com.huazhuo.shop.domain.MobileUsersAuthLicePic;
import com.huazhuo.shop.domain.ProductBrand;
import com.huazhuo.shop.domain.ShopCategoryCommissionRela;

/*
 * 首页显示类
 */
public class Register {

	private Integer shId;     //zhanghu
	private Integer cId;     //company id
	private Integer bId;     //back_user id
	private Integer mId;     //	MobileUsers
	private Integer sId;     //	shops
	private Integer moId;     //mobile_users_auth
    //	企业信息
	private String name;   //公司名称
    private String address;    //	注册地址
	private String legalPersion;//法人名称
	private String legalPersionCard;//法人证件号
	private String contactPerson;//联系人
	private String phone;//手机号
	private String email;//邮箱
	private String creditCode;//企业社会统一信用代码
//	账户信息
	private String openBank;//开户行
	private String accountName;//户名
	private String accountNumber;//账号
	//店铺基础信息信息
	private String shopsImg;//logo
	private String shopName;//店铺名称
	private String shopCategoryCommissionRela;//经营品类
	public String getShopCategoryCommissionRela() {
		return shopCategoryCommissionRela;
	}
	public void setShopCategoryCommissionRela(String shopCategoryCommissionRela) {
		this.shopCategoryCommissionRela = shopCategoryCommissionRela;
	}
	private Integer provincesId;//经营地址
	private Integer citiesId;//经营地址
	private String shopAddress;//经营地址
	private String shopPersion;//联系人
	private String shopPhone;//手机号
	private String shopServicePhone;//客服电话
	private String shopsPhone;//客服电话
	private String shopContent;//店铺介绍
	
	//品牌
	private List<ProductBrand> productBrand;//品牌
	//企业资质
	private List<MobileUsersAuthLicePic>  mobileUsersAuthLicePic1;
	public Integer getcId() {
		return cId;
	}
	public void setcId(Integer cId) {
		this.cId = cId;
	}
	public Integer getbId() {
		return bId;
	}
	public void setbId(Integer bId) {
		this.bId = bId;
	}
	public Integer getmId() {
		return mId;
	}
	public void setmId(Integer mId) {
		this.mId = mId;
	}
	public Integer getMoId() {
		return moId;
	}
	public void setMoId(Integer moId) {
		this.moId = moId;
	}
	public String getOpenBank() {
		return openBank;
	}
	public void setOpenBank(String openBank) {
		this.openBank = openBank;
	}
	public String getAccountName() {
		return accountName;
	}
	public void setAccountName(String accountName) {
		this.accountName = accountName;
	}
	public String getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(String accountNumber) {
		this.accountNumber = accountNumber;
	}
	public String getShopsImg() {
		return shopsImg;
	}
	public void setShopsImg(String shopsImg) {
		this.shopsImg = shopsImg;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	
	public Integer getProvincesId() {
		return provincesId;
	}
	public void setProvincesId(Integer provincesId) {
		this.provincesId = provincesId;
	}
	public Integer getCitiesId() {
		return citiesId;
	}
	public void setCitiesId(Integer citiesId) {
		this.citiesId = citiesId;
	}
	public String getShopAddress() {
		return shopAddress;
	}
	public void setShopAddress(String shopAddress) {
		this.shopAddress = shopAddress;
	}
	public String getShopPersion() {
		return shopPersion;
	}
	public void setShopPersion(String shopPersion) {
		this.shopPersion = shopPersion;
	}
	public String getShopPhone() {
		return shopPhone;
	}
	public void setShopPhone(String shopPhone) {
		this.shopPhone = shopPhone;
	}
	public String getShopServicePhone() {
		return shopServicePhone;
	}
	public void setShopServicePhone(String shopServicePhone) {
		this.shopServicePhone = shopServicePhone;
	}
	public String getShopContent() {
		return shopContent;
	}
	public void setShopContent(String shopContent) {
		this.shopContent = shopContent;
	}
	public List<ProductBrand> getProductBrand() {
		return productBrand;
	}
	public void setProductBrand(List<ProductBrand> productBrand) {
		this.productBrand = productBrand;
	}
	public List<MobileUsersAuthLicePic> getMobileUsersAuthLicePic() {
		return mobileUsersAuthLicePic1;
	}
	public void setMobileUsersAuthLicePic(List<MobileUsersAuthLicePic> mobileUsersAuthLicePic) {
		this.mobileUsersAuthLicePic1 = mobileUsersAuthLicePic;
	}
	//资质
	private List<MobileUsersAuthLicePic> mobileUsersAuthLicePic;//品牌
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public String getLegalPersion() {
		return legalPersion;
	}
	public void setLegalPersion(String legalPersion) {
		this.legalPersion = legalPersion;
	}
	

	public String getLegalPersionCard() {
		return legalPersionCard;
	}
	public void setLegalPersionCard(String legalPersionCard) {
		this.legalPersionCard = legalPersionCard;
	}
	public String getContactPerson() {
		return contactPerson;
	}
	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getCreditCode() {
		return creditCode;
	}
	public void setCreditCode(String creditCode) {
		this.creditCode = creditCode;
	}
	public Integer getsId() {
		return sId;
	}
	public void setsId(Integer sId) {
		this.sId = sId;
	}
	
	public Integer getShId() {
		return shId;
	}
	public void setShId(Integer shId) {
		this.shId = shId;
	}
	public String getShopsPhone() {
		return shopsPhone;
	}
	public void setShopsPhone(String shopsPhone) {
		this.shopsPhone = shopsPhone;
	}
	
}
