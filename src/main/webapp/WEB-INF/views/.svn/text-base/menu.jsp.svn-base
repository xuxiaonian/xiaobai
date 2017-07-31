<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<div class="j-Guidepage col-xs-my-48">
	<div class="col-xs-my-3">&nbsp;</div>
	<div class="col-xs-my-20">
		<c:if test="${sessionScope.subtree == 'index'}">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path%>/">首页</a></li>
			</ul>
		</c:if>
		<c:if test="${sessionScope.subtree == 'shoporder' || sessionScope.subtree == 'shoporderretrun'  || sessionScope.subtree == 'shoporderevaluates'}">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path%>/shoporderses?page=1&size=10">交易管理</a></li>
				<c:if test="${sessionScope.subtree == 'shoporder' }">
					<li><a href="<%=path%>/shoporderses?page=1&size=10">订单管理</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shoporderretrun' }">
					<li><a href="<%=path%>/shoporderretruns?page=1&size=10">退款</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shoporderevaluates'}">
					<li><a href="<%=path%>/shoporderevaluates?page=1&size=10">评价</a></li>
				</c:if>
			</ul>
		</c:if>
		<c:if
			test="${sessionScope.subtree == 'shoppingproduct' || sessionScope.subtree == 'shoppingproductNoSale' ||sessionScope.subtree == 'shoppingproductReview'}">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path%>/shoppingproductses?page=1&size=10">商品管理</a></li>
				<c:if test="${sessionScope.subtree == 'shoppingproduct' }">
					<li><a href="<%=path%>/shoppingproductses?page=1&size=10&onSale=1">上架中的商品</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shoppingproductNoSale' }">
					<li><a
						href="<%=path%>/shoppingproductses?method=noSalelist&store=true&page=1&size=10">未上架的商品</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shoppingproductReview' }">
					<li><a
						href="<%=path%>/shoppingproductses?method=reviewlist&page=1&size=10">审核未通过的商品</a></li>
				</c:if>
			</ul>
		</c:if>
		<c:if test="${sessionScope.subtree == 'syslog' || sessionScope.subtree == 'shoptree'}">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path %>/shopses">商家管理</a></li>
				<li><a href="">信息</a></li>
			</ul>
		</c:if>
		<c:if test="${sessionScope.subtree == 'shopAddress' || sessionScope.subtree == 'freightTemplate'}">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path %>/shopaddresses?form">物流管理</a></li>
				<c:if test="${sessionScope.subtree == 'shopAddress' }">
					<li><a href="">地址库</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'freightTemplate' }">
					<li><a href="">运费模板</a></li>
				</c:if>
			</ul>
		</c:if>
		<c:if test="${sessionScope.subtree == 'shopBillThis' || sessionScope.subtree == 'shopBill'}">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path %>/shopbills?method=thisList&page=1">账单管理</a></li>
				<c:if test="${sessionScope.subtree == 'shopBillThis' }">
					<li><a href="#">账单流水</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shopBill' }">
					<li><a href="#">往期账单管理</a></li>
				</c:if>
			</ul>
		</c:if>
		<c:if test="${sessionScope.subtree == 'promotionManagement'|| sessionScope.subtree == 'offerRewardManagement' }">
			<ul>
				<li>当前您的位置:</li>
				<li><a href="<%=path %>/promotion?list">促销管理</a></li>
				<c:if test="${sessionScope.subtree == 'promotionManagement' }">
						<li><a href="#">限时特惠</a></li>
				</c:if>
				
				<c:if test="${sessionScope.subtree == 'offerRewardManagement' }">
					<li><a href="#">商家悬赏</a></li>
				</c:if>
			
			</ul>
		</c:if>
	</div>
