<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" />
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>

	<div class="col-xs-my-40">
		<form action="<%=path%>/shoppingproductses" method="get"
			id="queryForm">
			<input type="hidden" name="method" value="reviewlist" /> <input
				type="hidden" name="page" value="${page }" /> <input type="hidden"
				id="hiddenId" />
			<div class="j-right">
				<div class="col-xs-my-6">
					<div class="j-font" style="margin: 8px; float: right;">分类</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="shoppingCategoryId" id="selectDate"
							class="form-control">
							<option value="">请选择</option>
							<c:forEach items="${shoppingCategories }" var="shoppingCategory">
								<c:if
									test="${shoppingProductQuery.shoppingCategoryId ==  shoppingCategory.id}">
									<option selected="selected" value="${shoppingCategory.id }">${shoppingCategory.name
										}</option>
								</c:if>
								<c:if
									test="${shoppingProductQuery.shoppingCategoryId !=  shoppingCategory.id}">
									<option value="${shoppingCategory.id }">${shoppingCategory.name
										}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" id="inputNumber" onchange="changeName(this)"
							class="form-control">
							<c:if test="${empty shoppingProductQuery.name }">
								<option value="name">商品名称</option>
							</c:if>
							<c:if test="${!(empty shoppingProductQuery.name) }">
								<option selected="selected" value="name">商品名称</option>
							</c:if>

							<c:if test="${empty shoppingProductQuery.sysNumber }">
								<option value="sysNumber">平台货号</option>
							</c:if>
							<c:if test="${!(empty shoppingProductQuery.sysNumber) }">
								<option selected="selected" value="sysNumber">平台货号</option>
							</c:if>

							<c:if test="${empty shoppingProductQuery.productNumber }">
								<option value="productNumber">商家货号</option>
							</c:if>
							<c:if test="${!(empty shoppingProductQuery.productNumber) }">
								<option selected="selected" value="productNumber">商家货号</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="col-xs-my-10">
					<div class="demo">
						<input type="text" name="content" id="postText"
							value="${shoppingProductQuery.name}${shoppingProductQuery.sysNumber}${shoppingProductQuery.productNumber}"
							class="form-control" placeholder="请输入商家名称">
					</div>
				</div>
				
				
				     <div class="col-xs-my-4">
						<div class="j-font" style="margin: 4px; float: right;">预售商品</div>
					</div>
					<div class="col-xs-my-7">
					     <select name="isExpect" id="isExpect" class="form-control" style="margin-top:5px">
					         <option value="">全部</option>
					         <option value="1">是</option>
					         <option value="0">否</option>
					     </select>
					
					</div>
				
				
				<div class="demo">
					<div class="col-xs-my-8 h4"></div>
				</div>
				<div class="col-xs-my-4 j-btn-act">
					<button type="submit"
						class="button  button-rounded button-action  button-small"
						style="float: right;">搜索</button>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<a
						href="<%=path%>/shoppingproductses?method=reviewlist&page=1&size=10"
						class="button  button-rounded button-action  button-small">重置</a>
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
					<table id="simpledatatable"
						class="table table-striped table-bordered table-hover dataTable no-footer"
						aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">商品编码</th>
								<th class="">商品名称</th>
								<th class="">分类</th>
								<th class="">销售价格</th>
								<th class="">审核失败原因</th>
								<th class="">审核时间</th>
								<th class="">预售商品</th>
								<th class="">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shoppingproductses }" var="shoppingproduct">
								<tr class="odd">
									<td class="j-odd1">平台货号：${shoppingproduct.sysNumber}</br>商家货号：${shoppingproduct.productNumber
										}
									</td>
									<td class="j-odd2"><a href="<%=path %>/shoppingproductses/${shoppingproduct.id}">${shoppingproduct.name}</a></td>
									<td class="j-odd2">
										${shoppingproduct.shoppingCategoryId.name}</td>
									<td class="j-odd2">￥${shoppingproduct.price}元</td>
									<td class="j-odd3">${shoppingproduct.reviewReason }</td>
									<td class="j-odd2"><fmt:formatDate value="${shoppingproduct.updatedAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
									<td class="j-odd2"><c:if test="${shoppingproduct.isExpect==true}">是</c:if><c:if test="${shoppingproduct.isExpect!=true}">否</c:if> </td>
									<td><a href="<%=path %>/shoppingproductses/${shoppingproduct.id}?form" class="j-odd4">编辑</a> <a class="j-odd5"
										onclick="deleteProduct(${shoppingproduct.id})">删除</a></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="shoppingproductses"
						parameter="&method=reviewlist&${list}"></page:page>
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
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
$(document).ready(function(){
	var value = $("#inputNumber option:selected").val();
	$("#postText").attr("name",value);
}); 

function changeName(obj){
	var index = obj.selectedIndex; // 选中索引
	var value = obj.options[index].value;
	var text = obj.options[index].text;
	$("#postText").attr("name",value);
	$("#postText").attr("placeholder","请输入"+text);
}

function deleteProduct(id){
	  $.ajax({
			url : '<%=path%>/shoppingproductses?method=deleteProduct&productId='+id,
			type: 'POST',
			contentType : "application/json",//application/xml
			processData : true,//contentType为xml时，些值为false
			dataType : "html",//json--返回json数据类型；xml--返回xml
			success : function(data) {
				if(data=="true"){
					alert("操作成功");
					window.location.reload();//刷新当前页面.
				}else{
					alert("操作失败");
				}
			},
		});
}


</script>
