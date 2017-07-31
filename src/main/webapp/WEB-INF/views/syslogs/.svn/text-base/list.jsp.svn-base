<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40">
		<form action="<%=path%>/syslogs" method="get" id="queryForm">
			<input type="hidden" name="page" value="${page }" /> <input type="hidden" id="hiddenId" />
			<div class="j-right">
				<div class="col-xs-my-7">
					<div class="j-font" style="margin: 8px; float: right;">操作时间</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<input class="form-control datetimepicker" id="postDateStart" name="startDate" size="16" type="text" value="<fmt:formatDate value="${sysLogQuery.startDate }" pattern="yyyy-MM-dd"/>" >
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="demo">
					<div class="col-xs-my-1 h4">-</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<input class="form-control datetimepicker" id="postDateEnd" name="endDate" size="16" type="text" value="<fmt:formatDate value="${sysLogQuery.endDate }" pattern="yyyy-MM-dd"/>" >
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-7">
					<div class="j-font" style="margin: 8px; float: right;">日志内容</div>
				</div>
				<div class="col-xs-my-6 ">
					<div class="demo">
						<input type="text" name="content" id="postText" value="${sysLogQuery.content}" class="form-control" placeholder="请输入日志内容">
					</div>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<button type="submit" class="button  button-rounded button-action  button-small" style="float: right;">搜索</button>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<a href="<%=path%>/syslogs?page=1" class="button  button-rounded button-action  button-small">重置</a>
				</div>
			</div>
		</form>
	</div>
	<!--content  右边上部部分-->
	<!--tab切换-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-content-top">

		<!--tab 内容切换-->
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<div class="table-scrollable">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">账号</th>
								<th class="">日志内容</th>
								<th class="">状态</th>
								<th class="">IP</th>
								<th class="">操作时间</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${syslogs }" var="syslog">
								<tr class="odd">
									<td class="j-odd1">${syslog.operator }</td>
									<td class="j-odd2">${syslog.content}</td>
									<td class="j-odd2"><c:if test="${syslog.state}">成功</c:if> <c:if test="${!syslog.state}">失败</c:if></td>
									<td class="j-odd2">${syslog.ip}</td>
									<td class="j-odd2"><fmt:formatDate value="${syslog.createdAt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="syslogs" parameter="&${list}"></page:page>
				</div>
			</div>
		</div>
	</div>
</div>
<link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$('.datetimepicker').datetimepicker({
		language : 'zh-CN',
		format : "yyyy-mm-dd",
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	});
</script>
