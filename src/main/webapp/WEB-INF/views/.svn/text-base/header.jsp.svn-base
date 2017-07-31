<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<div>
	<div class="j-head col-xs-my-48">
		<div class="col-xs-my-30">&nbsp;</div>
		<!--下拉-->
				<div class="col-xs-my-4">
					<div class="dropdown" style="margin-top: 7px;">
					    <span  class="dropdown-toggle j-odd8" id="dropdownMenu1" data-toggle="dropdown">${sessionScope.shop.name}
					        <i class="fa fa-chevron-down"></i>
					    </span>
					    <ul class="dropdown-menu" role="menu" aria-labelledby="dropdownMenu1">
					        <li role="presentation">
					            <a role="menuitem" tabindex="-1" href="<%=path %>/updatePassWord">修改密码</a>
					        </li>
					    </ul>
					</div>
				</div>
				<!--下拉-->
		<div class="col-xs-my-9">
			<h5>您好，欢迎登录途铃商家销售平台</h5>
		</div>
		<div class="col-xs-my-4">
			<h5>
				<a href="<%=path%>/resources/j_spring_security_logout">[退出系统]</a>
			</h5>
		</div>
	</div>
	<div class="j-Navigation col-xs-my-48">
		<div class="col-xs-my-6">&nbsp;</div>
		<div class="col-xs-my-8">
			<img src="<%=path %>/img/logo.png" />
		</div>
		<div class="col-xs-my-34">
			<ul>
				<li><a href="<%=path%>/index">首页</a></li>
				<li><a href="<%=path%>/shoporderses?page=1&size=10">交易管理</a></li>
				<li><a href="<%=path %>/shoppingproductses?page=1&size=10&onSale=1">商品管理</a></li>
				<li><a href="<%=path %>/shopbills?method=thisList&page=1">账单管理</a></li>
				<li><a href="<%=path %>/shopaddresses?form">物流管理</a></li>
				<li><a href="<%=path %>/shopses">商家管理</a></li>
				<li><a href="<%=path %>/promotion">促销管理</a></li>
			</ul>
		</div>
	</div>
</div>