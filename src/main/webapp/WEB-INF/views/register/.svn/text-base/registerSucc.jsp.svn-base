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
<div class="j-successful col-xs-my-48">
	<div class="col-xs-my-7">&nbsp;</div>
	<div class="col-xs-my-5">
		<img src="<%=path %>/img/logo.png" />
	</div>
	<div class="col-xs-my-2 j-line"></div>
	<div class="col-xs-my-22">
		<div class="col-xs-12 j-successful-font">商家管理后台</div>
		<div class="col-xs-12 j-successful-fontE">Merchant&nbsp;system</div>
	</div>
	<div class="col-xs-my-11 j-successful-a">
		<a href="<%=path %>/login">登录|</a> <a href="<%=path %>/register">注册</a>
	</div>
</div>
			<!--注册进度条-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2">&nbsp;</div>
				<c:if test="${state ==1}">
				<div class="col-xs-my-9">
					<div class="j-register1">
						<div class="j-Nav">1.注册</div>
					</div></div>
				</c:if>
				<c:if test="${state !=1}">
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">1.注册</div>
					</div></div>
				</c:if>
			
				
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">2.提交入驻信息</div>
					</div>
				</div>
					<c:if test="${state ==2}">
				<div class="col-xs-my-9">
					<div class="j-register1">
						<div class="j-Nav">3.入驻信息审核</div>
					</div>
				</div>
				</c:if>
				<c:if test="${state !=2}">
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">3.入驻信息审核</div>
					</div>
				</div>
				</c:if>
					<c:if test="${state ==4}">
				<div class="col-xs-my-9">
					<div class="j-register1">
						<div class="j-Nav">4.签订合同</div>
					</div>
				</div>
				</c:if>
				<c:if test="${state !=4}">
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">4.签订合同</div>
					</div>
				</div>
				</c:if>
				<c:if test="${state !=5}">
				<div class="col-xs-my-9">
					<div class="j-register3">
						<div class="j-Nav3">5.开始营业</div>
					</div>
				</div>
				</c:if>
				<c:if test="${state ==5}">
				<div class="col-xs-my-9">
					<div class="j-register1">
						<div class="j-Nav">5.开始营业</div>
					</div>
				</div>
				</c:if>
			</div>
			<!--/注册进度条-->
<!--content部分-->
<div class="j-content">
	<!--content 部分-->
	<div class="col-xs-my-4">&nbsp;</div>
	<div class="col-xs-my-40 j-bodySUC">
		<!--注册成功-->
	<!--注册成功-->
	<c:if test="${state ==1}">
		<div class="col-xs-my-48 j-icon">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-2 j-i">
				<i class="fa  fa-check-circle"></i>
			</div>
			<div class="col-xs-my-19 j-size">注册成功</div>
			<div class="col-xs-my-8">&nbsp;</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 10px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">请填写您的入驻信息</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${mId}?information" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">填写信息</a>
			</div>
		</div>
		</c:if>
			<c:if test="${state ==2}">
			<c:if test="${authStatus ==0}">
		<div class="col-xs-my-48 j-icon">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-2 j-i">
				<i class="fa  fa-check-circle"></i>
			</div>
			<div class="col-xs-my-19 j-size">提交成功</div>
			<div class="col-xs-my-8">&nbsp;</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 10px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">您的信息已提交成功，请耐心等待平台审核</div>
		</div>
	    </c:if>
	    	<c:if test="${authStatus ==2}">
	
		<div class="col-xs-my-48 j-icon" style="margin-top: 70px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">恭喜你！您的入驻信息审核已通过。</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${mId}?contract" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">签订合同</a>
			</div>
		</div>
	    </c:if>
	    	<c:if test="${authStatus ==3}">
			<div class="col-xs-my-48 j-icon" style="margin-top: 50px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">很遗憾！您的入驻信息审核未通过！</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 20px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">拒绝原因：${Reason}</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${userId}?update" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">修改审核信息</a>
			</div>
		</div>
	    </c:if>
	    	<c:if test="${authStatus ==4}">
		<div class="col-xs-my-48 j-icon">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-2 j-i">
				<i class="fa  fa-check-circle"></i>
			</div>
			<div class="col-xs-my-19 j-size">提交成功   您的修改申请已提交成功，请耐心等待平台确认</div>
			<div class="col-xs-my-8">&nbsp;</div>
		</div>
		
	    </c:if>
	    	<c:if test="${authStatus ==5}">
		<div class="col-xs-my-48 j-icon">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-2 j-i">
				<i class="fa  fa-check-circle"></i>
			</div>
			<div class="col-xs-my-19 j-size">您的修改申请后台已同意</div>
			<div class="col-xs-my-8">&nbsp;</div>
		</div>
         <div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${id}?update" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">修改入驻信息</a>
			</div>
		</div>
	    </c:if>
	    <c:if test="${authStatus ==6}">
		<div class="col-xs-my-48 j-icon">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-2 j-i">
				<i class="fa  fa-check-circle"></i>
			</div>
			<div class="col-xs-my-19 j-size">很遗憾,后台拒绝了你的修改申请</div>
			<div class="col-xs-my-8">&nbsp;</div>
		</div>
		 <div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${mId}?information" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">签订合同</a>
			</div>
		</div>
	
		</c:if>
			<c:if test="${authStatus ==7}">
	
		<div class="col-xs-my-48 j-icon" style="margin-top: 70px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">很遗憾！后台拒绝了您的修改申请。</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${mId}?contract" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">签订合同</a>
			</div>
		</div>
	    </c:if>
		</c:if>
		<c:if test="${state ==4}">
			<c:if test="${statedd ==1}">
		<div class="col-xs-my-48 j-icon">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-2 j-i">
				<i class="fa  fa-check-circle"></i>
			</div>
			<div class="col-xs-my-19 j-size">提交成功,请等待后台合同签章</div>
			<div class="col-xs-my-8">&nbsp;</div>
		</div>
		
			
	
	</c:if>
	   	<c:if test="${statedd ==2}">
			<div class="col-xs-my-48 j-icon" style="margin-top: 50px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">很遗憾！您的入驻信息审核未通过！</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 20px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">拒绝原因：${Reason}</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
