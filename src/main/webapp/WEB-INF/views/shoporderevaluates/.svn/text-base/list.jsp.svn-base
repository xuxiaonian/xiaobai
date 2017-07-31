<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fun"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<div class="j-content">
	<div class="col-xs-my-1">&nbsp;</div>
	<!--左侧个人信息与导航部分-->
	<div class="col-xs-my-40">
		<!--导航-->
		<!--content部分-->
		<div class="col-xs-my-45 j-bodyOR">
			<!--订单详情-->
			<div class="col-xs-my-48">
				<!--条件搜索-->
				<form action="<%=path%>/shoporderevaluates" method="get" id="queryForm">
					<input type="hidden" name="page" value="${page }" /> <input type="hidden" id="hiddenId" />
					
					<div class="j-right">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-7">
							<div class="demo">
								<select name="" id="inputNumber" onchange="changeName(this)" class="form-control">
									<c:if test="${empty shopOrderEvaluateQuery.name }">
										<option value="name">商品名称</option>
									</c:if>
									<c:if test="${!empty shopOrderEvaluateQuery.name }">
										<option selected="selected" value="name">商品名称</option>
									</c:if>
									<c:if test="${empty shopOrderEvaluateQuery.orderNumber }">
										<option value="orderNumber">订单编号</option>
									</c:if>
									<c:if test="${!empty shopOrderEvaluateQuery.orderNumber }">
										<option selected="selected" value="orderNumber">订单编号</option>
									</c:if>
									<c:if test="${empty shopOrderEvaluateQuery.content }">
										<option value="content">评价信息</option>
									</c:if>
									<c:if test="${!empty shopOrderEvaluateQuery.content }">
										<option selected="selected" value="content">评价信息</option>
									</c:if>
								</select>
							</div>
						</div>
						<div class="col-xs-my-7 ">
							<div class="demo">
								<input type="text" name="orderNumber" id="postText" value="${shopOrderEvaluateQuery.name }${shopOrderEvaluateQuery.orderNumber }${shopOrderEvaluateQuery.content }" class="form-control"
									placeholder="">
							</div>
						</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-7">
							<div class="j-font" style="margin: 8px; float: right;">评价时间：</div>
						</div>
						<div class="col-xs-my-7">
							<div class="demo">
								<input class="form-control datetimepicker" id="postDateStart" name="evaluateStart" size="16" type="text"
									value="<fmt:formatDate value="${shopOrderEvaluateQuery.evaluateStart }" pattern="yyyy-MM-dd"/>">
							</div>
							<div id="datePlugin"></div>
						</div>
						<div class="demo">
							<div class="col-xs-my-1 h4">-</div>
						</div>
						<div class="col-xs-my-7">
							<div class="demo">
								<input class="form-control datetimepicker" id="postDateEnd" name="evaluateEnd" size="16" type="text"
									value="<fmt:formatDate value="${shopOrderEvaluateQuery.evaluateEnd }" pattern="yyyy-MM-dd"/>">
							</div>
							<div id="datePlugin"></div>
						</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-4 j-btn-act">
							<button type="submit" class="button  button-rounded button-action  button-small" style="float: right;">搜索</button>
						</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-4 j-btn-act">
							<a href="<%=path%>/shoporderevaluates?page=1" class="button  button-rounded button-action  button-small">重置</a>
						</div>
					</div>
				</form>
				<!--条件搜索-->
				<!--留言板-->
				<div class="col-xs-my-48">
					<div id="tab1" class="tab_content" style="display: block;">
						<div class="table-scrollable">
							<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
								<thead>
									<tr role="row">
										<th class="">用户</th>
										<th class="">订单编码</th>
										<th class="">评价信息</th>
										<th class="">商品信息</th>
										<th class="">操作</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${shoporderevaluates }" var="shoporderevaluate">
										<tr class="odd">
											<td class="j-odd2 j-table-padd5">${shoporderevaluate.mobileUserId.userName }</td>
											<td>${shoporderevaluate.shopOrder.orderNumber }</td>
											<td class="j-odd2">
												<div class="j-star j-table-left">
													<c:forEach begin="1" end="${shoporderevaluate.grade }" step="1">
														<i class="fa fa-star"></i>
													</c:forEach>
												</div> <br />
												<div class="j-table-age j-table-left">
													<h1>${shoporderevaluate.content }</h1>
												</div> <br />
												<div class="j-odd2 j-margin50 j-table-padd5">
													<span class="j-table-left">评价时间：<fmt:formatDate value="${shoporderevaluate.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
												</div> <c:forEach items="${shoporderevaluate.shopOrderEvaluateReplies }" var="shopOrderEvaluateReplie">
													<br />
													<div class="j-table-padd5">
														<div class="alert alert-danger" role="alert">
															<h1 style="">回复：${shopOrderEvaluateReplie.content }</h1>
														</div>
													</div>
												</c:forEach>
											</td>
											<td class="j-odd2">
												<div class="j-odd2 j-margin50 j-table-padd5">
													<span><a href="<%=path %>/shoppingproductses/${shoporderevaluate.shoppingProductsId.id }">${shoporderevaluate.shoppingProductsId.name }</a></span>
												</div>
											</td>
											<c:if test="${fun:length(shoporderevaluate.shopOrderEvaluateReplies)<=0}">
												<td class="j-table-padd5"><a onclick="reply(${shoporderevaluate.id})">回复</a></td>
												
											</c:if>
											<c:if test="${fun:length(shoporderevaluate.shopOrderEvaluateReplies)>0}">
												<td class="j-table-padd5"><a onclick="replyDelete(${shoporderevaluate.id})">删除回复</a></td>
<!-- 												<td class="j-table-padd5">已回复</td> -->
											</c:if>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							<page:page maxPages="${maxPages }" url="shoporderevaluates" page="${page }" parameter="&${list }"></page:page>
						</div>
					</div>
				</div>
				<!--留言板-->
			</div>
		</div>
		<!--订单详情-->
	</div>
</div>
<link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<!--dialog页面的弹出引用js文件-->
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
$(document).ready(function(){
	var value = $("#inputNumber option:selected").val();
	$("#postText").attr("name",value);
});

function changeName(obj){
	var index = obj.selectedIndex; // 选中索引
	var value = obj.options[index].value;
	$("#postText").attr("name",value);
}

	function reply(id){
			art.dialog.open('<%=path%>/shoporderevaluates?form&id='+id,{id:'send',title:'回复评价',width:650,height:250,lock:true, background:'#000000',
				close: function() {  
					location.reload();
	            }
			});
	}

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
	function replyDelete(id){

		$("#queryForm").append('<input type="hidden" name="delete" value="'+id+'"/>');
		$("#queryForm").submit();
		
}
</script>