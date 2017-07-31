<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<style>
.fj1 {
	position: absolute;
	width: 100px
}

.fd {
	position: relative;
	background: #FFF;
	z-index: 1;
	margin-top: 17px;
}
</style>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" />
<div class="j-content">
	<!--content  左边下部部分-->
	
<form class="form-horizontal" action="<%=path%>/promotion/wew?updateKept" method="post"  enctype="multipart/form-data" id="myForm">
<div class="col-xs-my-40" style="padding-top:10px">
<!-- 	<div class="form-group"> -->
<!-- 		<div class="col-xs-offset-1"> -->
<!-- 	 		<input type="button"  data-toggle="modal" data-target="#modalId" class="btn button-rounded button-action  button-small" value="添加商品"> -->
<!-- 		</div> -->
<!-- 	</div>	 -->

	<div class="form-group">
		<label class="col-xs-2 control-label">商品名称</label>
		<div class="col-xs-5">${zListPromotion.rebateName }</div>
	</div>
	 	
<!-- 	 			商品名称		 -->
<!-- 		<div class="form-group">'; -->
<%-- 	<label class="col-xs-2 control-label">商品名称：</label><div><input type="hidden" name="productId" value="${shoppingProducts.id}" /></div> --%>
<%-- 		<div  class="col-xs-5 form-control-static">${shoppingProducts.name}</div> --%>
<!-- 	 </div> -->
<!-- 		规格 -->
		<div id="tableHtml" class="">	
				<div class="form-group"> <div class="col-xs-10 col-xs-offset-2"><table class="table table-bordered"><thead><tr><td>规格</td><td>库存</td><td>价格</td></tr></thead><tbody>
       		  <c:forEach items="${shoppingProductsSpec }" var="list" varStatus="status">
       			<tr>
       			 <c:if test="${list.id == zListPromotion.productsSpecId}">
       		  <td>${list.specName }</td>
       		   <td>${list.productsNum }</td>
       			<td>${list.price }</td>
       		</c:if>
       		</tr>  
       		</c:forEach>
       		
       		</tbody></table></div></div>
		</div>
<!-- 		活动价 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">活动价</label>
		<div class="col-xs-5">${zListPromotion.rebatePrice } </div>
	</div>

<!-- 		*  参与活动数量 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">参与活动数量</label>
		<div class="col-xs-5">
			${zListPromotion.productNum }
		</div>
	</div>
		<input name="id" type="hidden" value="${zListPromotion.id }">
		<div class="form-group">
		<label class="col-xs-2 control-label">开始时间</label>
		<div class="col-xs-5">
			${zListPromotion.startTime }
		</div>	
	  </div>
	
	<!-- 		结束时间 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">结束时间</label>
		<div class="col-xs-5">
		${zListPromotion.endTime }
		
    	</div>
    </div>
<!--     <div class="form-group"> -->
<!-- 		<label class="col-xs-2 control-label">限购数量</label> -->
<!-- 		<div class="col-xs-5"> -->
<%-- 			${zListPromotion.productLimit } --%>
<!-- 		</div> -->
<!-- 	</div> -->
    
    
    
<!-- 			商家悬赏 -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="col-xs-2 control-label">商家悬赏</label> -->
<!-- 		<div class="col-xs-5 form-inlin">			 -->
<!-- 			<div class="col-xs-12">						 -->
<!-- 				<div class="input-group"> -->
<%-- 				<c:if test="${zListPromotion.rewardRatio!= 0}"> --%>
<%-- 					参与，悬赏金额为商品金额的${zListPromotion.rewardRatio }% --%>
				 
<%-- 				</c:if> --%>
<%-- 			     <c:if test="${zListPromotion.rewardRatio== 0}"> --%>
<!-- 				  不参与 -->
<%-- 				  </c:if> --%>
				
<!-- 				</div> -->
<!-- 			</div>     -->
<!--        	</div> -->
<!--       </div> -->
	
	  <div class="form-group">
			<div id="tab1" class="col-xs-offset-2" >
				
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">序号</th>
								<th class="">时间</th>
								<th class="">操作人</th>
								<th class="">操作</th>
								<th class="">备注</th>
							</tr>
						</thead>
						<tbody>
							 	<c:forEach items="${list}" var="list" varStatus="status">
								<tr>
									<td class="j-odd3">${(status.index)}</td>
									<td class="j-odd4">${list.time }</td>
									<td class="j-odd4">${list.name }</td>
									 <c:if test="${list.operation == 0}">
									<td class="j-odd4">添加活动</td>
								    </c:if>
								     <c:if test="${list.operation == 1}">
									<td class="j-odd4">审核</td>
								    </c:if>
								     <c:if test="${list.operation == 2}">
									<td class="j-odd4">关闭</td>
								    </c:if>
								     <td class="j-odd4">${list.remarks }</td>
						
								
							
								</tr>
							</c:forEach>
						</tbody>
					</table>				
			
			</div>
		</div>
		
		
			
		</div>
	
	
<!-- 	<div class="form-group"> -->
<!-- 		<div class="col-xs-offset-3"> -->
<!-- 			<button type="button" class="btn btn-success"   onclick="subd()" class="left" >提交</button> -->
<!-- 			<button type="reset" class="btn btn-warning">取消</button> -->
<!-- 		</div> -->
		
<!-- 	</div> -->

                
	</div>
</form>


<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">

		 

</script>
