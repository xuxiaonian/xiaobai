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
			<c:if test="${shoporders.orderStatus.id != 5}">
			<div class="col-xs-my-48">
				<div class="col-xs-my-4">&nbsp;</div>
				<div class="col-xs-my-10">
					<c:if test="${shoporders.orderStatus.id==1 }">
						<div class="j-progress">
							<div class="j-Nav">1.买家提交订单</div>
						</div>
					</c:if>
					<c:if test="${shoporders.orderStatus.id!=1 }">
						<div class="j-progress2">
							<div class="j-Nav2">1.买家提交订单</div>
						</div>
					</c:if>
				</div>
				<div class="col-xs-my-10">
					<c:if test="${shoporders.orderStatus.id==2 }">
						<div class="j-progress">
							<div class="j-Nav">2.买家付款</div>
						</div>
					</c:if>
					<c:if test="${shoporders.orderStatus.id!=2 }">
						<div class="j-progress2">
							<div class="j-Nav2">2.买家付款</div>
						</div>
					</c:if>
				</div>
				<div class="col-xs-my-10">
					<c:if test="${shoporders.orderStatus.id==3 }">
						<div class="j-progress">
							<div class="j-Nav">3.商家发货</div>
						</div>
					</c:if>
					<c:if test="${shoporders.orderStatus.id!=3 }">
						<div class="j-progress2">
							<div class="j-Nav2">3.商家发货</div>
						</div>
					</c:if>

				</div>
				<div class="col-xs-my-10">
					<c:if test="${shoporders.orderStatus.id==4 }">
						<div class="j-progress">
							<div class="j-Nav">4.买家确认收货</div>
						</div>
					</c:if>
					<c:if test="${shoporders.orderStatus.id!=4 }">
						<div class="j-progress2">
							<div class="j-Nav2">4.买家确认收货</div>
						</div>
					</c:if>
				</div>
			</div>
			</c:if>
			<!--/买家进度导航-->
			<!--分割线-->
			<div class="col-xs-my-48">
				<hr />
			</div>
			<!--分割线-->
			<!--订单详情-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-46">
					<div class="col-xs-my-48 j-details">订单状态：<span class="j-odd3">${shoporders.orderStatus.name }(${sysLogs.get(sysLogs.size()-1).content })</span></div>
					<div class="col-xs-my-48">
						<hr />
					</div>
					<div class="col-xs-my-48 j-odd2 j-font14">
						订单编号：<span class="j-odd1">${shoporders.orderNumber } </span>
					</div>
					<!-- 订单及支付信息-->
					<div class="col-xs-my-48 j-table-tit">
						<div class="j-table-size">&nbsp;订单及支付信息</div>
					</div>
					<div class="col-xs-my-48 j-table-body">
						<div class="col-xs-my-48">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">下单时间：</div>
							<div class="col-xs-my-42 j-odd2 j-font14"><fmt:formatDate value="${shoporders.orderTime}" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						</div>
						<div class="col-xs-my-48">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">支付时间：</div>
							<div class="col-xs-my-42 j-odd2 j-font14"><fmt:formatDate value="${shoporders.payedAt }" pattern="yyyy-MM-dd HH:mm:ss"/></div>
						</div>
