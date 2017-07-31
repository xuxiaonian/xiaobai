<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<link href="<%=path%>/css/select2.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/select2.min.js"></script>
<div class="col-xs-my-1">&nbsp;</div>
<div class="col-xs-my-46">
	<form method="post" id="formId">
		<input type="hidden" name="method" value="updateOrderStatus" />
		<input type="hidden" name="orderId" value="${itemId}" />
		<input type="hidden" name="update" value="11" />
		<div class="j-body-up j-Inform-height">
			<div class="col-xs-my-48">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-6 j-line"></div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-40 j-size">发货信息</div>
			</div>
			<!--发货信息-->
			<div class="col-xs-my-48">
				<hr />
			</div>
			<!--横线-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2 j-title">
					<div class="j-Order">快递公司</div>
				</div>
			</div>
			<!--快递公司-->
			<div class="col-xs-my-48 j-remind">
				<div class="col-xs-1">&nbsp;</div>
				<div class="col-xs-10">
					<select name="logisticsCompanyId" id="select2" style="width: 500px" class="col-xs-12 form-control" data-live-search="true">
						<c:forEach items="${logisticsCompanies }" var="logisticsCompany">
							<option value="${logisticsCompany.id }">${logisticsCompany.logisticsCode }--${logisticsCompany.logisticsName }</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-xs-1">&nbsp;</div>
			</div>
			<!--快递单号-->
			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-2 j-title">
					<div class="j-Order">快递单号</div>
				</div>
			</div>
			<div class="col-xs-my-48 j-remind">
				<div class="col-xs-1">&nbsp;</div>
				<div class="col-xs-10">
					<input type="text" class="form-control" name="logisticsNumber" placeholder="请输入快递单号">
				</div>
				<div class="col-xs-1">&nbsp;</div>
			</div>
			<!--快递单号-->
			<div class="col-xs-my-48 j-Inform-Submit">
				<div class="col-xs-4">&nbsp;</div>
				<div class="col-xs-4">
					<button type="button" id="sub" class="button  button-rounded button-action">提交</button>
				</div>
				<div class="col-xs-4">&nbsp;</div>
			</div>
		</div>
		<div class="col-xs-my-1">&nbsp;</div>
	</form>
</div>
<div class="clearfix"></div>
<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
$("#select2").select2({

});
		 $(document).ready(function() {
				$('#sub').click(function(){
					 $.ajax({
			    			url : '<%=path %>/shoporderses',
			    			type: 'POST',
			    			dataType : "html",//json--返回json数据类型；xml--返回xml
			    			data: $('#formId').serialize(),
			    			success : function(data) {
			    				if(data=="true"){
			    					alert("发货成功");
			    					art.dialog.close();
			    				}else{
			    					alert("发货失败");
			    				}
			    			},
			    		});
				});
		  });
</script>