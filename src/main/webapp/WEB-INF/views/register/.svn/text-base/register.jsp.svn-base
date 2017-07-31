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
<link rel="stylesheet" href="<%=path %>/css/valid.css" />
<!--title部分-->
<div class="j-register col-xs-my-48">
	<div class="col-xs-my-7">&nbsp;</div>
	<div class="col-xs-my-7">
		<div class="col-xs-12">
			<img src="<%=path %>/img/logo.png" />
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
		<a href="<%=path %>/login">登录|</a> <a href="<%=path %>/register">注册</a>
	</div>
</div>
<!--content部分-->
<div class="j-content">
	<!--content 部分-->
	<div class="col-xs-my-4">&nbsp;</div>
	<div class="col-xs-my-40 j-bodyRE">
		<div>
			<!--注册进度条-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2">&nbsp;</div>
				<div class="col-xs-my-9">
					<div class="j-register1">
						<div class="j-Nav">1.注册</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">2.提交入驻信息</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">3.入驻信息审核</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">4.签订合同</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register3">
						<div class="j-Nav3">5.开始营业</div>
					</div>
				</div>
			</div>
			<!--/注册进度条-->
			<!--注册表单内容-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2">&nbsp;</div>
				<div class="col-xs-my-44 j-form">
					<!--form 注册表单-->
					<form  action="<%=path %>/register" method="post" role="form" id="registerform">
				
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">用户名</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="userName" id="userName" value="" onchange="checkUser(this)" datatype="m" class="col-xs-my-48 form-control" placeholder="请输入您的手机号">
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">验证码</label>
							</div>
							<div class="col-xs-5 form-group">
							<!-- onchange="checkSms(this)" -->
								<input type="text" name="smsToken" value=""  datatype="*" class="col-xs-my-48 form-control" placeholder="请输入验证码">
							</div>
							<div class="col-xs-2 form-group">
								<input type="button" id="btn" class="button button-action button-rounded button-small" value="免费获取验证码" onclick="settime(this)" /> 
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<!--用户名-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">密码</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="password" id="password" name="password" value="" plugin="passwordStrength"  datatype="*5-15" nullmsg="请输入密码！" errormsg="密码至少6个字符,最多16个字符！" class="col-xs-my-48 form-control" placeholder="请输入密码！"> <span class="col-xs-12 j-prompt">密码由6-16个字符组成，区分大小写（不能是9位以下的纯数字，不能包含空格）</span>
							</div>
								<div class="col-xs-2">
							</div>
						</div>
						<!--密码-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">确认密码</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="password" name="password1" value="" recheck="password"  datatype="*5-15" nullmsg="请确认密码！" errormsg="两次输入的密码不一致！"  class="col-xs-my-48 form-control" placeholder="请确认密码">
							</div>
								<div class="col-xs-2">
							</div>
						</div>
						<!--确认密码-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">推荐人手机号</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="userNamess" id="userName" value="" onchange="check(this)"  class="col-xs-my-48 form-control" placeholder="请输入手机号">
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<!--推荐人-->
					
						
						
						<div class="col-xs-5">&nbsp;</div>
						<div class="col-xs-3 j-register-top">
							<button name="submit" class="button button-action button-rounded" id="Information">注册</button>
							<div class="footer">
								<p> <a href="/shop/login">已注册直接登录</a></p>
							</div>
						</div>
						<div class="col-xs-4">&nbsp;</div>
					</form>
					<!--form 注册表单-->
				</div>
				<div class="col-xs-my-2">&nbsp;</div>
			</div>
			<!--注册表单内容-->
		</div>
	</div>
	<!--content 部分-->
</div>
<div class="col-xs-my-4">&nbsp;</div>
<div class="clearfix"></div>
<script>
$("#password").change(function(){
	  $(this).css("background-color","#FFFFCC");
	//密码必须包含数字和字母
    var str = $("#password").val();
  
   arr = str.split(" ");

   if(arr.length != 1){
   　　alert("字符串含有空格！");
   $("#password").val("");
   }else{
	   
	   if(str.length>9){}else{
		   var reg = new RegExp(/^(?![^a-zA-Z]+$)(?!\D+$)/);
		   
		    if (reg.test(str)){
		    	  return true;
		    }else{
		    	alert("密码必须包含数字和字母")
		    	$("#password").val("");
		    }
	   }
	
   }
   
});
$(function(){
	//$(".registerform").Validform();  //就这一行代码！;
	
	var getInfoObj=function(){
			return 	$(this).parents("div").next().find(".info");
		}
	
	$("[datatype]").focusin(function(){
		if(this.timeout){clearTimeout(this.timeout);}
		var infoObj=getInfoObj.call(this);
		if(infoObj.siblings(".Validform_right").length!=0){
			return;	
		}
		infoObj.show().siblings().hide();
		
	}).focusout(function(){
		var infoObj=getInfoObj.call(this);
		this.timeout=setTimeout(function(){
			infoObj.hide().siblings(".Validform_wrong,.Validform_loading").show();
		},0);
		
	});
	
	$("#registerform").Validform({
		tiptype:2,
		usePlugin:{
			passwordstrength:{
				minLen:6,
				maxLen:18,
				trigger:function(obj,error){
					if(error){
						obj.parent().next().find(".passwordStrength").hide().siblings(".info").show();
					}else{
						obj.removeClass("Validform_error").parent().next().find(".passwordStrength").show().siblings().hide();	
					}
				}
			}
		}
	});
})

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
 
 function checkUser(obj){
		var userName = $(obj).val();
		var sms = $(obj).val();
		$.ajax({
		url : '<%=path %>/register?method=checkUser&userName='+userName,
		type: 'POST',
		dataType : "html",//json--返回json数据类型；xml--返回xml
		success : function(data) {
			if(data=="true"){
				
			}else{
				$(obj).val("");
				alert("用户已经注册，请登录！");
			}
		},
	});
}
//  推荐人手机号de jiaoyan
 function check(obj){
		var userName = $(obj).val();
		var sms = $(obj).val();
		$.ajax({
		url : '<%=path %>/register?method=checkUser&userName='+userName,
		type: 'POST',
		dataType : "html",//json--返回json数据类型；xml--返回xml
		success : function(data) {
			if(data=="true"){
				$(obj).val("");
				alert("该推荐人不正确，请重新填写！");
			}else{
			
				
			}
		},
	});
}
</script>