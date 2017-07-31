<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<div class="j-content">
	<div class="col-xs-my-40">
		<div class="col-sm-offset-1" style="padding-top:20px">
			<div class="form-group">
				操作提示：
			</div>
			<div class="form-group">
				<span style="color:blue;"  data-toggle="modal" data-target="#myModal" >1、什么是商家悬赏?</span>
			</div>
			<div class="form-group">
				 2、为了打造爆款，参与商家悬赏的商品最多为30个
			</div>
		</div>
	<div class="form-group j-content-top" style="padding-left:20px">
		<a href="/shop/offerReward/add?Page&page=1&size=10" class="btn btn-lg btn-success" >新增商家悬赏</a>
	</div>
		
	
	      
    	<form action="<%=path%>/offerReward" method="page"
id="queryForm" class="form-horizontal">
	
			<div class="form-group" style="padding-top:6px;">
				<input name="page" value=1 type="hidden"/>
				<label class="col-xs-1 control-label">状态</label>
				<div class="col-xs-3">	  					     
					<select name="status" id="status" class="form-control">
				    	<option value="">全部</option>
						 <option value="RUNNIN">进行中</option>
					 	 <option value="END">已结束</option>
					 	 <option value="READY">即将开始</option>
					    <option value="CLOSED">关闭</option>									
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
								<th class="">商家悬赏</th>
								<th class="">分享次数</th>
								<th class="">购买次数</th>
								<th class="">转化率</th>
							
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
									<td class="j-odd4">${list.productId }</td>
									<td class="j-odd4">${list.productName }</td>
									<td class="j-odd4">${list.rewardRatio }</td>
									<td class="j-odd4">13</td>
									<td class="j-odd4">21</td>
									<td class="j-odd4">12</td>

									<td class="j-odd4">${list.createTime }</td>
									<td class="j-odd4">${list.startTime }</td>
									<td class="j-odd4">${list.endTime }</td>
									<td class="j-odd4">
									<c:if test="${list.rewardStatus=='RUNNING' }">
									进行中
									</c:if>
									<c:if test="${ list.rewardStatus=='READY' }">
									即将开始
									</c:if>
									 <c:if test="${ list.rewardStatus=='END' }">
									结束
									</c:if>
									<c:if test="${ list.rewardStatus=='CLOSED' }">
									关闭
									</c:if>
									</td>
									<td class="j-odd4">
										<c:if test="${list.rewardStatus=='RUNNING' || list.rewardStatus=='READY' }">
											<a href="/shop/offerReward/add?stop&id=${list.id }" >暂停</a> 
										</c:if>
											<c:if test="${list.rewardStatus=='END' || list.rewardStatus=='CLOSED' }">
										<a href="/shop/offerReward/add?delete&id=${list.id }" >删除</a> 
										</c:if>
										
									

									</td>
								
							
								
							
								</tr>
							</c:forEach>
						</tbody>
					</table>
				
					<page:page maxPages="${maxPages}" page="${page }" url="offerReward" parameter=""></page:page>
				</div>
			</div>
		</div>
</div>
</div>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">商家悬赏</h4>
      </div>
      <div class="modal-body">
<h1 style="font-size:20px ">1、什么是“商家悬赏”</h1>
<h1 style="font-size:10px ">“商家悬赏”是途铃推出的一个鼓励用户分享商品的有偿推广活动。</h1>


<h1 style="font-size:20px ">2、参加“商家悬赏”有什么好处</h1>

<h1 style="font-size:10px ">参加“商家悬赏”可以让更多的用户了解到自己的商品，并形成更多的购买行为，产生更多的利润！</h1>

<h1 style="font-size:20px ">3、怎样参与“商家悬赏”</h1>

<h1 style="font-size:10px ">参加限时特惠的商品方可参加商家悬赏，商家申报限时特惠商品时可进行选择</h1>

<h1 style="font-size:20px ">4、“商家悬赏”额度</h1>

<h1 style="font-size:10px ">商品金额乘以商家设置的百分比，商家可根据商品的情况自由设置，避免造成损失</h1>

<h1 style="font-size:20px ">5、“商家悬赏”形式</h1>

<h1 style="font-size:10px ">限时特惠的商品参加“商家悬赏”，对于参加了“商家悬赏”的商品，用户只要进行了分享，而其他用户通过分享的链接完成了交易，就可获得“商家悬赏”的金额</h1>
	<h1 style="font-size:15px "></h1>
	<h1 style="font-size:15px ">本活动最终解释权归途铃所有</h1>
	</div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> -->
<!--         <button type="button" class="btn btn-primary">确定</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

