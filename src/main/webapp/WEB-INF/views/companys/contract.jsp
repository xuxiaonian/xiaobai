<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<div class="j-content">
	<!--content 部分-->
	<div class="col-xs-my-4">&nbsp;</div>
	<div class="col-xs-my-40">

				<a class="button" href="<%=path %>/shopses">店铺信息</a> <a class="button" href="<%=path %>/companys">企业信息</a>
					
				<a class="button button-action" href="">合同信息</a>   <a class="button " href="<%=path %>/companys/12?brand">品牌信息</a>
		
			</div>
		<div>
		
		
			
			
<div class="col-xs-10">	
<STYLE type=text/css>.pad {
	PADDING-BOTTOM: 0.5em !important; PADDING-LEFT: 0.5em !important; PADDING-RIGHT: 0.5em !important; PADDING-TOP: 0.5em !important
}
</STYLE>
		<form  action="<%=path %>/register?contracting" method="post"  id="myForm" >
<DIV class='block' style="clear:both; padding-top:30px">
<DIV class="col-sm-10 col-sm-offset-1">
<DIV class="block form-horizontal">
<H3>合同编号：${settlement.contractNunber }</H3>
<TABLE class="table table-bordered">
<TBODY>
<TR>
<TD class="text-center pad bg-success" colSpan=2>
<H3>合同基本信息</H3></TD></TR>
<TR>
<TD colSpan=2>
<DIV class=form-group>
<DIV class=col-sm-6>
<DIV><LABEL class="col-sm-4 control-label">合同类型:</LABEL> 
<DIV class="col-sm-8 form-control-static">商家入驻</DIV></DIV>
<DIV><LABEL class="col-sm-4 control-label">合作类型:</LABEL> 
<DIV class="col-sm-8 form-control-static">

<c:if test="${settlement.teamworkType ==0}">
技术服务费模式
</c:if>
<c:if test="${settlement.teamworkType ==1}">
代销模式
</c:if>
</DIV></DIV>
<DIV><LABEL class="col-sm-4 control-label">月销售目标:</LABEL> 
<DIV class="col-sm-8 form-control-static">${settlement.monthSalesTarget }元</DIV></DIV></DIV>
<DIV class=col-sm-6>
<DIV><LABEL class="col-sm-4 control-label">合同期限:</LABEL> 
<DIV class="col-sm-8 form-control-static">${settlement.startTime }至${settlement.endTime }</DIV></DIV>
<DIV><LABEL class="col-sm-5 control-label">允许设置优惠:</LABEL> 
<DIV class="col-sm-7 form-control-static">
<c:if test="${settlement.discount ==true}">
是 
</c:if>
<c:if test="${settlement.discount ==false}">
否
</c:if>
</DIV></DIV></DIV></DIV></TD></TR>
<TR>
<TD style="VERTICAL-ALIGN: top !important" width="50%">
<H3 class=text-center>甲方</H3>

<DIV><LABEL class="col-sm-3 control-label">公司名称:</LABEL> 
<DIV class="col-sm-9 form-control-static">${company.name }</DIV>
<DIV><LABEL class="col-sm-3 control-label">店铺名称:</LABEL> 
<DIV class="col-sm-9 form-control-static">${shops.name }</DIV></DIV>
<DIV><LABEL class="col-sm-3 control-label">账期:</LABEL> 
<DIV class="col-sm-9 form-control-static">${settlement.billingCycle }天</DIV></DIV>


</TD>
<TD width="50%">
<H3 class=text-center>乙方</H3>
<DIV><LABEL class="col-sm-3 control-label">公司名称:</LABEL> 
<DIV class="col-sm-9 form-control-static">北京最印象科技有限公司</DIV></DIV>

</TD></TR></TBODY></TABLE></DIV>
<DIV class="block form-horizontal">
<TABLE class="table table-bordered">
<TBODY>
<TR>
<TD class="text-center pad bg-success" colSpan=2>
<H3>合同费用及扣点</H3></TD></TR>
<TR>
<TD>
<DIV class=form-group><LABEL class="col-sm-2 control-label">质保金:</LABEL> 
<DIV class="col-sm-2 form-control-static">${settlement.warranty }元</DIV><LABEL class="col-sm-2 control-label">平台使用费:</LABEL> 
<DIV class="col-sm-2 form-control-static">${settlement.serviceCharge }元</DIV></DIV></TD></TR>
<TR>
<TD>
<TABLE class="table table-bordered text-center table-hover">
<TBODY>
<TR>
<TD>序号</TD>
<TD>类目</TD>
<TD>扣点</TD></TR>
 <c:forEach items="${expense }" var="expense" varStatus="status">
<TR>
<TD>${status.index+1 }</TD>
<TD>${expense.name }</TD>
<TD>${expense.commissionRate }%</TD></TR>

</c:forEach>
</TBODY></TABLE></TD></TR></TBODY></TABLE></DIV>
<!-- <DIV class="block form-horizontal"> -->
<!-- <TABLE class="table table-bordered"> -->
<!-- <TBODY> -->
<!-- <TR> -->
<!-- <TD class="text-center pad bg-success" colSpan=2> -->
<!-- <H3>经营品牌</H3></TD></TR> -->
<!-- <TR> -->
<!-- <TD> -->
<!-- <TABLE class="table table-bordered text-center table-hover"> -->
<!-- <TBODY> -->
<!-- <TR> -->
<!-- <TD width="20%">序号</TD> -->
<!-- <TD width="20%">品牌名称</TD> -->
<!-- <TD width="60%">品牌分类</TD></TR> -->
<%--  <c:forEach items="${productBrand }" var="productBrand" varStatus="statu"> --%>
<!-- <TR> -->
<%-- <TD>${statu.index+1 }</TD> --%>
<%-- <TD>${productBrand.brandName }</TD> --%>
<%-- <TD>${productBrand.categoryName }</TD></TR> --%>

<%-- </c:forEach> --%>

<!-- </TBODY></TABLE></TD></TR></TBODY></TABLE></DIV> -->




<DIV class="block text-center">


<A class="btn btn-lg" href="${lps.data }" target=_blank>下载查看完整合同条款</A> 
<A class="btn btn-lg" href="${settlement.fileUrl }" target=_blank>下载查看补充协议</A> </DIV>
<DIV class="block text-center">
<input type="hidden" name="state" value=1 />
<input type="hidden" name="moId" value="${mo.id }" />
 </DIV></DIV></DIV>

<DIV id=modalRefuse class="modal fade in" role=dialog tabIndex=-1>
<DIV class="modal-dialog modal-sm" role=document>
<DIV class=modal-content>
<DIV class=modal-header><BUTTON class=close type=button aria-label="Close" data-dismiss="modal"><SPAN aria-hidden=true>×</SPAN></BUTTON> 
<H4 id=exampleModalLabel class=modal-title>拒绝原因</H4></DIV>

<DIV class=modal-body>

<FORM>
<DIV class=form-group><TEXTAREA id=refuseText name="reason" class=form-control rows=4 type="text"></TEXTAREA> </DIV></FORM></DIV>
<DIV class=modal-footer><BUTTON class="btn btn-default" type=button data-dismiss="modal">关闭</BUTTON>
<BUTTON class="btn btn-primary btnRefuseSubmit" type="submit">确定</BUTTON> </DIV></DIV></DIV></DIV>
 </form>
					
					<!--form 注册表单-->
				</div>
				<div class="col-xs-my-2">&nbsp;</div>
			</div>
			<!--注册表单内容-->
		</div>

	