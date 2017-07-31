<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>
<script src="<%=path%>/js/email.js"></script>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>
<link rel="stylesheet" href="<%=path%>/css/valid.css" />
<!--title部分-->
<div class="j-register col-xs-my-48">
	<div class="col-xs-my-7">&nbsp;</div>
	<div class="col-xs-my-7">
		<div class="col-xs-12">
			<img src="<%=path%>/img/logo.png" />
		</div>
		<div class="col-xs-12">
			<p>途有铃动，必有乾坤</p>
		</div>
	</div>
	<div class="col-xs-my-1 j-line"></div>
	<div class="col-xs-my-22">
		<div class="col-xs-12 j-register-font">商家管理后台</div>
		<div class="col-xs-12 j-register-fontE">Merchant&nbsp;system</div>
	</div>
	<div class="col-xs-my-11 j-register-a">
		<a href="<%=path%>/login">登录|</a> <a href="#" name="reister">注册</a>
	</div>
</div>
<!--content部分-->
<div class="j-content">
	<!--content 部分-->
	<div class="col-xs-my-4">&nbsp;</div>
	<div class="col-xs-my-40 j-bodyRE">
		<div class="col-xs-my-48">
			<div class="col-xs-my-2">&nbsp;</div>
			<div class="col-xs-my-44 j-form">
				<!--form 注册表单-->
				<form action="<%=path%>/forgetPassWord" method="post" role="form" id="registerform">
					<div class="col-xs-12 j-register-top">
						<div class="col-xs-3 j-name">
							<span class="j-color">*</span><label for="name">手机号码</label>
						</div>
						<div class="col-xs-7 form-group">
							<input type="text" name="userName" id="userName" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="手机号码" />
						</div>
						<div class="col-xs-2"></div>
					</div>
					<div class="col-xs-12 j-register-top">
						<div class="col-xs-3 j-name">
							<span class="j-color">*</span><label for="name">验证码</label>
						</div>
						<div class="col-xs-7 form-group">
							<input type="text" name="check" value="" onchange="checkSms(this)" datatype="*" class="col-xs-my-38 form-control" placeholder="请输入验证码">
							<input type="button" onclick="settime(this)" class="btn col-xs-my-10" value="获取验证码"></input>
						</div>
						<div class="col-xs-2"></div>
					</div>
					<!--用户名-->
					<div class="col-xs-12 j-register-top">
						<div class="col-xs-3 j-name">
							<span class="j-color">*</span><label for="name">密码</label>
						</div>
						<div class="col-xs-7 form-group">
							<input type="password" name="password" value="" plugin="passwordStrength" datatype="*5-15" nullmsg="请输入密码！" errormsg="密码至少5个字符,最多15个字符！" class="col-xs-my-48 form-control" placeholder="********">
							<span class="col-xs-12 j-prompt">5-15个字符，区分大小写（不能是9位以下的纯数字，不能包含空格）</span>
						</div>
						<div class="col-xs-2"></div>
					</div>
					<!--密码-->
					<div class="col-xs-12 j-register-top">
						<div class="col-xs-3 j-name">
							<span class="j-color">*</span><label for="name">确认密码</label>
						</div>
						<div class="col-xs-7 form-group">
							<input type="password" name="password1" value="" recheck="password" datatype="*5-15" nullmsg="请确认密码！" errormsg="两次输入的密码不一致！" class="col-xs-my-48 form-control" placeholder="********">
						</div>
						<div class="col-xs-2"></div>
					</div>
					<!--确认密码-->
					<div class="col-xs-5">&nbsp;</div>
					<div class="col-xs-3 j-register-top">
						<button name="submit" class="button button-action button-rounded" id="Information">提交</button>
					</div>
					<div class="col-xs-4">&nbsp;</div>
				</form>
				<!--form 注册表单-->
			</div>
			<div class="col-xs-my-2">&nbsp;</div>
		</div>
	</div>
</div>
<div class="col-xs-my-4">&nbsp;</div>
<div class="clearfix"></div>
<script>
	$(function() {
		//$(".registerform").Validform();  //就这一行代码！;

		var getInfoObj = function() {
			return $(this).parents("div").next().find(".info");
		}

		$("[datatype]").focusin(function() {
			if (this.timeout) {
				clearTimeout(this.timeout);
			}
			var infoObj = getInfoObj.call(this);
			if (infoObj.siblings(".Validform_right").length != 0) {
				return;
			}
			infoObj.show().siblings().hide();

		}).focusout(
				function() {
					var infoObj = getInfoObj.call(this);
					this.timeout = setTimeout(function() {
						infoObj.hide().siblings(
								".Validform_wrong,.Validform_loading").show();
					}, 0);

				});

		$("#registerform").Validform(
				{
					tiptype : 2,
					usePlugin : {
						passwordstrength : {
							minLen : 6,
							maxLen : 18,
							trigger : function(obj, error) {
								if (error) {
									obj.parent().next().find(
											".passwordStrength").hide()
											.siblings(".info").show();
								} else {
									obj.removeClass("Validform_error").parent()
											.next().find(".passwordStrength")
											.show().siblings().hide();
								}
							}
						}
					}
				});
	})
</script>
<script type="text/javascript">
var countdown=60; 
function settime(obj) {
	if(countdown==60){
	    var userName = $("#userName").val();
		$.ajax({
		url : '<%=path %>/register?method=sendSms&userName='+userName,
		type: 'POST',
		dataType : "html",//json--返回json数据类型；xml--返回xml
		success : function(data) {
			if(data=="true"){
				
			}else{
				
			}
		},
	});
	}
	
    if (countdown == 0) { 
        obj.removeAttribute("disabled");    
        obj.value="免费获取验证码"; 
        countdown = 60; 
        return;
    } else { 
        obj.setAttribute("disabled", true); 
        obj.value="重新发送(" + countdown + ")"; 
        countdown--; 
    } 
setTimeout(function() { 
    settime(obj) }
    ,1000) 
}
 function checkSms(obj){
		var userName = $("#userName").val();
		var sms = $(obj).val();
		$.ajax({
		url : '<%=path %>/register?method=checkSms&userName='+userName+'&smsToken='+sms,
		type: 'POST',
		dataType : "html",//json--返回json数据类型；xml--返回xml
		success : function(data) {
			if(data=="true"){
				
			}else{
				$(obj).val("");
				alert("验证码填写错误，请重新填写");
			}
		},
	});
 }
 
</script>