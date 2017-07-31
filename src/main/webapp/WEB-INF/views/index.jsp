<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-31">
		<div class="j-body-up">
			<div class="col-xs-my-48">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-6 j-line"></div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-40 j-size">待办事项</div>
			</div>
			<!--图标和待办事项-->
			<div class="col-xs-my-48">
				<hr />
			</div>
			<!--横线-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2 j-title">
					<div class="j-Order">订单提醒</div>
				</div>
			</div>
			<!--订单标题-->
			<div class="col-xs-my-48 j-remind">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-10 j-delivery">
					待发货：<span> <c:if test="${index.staySend ==0}">0</c:if> <c:if test="${index.staySend >0}">
							<a href="<%=path%>/shoporderses?page=1&orderStatus=2">${index.staySend }</a>
						</c:if>
					</span>
				</div>
				<div class="col-xs-my-1 j-delivery">|</div>
				<!--待发货-->
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-10 j-delivery">
					待付款：<span> <c:if test="${index.stayPay ==0}">0</c:if> <c:if test="${index.stayPay >0}">
							<a href="<%=path%>/shoporderses?page=1&orderStatus=1">${index.stayPay }</a>
						</c:if>
					</span>
				</div>
				<div class="col-xs-my-1 j-delivery">|</div>
				<!--待发货-->
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-10 j-delivery">
					待处理退款申请：<span> <c:if test="${index.stayReturnPay ==0}">0</c:if> <c:if test="${index.stayReturnPay >0}">
					<a href="<%=path%>/shoporderretruns?page=1&shopOrderRetrunType=1">${index.stayReturnPay }</a></c:if></span>
				</div>
			</div>
			<!--订单提醒内容-->
			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-2 j-title">
					<div class="j-Order">商品管理</div>
				</div>
			</div>
			<!--商家管理-->
			<div class="col-xs-my-48 j-remind">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-10 j-delivery">
					销售中的商品：<span> <c:if test="${index.onSale ==0}">0</c:if> <c:if test="${index.onSale >0}">
					<a href="<%=path%>/shoppingproductses?page=1&size=10">${index.onSale }</a></c:if></span>
				</div>
				<div class="col-xs-my-1 j-delivery">|</div>
				<!--待发货-->
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-10 j-delivery">
					仓库中的商品：<span> <c:if test="${index.noSale ==0}">0</c:if> <c:if test="${index.noSale >0}">
					<a href="<%=path%>/shoppingproductses?method=noSalelist&store=true&page=1&size=10">${index.noSale }</a></c:if></span>
				</div>
				<div class="col-xs-my-1 j-delivery">|</div>
				<!--待发货-->
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-10 j-delivery">
					等待审核的商品：<span><c:if test="${index.stayStatus ==0}">0</c:if> <c:if test="${index.stayStatus >0}">
					<a href="<%=path%>/shoppingproductses?method=noSalelist&store=false&review=0&page=1&size=10">${index.stayStatus }</a></c:if></span>
				</div>
			</div>
			<!--商家管理内容-->

			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-2 j-title">
					<div class="j-Order">账单管理</div>
				</div>
			</div>
			<!--商家管理-->
			<div class="col-xs-my-48 j-remind">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-47 j-delivery">
					待确认账单：<span><c:if test="${index.generateBill ==0}">0</c:if> <c:if test="${index.generateBill >0}">
					<a href="<%=path%>/shopbills?page=1&billEnum=1">${index.generateBill }</a></c:if></span>
				</div>
			</div>
		</div>
		<!--待办事项-->
		<div class="j-body-up">
			<div class="col-xs-my-48">
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-6 j-line"></div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-40 j-size">销售情况统计</div>
			</div>
			<!--图标和待办事项-->
			<div class="col-xs-my-48">
				<hr />
			</div>
			<!--横线-->
			<div class="col-xs-my-2">&nbsp;</div>
			<div class="col-xs-my-44">
				<table class="table">
					<thead>
						<tr>
							<th class="j-table-th">项目</th>
							<th class="j-table-th">订单量</th>
							<th class="j-table-th">订单金额</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<td class="j-delivery">昨日销量</td>
							<td class="j-odd3"><c:if test="${index.yesterDay ==0}">0</c:if> <c:if test="${index.yesterDay >0}">
							<a href="<%=path %>/shoporderses?listIndex&orderTimeStart=${index.yesterDateStart}&orderTimeEnd=${index.yesterDateEnd}">${index.yesterDay }</a></c:if></td>
							<td class="j-delivery">￥：<span>
								<c:if test="${empty index.yesterDayCost }">0</c:if>
								<c:if test="${not empty index.yesterDayCost }">${index.yesterDayCost }</c:if>
							</span></td>
						</tr>
						<tr>
							<td class="j-delivery">上周销量</td>
							<td class="j-odd3"><c:if test="${index.lastWeek ==0}">0</c:if> <c:if test="${index.lastWeek >0}">
							<a href="<%=path %>/shoporderses?listIndex&orderTimeStart=${index.lastWeekDateStart}&orderTimeEnd=${index.lastWeekDateEnd}">${index.lastWeek }</a></c:if></td>
							<td class="j-delivery">￥：<span>
							<c:if test="${empty index.lastWeekCost }">0</c:if>
								<c:if test="${not empty index.lastWeekCost }">${index.lastWeekCost }</c:if>
							</span></td>
						</tr>
						<tr>
							<td class="j-delivery">上月销量</td>
							<td class="j-odd3"><c:if test="${index.lastMonth ==0}">0</c:if> <c:if test="${index.lastMonth >0}">
							<a href="<%=path %>/shoporderses?listIndex&orderTimeStart=${index.lastMonthDateStart}&orderTimeEnd=${index.lastMonthDateEnd}">${index.lastMonth }</a></c:if></td>
							<td class="j-delivery">￥：<span>
							<c:if test="${empty index.lastMonthCost }">0</c:if>
								<c:if test="${not empty index.lastMonthCost }">${index.lastMonthCost }</c:if>
							</span></td>
						</tr>
					</tbody>
				</table>
			</div>
		</div>
		<div class="col-xs-my-2">&nbsp;</div>
		<!--销售情况统计-->
	</div>

	<!--content  中间上部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-8">
		<div class="col-xs-my-48 j-bgup">
			<div class="col-xs-my-48 j-ash">
				<div class="j-font">&nbsp;商家帮助</div>
			</div>
			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-3 j-odd8">
					<i class="fa fa-circle"></i>
				</div>
				<div class="col-xs-my-2">&nbsp;</div>
				<div class="col-xs-my-40 j-uppeg">
				<a href="<%=path%>/shopHellp">规则体系</a></div>
			</div>
			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-3 j-odd8">
					<i class="fa fa-circle"></i>
				</div>
				<div class="col-xs-my-2">&nbsp;</div>
				<div class="col-xs-my-40 j-uppeg">
				<a href="<%=path%>/indexHellp">入驻流程</a></div>
			</div>
		</div>
		<div class="col-xs-my-48 j-bgdow">
			<div class="col-xs-my-48 j-ash">
				<div class="j-font">&nbsp;平台联系方式</div>
			</div>
			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-12 j-odd2">电话：</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-32 j-uppeg">18911002686</div>
			</div>
			<div class="col-xs-my-48 j-uppadd">
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-12 j-odd2">邮箱：</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-32 j-uppeg">smy@bjhuazhuo.com</div>
			</div>
		</div>
	</div>
	<!--content  中右边上部部分-->
</div>