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
		<!--订单详情-->
		
		<div class="col-xs-my-48">
			<div class="col-xs-my-1">&nbsp;</div>
			<div class="col-xs-my-46">
				<div class="col-xs-my-48 j-details" style="padding-top: 10px;">商品详情</div>
				<div class="col-xs-my-48">
					<hr />
				</div>
				<div class="col-xs-my-48 j-table-tit">
					<div class="j-table-size">&nbsp;基本信息</div>
				</div>
				<div class="col-xs-my-44">
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">平台货号：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.sysNumber }</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">商家货号：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.productNumber }</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">商品名称：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.name }</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">商品分类：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.shoppingCategoryId.name }</div>
					</div>
					
					<!-- 商品预售 -->
					 <c:if test="${shoppingProductsExpects!=null}"> 
						<div class="col-xs-my-48 j-foot-font">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">预售商品：</div>
							<div class="col-xs-my-18 j-odd2 j-font14">是</div>
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">预售期：</div>
							<div class="col-xs-my-18 j-odd2 j-font14">${shoppingProductsExpects.expectTimeBegin} 至 ${shoppingProductsExpects.expectTimeEnd}</div>
						</div>
						
						<div class="col-xs-my-48 j-foot-font">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">发货日期：</div>
							<div class="col-xs-my-18 j-odd2 j-font14">${shoppingProductsExpects.sendGoodsTime }</div>
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14" width="10%">预售结束转为普通商品：</div>
							<div class="col-xs-my-18 j-odd2 j-font14"><c:if test="${shoppingProductsExpects.isCommon==1}">是</c:if><c:if test="${shoppingProductsExpects.isCommon==0}">否</c:if> </div>
						</div>
					</c:if>
					
					
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">规格和价格：</div>
						<div class="col-xs-my-30">
						<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" style="margin-bottom: -1px;">
							<thead>
								<tr role="row">
									<th class="">规格</th>
									<th class="">市场价</th>
									<th class="">销售价</th>
									<th class="">库存</th>
									<th class="">库存预警值</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${shoppingproducts.shoppingProductsSpecs }" var="spec">
									<tr class="odd">
										<td class="j-odd1">${spec.specName }</td>
										<td class="j-odd2">${spec.orgPrice }</td>
										<td class="j-odd2">${spec.price }</td>
										<td class="j-odd2">${spec.productsNum }</td>
										<td class="j-odd2">${spec.warningNum }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">库存：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.stock }</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">库存预警：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.stockWarning }</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">产地：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.provinces.provinceName } - ${shoppingproducts.cityId.name }</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">商品品牌：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">${shoppingproducts.productBrandId.brandName }</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">物流费用：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">
							<c:if test="${shoppingproducts.isCost }">
									包邮
								</c:if>
							<c:if test="${!shoppingproducts.isCost }">
									物流模板：${shoppingproducts.shopFreightTemplate.name }
								</c:if>
						</div>
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">发票信息：</div>
						<div class="col-xs-my-18 j-odd2 j-font14">
							<c:if test="${shoppingproducts.invoice }">
									开发票
								</c:if>
							<c:if test="${!shoppingproducts.invoice }">
									不开发票
								</c:if>
						</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">推荐理由：</div>
						<div class="col-xs-my-42 j-odd2 j-font14">${shoppingproducts.recommendReason }</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">标签：</div>
						<div class="col-xs-my-42 j-odd2 j-font14">${shoppingproducts.shoppingProductMarkName }</div>
					</div>
					<div class="col-xs-my-48 j-foot-font">
						<div class="col-xs-my-1">&nbsp;</div>
						<div class="col-xs-my-5 j-odd2 j-font14">服务承诺：</div>
						<div class="col-xs-my-42 j-odd2 j-font14">  
					          <c:if test="${shoppingproducts.is_send_st==true}">   该商品支持72小时发货   </c:if>	
					          <c:if test="${shoppingproducts.is_customer==true}">  商家提供售后      </c:if>	 
					          <c:if test="${is_return_goods==true}">  该商品支持7天无理由退货  </c:if>
						</div>
						<input type="hidden" name="url" value="${qq}">
					</div>

					<div class="col-xs-my-48 j-details j-uppadd" style="padding-top: 40px">商品主图</div>
					<div class="col-xs-my-48 ">
						<c:forEach items="${shoppingproducts.shoppingProductPictures }" var="shoppingProductPicture">
						<c:if test="${not empty shoppingProductPicture.image }">
						<div class="col-xs-my-16 j-pohto3">
							<div class="col-xs-5">
								<img style="height: 200px;width: 250px" src="${shoppingProductPicture.image }">
							</div>
						</div>
						</c:if>
						</c:forEach>
					</div>