<!-- 						<div class="col-xs-my-48"> -->
<!-- 							<div class="col-xs-my-1">&nbsp;</div> -->
<!-- 							<div class="col-xs-my-5 j-odd2 j-font14">支付方式：</div> -->
<%-- 							<div class="col-xs-my-42 j-odd2 j-font14"><c:if test="${shoporders.att4 eq '1'}">支付宝</c:if><c:if test="${shoporders.att4 eq '2'}">微信</c:if></div> --%>
<!-- 						</div> -->
<!-- 						<div class="col-xs-my-48"> -->
<!-- 							<div class="col-xs-my-1">&nbsp;</div> -->
<!-- 							<div class="col-xs-my-5 j-odd2 j-font14">交易流水号：</div> -->
<%-- 							<div class="col-xs-my-42 j-odd2 j-font14">${shoporders.tripleOrderNumber }</div> --%>
<!-- 						</div> -->
					</div>
					<!-- 订单及支付信息-->
					<!-- 收获信息-->
					<div class="col-xs-my-48 j-table-tit2">
						<div class="j-table-size">&nbsp;收货信息</div>
					</div>
					<div class="col-xs-my-48 j-table-body2">
						<div class="col-xs-my-48">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">收货人：</div>
							<div class="col-xs-my-42 j-odd2 j-font14">${shoporders.att1 }</div>
						</div>
						<div class="col-xs-my-48">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">手机号：</div>
							<div class="col-xs-my-42 j-odd2 j-font14">${shoporders.att2 }</div>
						</div>
						<div class="col-xs-my-48">
							<div class="col-xs-my-1">&nbsp;</div>
							<div class="col-xs-my-5 j-odd2 j-font14">收货地址：</div>
							<div class="col-xs-my-42 j-odd2 j-font14">${shoporders.address }</div>
						</div>
					</div>
					<!-- 收获信息-->
					<!--订单商品详情-->
					<div class="col-xs-my-48">
						<div class="col-xs-my-48 j-table-tit3">
							<div class="col-xs-my-24 j-table-size">&nbsp;订单商品详情</div>
							<div class="col-xs-my-6 j-table-size">数量</div>
							<div class="col-xs-my-6 j-table-size">规格</div>
							<div class="col-xs-my-6 j-table-size">单价</div>
							<div class="col-xs-my-6 j-table-size">小计</div>
						</div>
						<c:forEach items="${shoporders.shopOrderList }" var="shopOrderList">
							<div class="col-xs-my-48 j-table-body3">
								<div class="col-xs-my-24 j-pohto3">
									<div class="col-xs-5">
										<img src="${shopOrderList.productId.headImage }">
									</div>
									<div class="col-xs-7">
										<div class="col-xs-12 j-table-size">${shopOrderList.productId.name }</div>
										<div class="col-xs-12 j-odd2 j-margin50">商家货号：${shopOrderList.productId.productNumber }</div>
									</div>
								</div>
								<div class="col-xs-my-6 j-table-size">×${shopOrderList.buyCouts }</div>
								<div class="col-xs-my-6 j-table-size">${shopOrderList.productProperty }</div>
								<div class="col-xs-my-6 j-table-size">￥${shopOrderList.price }</div>
								<div class="col-xs-my-6 j-table-size">￥${shopOrderList.price *shopOrderList.buyCouts }</div>
							</div>
						</c:forEach>
						<!--订单商品-->
						<div class="col-xs-my-48 j-table-body3">
						<div class="col-xs-12 j-total">
								<span class="j-odd3"></span>
							</div>
							<div class="col-xs-12 j-total">
								订单商品总价:<span class="j-odd3">${shoporders.collect-shoporders.mailCost }元</span>
							</div>
							<div class="col-xs-12 j-total">
								运费:<span class="j-odd3">${shoporders.mailCost }元</span>
							</div>
							<div class="col-xs-12 j-total">
								合计（实付）金额:<span class="j-odd3">${shoporders.collect }元</span>
							</div>
						</div>
						<!--订单商品-->
						<!--买家留言-->
						<div class="col-xs-my-48 j-table-body3">
							<div class="col-xs-12 j-total j-top">
								<i class="fa fa-comments-o j-odd6">买家留言:</i>${shoporders.remarks }
							</div>
						</div>
						<!--买家留言-->
						<!-- 退货信息 -->
						<c:if test="${!empty shopOrderRetrun.returnNumber }">
						<div class="col-xs-my-48 j-details j-uppadd">退款信息</div>
							<div class="col-xs-my-48">
								<hr />
							</div>
						<div class="col-xs-my-48 j-odd2 j-font14">退款编号：<span class="j-odd2">${shopOrderRetrun.returnNumber } </span>	</div>
						<div class="col-xs-my-48 j-odd2 j-font14">申请时间：<span class="j-odd2"><fmt:formatDate value="${shopOrderRetrun.returnTime }" pattern="yyyy-MM-dd HH:mm:ss"/> </span>	</div>
						<div class="col-xs-my-48 j-odd2 j-font14">退款原因：<span class="j-odd2">
							<c:forEach items="${shopOrderRetrun.shopOrderReturnConsults}" var="shopOrderReturnConsult">
								${shopOrderReturnConsult.content }
							</c:forEach>
						</span>	</div>
						</c:if>
						<div class="col-xs-my-48 j-uppadd">
							<div class="table-scrollable">
								<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" style="margin-bottom: -1px;">
									<thead>
										<tr role="row">
											<th class="">商家货号</th>
											<th class="">商品名称</th>
											<th class="">单价(元)</th>
											<th class="">数量</th>
											<th class="">小计(元)</th>
											<th class="">退款金额(元)</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${shoporders.shopOrderList }" var="shopOrderList">
											<tr class="odd">
												<td class="j-odd1">${shopOrderList.productId.productNumber }</td>
												<td class="j-odd2">${shopOrderList.productId.name }</td>
												<td class="j-odd2">￥${shopOrderList.price }</td>
												
												<td class="j-odd2">×${shopOrderList.buyCouts }</td>
												<td class="j-odd2">￥${shopOrderList.price *shopOrderList.buyCouts }</td>
												<td class="j-odd2">￥${shopOrderList.price *shopOrderList.buyCouts }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
						</div>
						
						
						
						<!-- 退货信息 -->
						<!--订单日志-->
						<div class="col-xs-my-48 j-details j-uppadd">订单日志</div>
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
												<td class="j-odd1"><fmt:formatDate value="${sysLog.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												<td class="j-odd2">${sysLog.operator }</td>
												<td class="j-odd2">${sysLog.content }</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
								<c:if test="${shoporders.orderStatus.id >2 && shoporders.orderStatus.id !=5 && shoporders.orderStatus.id !=7 }">
								<div class="col-xs-my-48 j-table-body3">
									<div class="col-xs-12 j-total j-uppadd">快递公司:${shoporders.logisticsCompany.logisticsName }</div>
									<div class="col-xs-12 j-total">
										快递单号:${shoporders.logisticsNumber }<a class="j-odd6" style="float: right;" onclick="showLogistics()">查询物流</a>
									<button id="update" class="button button-action button-rounded">修改物流</button>
									</div>
								</div>
								</c:if>
							</div>
						</div>
						<!--订单日志-->
						<!--可做操作-->
						<c:if test="${shoporders.orderStatus.id==1 && shoporders.deleteStatus==0}">
						<div class="col-xs-my-48 j-table-tit2">
							<div class="j-table-size">&nbsp;可做操作</div>
						</div>
						<div class="col-xs-my-48 j-table-body4 j-uppadd">
							<div class="col-xs-1">&nbsp;</div>
							<div class="col-xs-11">
								<button id="cancel" class="button button-action button-rounded">取消订单</button>
							</div>
						</div>
						</c:if>
						
						<c:if test="${shoporders.orderStatus.id==2}">
						<div class="col-xs-my-48 j-table-tit2">
							<div class="j-table-size">&nbsp;可做操作</div>
						</div>
						<div class="col-xs-my-48 j-table-body4 j-uppadd">
							<div class="col-xs-1">&nbsp;</div>
							<c:if test="${!shoporders.isReturn }">
							<div class="col-xs-11">
								<button id="send" class="button button-action button-rounded">发货</button>
							</div>
							</c:if>
							<c:if test="${shoporders.isReturn }">
							<div class="col-xs-11">
								<button id="" disabled="disabled" class="button button-action button-rounded">发货</button>
							</div>
							</c:if>
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
	<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
	<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
	<script type="text/javascript">
		function showLogistics(){
			art.dialog.open('<%=path %>/shoporderses?method=showLogistics&logisticsCompanyId=${shoporders.logisticsCompany.id}&logisticsNumber=${shoporders.logisticsNumber }',{id:'send',title:'物流信息',width:650,height:350,lock:true, 
				close: function() {  
	            }	
			});
		}
		
	  $(document).ready(function() {
	 	//发货信息
			$('#send').click(function(){
				art.dialog.open('<%=path %>/shoporderses/${shoporders.id}?send',{id:'send',title:'发货信息',width:650,height:350,lock:true, background:'#000000',
					close: function() {  
						location.reload();
		            }	
				});
			});
			//修改物流
			$('#update').click(function(){
				art.dialog.open('<%=path %>/shoporderses/${shoporders.id}?update',{id:'update',title:'修改信息',width:650,height:350,lock:true, background:'#000000',
					close: function() {  
						location.reload();
		            }	
				});
			});
			//取消订单
			$('#cancel').click(function(){
				art.dialog.open('<%=path %>/shoporderses/${shoporders.id}cancel',{id:'send',title:'取消订单',width:650,height:150,lock:true, background:'#000000',
					close: function() {  
						location.reload();
		            }	
				});
			});
	  });
</script>