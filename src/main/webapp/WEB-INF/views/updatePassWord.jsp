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
		<a href="<%=path%>/login">登录|</a> <a href="<%=path%>/register" name="reister">注册</a>
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
				<form action="<%=path%>/updatePassWord" method="post" role="form" id="registerform">
					<div class="col-xs-12 j-register-top">
						<div class="col-xs-3 j-name">
							<span class="j-color">*</span><label for="name">当前密码</label>
						</div>
						<div class="col-xs-7 form-group">
							<input type="password" name="oldPassWord" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="当前密码" />
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
					<!-- <div class="col-xs-12 j-register-top">
						<div class="col-xs-3 j-name">
							<span class="j-color">*</span><label for="name">验证码</label>
						</div>
						<div class="col-xs-7 form-group">
							<input type="text" name="check" value="" datatype="*" class="col-xs-my-38 form-control" placeholder="请输入您的手机号">
							<input type="button" onclick="sendCode(this)" class="btn col-xs-my-10" value="获取验证码"></input>
						</div>
						<div class="col-xs-2"></div>
					</div> -->
					<div class="col-xs-5">&nbsp;</div>
					<div class="col-xs-3 j-register-top">
						<button name="submit" class="button button-action button-rounded" id="Information">确定</button>
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
	var clock = '';
	var nums = 60;
	var btn;
	function sendCode(thisBtn) {
		btn = thisBtn;
		btn.disabled = true; //将按钮置为不可点击
		btn.value = nums + '秒后可重新获取';
		clock = setInterval(doLoop, 1000); //一秒执行一次
		
		
		
	}
	function doLoop() {
		nums--;
		if (nums > 0) {
			btn.value = nums + '秒后可重新获取';
		} else {
			clearInterval(clock); //清除js定时器
			btn.disabled = false;
			btn.value = '点击发送验证码';
			nums = 60; //重置时间
		}
	}
</script>