<!-- 					<div class="col-xs-my-48 j-details j-uppadd" style="padding-top: 40px">商品描述</div> -->
<!-- 					<div class="col-xs-my-48 "> -->
<!-- 						<div style="padding-top: 40px"> -->
<%-- 							${shoppingproducts.details } --%>
<!-- 						</div> -->
<!-- 					</div> -->
				</div>
				<div>
				<div class="col-xs-my-4"><div id="code"></div></div>
				<div class="col-xs-my-48 j-details j-uppadd" style="padding-top: 40px">商品基础描述</div>
				<c:forEach items="${gsBigcategory }" var="gsBigcategory" >
				
				<c:forEach items="${shoppingProductsDetail }" var="detail" >
				   
				      <c:if test="${detail.gsBigcategoryId==gsBigcategory.id }">
				      
							      <c:if test="${detail.type==1 }">
							      <div class="col-xs-my-48 j-details j-uppadd" >
										<span  class="col-xs-my-46 col-xs-my-offset-1" style="margin-bottom:10px">${detail.bigcategoryName}</span>
										<div class="col-xs-my-46 col-xs-my-offset-1">
				                          ${detail.content }
						               </div> 
								</div>
								</c:if>  
								 <c:if test="${detail.type==2 }">
							      <div class="col-xs-my-48 j-details j-uppadd" >
										<span class="col-xs-my-46 col-xs-my-offset-1" style="margin-bottom:10px">${detail.bigcategoryName}</span>
										<span class="col-xs-my-46 col-xs-my-offset-1">
										<img style="height: 200px;width: 250px" src="${detail.content }">
										</span>
								</div>
								</c:if> 
								</c:if> 
								</c:forEach> 
							 </c:forEach>
					</div>
<!-- 					商品的基础描述 -->
		<div>
				<div class="col-xs-my-48 j-details j-uppadd" style="padding-top: 40px">商品的更多描述</div>
				<c:forEach items="${shoppingProductsContent }" var="content" >
				
							      <c:if test="${content.type==1 }">
							    
								 	<div class="col-xs-my-48 j-details j-uppadd" >
										<span class="col-xs-my-46 col-xs-my-offset-1">
											${content.content }
										</span>
									</div>
								</c:if>  
								 <c:if test="${content.type==2 }">
							      <div class="col-xs-my-48 j-details j-uppadd" >
									<span class="col-xs-my-46 col-xs-my-offset-1">
										<img style="height: 200px;width: 250px" src="${content.content }">
							        </span>
								</div>
								</c:if>  
								
							</c:forEach>
					</div>
					</div>
<!-- 					商品的更多描述 -->
				<div id="tab1" class="tab_content" style="display:padding-top:20px; block;">
					<div class="table-scrollable">
						<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
							<thead>
								<tr role="row">
								
									<th class="">联系人</th>
									<th class="">所在地区</th>
									<th class="">街道地区</th>
									<th class="">邮政编码</th>
									<th class="">手机号</th>
									<th class="">电话号码</th>
									
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${shopaddresses }" var="shopaddress">
									<tr class="odd">
									
										<td class="j-odd2">${shopaddress.contact }</td>
										<td class="j-odd2">${shopaddress.provinces.provinceName }${shopaddress.cities.name }${shopaddress.areas.areaName }</td>
										<td class="j-odd2">${shopaddress.address }</td>
										<td class="j-odd2">${shopaddress.zipcood }</td>
										<td class="j-odd2">${shopaddress.phoneNumber }</td>
										<td class="j-odd4">${shopaddress.tel1 }
															<c:if test="${not empty shopaddress.tel1 }">
																-
															</c:if>
															${shopaddress.tel2 }
															<c:if test="${not empty shopaddress.tel3 }">
																-
															</c:if>
															${shopaddress.tel3 }</td>
										
