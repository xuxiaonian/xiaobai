<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script src="<%=path%>/styles/jquery-1.9.1.min.js"></script>
</head>
<body>
	<div>
		订单状态：${shoporders.orderStatus.name }</br>
		订单详情：</br>
		&nbsp;&nbsp;&nbsp;&nbsp;收货信息 收货人：${shoporders.att1 } ${shoporders.att2 }</br>
		&nbsp;&nbsp;&nbsp;&nbsp;收货地址：${shoporders.address }</br>
		</br></br></br>
		商品信息：</br>
		&nbsp;&nbsp;&nbsp;&nbsp;
		<c:forEach items="${shoporders.shopOrderList }" var="shopOrderList">
			商家货号：${shopOrderList.productId.name }
			<img src="${shopOrderList.productId.headImage }" width="80px" height="80px;"/> *${shopOrderList.buyCouts } ￥${shopOrderList.productId.price }
		</c:forEach>
		</br>	</br>	</br>	
		价格信息：
			&nbsp;&nbsp;&nbsp;&nbsp;商品总价：${shoporders.collect-shoporders.mailCost }</br>
			&nbsp;&nbsp;&nbsp;&nbsp;快递运费：${shoporders.mailCost }</br>
			&nbsp;&nbsp;&nbsp;&nbsp;订单金额：${shoporders.collect }</br>
			</br>	</br>	</br>	</br>	</br>	</br>
		买家留言：&nbsp;&nbsp;&nbsp;&nbsp;订单金额：${shoporders.remarks }</br>
		</br>	</br>	</br>	
		基础信息：</br>
		&nbsp;&nbsp;&nbsp;&nbsp;订单编号：${shoporders.orderNumber } &nbsp;&nbsp;&nbsp;&nbsp;下单时间：${shoporders.orderTime }</br>
		&nbsp;&nbsp;&nbsp;&nbsp;支付时间：${shoporders.payedAt } </br>
		&nbsp;&nbsp;&nbsp;&nbsp;支付方式：${shoporders.tripleOrderNumber } &nbsp;&nbsp;&nbsp;&nbsp;交易流水号：${shoporders.tripleOrderNumber }</br>
		
		订单日志：</br>
		<table>
			<tr><th>时间</th><th>操作人</th><th>操作内容</th></tr>
			<c:forEach items="${sysLogs }" var="sysLog">
				<tr><td>${sysLog.createdAt }</td><td>${sysLog.operator }</td><td>${sysLog.content }</td></tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>