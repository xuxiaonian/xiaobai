<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40">
		<form action="<%=path %>/shoporderretruns" method="get" id="queryForm">
			<input type="hidden" name="page" value="${page }" /> <input type="hidden" id="hiddenId" />
			<div class="j-right">
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="shopOrderRetrunType" class="form-control">
							<option value="">请选择退款状态</option>
							<c:forEach items="${shoporderretruntypes }" var="shoporderretruntype">
								<c:if test="${shopOrderRetrunQuery.shopOrderRetrunType.id == shoporderretruntype.id}">
									<option selected="selected" value="${shoporderretruntype.id }">${shoporderretruntype.name }</option>
								</c:if>
								<c:if test="${shopOrderRetrunQuery.shopOrderRetrunType.id != shoporderretruntype.id}">
									<option value="${shoporderretruntype.id }">${shoporderretruntype.name }</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
				</div>

				<div class="col-xs-my-5">
					<div class="demo">
						<select name="" onchange="changeDate(this)" id="selectDate" class="form-control">
						<c:if test="${(!empty shopOrderRetrunQuery.orderTimeStart)||!empty shopOrderRetrunQuery.orderTimeEnd }">
							<option selected="selected" value="orderTime">下单时间</option>
						</c:if>
						<c:if test="${(empty shopOrdersQuery.orderTimeStart) && empty shopOrdersQuery.orderTimeEnd }">
							<option value="orderTime">下单时间</option>
						</c:if>
						<c:if test="${(!empty shopOrderRetrunQuery.payedAtStart)||!empty shopOrderRetrunQuery.payedAtEnd}">
							<option selected="selected" value="payedAt">支付时间</option>
						</c:if>
						<c:if test="${(empty shopOrdersQuery.payedAtStart) && empty shopOrdersQuery.payedAtEnd }">
							<option value="payedAt">支付时间</option>
						</c:if>
						<c:if test="${(!empty shopOrderRetrunQuery.returnAtStart)||!empty shopOrderRetrunQuery.returnAtEnd}">
							<option selected="selected" value="returnAt">退款申请时间</option>
						</c:if>
						<c:if test="${(empty shopOrdersQuery.returnAtStart) && empty shopOrdersQuery.returnAtEnd }">
							<option value="returnAt">退款申请时间</option>
						</c:if>
						</select>
					</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<input class="form-control datetimepicker" id="postDateStart" name="orderTimeEnd" size="16" type="text" value="<fmt:formatDate value="${shopOrderRetrunQuery.orderTimeStart }" pattern="yyyy-MM-dd"/><fmt:formatDate value="${shopOrderRetrunQuery.payedAtStart }" pattern="yyyy-MM-dd"/><fmt:formatDate value="${shopOrderRetrunQuery.returnAtStart }" pattern="yyyy-MM-dd"/>"
							>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="demo">
					<div class="col-xs-my-1 h4">-</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<input class="form-control datetimepicker" id="postDateEnd" name="orderTimeEnd" size="16" type="text" value="<fmt:formatDate value="${shopOrderRetrunQuery.orderTimeEnd }" pattern="yyyy-MM-dd"/><fmt:formatDate value="${shopOrderRetrunQuery.payedAtEnd }" pattern="yyyy-MM-dd"/><fmt:formatDate value="${shopOrderRetrunQuery.returnAtEnd }" pattern="yyyy-MM-dd"/>"
							>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" onchange="changeName(this)" id="inputNumber" class="form-control">
							<c:if test="${!(empty shopOrderRetrunQuery.orderNumber) }">
								<option selected="selected" value="orderNumber">订单编号</option>
							</c:if>
							<c:if test="${(empty shopOrderRetrunQuery.orderNumber) }">
								<option value="orderNumber">订单编号</option>
							</c:if>
							<c:if test="${!(empty shopOrderRetrunQuery.returnNumber) }">
								<option selected="selected" value="returnNumber">退款编号</option>
							</c:if>
							<c:if test="${(empty shopOrderRetrunQuery.returnNumber) }">
								<option value="returnNumber">退款编号</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="col-xs-my-6 ">
					<div class="demo">
						<input type="text" id="postText" name="orderNumber" value="${shopOrderRetrunQuery.orderNumber }${shopOrderRetrunQuery.returnNumber}" class="form-control" placeholder="请输入订单编号">
					</div>
				</div>
				<div class="col-xs-my-4 j-btn-act">
					<button type="submit" class="button  button-rounded button-action  button-small" style="float: right;">搜索</button>
				</div>
				<div class="col-xs-my-4 j-btn-act">
					<a href="<%=path%>/shoporderretruns?page=1&size=10" class="button  button-rounded button-action  button-small">重置</a>
				</div>
			</div>
		</form>
	</div>
	<!--content  右边上部部分-->
	<!--tab切换-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-content-top">
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<div class="table-scrollable">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">退款编号</th>
								<th class="">订单编号</th>
								<th class="">商品信息</th>
								<th class="">订单金额</th>
								<th class="">退款金额</th>
								<th class="">申请时间</th>
								<th class="">状态</th>
								<th class="">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shoporderretruns }" var="shoporderretrun">
								<tr class="odd">
									<td class="j-odd1">${shoporderretrun.returnNumber }</td>
									<td class="j-odd2">${shoporderretrun.shopOrderId.orderNumber }</td>
									<td class="j-odd2">
										<c:forEach items="${shoporderretrun.shopOrderId.shopOrderList }" var="shopOrderList">
												${shopOrderList.productName } * ${shopOrderList.buyCouts }
												</br>
										</c:forEach>
									</td>
									<td class="j-odd2">${shoporderretrun.shopOrderId.collect }
									</td>
									<td class="j-odd3">${shoporderretrun.returnCost }</td>
									<td class="j-odd2"><fmt:formatDate value="${shoporderretrun.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td class="j-odd4">${shoporderretrun.shopOrderRetrunType.name }</td>
									<td>
										<c:if test="${shoporderretrun.shopOrderId.orderStatus.id==4 }"><span style="float: right;" class="j-odd1">售后</span><br></c:if>
										<a href="<%=path%>/shoporderretruns/${shoporderretrun.id}" class="j-odd6">退款详情</a> 
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="shoporderretruns" parameter="&${list}"></page:page>
				</div>
			</div>
		</div>
	</div>
</div>
<link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var selected = $("#selectDate option:selected").val();
	$("#postDateStart").attr("name",selected+"Start");
	$("#postDateEnd").attr("name",selected+"End");
	
	var value = $("#inputNumber option:selected").val();
	$("#postText").attr("name",value);
}); 

	$('.datetimepicker').datetimepicker({
		language: 'zh-CN',
		format:"yyyy-mm-dd",
        weekStart: 1,
        todayBtn:  1,
		autoclose: 1,
		todayHighlight: 1,
		startView: 2,
		minView: 2,
		forceParse: 0
    });
		function changeName(obj){
			var index = obj.selectedIndex; // 选中索引
			var value = obj.options[index].value;
			$("#postText").attr("name",value);
		}
		
		function changeDate(obj){
			var index = obj.selectedIndex; // 选中索引
			var value = obj.options[index].value;
			$("#postDateStart").attr("name",value+"Start");
			$("#postDateEnd").attr("name",value+"End");
		}
	</script>