<%-- 										<c:if test="${!shopaddress.sendProduct && !shopaddress.returnProduct}"> --%>
<%-- 											<a onclick="deleteAddress(${shopaddress.id})" class="j-odd5">删除</a> --%>
<%-- 										</c:if> --%>
										<br> <!--这里是dialog弹出--></td>
									</tr>
									<form action="<%=path %>/shopaddresses/${shopaddress.id}" method="post" id="deleteForm${shopaddress.id}">
											<input type="hidden" name="_method" value="DELETE">
										</form>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
				<!--订单日志-->
				<div class="col-xs-my-48 j-details j-uppadd">商品日志</div>
				<div class="col-xs-my-48 j-uppadd">
					<div class="table-scrollable">
						<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" style="margin-bottom: -1px;">
							<thead>
								<tr role="row">
									<th class="">时间</th>
									<th class="">操作人</th>
									<th class="">操作内容</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${sysLogs }" var="sysLog">
									<tr class="odd">
										<td class="j-odd1">${sysLog.createdAt }</td>
										<td class="j-odd2">${sysLog.operator }</td>
										<td class="j-odd2">${sysLog.content }</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<c:if test="${shoporders.orderStatus.id >2 }">
							<div class="col-xs-my-48 j-table-body3">
								<div class="col-xs-12 j-total j-uppadd">快递公司:${shoporders.logisticsCompany.name }</div>
								<div class="col-xs-12 j-total">
									快递单号: ${shoporders.logisticsNumber }<a href="#">&nbsp;查询物流</a>
								</div>
							</div>
						</c:if>
					</div>
				</div>
					
				<!--订单日志-->
				<!--可做操作-->
				<c:if test="${shoporders.orderStatus.id==2 }">
					<div class="col-xs-my-48 j-table-tit2">
						<div class="j-table-size">&nbsp;可做操作</div>
					</div>
					<div class="col-xs-my-48 j-table-body4 j-uppadd">
						<div class="col-xs-1">&nbsp;</div>
						<div class="col-xs-11">
							<button id="send" class="button button-action button-rounded">发货</button>
						</div>
					</div>
				</c:if>
				<!--可做操作-->
			</div>
			<!--/订单商品详情-->
		</div>
		
		<div class="col-xs-my-1">&nbsp;</div>
		<!--订单详情-->
	</div>
</div>
  
<!--content 部分-->
</div>
<div id="modalPage" style="position:fiexd; top:10px; left:40%; width:320px; height:480px; overflow:auto; overflow-x:hidden; display:none;"></div>
<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<!--dialog页面的弹出引用js文件-->
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<script src="<%=path%>/js/artDialog/jquery.qrcode.min.js"></script>
<!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
$(document).ready(function(){ 

	
	var cc=document.getElementsByName("url")[0].value;
	
	$('#code').qrcode(cc);
	
	}); 

		
		function toUtf8(str) {   
		    var out, i, len, c;   
		    out = "";   
		    len = str.length;   
		    for(i = 0; i < len; i++) {   
		    	c = str.charCodeAt(i);   
		    	if ((c >= 0x0001) && (c <= 0x007F)) {   
		        	out += str.charAt(i);   
		    	} else if (c > 0x07FF) {   
		        	out += String.fromCharCode(0xE0 | ((c >> 12) & 0x0F));   
		        	out += String.fromCharCode(0x80 | ((c >>  6) & 0x3F));   
		        	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
		    	} else {   
		        	out += String.fromCharCode(0xC0 | ((c >>  6) & 0x1F));   
		        	out += String.fromCharCode(0x80 | ((c >>  0) & 0x3F));   
		    	}   
		    }   
		    return out;   
		}
</script>