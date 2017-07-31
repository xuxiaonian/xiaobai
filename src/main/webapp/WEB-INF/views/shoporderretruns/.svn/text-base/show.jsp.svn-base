<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/tuihuo.css" />

<!--content部分-->
<div class="j-content">
	<div class="col-xs-my-1">&nbsp;</div>
	<!--左侧个人信息与导航部分-->
	<div class="col-xs-my-40 j-bodyOR">
		<!--content部分-->
		<div class="col-xs-my-48">
			<!--买家进度导航-->
			<c:if test="${shoporderretrun.shopOrderId.orderStatus.id==2 }">
			<div class="col-xs-my-12">
				<div class="j-progressOrderfirst col-xs-my-43">
					<div class="j-Nav2Order">1.买家申请退款</div>
				</div>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
					<div class="j-progressOrder2 col-xs-my-5">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=1 }">
					<div class="j-progressOrder col-xs-my-5">&nbsp;</div>
				</c:if>
			</div>
			
			<div class="col-xs-my-12">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
					<div class="j-progressOrderfirst2 col-xs-my-43">
						<div class="j-Nav2Order2">2.商家处理退款申请</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=1 }">
					<div class="j-progressOrderfirst col-xs-my-43">
						<div class="j-Nav2Order">2.商家处理退款申请</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
					<div class="j-progressOrder1 col-xs-my-5">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==4 }">
					<div class="j-progressOrder2 col-xs-my-5">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=4 && shoporderretrun.shopOrderRetrunType.id!=1}">
					<div class="j-progressOrder col-xs-my-5">&nbsp;</div>
				</c:if>
			</div>
			
			<div class="col-xs-my-12">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==4 }">
					<div class="j-progressOrderfirst2 col-xs-my-43">
						<div class="j-Nav2Order2">3.等待平台退款给买家</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=4 }">
					<div class="j-progressOrderfirst col-xs-my-43">
						<div class="j-Nav2Order">3.等待平台退款给买家</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==4 }">
					<div class="j-progressOrder1 col-xs-my-5">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==5 }">
					<div class="j-progressOrder2 col-xs-my-5">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==6 }">
					<div class="j-progressOrder2 col-xs-my-5">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=5 && shoporderretrun.shopOrderRetrunType.id!=4 && shoporderretrun.shopOrderRetrunType.id!=6}">
					<div class="j-progressOrder col-xs-my-5">&nbsp;</div>
				</c:if>
			</div>
			
			<div class="col-xs-my-12">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==5 }">
					<div class="j-progressOrderfirst2 col-xs-my-43">
						<div class="j-Nav2Order2">4.退款完成</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==6 }">
					<div class="j-progressOrderfirst2 col-xs-my-43">
						<div class="j-Nav2Order2">4.退款关闭</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=5 && shoporderretrun.shopOrderRetrunType.id!=6}">
					<div class="j-progressOrderfirst col-xs-my-43">
						<div class="j-Nav2Order">4.退款完成</div>
					</div>
				</c:if>
					<c:if test="${shoporderretrun.shopOrderRetrunType.id==5 }">
						<div class="j-progressOrder1 col-xs-my-5">&nbsp;</div>
					</c:if>
					<c:if test="${shoporderretrun.shopOrderRetrunType.id==6 }">
						<div class="j-progressOrder1 col-xs-my-5">&nbsp;</div>
					</c:if>
					
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=5 && shoporderretrun.shopOrderRetrunType.id!=6}">
					<div class="j-progressOrder col-xs-my-5">&nbsp;</div>
				</c:if>
			</div>
			
			</c:if>
			<c:if test="${shoporderretrun.shopOrderId.orderStatus.id>=3 }">
			<div class="col-xs-my-7">
				<div class="j-progressOrderfirst col-xs-my-40">
					<div class="j-Nav2Order">1.买家申请退款</div>
				</div>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
					<div class="j-progressOrder2 col-xs-my-8">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=1 }">
					<div class="j-progressOrder col-xs-my-8">&nbsp;</div>
				</c:if>
			</div>
				<div class="col-xs-my-8">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
					<div class="j-progressOrderfirst2 col-xs-my-41">
						<div class="j-Nav2Order2">2.商家处理退款申请</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=1 }">
					<div class="j-progressOrderfirst col-xs-my-41">
						<div class="j-Nav2Order">2.商家处理退款申请</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
					<div class="j-progressOrder1 col-xs-my-7">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==2 }">
					<div class="j-progressOrder2 col-xs-my-7">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=2 && shoporderretrun.shopOrderRetrunType.id!=1}">
					<div class="j-progressOrder col-xs-my-7">&nbsp;</div>
				</c:if>
				
				</div>
				<div class="col-xs-my-8">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==2 }">
					<div class="j-progressOrderfirst2 col-xs-my-41">
						<div class="j-Nav2Order2">3.买家退货给卖家</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=2 }">
					<div class="j-progressOrderfirst col-xs-my-41">
						<div class="j-Nav2Order">3.买家退货给卖家</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==2 }">
					<div class="j-progressOrder1 col-xs-my-7">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==3 }">
					<div class="j-progressOrder2 col-xs-my-7">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=3 && shoporderretrun.shopOrderRetrunType.id!=2}">
					<div class="j-progressOrder col-xs-my-7">&nbsp;</div>
				</c:if>
				
				</div>
			
			
				<div class="col-xs-my-10">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==3 }">
					<div class="j-progressOrderfirst2 col-xs-my-42">
						<div class="j-Nav2Order2">4.商家确认收货,同意退款</div>
					</div>
				</c:if>
				
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=3 }">
					<div class="j-progressOrderfirst col-xs-my-42">
						<div class="j-Nav2Order">4.商家确认收货,同意退款</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==3 }">
					<div class="j-progressOrder1 col-xs-my-6">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==4 }">
					<div class="j-progressOrder2 col-xs-my-6">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=4 && shoporderretrun.shopOrderRetrunType.id!=3}">
					<div class="j-progressOrder col-xs-my-6">&nbsp;</div>
				</c:if>
				</div>
			
				<div class="col-xs-my-9">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==4 }">
					<div class="j-progressOrderfirst2 col-xs-my-42">
						<div class="j-Nav2Order2">5.等待平台退款给买家</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=4 }">
					<div class="j-progressOrderfirst col-xs-my-42">
						<div class="j-Nav2Order">5.等待平台退款给买家</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==4 }">
					<div class="j-progressOrder1 col-xs-my-6">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==5 }">
					<div class="j-progressOrder2 col-xs-my-6">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==6 }">
					<div class="j-progressOrder2 col-xs-my-6">&nbsp;</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=5 && shoporderretrun.shopOrderRetrunType.id!=4 && shoporderretrun.shopOrderRetrunType.id!=6}">
					<div class="j-progressOrder col-xs-my-6">&nbsp;</div>
				</c:if>
				</div>
				
				
				<div class="col-xs-my-6">
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==5 }">
					<div class="j-progressOrderfirst2 col-xs-my-40">
						<div class="j-Nav2Order2">6.退款完成</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==6 }">
					<div class="j-progressOrderfirst2 col-xs-my-40">
						<div class="j-Nav2Order2">6.退款关闭</div>
					</div>
				</c:if>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=5 && shoporderretrun.shopOrderRetrunType.id!=6}">
					<div class="j-progressOrderfirst col-xs-my-40">
						<div class="j-Nav2Order">6.退款完成</div>
					</div>
				</c:if>
					<c:if test="${shoporderretrun.shopOrderRetrunType.id==5 }">
						<div class="j-progressOrder1 col-xs-my-8">&nbsp;</div>
					</c:if>
					<c:if test="${shoporderretrun.shopOrderRetrunType.id==6 }">
						<div class="j-progressOrder1 col-xs-my-8">&nbsp;</div>
					</c:if>
					
				<c:if test="${shoporderretrun.shopOrderRetrunType.id!=5 && shoporderretrun.shopOrderRetrunType.id!=6}">
					<div class="j-progressOrder col-xs-my-8">&nbsp;</div>
				</c:if>
				</div>
			</c:if>
			<div class="col-xs-my-1">&nbsp;</div>
		</div>
		<!--/买家进度导航-->
		<!--分割线-->
		<div class="col-xs-my-48">
			<hr class="j-hr" />
		</div>
		<!--分割线-->
		<!--订单详情-->
		<div class="col-xs-my-48">
			<div class="col-xs-my-1">&nbsp;</div>
			<div class="col-xs-my-46">
				<div class="col-xs-my-48">
					<div class="col-xs-my-6  j-details">订单状态：</div>
					<div class="col-xs-my-11 j-Return">
						<span class="j-odd3">${shoporderretrun.shopOrderRetrunType.name }</span>
					</div>
					<c:if test="${shoporderretrun.shopOrderRetrunType.id==1}">
						<div class="col-xs-my-31 j-odd2 ">（自买家提出申请后，如商家不做任何操作，5天后系统将默认商家同意退款）</div>
					</c:if>
				</div>
				<c:if test="${shoporderretrun.shopOrderRetrunType.id>=3 }">
					<div class="col-xs-my-48 j-details" style="padding-top: 30px;">退货物流</div>
					<!--退货物流-->
					<ul class="col-xs-my-48 maiJ mai">
						<li class="col-xs-my-7 nameIP">买家用户名:</li>
						<li class="col-xs-my-41 nIP">${shoporderretrun.shopOrderId.mobileUserId.userName }</li>
					</ul>
					<ul class="col-xs-my-48 maiJ">
						<li class="col-xs-my-7 nameIP">物流公司:</li>
						<li class="col-xs-my-41 nIP">${logisticsCompany.logisticsName }</li>
					</ul>
					<ul class="col-xs-my-48 maiJ">
						<li class="col-xs-my-7 nameIP">快递单号:</li>
						<li class="col-xs-my-12 nIP">${shoporderretrun.logisticsNumber}</li>
						<c:if test="${!(empty logisticsCompany.logisticsName) && !(empty shoporderretrun.logisticsNumber)}">
							<li class="cha"><a onclick="showLogistics()">查看物流</a></li>
						</c:if>
					</ul>
					<c:if test="${shoporderretrun.shopOrderRetrunType.id==3 }">
					<div class="col-xs-my-48 j-table-body4 j-uppadd">
							<div class="col-xs-3">&nbsp;</div>
							<div class="col-xs-4">
								<button onclick="goodsReturnOrder()" class="button button-action button-rounded">确定收货并同意退款</button>
							</div>
							<div class="col-xs-3">
								<button onclick="goodsDisagreeReturnOrder()" class="button button-action button-rounded">拒接退款</button>
							</div>
							<div class="col-xs-2">&nbsp;</div>
						</div>
					</c:if>
				 </c:if>
				<!--/退货物流-->
				<div class="col-xs-my-48" style="padding-top: 40px;">
					<div class="col-xs-my-48  j-details">订单详情：</div>
				</div>
			</div>
			<!--退款协商-->
			<div class="col-xs-my-48 tui">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-46">
					<div class="col-xs-my-48 xieS">退款协商</div>
					<div class="col-xs-my-48 Txiang">
						<c:forEach items="${shoporderretrun.shopOrderReturnConsults }" var="shopOrderReturnConsult">
							<dl class="col-xs-my-48 tuiN">
								<dt class="col-xs-my-12 weiL">
									<div class="col-xs-my-48 Tname">
										<span class="ballN"></span> <span class="col-xs-my-40 Tn"> <c:if test="${shopOrderReturnConsult.isShop }">
										${sessionScope.shop.name}
									</c:if> <c:if test="${!shopOrderReturnConsult.isShop }">
										${shoporderretrun.shopOrderId.mobileUserId.userName }
									</c:if>
										</span>
									</div>
									<div class="col-xs-my-48 Ntime">
										<span class="nianN"><fmt:formatDate value="${shopOrderReturnConsult.createdAt }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
									</div>
								</dt>

								<dd class="col-xs-my-34 Nxin">
									<div class="col-xs-my-48 Nend">
										<span class="col-xs-my-48 Njie">${shopOrderReturnConsult.content }</span>
									</div>
									<div class="col-xs-my-48 Nadd">
										<c:forEach items="${shopOrderReturnConsult.shopOrderReturnImgs }" var="shopOrderReturnImg">
											<img style="width: 140px; height: 88px" src="${shopOrderReturnImg.imgUrl }"></img>
										</c:forEach>
									</div>
								</dd>
							</dl>
						</c:forEach>

						<dl class="col-xs-my-48 tuiJ">
							<dt class="col-xs-my-12 weiL">
								<div class="col-xs-my-48 Jname">
									<span class="ballJ"></span> <span class="col-xs-my-40 Jn"></span>
								</div>
								<div class="col-xs-my-48 Jtime"></div>
							</dt>
						</dl>

					</div>
					<div class="col-xs-my-48 xieS">退款信息</div>
					<div class="col-xs-my-48 Txiang">
						<div class="col-xs-my-48 dHao">
							<span class="col-xs-my-7 bHao">退款单编号:</span><span class="col-xs-my-40 bH">${shoporderretrun.returnNumber }</span>
						</div>
						<div class="col-xs-my-48 dTime">
							<span class="col-xs-my-7 dShen">申请时间:</span> <span class="col-xs-my-41 dS"><fmt:formatDate value="${shoporderretrun.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</div>
						<div class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44 sPin">
								<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
									<thead>
										<tr role="row">
											<th class="">商家货号</th>
											<th class="">商品名称</th>
											<th class="">单价</th>
											<th class="">数量</th>
											<th class="">小计</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${shoporderretrun.shopOrderId.shopOrderList }" var="shopOrderList" varStatus="status">
											<tr>
												<td>${shopOrderList.productId.productNumber }</td>
												<td>${shopOrderList.productId.name }</td>
												<td class="j-odd3">${shopOrderList.price }</td>
												<td>${shopOrderList.buyCouts }</td>
												<td class="j-odd3">${shopOrderList.price * shopOrderList.buyCouts}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">商品总价：￥${shoporderretrun.shopOrderId.collect-shoporderretrun.shopOrderId.mailCost}；快递运费：￥${shoporderretrun.shopOrderId.mailCost }</td>
											<td colspan="2" class="j-odd3">订单金额：￥${shoporderretrun.shopOrderId.collect}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<div class="col-xs-my-48 yuanX">原订单信息</div>
					<div class="col-xs-my-48 y-ding">
						<div class="col-xs-my-48 y-Hao">
							<span class="col-xs-my-7 yHao">订单编号:</span><span class="col-xs-my-40 bH">${shoporderretrun.shopOrderId.orderNumber }</span>
						</div>
						<div class="col-xs-my-48 yTime">
							<span class="col-xs-my-7 yShen">下单时间:</span> <span class="col-xs-my-40 yS"><fmt:formatDate value="${shoporderretrun.shopOrderId.orderTime }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</div>
						<div class="col-xs-my-48 yzTime">
							<span class="col-xs-my-7 yzShen">支付时间:</span> <span class="col-xs-my-40 yS"><fmt:formatDate value="${shoporderretrun.shopOrderId.payedAt }" pattern="yyyy-MM-dd HH:mm:ss"/></span>
						</div>
