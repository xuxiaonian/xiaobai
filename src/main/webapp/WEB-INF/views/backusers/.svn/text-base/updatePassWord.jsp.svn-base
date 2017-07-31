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
	<form action="<%=path %>/backusers" method="post" class="form-inline">
		<input type="hidden" name="_method" value="PUT"/>
		<input type="hidden" name="method" value="updatePassWord"/>
		原密码：<input type="text" name="oldPassWord" value=""/>
		</br>
		新密码：<input type="text" name="newPassWord" value=""/>
		<input type="submit" />
    </form>
</body>
</html>