<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/template.js"></script>
<script type="text/javascript" src="<%=path%>/js/XCheck.js"></script>

<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>

	<div class="col-xs-my-40">
		<form action="<%=path%>/shopbills" method="get" id="queryForm">
			<input type="hidden" name="page" value="${page }" /> <input type="hidden" id="hiddenId" />
			<div class="j-right">
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" id="selectDate" class="form-control">
							<option selected="selected" value="orderTime">账单生成时间</option>
						</select>
					</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<c:if test="${(!empty shopBillQuery.createDateStart)}">
							<input class="form-control datetimepicker" id="postDateStart" name="createDateStart" size="16" type="text"
								value="<fmt:formatDate value="${shopBillQuery.createDateStart }" pattern="yyyy-MM-dd"/>" >
						</c:if>
						<c:if test="${(empty shopBillQuery.createDateStart)}">
							<input class="form-control datetimepicker" id="postDateStart" name="createDateStart" size="16" type="text" value="" >
						</c:if>
					</div>
					<div id="datePlugin"></div>
				</div>
				
				<div class="col-xs-my-7">
					<div class="demo">
						<c:if test="${(!empty shopBillQuery.createDateEnd)}">
							<input class="form-control datetimepicker" id="postDateEnd" name="createDateEnd" size="16" type="text" value="<fmt:formatDate value="${shopBillQuery.createDateEnd }" pattern="yyyy-MM-dd"/>"
								>
						</c:if>
						<c:if test="${(empty shopBillQuery.createDateEnd)}">
							<input class="form-control datetimepicker" id="postDateEnd" name="createDateEnd" size="16" type="text" value="" >
						</c:if>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" id="inputNumber" onchange="changeName(this)" class="form-control">
							<option value="orderNumber">账单编号</option>
						</select>
					</div>
				</div>
				<div class="col-xs-my-6 ">
					<div class="demo">
						<input type="text" name="billNumber" id="postText" value="${shopBillQuery.billNumber }" class="form-control" placeholder="请输入订单编号">
					</div>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<button type="submit" class="button  button-rounded button-action  button-small" style="float: right;">搜索</button>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<a href="<%=path%>/shopbills?page=1" class="button  button-rounded button-action  button-small">重置</a>
				</div>
			</div>
		</form>
	</div>
	<!--content  右边上部部分-->
	<!--tab切换-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-content-top">
		<c:if test="${ empty shopBillQuery.billEnum && empty shopBillQuery.billShowEnum }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)">全部账单</button>
		</c:if>
		<c:if test="${ !(empty shopBillQuery.billEnum) || !(empty shopBillQuery.billShowEnum)}">
			<button class="button " onclick="queryShopOrdersByStatus(this.value)">全部账单</button>
		</c:if>
		<c:if test="${shopBillQuery.billEnum==5 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="5">待确认</button>
		</c:if>
		<c:if test="${shopBillQuery.billEnum!=5 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="5">待确认</button>
		</c:if>
		<c:if test="${shopBillQuery.billEnum==6 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="6">已确认</button>
		</c:if>
		<c:if test="${shopBillQuery.billEnum!=6 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="6">已确认</button>
		</c:if>
		<c:if test="${shopBillQuery.billEnum==7 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="7">已结算</button>
		</c:if>
		<c:if test="${shopBillQuery.billEnum!=7 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="7">已结算</button>
		</c:if>
		<c:if test="${shopBillQuery.billShowEnum==4 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="4">已拒绝</button>
		</c:if>
		<c:if test="${shopBillQuery.billShowEnum!=4 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="4">已拒绝</button>
		</c:if>
		<!--tab 内容切换-->
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
			<form action="<%=path%>/shopbills/sdd" method="get" id="update">
			  <input name="ids" type="hidden" class="xcheckgroup2 xcheckValue" readonly="readonly" />
				<div class="table-scrollable">
				<div id="export_excel" style="display: block"> 
			         <button class="button" onclick="update()">批量确定账单</button>
			    </div>
			    </from>
				 	<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
					 	<thead>
							<tr role="row">
								<c:if test="${shopBillQuery.billEnum==5 }">
							<th class="">   <input type="checkbox" class="xcheckgroup2 checkAllCurrent" /></th>
							</c:if>
								<th class="">账单编号</th>
								<th class="">周期</th>
								<th class="">结算金额</th>
								<th class="">账单状态</th>
								<th class="">账单生成时间</th>
								<th class="">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopbills }" var="shopbill">
								<tr class="odd"  id="${shopbill.id}">
								<c:if test="${shopBillQuery.billEnum==5 }">
								<td class="j-odd1"> 
								<input type="checkbox" class="xcheckgroup2 checkItem" value="${shopbill.id}" /></td>
								</c:if>	
									<td class="j-odd1">${shopbill.billNumber }</td>
									<td class="j-odd2"><fmt:formatDate value="${shopbill.billStart }" pattern="yyyy-MM-dd"/>至<fmt:formatDate value="${shopbill.billEnd }" pattern="yyyy-MM-dd"/></td>
									<td class="j-odd2">￥${shopbill.settleCost }</td>
									<td class="j-odd3">
									<c:if test="${shopbill.billEnum ==4}">
										已拒绝
									</c:if>
									<c:if test="${shopbill.billEnum ==5}">
										待确认
									</c:if>
									<c:if test="${shopbill.billEnum ==6}">
										已确认
									</c:if>
									<c:if test="${shopbill.billEnum ==7}">
										已结算
									</c:if>
									</td>
									<td class="j-odd2"><fmt:formatDate value="${shopbill.createDate }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td>
										<c:if test="${shopbill.billEnum!=1}">
											<a href="<%=path%>/shopbills/${shopbill.id}?page=1" class="j-odd6">账单详情</a>
										</c:if>
										<c:if test="${shopbill.billEnum==5}">
											<a href="<%=path%>/shopbills/${shopbill.id}?page=1" class="j-odd5">确认账单</a>
										</c:if>
									</td>
								</tr>
							</c:forEach>

   

						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="shopbills" parameter="&${list}"></page:page>
				</div>
			</div>
		</div>
	</div>
</div>
<link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css" />

<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>

<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
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
</script>
<script type="text/javascript">
$(function(){
    
    
    //场景二（普通选择的情况，也就是只有单页选择）
    $.XCheck({
        groupClass:".xcheckgroup2"
    });

});

		function send(id){
	    	  $.ajax({
	    			url : '<%=path%>/shoporderses?method=updateOrderStatus&id='+id,
	    			type: 'POST',
	    			contentType : "application/json",//application/xml
	    			processData : true,//contentType为xml时，些值为false
	    			dataType : "html",//json--返回json数据类型；xml--返回xml
	    			success : function(data) {
	    				if(data=="true"){
	    					window.location.reload();//刷新当前页面.
	    				}else{
	    				}
	    			},
	    		});
		}
		
		function queryShopOrdersByStatus(id){
			$("#hiddenId").after('<input type="hidden" name="billEnum" value="'+id+'"/>');
			$("#queryForm").submit();
		}
		
		function queryShopOrdersByBillShowEnum(id){
			$("#hiddenId").after('<input type="hidden" name="billEnum" value="0"/>');
			$("#hiddenId").after('<input type="hidden" name="billShowEnum" value="'+id+'"/>');
			$("#queryForm").submit();
		}
		
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