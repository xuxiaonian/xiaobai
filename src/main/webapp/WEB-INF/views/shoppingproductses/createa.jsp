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
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>
</head>
<body>
<form action="<%=path%>/shoppingproductses" method="post"  enctype="multipart/form-data" class="form-inline">
		<input type="hidden" value="${shoppingProducts.shoppingCategoryId }" name="shoppingCategoryId"/>
		商品名称:<input type="text" name="name"/></br>
		商家货号:<input type="text" name="productNumber"/></br>
		商品销售规格：
		<table>
			<tr>
				<th>商品规格</th>
				<th>市场价/元</th>
				<th>销售价（实际售卖价格）/元</th>
			</tr>
			<tr>
				<td><input type="text" name="shoppingProductsSpecs[0].specName"/></td>
				<td><input type="text" name="shoppingProductsSpecs[0].orgPrice"/></td>
				<td><input type="text" name="shoppingProductsSpecs[0].price"/></td>
			</tr>
		</table></br>
		市场价格:<input type="text" name="orgPrice"/></br>
		销售价格:<input type="text" name="price"/></br>
		
		库存:<input type="text" name="stock"/></br>
		库存预警:<input type="text" name="stockWarning"/></br>
		推荐理由:<input type="text" name="recommendReason"/></br>
		<div data-toggle="distpicker">
		<div class="form-group">
          <label class="sr-only" for="province7">公司地址</label>
          <select name="provincesId" class="form-control" id="province7"></select>
        </div>
        <div class="form-group">
          <label class="sr-only" for="city7">市</label>
          <select name="cityId" class="form-control" id="city7"></select>
        </div>
        </div>
        商品品牌：<select name="productBrandId">
        	<c:forEach items="${productbrands }" var="productbrand">
        		<option value="${productbrand.id }">${productbrand.brandName }</option>
        	</c:forEach>
        </select></br>
        商品主图：
        <c:forEach begin="0" end="3" step="1" varStatus="status">
        	<input type="file" name="shoppingProductPictures[${status.index }].attachment"/>
        </c:forEach>
		</br>
		商品参数：
		<input type="text" name="shoppingProductsParameters[0].parameterType"/>
		<input type="text" name="shoppingProductsParameters[0].parameterValue"/>
		</br>
		商品描述：
		<input type="text" name="details"/>
		</br>
		商品标签：	<input type="text" name="shoppingProductMarkName"/>
			<c:forEach items="${specialMarks }" var="specialMark">
				${specialMark.name }
			</c:forEach>
		</br>
		物流信息：
		固定运费：<input type="radio" name="isCost" value="true"/><input type="text" name="cost"/>
		</br>
		物流信息：
		固定运费：<input type="radio" name="isCost" value="false"/>
		<select name="shopFreightTemplate">
				<option></option>
			<c:forEach items="${shopfreighttemplates }" var="shopfreighttemplate">
				<option value="${shopfreighttemplate.id }">${shopfreighttemplate.name }</option>
			</c:forEach>
		</select>
		</br>
		发票信息：<input type="radio" name="invoice" value="true"/>是<input type="radio" name="invoice" value="false"/>否
		</br>
		<input type="submit" value="提交"/>
</form>
</body>
</html>