<!-- 						<div class="col-xs-my-48 yzhi"> -->
<!-- 							<span class="col-xs-my-7 ymethod">支付方式:</span><span class="col-xs-my-40 yM">支付宝</span> -->
<!-- 						</div> -->
<!-- 						<div class="col-xs-my-48 yliu"> -->
<%-- 							<span class="col-xs-my-7 yLiu">交易流水号:</span><span class="col-xs-my-40 yL">${shoporderretrun.shopOrderId.tripleOrderNumber }</span> --%>
<!-- 						</div> -->
						<div class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44 sPin">
								<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
									<thead>
										<tr role="row">
											<th class="">商家货号</th>
											<th class="">商品名称</th>
											<th class="">单价</th>
											<th class="">数量</th>
											<th class="">小计</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach items="${shoporderretrun.shopOrderId.shopOrderList }" var="shopOrderList" varStatus="status">
											<tr>
												<td>${shopOrderList.productId.productNumber }</td>
												<td>${shopOrderList.productId.name }</td>
												<td class="j-odd3">${shopOrderList.productId.price }</td>
												<td>${shopOrderList.buyCouts }</td>
												<td class="j-odd3">${shopOrderList.productId.price * shopOrderList.buyCouts}</td>
											</tr>
										</c:forEach>
										<tr>
											<td colspan="3">商品总价：￥${shoporderretrun.shopOrderId.collect-shoporderretrun.shopOrderId.mailCost}；快递运费：￥${shoporderretrun.shopOrderId.mailCost }</td>
											<td colspan="2" class="j-odd3">订单金额：￥${shoporderretrun.shopOrderId.collect}</td>
										</tr>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<!--订单日志-->
					<div class="col-xs-my-48 rizhi">订单日志</div>
					<div class="col-xs-my-48 liuC">
						<div class="col-xs-my-48 zhi">
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
						</div>
					</div>
					<!--/订单日志-->
				<c:if test="${shoporderretrun.shopOrderRetrunType.id==1 }">
				<div class="col-xs-my-48 rizhi">
							<div class="j-table-size">&nbsp;可做操作</div>
						</div>
						<div class="col-xs-my-48 j-table-body4 j-uppadd">
							<div class="col-xs-3">&nbsp;</div>
							<div class="col-xs-3">
								<button onclick="returnOrder()" class="button button-action button-rounded">同意退款</button>
							</div>
							<c:if test="${shoporderretrun.shopOrderId.orderStatus.id>2 }">
								<div class="col-xs-3">
									<button onclick="disagreeReturnOrder()" class="button button-action button-rounded">拒绝退款</button>
								</div>
							</c:if>
							<c:if test="${shoporderretrun.shopOrderId.orderStatus.id<=2 }">
								<div class="col-xs-3">
								<button onclick="send()" class="button button-action button-rounded">继续发货</button>
							</div>
							</c:if>
							
							<div class="col-xs-3">&nbsp;</div>
						</div>
				</c:if>
				</div>
				<!--/退款协商-->
				<!--/订单详情-->
				<div class="col-xs-my-1">&nbsp;</div>
			</div>
			<!--订单详情-->
				
		</div>
	</div>
