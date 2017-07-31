<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<!--content部分-->
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-Commodity-up">
		<a class="button  button-action" href=" ">单品运费模板</a> <a class="button " href="<%=path %>/shopfreighttemplates/12?listShop">店铺运费模板</a>
				<a class="button " href="<%=path %>/shopfreighttemplates/12?calculation">计算模式</a>	
		
		<div class="j-body-up">
			<!--新增运费模版-->
			<div class="col-xs-my-48 j-freight">
				<div class="col-xs-4">&nbsp;</div>
				<div class="col-xs-4">
					<a href="<%=path %>/shopfreighttemplates?form" class="button button-action button-rounded">新增运费模版</a>
				</div>
				<div class="col-xs-4">&nbsp;</div>
			</div>
			<!--/新增运费模版-->
		</div>
		<div class="j-body-up">
			<c:forEach items="${shopfreighttemplates }" var="shopfreighttemplate" varStatus="status">
             
				<c:if test="${ shopfreighttemplate.templateType ==0 }">
				 <c:if test="${ shopfreighttemplate.freeShipping ==1 }">
				 <div class="col-xs-my-48">
					<div class="col-xs-my-1">&nbsp;</div>
					<div class="col-xs-my-46 j-table-tit3">
						<div class="col-xs-my-20 j-table-size">&nbsp;${(status.index+1)}.${shopfreighttemplate.name }</div>
						<div class="col-xs-my-17 j-table-size">
							最后编辑时间：
							<fmt:formatDate value="${shopfreighttemplate.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
					   <div class="col-xs-my-3 j-table-size">
							<a href="<%=path %>/shopfreighttemplates/${shopfreighttemplate.id}?form">修改|</a>
						</div>
						<div class="col-xs-my-4 j-table-size">
							<a onclick="del(${shopfreighttemplate.id})">删除</a>
						</div>
					</div>
					<div class="col-xs-my-1">&nbsp;</div>
				</div>
                </c:if >
				 <c:if test="${ shopfreighttemplate.freeShipping ==0 }">
               
			   <c:if test="${ shopfreighttemplate.mode ==0 }">
				<div class="col-xs-my-48">
					<div class="col-xs-my-1">&nbsp;</div>
					<div class="col-xs-my-46 j-table-tit3">
						<div class="col-xs-my-20  j-table-size">&nbsp;${(status.index+1)}.${shopfreighttemplate.name }</div>
						<div class="col-xs-my-17 j-table-size">
							最后编辑时间：
							<fmt:formatDate value="${shopfreighttemplate.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
<!-- 						<div class="col-xs-my-4 j-table-size"> -->
<%-- 							<a onclick="cope(${shopfreighttemplate.id})">复制模版|</a> --%>
<!-- 						</div> -->
						<div class="col-xs-my-3 j-table-size">
							<a href="<%=path %>/shopfreighttemplates/${shopfreighttemplate.id}?form">修改|</a>
						</div>
						<div class="col-xs-my-4 j-table-size">
							<a onclick="del(${shopfreighttemplate.id})">删除</a>
						</div>
					</div>
					<div class="col-xs-my-1">&nbsp;</div>
				</div>
				<!--茶品通类-->
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-46">
					<table class="table">
						<thead>
							<tr>
								<th class="j-table-th">运送到</th>
								<th class="j-table-th">首件（个）</th>
								<th class="j-table-th">运费（元）</th>
								<th class="j-table-th">续件（个）</th>
								<th class="j-table-th">运费（元）</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopfreighttemplate.shopFreightTemplateDetails }" var="shopFreightTemplateDetail">
								<tr>
									<td class="j-delivery">
								
									<c:forEach items="${shopFreightTemplateDetail.shopFreightTemplateDetailCities }" var="shopFreightTemplateDetailCity">
