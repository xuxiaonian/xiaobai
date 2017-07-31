<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<div class="alert alert-success" role="alert" >
	<form action="" method="post" id="formId">
		<input type="hidden" name="shopOrderRetrunId" value="${returnId}"/>
	<div class="j-odd2">
		<select class="form-control" name="selectContent">
			<c:forEach items="${dicItem }" var="dicItem">
				<option value="${dicItem.dicName }">${dicItem.dicName }</option>
			</c:forEach>
		</select>
		<hr />
		<textarea name="content" class="form-control" rows="3">感谢您对商品的喜爱,祝您生活愉快!</textarea>
		<hr />
		<button type="button" onclick="replySub()" class="btn btn-warning btn-sm j-table-sub" style="float: right;">提交</button>
	</div>
	</form>
	<div class="clearfix"></div>
</div>


<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<script type="text/javascript">
function replySub(){
	 $.ajax({
			url : '<%=path %>/shoporderreturnconsults',
			type: 'POST',
			dataType : "html",//json--返回json数据类型；xml--返回xml
			data: $('#formId').serialize(),
			success : function(data) {
				if(data=="true"){
					art.dialog.close();
				}else{
					
				}
			},
		});
}
</script>