</div>
	<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
	<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
function showLogistics(){
	art.dialog.open('<%=path %>/shoporderses?method=showLogistics&logisticsCompanyId=${logisticsCompany.id}&logisticsNumber=${shoporderretrun.logisticsNumber }',{id:'send',title:'物流信息',width:650,height:350,lock:true, 
		close: function() {  
		}	
	});
}
function send(){
	art.dialog.open('<%=path %>/shoporderretruns/${shoporderretrun.id}?send',{id:'send',title:'发货信息',width:650,height:350,lock:true, background:'#000000',
		close: function() {  
			location.reload();
        }	
	});
}
function returnOrder(){
	var truthBeTold = window.confirm("您确定退款吗？");
	if (truthBeTold) {
	 $.ajax({
			url : '<%=path %>/shoporderretruns?method=returnOrder&id=${shoporderretrun.id}',
			type: 'POST',
			dataType : "html",//json--返回json数据类型；xml--返回xml
			success : function(data) {
				if(data=="true"){
					window.location.reload();//刷新当前页面.
				}else{
					alert("退款失败");
				}
			},
		});
	}
}

function disagreeReturnOrder(){
	 $.ajax({
			url : '<%=path %>/shoporderretruns?method=disagreeReturnOrder&id=${shoporderretrun.id}',
			type: 'POST',
			dataType : "html",//json--返回json数据类型；xml--返回xml
			success : function(data) {
				if(data=="true"){
					location.href = "<%=path %>/shoporderses/${shoporderretrun.shopOrderId.id}";
				}else{
					alert("继续发货失败");
				}
			},
		});
}

function goodsReturnOrder(){
	 $.ajax({
			url : '<%=path %>/shoporderretruns?method=goodsReturnOrder&id=${shoporderretrun.id}',
			type: 'POST',
			dataType : "html",//json--返回json数据类型；xml--返回xml
			success : function(data) {
				if(data=="true"){
					window.location.reload();//刷新当前页面.
				}else{
					
				}
			},
		});
}

function goodsDisagreeReturnOrder(){
	art.dialog.open('<%=path %>/shoporderreturnconsults?form&returnId=${shoporderretrun.id}',{id:'send',title:'拒接理由',width:650,height:250,lock:true, 
		close: function() {
			window.location.reload();//刷新当前页面.
		}	
	});
}
</script>