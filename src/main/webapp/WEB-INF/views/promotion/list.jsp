<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<div class="j-content">
	<div class="col-xs-my-40">
	<div class="form-group j-content-top" style="padding-left:20px">
		<a href="/shop/promotion/add?Page&page=1&size=10" class="btn btn-lg btn-success" >新增限时特惠</a>
	</div>
	
    	<form action="<%=path%>/promotion" method="page"
id="queryForm" class="form-horizontal">
	
			<div class="form-group" style="padding-top:6px;">
				<input name="page" value=1 type="hidden"/>
				<label class="col-xs-1 control-label">状态</label>
				<div class="col-xs-3">							     
					<select name="status" id="status" class="form-control">
				    	<option value="">全部</option>
						 <option value="RUNNING">进行中</option>
					 	 <option value="END">已结束</option>
					 	 <option value="READY">即将开始</option>
					    <option value="CLOSE">平台关闭</option>									
					</select>
				</div>
				<div class="col-xs-3">
					<input type="text" name="name" id="postText"
						value=""
						class="form-control" placeholder="请输入商品名称">
				</div>							
				<div class="col-xs-3">
					<button type="submit" class="button  button-rounded button-action  button-small">搜索</button>
				
					<a href="<%=path%>/promotion" class="button  button-rounded button-action  button-small">重置</a>
				</div>							
			</div>
	</form>
		
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<div class="table-scrollable">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">序号</th>
								<th class="">商品编码</th>
								<th class="">商品名称</th>
								<th class="">规格</th>
								<th class="">售价（元）</th>
								<th class="">活动价（元）</th>
								<th class="">参与活动的数量</th>
<!-- 								<th class="">商家悬赏</th> -->
								<th class="">创建时间</th>
								<th class="">开始时间</th>
								<th class="">结束时间</th>
								<th class="">状态</th>
								<th class="">操作</th>
							</tr>
						</thead>
						<tbody>
							 	<c:forEach items="${dataList }" var="list" varStatus="status">
								<tr>
									<td class="j-odd3">${(status.index+1)}</td>
									<td class="j-odd4">${list.id }</td>
									<td class="j-odd4">${list.rebateName }</td>
									<td class="j-odd4">${list.productsSpecName }</td>
									<td class="j-odd4">${list.price }</td>
									<td class="j-odd4">${list.rebatePrice }</td>
									<td class="j-odd4">${list.productNum }</td>
<%-- 									<c:if test="${list.rewardRatio==0 }"> --%>
<!-- 									<td class="j-odd4">不参与</td> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${list.rewardRatio!=0 }"> --%>
<%-- 									<td class="j-odd4">参与商品金额的${list.rewardRatio }%</td> --%>
<%-- 									</c:if> --%>
									<td class="j-odd4">${list.createTime }</td>
									<td class="j-odd4">${list.startTime }</td>
									<td class="j-odd4">${list.endTime }</td>
									
								
									<c:if test="${list.rebateStatus=='AUDITING' }">
									<td class="j-odd4">待审核</td>
<%-- 									<a href="/shop/promotion/add?update&id=${list.id }" >编辑</a> --%>
									<td class="j-odd4"><a href="/shop/promotion/loo?look&id=${list.id }" >查看</a></td>

										
									</c:if>
									<c:if test="${list.rebateStatus=='NOT_PASS' }">
									<td class="j-odd4">审核不通</td>
									<td class="j-odd4">
									    <a href="/shop/promotion/loo?look&id=${list.id }" >查看</a> 
										<a href="/shop/promotion/add?delete&id=${list.id }" >删除</a>
										<a href="/shop/promotion/add?update&id=${list.id }" >编辑</a>
									</td>
										
									</c:if>
									<c:if test="${list.rebateStatus=='READY' }">
									<td class="j-odd4">即将开始</td>
									<td class="j-odd4"><a href="/shop/promotion/loo?look&id=${list.id }" >查看</a></td>
										
									</c:if>
									<c:if test="${list.rebateStatus=='RUNNING' }">
									<td class="j-odd4">进行中</td>
									<td class="j-odd4"><a href="/shop/promotion/loo?look&id=${list.id }" >查看</a></td>
										
									</c:if>
									<c:if test="${list.rebateStatus=='END' }">
									<td class="j-odd4">已结束</td>
									<td class="j-odd4"><a href="/shop/promotion/loo?look&id=${list.id }" >查看</a>
											<a href="/shop/promotion/add?delete&id=${list.id }" >删除</a></td>
									</c:if>
									<c:if test="${list.rebateStatus=='CLOSE' }">
									<td class="j-odd4">平台关闭</td>
										<td class="j-odd4"><a href="/shop/promotion/loo?look&id=${list.id }" >查看</a>
											<a href="/shop/promotion/add?delete&id=${list.id }" >删除</a></td>	
									</c:if>
<%-- 								 	    <td class="j-odd4">${list.rebateStatus }</td> --%>
																
<!-- 										<td class="j-odd4"> -->
<%-- 										<a href="/shop/promotion/loo?look&id=${list.id }" >查看</a> --%>
<%-- 										<a href="/shop/promotion/add?delete&id=${list.id }" >删除</a> --%>
<%-- 										<a href="/shop/promotion/add?update&id=${list.id }" >编辑</a> --%>
<!-- 										</td> -->
								
							
								</tr>
							</c:forEach>
						</tbody>
					</table>
				
					<page:page maxPages="${maxPages}" page="${page }" url="promotion" parameter=""></page:page>
				</div>
			</div>
		</div>
</div>
</div>
