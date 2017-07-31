<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/zhangdanDetail.css" />
<!--图标引用样式-->
<div class="j-content">
	<div class="col-xs-my-1">&nbsp;</div>
	<!--左侧个人信息与导航部分-->
	<div class="col-xs-my-40">
		<!--导航-->
		<!--content部分-->
		<div class="col-xs-my-48 j-bodyOR">
			<div class="col-xs-my-48 zState">
				<span class="col-xs-my-6 zstate">账单状态：</span><span class="col-xs-my-30 state">
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
						<a class="btn btn-success" onclick="showBillPro()">查看结算凭证</a>
					</c:if>
				</span>
				<div class="col-xs-my-12 daoC">
					<a class="btn btn-success" href="<%=path %>/report/${shopbill.id}?expExcelShopBill">导出EXCEL</a>
				</div>
			</div>
			<div class="col-xs-my-48 bill">账单详情</div>
			<div class="col-xs-my-48 mesge">
				<table class="col-xs-my-48 basic">
					<tr>
						<td class="col-xs-my-9 basicL">账单编号：</td>
						<td class="col-xs-my-15 basicR">${shopbill.billNumber }</td>
						<td class="col-xs-my-9 basicL">账单周期:</td>
						<td class="col-xs-my-15 basicR"><fmt:formatDate value="${shopbill.billStart }" pattern="yyyy-MM-dd" />至<fmt:formatDate value="${shopbill.billEnd }" pattern="yyyy-MM-dd" /></td>
					</tr>
					<tr>
						<td class="col-xs-my-9 basicL">生成时间：</td>
						<td class="col-xs-my-15 basicR">${shopbill.createDate }</td>
						<td class="col-xs-my-9 basicL">确认时间:</td>
						<td class="col-xs-my-15 basicR">${shopbill.shopEnterDate }</td>
					</tr>
					<tr>
						<td class="col-xs-my-9 basicL">结算时间：</td>
						<td class="col-xs-my-15 basicR">${shopbill.operFinancialManagerSettleTime }</td>
						<td class="col-xs-my-9 basicL"></td>
						<td class="col-xs-my-15 basicR">&nbsp;</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td class="col-xs-my-9 basicL bscH">账单金额：</td> -->
<%-- 						<td class="col-xs-my-15 basicR org">¥${shopbill.billCost }</td> --%>
<!-- 						<td class="col-xs-my-9 basicL bscH">结算金额：</td> -->
<%-- 						<td class="col-xs-my-15 basicR org">¥${shopbill.settleCost }</td> --%>
<!-- 					</tr> -->
				</table>
				<div class="col-xs-my-48 bscT">订单明细</div>
				<div class="col-xs-my-48 order">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">订单/退款编号</th>
								<th class="">商品信息</th>
								<th class="">订单完结时间</th>
								<th class="">收入类型</th>
								<th class="">订单金额</th>
								<th class="">结算金额</th>
							</tr>
						</thead>
						<c:forEach items="${shopbill.shopBillDetails }" var="shopBillDetail">
							<tr class="odd">
								<td class="j-odd1">
									<c:if test="${shopBillDetail.billEnumDetail.name=='收入' }">
										${shopBillDetail.shopOrders.orderNumber }
									</c:if>
									<c:if test="${shopBillDetail.billEnumDetail.name=='支出' }">
										R${shopBillDetail.shopOrders.orderNumber }
									</c:if>
								</td>
								<td class="j-odd2"><c:forEach items="${shopBillDetail.shopOrders.shopOrderList }" var="shopOrderList">
										${shopOrderList.productName } * ${shopOrderList.buyCouts }
										</br>
									</c:forEach></td>
								<td class="j-odd2">
									<c:if test="${shopBillDetail.billEnumDetail.name=='收入' }">
										<fmt:formatDate value="${shopBillDetail.shopOrders.endTime }" pattern="yyyy-MM-dd HH:mm:ss" />
									</c:if>
									<c:if test="${shopBillDetail.billEnumDetail.name=='支出' }">
									<fmt:formatDate value="${shopBillDetail.shopOrders.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" />
									</c:if>
								</td>
								<td class="j-odd3">${shopBillDetail.billEnumDetail.name }</td>
								<td class="j-odd4">${shopBillDetail.orderCost }</td>
								<td class="j-odd4">${shopBillDetail.orderSettleCost }</td>
							</tr>
						</c:forEach>
						<tbody>
						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="../shopbills/${id }" parameter="${list}"></page:page>
				</div>
				<c:if test="${shopbill.billEnum==5}">
				<div class="col-xs-12">
					<div class="col-xs-3">&nbsp;</div>
					<div class="col-xs-3 j-register-top">
						<button type="button" onclick="enter()" class="btn btn-success" id="Preservation">确认账单</button>
					</div>
					<div class="col-xs-3 j-register-top">
						<button type="button" onclick="noEnter()" class="btn btn-danger" id="Preservation">拒绝确认</button>
					</div>
					<div class="col-xs-3">&nbsp;</div>
				</div>
				</c:if>
			</div>
		</div>
		<!--content部分-->
	</div>
</div>
	<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
	<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
function enter(){
	var truthBeTold = window.confirm("您确定确认账单吗？");
	if (truthBeTold) {
	 $.ajax({
			url : '<%=path%>/shopbills?method=enter&id='+${shopbill.id},
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
}
function noEnter(){
	var truthBeTold = window.confirm("您确定拒绝确认吗？");
	if (truthBeTold) {
	 $.ajax({
			url : '<%=path%>/shopbills?method=noEnter&id='+${shopbill.id},
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
}

function showBillPro(){
		art.dialog.open('<%=path %>/shopbills/showPro?id=${itemId}',{id:'send',title:'结算凭证',width:650,height:350,lock:true, background:'#000000',
			close: function() {  
            }	
		});
}

</script>