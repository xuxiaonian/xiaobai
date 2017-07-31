<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/valid.css" />
<div>
	<div class="j-content">
		<!--content  左边下部部分-->
		<div class="col-xs-my-1">&nbsp;</div>
		<div class="col-xs-my-40">
	
					<a class="button " href="/shop/shopfreighttemplates">单品运费模板</a> <a class="button " href="<%=path %>/shopfreighttemplates/12?listShop">店铺运费模板</a>
				<a class="button button-action" href="">计算模式</a>	
		
			<div class="j-right">
				<div class="col-xs-my-48 j-form j-bodyRE">
					<form action="<%=path %>/shopfreighttemplates/122?calculation" method="post" id="form">
						<input type="hidden" name="productId" value="${productId }"/>
				

						<div class="col-xs-12 j-register-top">
							<div class="col-xs-5 j-name">
								<span class="j-color">*</span><label for="name">一单多品运费计算模式：</label>
							</div>
							<div class="col-xs-7 form-group">
							<c:if test="${shops.calculationModel ==0 }">
								<div class="col-xs-3">  
									<label class="checkbox"><input  name="calculationModel" type="radio"   value="0"  checked/>叠加计算</label>
			                    </div>
			                    <div class="col-xs-3">
			                    	<label class="checkbox"><input name="calculationModel" type="radio"   value="1" />取高计算 </label>
       							</div>
       						</c:if>
       							<c:if test="${shops.calculationModel !=0 }">
								<div class="col-xs-3">
									<label class="checkbox"><input  name="calculationModel" type="radio"   value="0"  />叠加计算</label>
			                    </div>
			                    <div class="col-xs-3">
			                    	<label class="checkbox"><input name="calculationModel" type="radio"   value="1"  checked/>取高计算 </label>
       							</div>
       						</c:if>
							</div>
							
						</div>
	
						<div class="col-xs-12">
							<div class="col-xs-3">&nbsp;</div>
							<div class="col-xs-3 j-register-top">
								<button type="submit" class="button button-action button-rounded" id="Preservation">保存并返回</button>
							</div>
						
							<div class="col-xs-4">&nbsp;</div>
						</div>
					</form>
				</div>
			</div>
			
		</div>
		<!--content  中右边上部部分-->
	</div>
</div>
	<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
	<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
	<script type="text/javascript">
// 	$("#form").Validform({
// 		tiptype:1
// 	});
	

</script>