<%-- 											${ shopFreightTemplateDetailCity.provinces } --%>
											<c:if test="${ empty shopFreightTemplateDetailCity.provinces }">
											全国
										</c:if>
											<c:if test="${!empty shopFreightTemplateDetailCity.provinces }">
										
											${shopFreightTemplateDetailCity.provinces.provinceName }
										</c:if>
										</c:forEach></td>
									<td class="j-delivery">${shopFreightTemplateDetail.count }</td>
									<td class="j-delivery">${shopFreightTemplateDetail.freight }</td>
									<td class="j-delivery">${shopFreightTemplateDetail.addCount }</td>
									<td class="j-delivery">${shopFreightTemplateDetail.addFreight }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
							<div class="col-xs-my-46">
					<table class="table">
						<thead>
							<tr>
							<c:forEach items="${shopfreighttemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping1" varStatus="sta">
							<c:if test="${sta.index == 0 }">
								<c:if test="${ !empty shopFreightFreeShipping1.version  }">
								<th class="j-table-th">运送到</th>
								<th class="j-table-th">包邮条件</th>
								</c:if>
								</c:if>
							</c:forEach>
							
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopfreighttemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping">
								<tr>
									<td class="j-delivery"><c:forEach items="${shopFreightFreeShipping.shopFreightFreeShippingCity }" var="ShopFreightFreeShippingCity">
											<c:if test="${empty ShopFreightFreeShippingCity.provinces }">
											全国
										</c:if>
											<c:if test="${!empty ShopFreightFreeShippingCity.provinces }">
											${ShopFreightFreeShippingCity.provinces.provinceName }
										</c:if>
										</c:forEach></td>
									<td class="j-delivery">
								<c:if test="${shopFreightFreeShipping.count==0 }">
								满${shopFreightFreeShipping.numbers }件包邮
								</c:if>
								<c:if test="${shopFreightFreeShipping.count==1 }">
								满${shopFreightFreeShipping.freight }元包邮
								</c:if>
									
									</td>
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				 </c:if>
			   <c:if test="${ shopfreighttemplate.mode !=0 }">

				<div class="col-xs-my-48">
					<div class="col-xs-my-1">&nbsp;</div>
					<div class="col-xs-my-46 j-table-tit3">
						<div class="col-xs-my-20 j-table-size">&nbsp;${(status.index+1)}.${shopfreighttemplate.name }</div>
						<div class="col-xs-my-17 j-table-size">
							最后编辑时间：
							<fmt:formatDate value="${shopfreighttemplate.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
<!-- 						<div class="col-xs-my-4 j-table-size"> -->
<%-- 							<a onclick="cope(${shopfreighttemplate.id})">复制模版|</a> --%>
<!-- 						</div> -->
						<div class="col-xs-my-3 j-table-size">
							<a href="<%=path %>/shopfreighttemplates/${shopfreighttemplate.id}?form">修改|</a>
						</div>
						<div class="col-xs-my-4 j-table-size">
							<a onclick="del(${shopfreighttemplate.id})">删除</a>
						</div>
					</div>
					<div class="col-xs-my-1">&nbsp;</div>
				</div>
				<!--茶品通类-->
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-46">
					<table class="table">
						<thead>
							<tr>
								<th class="j-table-th">运送到</th>
								<th class="j-table-th">首件（kg）</th>
								<th class="j-table-th">运费（元）</th>
								<th class="j-table-th">续件（kg）</th>
								<th class="j-table-th">运费（元）</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopfreighttemplate.shopFreightTemplateDetails }" var="shopFreightTemplateDetail">
								<tr>
									<td class="j-delivery"><c:forEach items="${shopFreightTemplateDetail.shopFreightTemplateDetailCities }" var="shopFreightTemplateDetailCity">
											<c:if test="${empty shopFreightTemplateDetailCity.provinces }">
											全国
										</c:if>
											<c:if test="${!empty shopFreightTemplateDetailCity.provinces }">
											${shopFreightTemplateDetailCity.provinces.provinceName }
										</c:if>
										</c:forEach></td>
									<td class="j-delivery">${shopFreightTemplateDetail.count }</td>
									<td class="j-delivery">${shopFreightTemplateDetail.freight }</td>
									<td class="j-delivery">${shopFreightTemplateDetail.addCount }</td>
									<td class="j-delivery">${shopFreightTemplateDetail.addFreight }</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
							<div class="col-xs-my-46">
					<table class="table">
						<thead>