<%-- 				<a href="/shop/register/${userId}?update" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">修改审核信息</a> --%>
			</div>
		</div>
	</c:if>
	   	<c:if test="${statedd ==3}">
			<div class="col-xs-my-48 j-icon" style="margin-top: 50px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">很遗憾！您的入驻信息审核未通过！</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 20px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">拒绝原因：${Reason}</div>
		</div>
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/register/${userId}?update" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">修改审核信息</a>
			</div>
		</div>
	</c:if>
		</c:if>
			<c:if test="${state ==5}">
			<div class="col-xs-my-48 j-icon" style="margin-top: 10px">
			<div class="col-xs-my-48 j-size" style="font-size: 20px" align="center">恭喜您，合同签署成功，欢迎入驻！</div>
		</div>
		
		<div class="col-xs-my-48 j-icon" style="margin-top: 40px">
			<div class="col-xs-my-19">&nbsp;</div>
			<div class="col-xs-my-24 j-size" style="font-size: 20px">
				<a href="/shop/index" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">开始经营</a>
			</div>
		</div>
	</c:if>
		<!--/注册成功-->
	</div>
	<!--/content 部分-->
</div>
<div class="col-xs-my-4">&nbsp;</div>
<div class="clearfix"></div>
<!--content foot部分-->
<div class="col-xs-12 j-content-foot">
	<div class="col-xs-3">
			<div class="j-foot-font">联系我们</div>
			</br>
			<hr />
			<div class="j-foot-phone j-foot-line">400-6218-116</div>
			<div class="j-odd2 j-foot-line">服务时间：9:00-18:00</div>
			<div class="j-odd2 j-foot-line">客服邮箱：tlkf@bjhuazhuo.com</div>
		</div>
		<div class="col-xs-1">&nbsp;</div>
		<div class="col-xs-3">
			<div class="j-foot-font">商务合作</div>
			</br>
			<hr />
			<div class="j-odd2 j-foot-line">联系人：王女士</div>
			<div class="j-odd2 j-foot-line">电话：010-61468944转807</div>
			<div class="j-odd2 j-foot-line">邮箱：wangchen@touring.com.cn</div>
		</div>
	<div class="col-xs-1">&nbsp;</div>
	<div class="col-xs-3">
		<div class="j-foot-font">
			关注途铃</span></br>
			<hr />
			<div>
				<img src="<%=path %>/img/code.png" />
			</div>
		</div>
	</div>
</div>
<!--foot 部分-->
<div class="j-foot">
	<div class="col-xs-my-18">&nbsp;</div>
	<div class="col-xs-my-20 j-foont-span">
		<span class="j-odd2">版权声明|Copyright@2016京|京ICP备16020857号&nbsp;北京最印象科技有限公司</span>
	</div>
</div>
<div class="clearfix"></div>