</div>
<div class="j-content">
	<div class="col-xs-my-7">
		<div class="j-left">
			<img src="${sessionScope.shop.url}" />
			<div class="j-font">
				${sessionScope.shop.name}<a href="<%=path%>/shopses"><i class="fa fa-pencil"></i></a>
			</div>
			<a class="button button-highlight button-pill button-small" style="cursor:default">企业会员</a>
			<span class="j-odd2">最近登录时间:<fmt:formatDate value="${sessionScope.CurrentUser.lastLoginTime }" pattern="yyyy-MM-dd"/></span><br>
			<span class="j-odd2"></span>
		</div>
		<!--content  左边上部部分-->
		<div class="j-left">
			<c:if test="${sessionScope.subtree == 'index'}">
				<ul class="j-ul">
					<li class="j-li"><a class="hover" href="<%=path %>/shoporderses?page=1&orderStatus=4">已卖出商品</a></li>
					<li class="j-li"><a href="<%=path %>/shoppingproductses?createCategoryFrom">发布商品</a></li>
					<li class="j-li"><a href="<%=path %>/shoppingproductses?page=1&size=10">销售中的商品</a></li>
				</ul>
			</c:if>
			<c:if test="${sessionScope.subtree == 'shoporder' || sessionScope.subtree == 'shoporderretrun' || sessionScope.subtree == 'shoporderevaluates'}">
				<ul class="j-ul">
				<c:if test="${sessionScope.subtree == 'shoporder' }">
					<li class="j-li lanPos"><a class="hover" href="<%=path%>/shoporderses?page=1&size=10">订单管理</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree != 'shoporder' }">
					<li class="j-li"><a class="hover" href="<%=path%>/shoporderses?page=1&size=10">订单管理</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shoporderretrun' }">
					<li class="j-li lanPos"><a href="<%=path%>/shoporderretruns?page=1&size=10">退款</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree != 'shoporderretrun' }">
					<li class="j-li"><a href="<%=path%>/shoporderretruns?page=1&size=10">退款</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree != 'shoporderevaluates' }">
					<li class="j-li"><a href="<%=path %>/shoporderevaluates?page=1">评价</a></li>
				</c:if>
				<c:if test="${sessionScope.subtree == 'shoporderevaluates' }">
					<li class="j-li lanPos"><a href="<%=path %>/shoporderevaluates?page=1">评价</a></li>
				</c:if>
				</ul>
			</c:if>
			<c:if
				test="${sessionScope.subtree == 'shoppingproduct' || sessionScope.subtree == 'shoppingproductNoSale' ||sessionScope.subtree == 'shoppingproductReview' || sessionScope.subtree == 'shoppingproductCreate'}">
				<ul class="j-ul">
					<c:if test="${sessionScope.subtree == 'shoppingproductCreate' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path%>/shoppingproductses?createCategoryFrom">发布商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shoppingproductCreate' }">
						<li class="j-li "><a class="hover" href="<%=path%>/shoppingproductses?createCategoryFrom">发布商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'shoppingproduct' }">
						<li class="j-li lanPos"><a class="hover"
							href="<%=path%>/shoppingproductses?page=1&size=10&onSale=1">上架中的商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shoppingproduct' }">
						<li class="j-li"><a class="hover"
							href="<%=path%>/shoppingproductses?page=1&size=10&onSale=1">上架中的商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'shoppingproductNoSale' }">
						<li class="j-li lanPos"><a class="hover"
							href="<%=path%>/shoppingproductses?method=noSalelist&store=true&page=1&size=10">未上架的商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shoppingproductNoSale' }">
						<li class="j-li"><a class="hover"
							href="<%=path%>/shoppingproductses?method=noSalelist&store=true&page=1&size=10">未上架的商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'shoppingproductReview' }">
						<li class="j-li lanPos"><a class="hover"
							href="<%=path%>/shoppingproductses?method=reviewlist&page=1&size=10">审核未通过的商品</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shoppingproductReview' }">
						<li class="j-li"><a class="hover"
							href="<%=path%>/shoppingproductses?method=reviewlist&page=1&size=10">审核未通过的商品</a></li>
					</c:if>
				</ul>
			</c:if>
			<c:if test="${sessionScope.subtree == 'syslog' || sessionScope.subtree == 'shoptree'}">
				<ul class="j-ul">
					<c:if test="${sessionScope.subtree == 'shoptree' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/shopses">信息管理</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shoptree' }">
						<li class="j-li"><a class="hover" href="<%=path %>/shopses">信息管理</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'syslog' }">
						<li class="j-li lanPos"><a href="<%=path %>/syslogs?page=1">日志</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'syslog' }">
						<li class="j-li"><a href="<%=path %>/syslogs?page=1">日志</a></li>
					</c:if>
				</ul>
			</c:if>
			<c:if test="${sessionScope.subtree == 'shopAddress' || sessionScope.subtree == 'freightTemplate' }">
				<ul class="j-ul">
					<c:if test="${sessionScope.subtree == 'shopAddress' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/shopaddresses?form">地址库</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shopAddress' }">
						<li class="j-li"><a class="hover" href="<%=path %>/shopaddresses?form">地址库</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'freightTemplate' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/shopfreighttemplates">运费模板库</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'freightTemplate' }">
						<li class="j-li"><a class="hover" href="<%=path %>/shopfreighttemplates">运费模板库</a></li>
					</c:if>
				</ul>
			</c:if>
			
			<c:if test="${sessionScope.subtree == 'shopBillThis' || sessionScope.subtree == 'shopBill'}">
				<ul class="j-ul">
					<c:if test="${sessionScope.subtree == 'shopBillThis' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/shopbills?method=thisList&page=1">本期账单明细</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shopBillThis' }">
						<li class="j-li"><a class="hover" href="<%=path %>/shopbills?method=thisList&page=1">本期账单明细</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'shopBill' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/shopbills?page=1">往期账单管理</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shopBill' }">
						<li class="j-li "><a class="hover" href="<%=path %>/shopbills?page=1">往期账单管理</a></li>
					</c:if>
				</ul>
			</c:if>
				<c:if test="${sessionScope.subtree == 'shopHelpThis' || sessionScope.subtree == 'shopHelp'}">
				<ul class="j-ul">
					<c:if test="${sessionScope.subtree == 'shopBillThis' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/shopHellp">规则体系</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shopBillThis' }">
						<li class="j-li"><a class="hover" href="<%=path %>/shopHellp">规则体系</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree == 'shopBill' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/indexHellp">入驻流程</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'shopBill' }">
						<li class="j-li "><a class="hover" href="<%=path %>/indexHellp">入驻流程</a></li>
					</c:if>
				</ul>
			</c:if>
			<c:if test="${sessionScope.subtree == 'promotionManagement'  || sessionScope.subtree == 'offerRewardManagement'}">
				<ul class="j-ul">
				
				
					<c:if test="${sessionScope.subtree == 'promotionManagement' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/promotion?list">限时特惠</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'promotionManagement' }">
						<li class="j-li "><a class="hover" href="<%=path %>/promotion?list">限时特惠</a></li>
					</c:if>
					
					<c:if test="${sessionScope.subtree == 'offerRewardManagement' }">
						<li class="j-li lanPos"><a class="hover" href="<%=path %>/offerReward?list">商家悬赏</a></li>
					</c:if>
					<c:if test="${sessionScope.subtree != 'offerRewardManagement' }">
						<li class="j-li "><a class="hover" href="<%=path %>/offerReward?list">商家悬赏</a></li>
					</c:if>
				</ul>
			</c:if>
		</div>
	</div>

	<div class="col-xs-my-41">
		
	</div>
</div>