<%-- 					 --%>
							<tr>
							<c:forEach items="${shopfreighttemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping1" varStatus="sta">
							<c:if test="${sta.index == 0 }">
								<c:if test="${ !empty shopFreightFreeShipping1.version  }">
								<th class="j-table-th">运送到</th>
								<th class="j-table-th">包邮条件</th>
								</c:if>
								</c:if>
							</c:forEach>
							</tr>
							
						</thead>
						<tbody>
							<c:forEach items="${shopfreighttemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping">
								<tr>
									<td class="j-delivery"><c:forEach items="${shopFreightFreeShipping.shopFreightFreeShippingCity }" var="ShopFreightFreeShippingCity">
											<c:if test="${empty ShopFreightFreeShippingCity.provinces }">
											全国
										</c:if>
											<c:if test="${!empty ShopFreightFreeShippingCity.provinces }">
											${ShopFreightFreeShippingCity.provinces.provinceName }
										</c:if>
										</c:forEach></td>
									<td class="j-delivery">
								<c:if test="${shopFreightFreeShipping.count==0 }">
								满${shopFreightFreeShipping.numbers }kg包邮
								</c:if>
								<c:if test="${shopFreightFreeShipping.count==1 }">
								满${shopFreightFreeShipping.freight }元包邮
								</c:if>
									
									</td>
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				</c:if>
				  </c:if>
				    </c:if>
			 <c:if test="${ shopfreighttemplate.templateType !=0 }">
						<div class="col-xs-my-48">
					<div class="col-xs-my-1">&nbsp;</div>
					<div class="col-xs-my-46 j-table-tit3">
						<div class="col-xs-my-20 j-table-size">&nbsp;${(status.index+1)}.${shopfreighttemplate.name }</div>
						<div class="col-xs-my-17 j-table-size">
							最后编辑时间：
							<fmt:formatDate value="${shopfreighttemplate.updatedAt }" pattern="yyyy-MM-dd HH:mm:ss" />
						</div>
<!-- 						<div class="col-xs-my-4 j-table-size"> -->
<%-- 							<a onclick="cope(${shopfreighttemplate.id})">复制模版|</a> --%>
<!-- 						</div> -->
						<div class="col-xs-my-3 j-table-size">
							<a href="<%=path %>/shopfreighttemplates/${shopfreighttemplate.id}?form">修改|</a>
						</div>
						<div class="col-xs-my-4 j-table-size">
							<a onclick="del(${shopfreighttemplate.id})">删除</a>
						</div>
					</div>
					<div class="col-xs-my-1">&nbsp;</div>
				</div>
			
		
				<div class="col-xs-my-46">
					<table class="table">
						<thead>
							<tr>
								<th class="j-table-th">运送到</th>
								<th class="j-table-th">计费规则</th>
							
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shopfreighttemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping">
								<tr>
									<td class="j-delivery"><c:forEach items="${shopFreightFreeShipping.shopFreightFreeShippingCity }" var="ShopFreightFreeShippingCity">
											<c:if test="${empty ShopFreightFreeShippingCity.provinces }">
											全国
										</c:if>
											<c:if test="${!empty ShopFreightFreeShippingCity.provinces }">
											${ShopFreightFreeShippingCity.provinces.provinceName }
										</c:if>
										</c:forEach></td>
									<td class="j-delivery">
									<c:if test="${shopFreightFreeShipping.fixedFreight==1}">
									固定运费是${shopFreightFreeShipping.charge }元
									</c:if>
							        <c:if test="${shopFreightFreeShipping.fixedFreight==0}">
							     订单金额满${shopFreightFreeShipping.freight }元包邮，不足时运费是${shopFreightFreeShipping.charge }元
							     	</c:if>
									
									</td>
								
								</tr>
							</c:forEach>
						</tbody>
					</table>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				
								
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>
<script type="text/javascript">
		function cope(id){
	    	  $.ajax({
	    			url : '<%=path%>/shopfreighttemplates?method=cope&templateId='+id,
	    			type: 'POST',
	    			contentType : "application/json",//application/xml
	    			processData : true,//contentType为xml时，些值为false
	    			dataType : "html",//json--返回json数据类型；xml--返回xml
	    			success : function(data) {
	    					window.location.reload();//刷新当前页面.
	    			},
	    		});
		}
		
		function del(id){
			var truthBeTold = window.confirm("您确定删除吗？");
			if (truthBeTold) {
	    	  $.ajax({
	    			url : '<%=path%>/shopfreighttemplates/'+id+'?_method=DELETE',
	    			type: 'POST',
	    			contentType : "application/json",//application/xml
	    			processData : true,//contentType为xml时，些值为false
	    			dataType : "html",//json--返回json数据类型；xml--返回xml
	    			success : function(data) {
	    				
	    				if(data=="true"){
	    					window.location.reload();//刷新当前页面.
	    				}else{
	    					alert("当前运费模板正在使用，不能删除");
	    				}
	    			},
	    		});
		}
		}
</script>