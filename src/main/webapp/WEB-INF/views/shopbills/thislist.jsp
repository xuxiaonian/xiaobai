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
		<form action="<%=path%>/shopbills" method="get" id="queryForm">
			<input type="hidden" name="page" value="${page }" />
			<input type="hidden" name="method" value="thisList" />
			<input type="hidden" id="hiddenId" />
			<div class="j-right">
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" id="selectDate" class="form-control">
							<option selected="selected" value="orderTime">订单完结时间</option>
						</select>
					</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<c:if test="${shopBill.billStart!=null}">
							<input class="form-control datetimepicker" id="postDateStart" name="billStart" size="16" type="text"
								value="<fmt:formatDate value="${shopBill.billStart }" pattern="yyyy-MM-dd"/>" >
						</c:if>
						<c:if test="${shopBill.billStart==null}">
							<input class="form-control datetimepicker" id="postDateStart" name="billStart" size="16" type="text" value=""
								>
						</c:if>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="demo">
					<div class="col-xs-my-1 h4">-</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<c:if test="${shopBill.billEnd!=null}">
							<input class="form-control datetimepicker" id="postDateEnd" name="billEnd" size="16" type="text" value="<fmt:formatDate value="${shopBill.billEnd }" pattern="yyyy-MM-dd"/>"
								>
						</c:if>
						<c:if test="${shopBill.billEnd==null}">
							<input class="form-control datetimepicker" id="postDateEnd" name="billEnd" size="16" type="text" value=""
								>
						</c:if>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="col-xs-my-12">&nbsp;</div>
				
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<button type="submit" class="button  button-rounded button-action  button-small" style="float: right;">搜索</button>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<a href="<%=path%>/shopbills?method=thisList&page=1" class="button  button-rounded button-action  button-small">重置</a>
				</div>
				<div class="col-xs-my-4 j-btn-act">
					<a href="<%=path%>/report?expExcel&billStart=<fmt:formatDate value="${shopBill.billStart }" pattern="yyyy-MM-dd"/>&billEnd=<fmt:formatDate value="${shopBill.billEnd }" pattern="yyyy-MM-dd"/>" class="button  button-rounded button-action  button-small">导出EXCEL</a>
				</div>
			</div>
		</form>
	</div>
	<!--content  右边上部部分-->
	<!--tab切换-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-content-top">
		<!--tab 内容切换-->
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<div class="table-scrollable">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
					<thead>
							<tr >
								<th colspan="7" style="background-color: #fff">账单日期：从<fmt:formatDate value="${shopBill.billStart}" pattern="yyyy-MM-dd"/>到<fmt:formatDate value="${shopBill.billEnd}" pattern="yyyy-MM-dd"/></th>
<%-- 								<th colspan="2" style="background-color: #fff">账单金额：${shopBill.billCost }</th> --%>
<%-- 								<th colspan="2" style="background-color: #fff">结算金额：${shopBill.settleCost }</th> --%>
							</tr>
							<tr role="row">
								<th class="">订单/退款编号</th>
								<th class="">商品信息</th>
								<th class="">收入类型</th>
								<th class="">订单完结时间</th>
								<th class="">订单金额</th>
								<th class="">结算金额</th>
								<th class="">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopBill.shopBillDetails }" var="shopBillDetail">
								<tr class="odd">
									<td class="j-odd1">${shopBillDetail.shopOrders.orderNumber }</td>
									<td class="j-odd2"><c:forEach items="${shopBillDetail.shopOrders.shopOrderList }" var="shopOrderList">
										${shopOrderList.productName } * ${shopOrderList.buyCouts }
										</br>
										</c:forEach></td>
									<td class="j-odd2">${shopBillDetail.billEnumDetail.name }
									</td>
									<td class="j-odd2"><fmt:formatDate value="${shopBillDetail.shopOrders.endTime }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td class="j-odd4">￥${shopBillDetail.orderCost }</td>
									<td class="j-odd4">￥${shopBillDetail.orderSettleCost }</td>
									<td><a href="<%=path%>/shoporderses/${shopBillDetail.shopOrders.id}" class="j-odd6">订单详情</a> <!-- </br> <a href="#" class="j-odd7">取消订单</a> --></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="shopbills" parameter="&method=thisList&${list}"></page:page>
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
		function send(id){
	    	  $.ajax({
	    			url : '<%=path%>/shoporderses?method=updateOrderStatus&id='+id,
	    			type: 'POST',
	    			contentType : "application/json",//application/xml
	    			processData : true,//contentType为xml时，些值为false
	    			dataType : "html",//json--返回json数据类型；xml--返回xml
	    			success : function(data) {
	    				if(data=="true"){
	    					alert("发货成功");
	    					window.location.reload();//刷新当前页面.
	    				}else{
	    					alert("发货失败");
	    				}
	    			},
	    		});
		}
		
		function queryShopOrdersByStatus(id){
			$("#hiddenId").after('<input type="hidden" name="orderStatus" value="'+id+'"/>');
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