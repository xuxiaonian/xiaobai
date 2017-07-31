<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40">
		<div class="j-right">
			<div class="col-xs-my-48">
				<a class="button" href="<%=path %>/shopses">店铺信息</a> <a class="button button-action" href="">企业信息</a>
					
				<a class="button " href="<%=path %>/companys/12?contract">合同信息</a>   <a class="button " href="<%=path %>/companys/12?brand">品牌信息</a>
		
			</div>
			<div class="col-xs-my-48 j-form j-bodyRE">
				<form action="<%=path %>/shopses" method="post">
					<input type="hidden" name="_method" value="PUT"/>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">企业名称：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="j-odd4" for="name">${company.name }</label>
						</div>
					</div>
					<%-- <div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name"></label>
						</div>
						<div class="col-xs-10 j-name">
							<img style="float: left;width: 250px;height: 200px" src="${company.imgUrl }" />
						</div>
					</div> --%>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">详细地址：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="" for="name">${company.address }</label>
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">法人：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="" for="name">${company.legalPersion}</label>
						</div>
					</div>
					<%-- <div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">企业介绍：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="" for="name">${company.remark }</label>
						</div>
					</div> --%>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">注册时间：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="" for="name"><fmt:formatDate value="${company.createdAt }" pattern="yyyy-MM-dd"/></label>
						</div>
					</div>
					<div class="col-xs-12 j-shop-top">
						<div class="col-xs-2 j-name">
							<label for="name">审核时间：</label>
						</div>
						<div class="col-xs-10 j-name">
							<label class="" for="name"><fmt:formatDate value="${company.auditTime }" pattern="yyyy-MM-dd"/></label>
						</div>
					</div>
					<div class="col-xs-12 j-shop-top"></div>
				</form>
			</div>
		</div>
	</div>
</div>