<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!--content部分-->
<div class="j-content">
	<!--content 部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-bodyOR">
		<!--买家进度导航-->
		<div class="col-xs-my-48">
			<div class="col-xs-my-4">&nbsp;</div>
			<div class="col-xs-my-10">
				<div class="j-progress2">
					<div class="j-Nav2">1.选择商品分类</div>
				</div>
			</div>
			<div class="col-xs-my-10">
				<div class="j-progress2">
					<div class="j-Nav2">2.编辑商品详情</div>
				</div>
			</div>
			<div class="col-xs-my-10">
				<div class="j-progress2">
					<div class="j-Nav2">3.上传并审核</div>
				</div>
			</div>
			<div class="col-xs-my-10">
				<div class="j-progress2">
					<div class="j-Nav2">4.通过并上线</div>
				</div>
			</div>
		</div>
		<div class="col-xs-my-48">
			<hr />
		</div>

		<form action="<%=path %>/shoppingproductses" method="get" id="myForm">
			<input type="hidden" name="productId" value="${id }"/>
			<input id="categoryId" type="hidden" name="categoryId" value=""/>
			<input type="hidden" name="method" value="updateCategory"/>
			<input id="shoppingCategoryName" type="hidden" name="shoppingCategoryName" value=""/>
			<div class="col-xs-my-48 j-form">
				<div class="col-xs-12 j-register-top">
				<div class="col-xs-my-6 j-name">&nbsp;</div>
					<div class="col-xs-3 j-name">
						<label for="name">您常用的商品分类：</label>
					</div>
					<div class="col-xs-6 form-group">
						<select class="col-xs-my-48 form-control" name="shopFreightTemplateType">
							<option value="1">24小时内</option>
							<option value="2">72小时内</option>
						</select>
					</div>
				</div>
			</div>
			<div class="col-xs-my-48">
				<div class="col-xs-my-8">&nbsp;</div>
				<div class="col-xs-my-16" style="border-width: 1px; border-color: #E2E2E2; border-style: solid;">
					<div class="col-xs-my-48" style="height: 500px; padding-top: 10px; overflow-y: scroll;">
						<ul id="myUl">
							<c:forEach items="${shoppingCategories }" var="shoppingCategor">
								<li onclick="selectCategory(this,${shoppingCategor.id},'${shoppingCategor.name }')" style="cursor: pointer; font-size: 20px; margin: 10px;">${shoppingCategor.name }></li>
							</c:forEach>
						</ul>
					</div>
				</div>
				<div class="col-xs-my-16" style="border-width: 1px; border-color: #E2E2E2; border-style: solid;">
					<div class="col-xs-my-48" style="height: 500px; padding-top: 10px; overflow-y: scroll;">
						<ul id="addUl">

						</ul>
					</div>
				</div>
				<div class="col-xs-my-8">&nbsp;</div>
			</div>

			<div class="col-xs-my-48" style="padding-top: 20px">
				<div class="col-xs-my-4">&nbsp;</div>
				<div class="col-xs-my-44">
					<span id="spanValue" style="cursor: pointer; font-size: 16px; margin: 10px">您当前选择的商品分类：</span>
				</div>
			</div>
			<div class="col-xs-12">
				<div class="col-xs-5">&nbsp;</div>
				<div class="col-xs-4 j-register-top">
					<button type="submit" class="button button-action button-rounded" id="Preservation">下一步，编辑商品信息</button>
				</div>
				<div class="col-xs-3">&nbsp;</div>
			</div>
		</form>
	</div>
</div>
<script type="text/javascript">
	function selectCategory(obj,id,name){
		  $("#myUl li").attr("class","");
		  $(obj).attr("class","j-odd3");
		  $("#categoryId").val(id);	
		  $("#shoppingCategoryName").val(name);	
		  $("#spanValue").html("您当前选择的商品分类："+name);
		  $.ajax({
				url : '<%=path%>/shoppingcategorieses?method=selectCategories&id='+id,
				type: 'POST',
				contentType : "application/json",//application/xml
				processData : true,//contentType为xml时，些值为false
				dataType : "html",//json--返回json数据类型；xml--返回xml
				success : function(data) {
					$("#addUl li").remove();
					var data = eval("("+data+")");
					for(var i=0;i<data.length;i++){
						$("#addUl").append('<li id="addUl'+data[i].id+'" onclick="selectCategoryTwo('+data[i].id+','+"'"+name+"'"+','+"'"+data[i].name+"'"+')" style="cursor:pointer;font-size: 20px;margin: 10px;">'+data[i].name+'</li>');
					}
				},
			});
	}
	
	function selectCategoryTwo(id,name,name1){
		 $("#addUl li").attr("class","");
		 $("#addUl"+id).attr("class","j-odd3");
		 $("#categoryId").val(id);
		 $("#shoppingCategoryName").val(name+"->"+name1);
		 $("#spanValue").html("您当前选择的商品分类："+name+">"+name1);
	}
</script>