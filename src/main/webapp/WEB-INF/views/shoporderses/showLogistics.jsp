<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<div class="col-xs-my-1">&nbsp;</div>
<div class="col-xs-my-46  j-bodyOR">
	<div class="col-xs-my-48 j-details"></div>
	<div class="col-xs-my-48">
		<div class="col-xs-my-1">&nbsp;</div>
		<div class="col-xs-my-8 j-odd2 j-font14">快递公司：</div>
		<div class="col-xs-my-39 j-odd2 j-font14">${logisticsCompany.logisticsName }</div>
	</div>
	<div class="col-xs-my-48">
		<div class="col-xs-my-1">&nbsp;</div>
		<div class="col-xs-my-8 j-odd2 j-font14">快递单号：</div>
		<div class="col-xs-my-39 j-odd2 j-font14">${LogisticsPoJo.logisticCode }</div>
	</div>
	<c:forEach items="${LogisticsPoJo.traces }" var="traces">
		<div class="col-xs-my-48">
		<div class="col-xs-my-4 j-odd2 j-font14">√</div>
		<div class="col-xs-my-15 j-odd2 j-font14">${traces.acceptTime }</div>
		<div class="col-xs-my-29 j-odd2 j-font14">${traces.acceptStation }</div>
	</div>
	</c:forEach>
	
	<div class="clearfix">&nbsp;</div>
</div>
