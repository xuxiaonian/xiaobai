<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>
<style>
#wrap{word-break:break-all; width:200px;}
</style>
<link rel="stylesheet" href="<%=path %>/css/valid.css" />
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40">
		<div class="j-right">
			<div class="col-xs-my-48">
				<a class="button button-action" href="">店铺信息</a>   <a class="button" href="<%=path %>/companys">企业信息</a>
					<a class="button " href="<%=path %>/companys/12?contract">合同信息</a>   <a class="button " href="<%=path %>/companys/12?brand">品牌信息</a>
			</div>
			<div class="col-xs-my-48 j-form j-bodyRE">
				<form action="<%=path %>/shopses" method="post" id="myForm">
					<input type="hidden" name="_method" value="PUT"/>
					<input type="hidden" name="id" value="${shop.id }"/>
					<input type="hidden" name="version" value="${shop.version }"/>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">店铺名称：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="j-odd4" for="name">${shop.name }</label>
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">店铺LOGO：</label>
						</div>
						<div class="col-xs-10 j-name">
							<img style="float: left;width: 250px;height: 200px" src="${shop.url }" />
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">店铺介绍：</label>
						</div>
						<div class="col-xs-10 j-name ">
							<label class="" style="float: left; text-align: left;word-break : break-all; overflow:hidden; " for="name">${shop.content }</label>
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">店铺地址：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="" style="float: left" for="name">${shop.cities.name }${shop.address }</label>
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">联系人：</label>
						</div>
						<div class="col-xs-10 form-group">
							<input type="text" datatype="*" name="persion" value="${shop.persion }" class="col-xs-my-43 form-control" placeholder="请输入联系人">
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">手机号：</label>
						</div>
						<div class="col-xs-10 form-group">
							<input type="text" datatype="*" name="phone" value="${shop.phone }" class="col-xs-my-43 form-control" placeholder="请输入手机号">
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">客服电话：</label>
						</div>
						
							<div class="col-xs-3 form-group">
								<input type="text" name="servicePhone" value="${shop.servicePhone }" datatype="*" class="col-xs-my-48 form-control" placeholder="客服电话"/>
							</div>
							<div class="col-xs-1 text-center form-control-static">转</div>
							<div class="col-xs-3 form-group">
								<input type="text" name="servicePhoneExt" value="${shop.servicePhoneExt }" class="col-xs-my-48 form-control" placeholder="分机号"/>
							</div>
							<div class="col-xs-2">
					</div>
					<div class="col-xs-12 ">
						<div class="col-xs-2 j-name">
							<label for="name">&nbsp;</label>
						</div>
						<div class="col-xs-10 form-group">
							用于买家有问题联系商家时使用     固定电话格式为“区号-号码-分机”，不支持400电话)
						</div>
					</div>
					<div class="col-xs-12">
					<div class="col-xs-5">&nbsp;</div>
					<div class="col-xs-3 j-shop-top" style="margin: 1px">
						<button type="submit" class="button button-action button-rounded" id="Preservation">保存设置</button>
					</div>
					<div class="col-xs-4">&nbsp;</div>
				</div>
				</form>
			</div>
		</div>
	</div>
</div>
<script>
$("#myForm").Validform({
	tiptype:1
});
</script>