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
			<div class="col-xs-12 j-size text-center" style="line-height:1.5">
				<i class="fa  fa-check-circle"></i> 您的商铺已被锁定，暂时无法进行经营活动<br>
				<small style="display:block; padding-top:40px">如有问题请在工作时间联系平台工作人员</small>
			</div>
			
			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">			                                               
				<div class="col-xs-3 text-center">电话：400-6218-116 </div>
				<div class="col-xs-4 text-center">邮箱：tlkf@bjhuazhuo.com </div>
				<div class="col-xs-5 text-center">服务时间：周一—周五  09:00-18:00 </div>
			</div>
			
<!-- 			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">	 -->
<!-- 				<a class="btn btn-lg btn-primary">重新签约</a> -->
<!-- 			</div> -->
		</div>
		
		
		</c:if>
		
		<c:if test="${state ==2}">
			<div class="col-xs-my-48 j-icon">			
			<div class="col-xs-12 j-size text-center" style="line-height:1.5">
				<i class="fa  fa-check-circle"></i> 您的入驻合同已到期，暂时无法进行经营活动<br>
				<small style="display:block; padding-top:40px">如需继续经营请您尽快联系平台续签</small>
			</div>
			
			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">			                                               
				<div class="col-xs-3 text-center">电话：400-6218-116 </div>
				<div class="col-xs-4 text-center">邮箱：tlkf@bjhuazhuo.com </div>
				<div class="col-xs-5 text-center">服务时间：周一—周五  09:00-18:00 </div>
			</div>
			
<!-- 			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">	 -->
<!-- 				<a class="btn btn-lg btn-primary">重新签约</a> -->
<!-- 			</div> -->
		</div>
		
		
	</c:if>
		<c:if test="${state ==3}">
			<div class="col-xs-my-48 j-icon">			
			<div class="col-xs-12 j-size text-center" style="line-height:1.5">
				<i class="fa  fa-check-circle"></i> 您的商铺已被锁定，暂时无法进行经营活动<br>
				<small style="display:block; padding-top:40px">如有问题请在工作时间联系平台工作人员</small>
			</div>
			
			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">			                                               
				<div class="col-xs-3 text-center">电话：400-6218-116 </div>
				<div class="col-xs-4 text-center">邮箱：tlkf@bjhuazhuo.com </div>
				<div class="col-xs-5 text-center">服务时间：周一—周五  09:00-18:00 </div>
			</div>
			
			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">	
<%-- 			<a href="/shop/register/${id}?update" class="button button-rounded col-xs-my-21" style="background-color: #017E44;border-color: #017E44;color: #eee; margin: 0 auto">重新签约</a> --%>
				<a href="/shop/register/${id}?update" class="btn btn-lg btn-primary">重新签约</a>
			</div>
		</div>

	</c:if>
		<c:if test="${state ==4}">
					<div class="col-xs-my-48 j-icon">			
			<div class="col-xs-12 j-size text-center" style="line-height:1.5">
				<i class="fa  fa-check-circle"></i> 您的入驻合同已到期，暂时无法进行经营活动<br>
				<small style="display:block; padding-top:40px">如需继续经营请您尽快联系平台续签</small>
			</div>
			
			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">			                                               
				<div class="col-xs-3 text-center">电话：400-6218-116 </div>
				<div class="col-xs-4 text-center">邮箱：tlkf@bjhuazhuo.com </div>
				<div class="col-xs-5 text-center">服务时间：周一—周五  09:00-18:00 </div>
			</div>
			
			<div class="col-xs-10 col-xs-offset-1 j-size text-center" style="font-size:16px; padding-top:40px">	
			
				<a href="/shop/register/${id}?update"  class="btn btn-lg btn-primary">续签入驻合同</a>
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