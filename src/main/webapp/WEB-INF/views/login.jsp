<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" href="<%=path%>/css/reset.css" />
<link rel="stylesheet" href="<%=path%>/css/login.css" />

<script src="<%=path %>/js/jquery-1.9.1.js"></script>
<script src="<%=path %>/js/Validform_v5.3.2_ncr_min.js"></script>
<div class="header">
	<div class="header_cot">
		<div class="logo"></div>
		<div class="logoText green">
			<span>商家管理后台</span> <span>Merchant&nbsp;system</span>
		</div>
	</div>
</div>
<!--header-->
<div class="bannerBg">
	<div class="region">
		<div class="regionCot">
			<h1>商家登录</h1>
			<form action="<%=path%>/resources/j_spring_security_check" method="post">
				<div class="regionInp">
					<input class="name" name="j_username" type="text" value="${sessionScope['SPRING_SECURITY_LAST_USERNAME'] }" placeholder="手机号或邮箱地址" /> <input class="passward" name="j_password" type="password"
						placeholder="请输入密码，不少于6位" />
					<div class="rememberPwd clear">
						<label><input id="_spring_security_remember_me" name="_spring_security_remember_me" type="checkbox" value="true" />记住密码</label>
					</div>
					<div class="btn clear">
						<button type="submit" class="regionBtn">登录</button>
						<a href="<%=path%>/register" class="enrollBtn">注册</a>
					</div>
					<c:if test="${not empty param.login_error}">
						<div style="text-align: center; color: red;">
							<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Empty Username'}">
		          			用户名不能为空。
		          		</c:if>
							<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Bad credentials'}">
		          			用户名或密码错误。
		          		</c:if>
							<c:if test="${SPRING_SECURITY_LAST_EXCEPTION.message eq 'Empty Password'}">
		          			密码不能为空。
		          		</c:if>
						</div>
					</c:if>
				</div>
			</form>
			<a href="<%=path%>/forgetPassWord" class="forgetPwd">忘记密码?</a>
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
var demo =$("form").Validform();

demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
demo.addRule([{
	ele:"input:eq(0)",
	datatype:"*"
},

{
	ele:"input:eq(1)",
	datatype:"*"
},
]);
});
</script>