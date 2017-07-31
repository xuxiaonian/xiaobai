<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<div class="j-content">
	<div class="col-xs-my-1">&nbsp;</div>
	<!--左侧个人信息与导航部分-->
	<div class="col-xs-my-40">
		<!--导航-->
		<!--content部分-->
		<div class="col-xs-my-45 j-bodyOR">
			<!--订单详情-->
			<div class="col-xs-my-48">
				<!--条件搜索-->
				<div class="col-xs-my-48 j-search">
					<div class="col-lg-5">
						<div class="input-group">
							<div class="input-group-btn">
								<button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
									商品名称 <span class="caret"></span>
								</button>
								<ul class="dropdown-menu" role="menu">
									<li><a href="#">阿鹏哥云南特产鲜花饼</a></li>
									<li><a href="#">阿鹏哥云南特产鲜花饼</a></li>
								</ul>
							</div>
							<!-- /btn-group -->
							<input type="text" class="form-control">
						</div>
						<!-- /input-group -->
					</div>
					<!-- /.col-lg-5 -->
					<!--商品名称-->
					<div class="col-xs-5">
						<div class="input-group">
							<span class="input-group-addon"> 评价时间 </span> <input type="text" value=" " class="form-control" placeholder="请输入产品名称">
						</div>
					</div>
					<!--日期选择-->
					<div class="col-xs-2">
						<button class="button button-action button-rounded" value="submit">查询</button>
					</div>
					<!--查询-->
				</div>
				<!--条件搜索-->
				<!--留言板-->
				<div class="col-xs-my-48">
					<div id="tab1" class="tab_content" style="display: block;">
						<div class="table-scrollable">
							<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
								<thead>
									<tr role="row">
										<th class="">用户</th>
										<th class="">评价信息</th>
										<th class="">商品信息</th>
										<th class="">操作</th>
									</tr>
								</thead>
								<tbody>
									<tr class="odd">
										<td class="j-odd2 j-table-padd5">用户10999</td>
										<td class="j-odd2">
											<div class="j-star j-table-left">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
											</div> <br />
											<div class="j-table-age j-table-left">
												<h1>送给老妈的，老妈收到后说，没白疼我。</h1>
											</div> <br />
											<div class="j-odd2 j-margin50 j-table-padd5">
												<span class="j-table-left">订单编码：201609231999</span><br /> <span class="j-table-left">评价时间：2016-09-23 17:16</span>
											</div>
										</td>
										<td class="j-odd2">
											<div class="j-odd2 j-margin50 j-table-padd5">
												<span>阿鹏哥云南特产鲜花饼*1</span><br /> <span>阿鹏哥云南袋装普洱茶*2</span>
											</div>
										</td>
										<td class="j-table-padd5"><a onclick="reply()" name="">回复</a></td>
									</tr>
									<tr class="odd">
										<td class="j-odd2 j-table-padd5">用户10999</td>
										<td class="j-odd2">
											<div class="j-star j-table-left">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
											</div> <br />
											<div class="j-table-age j-table-left">
												<h1>送给老妈的，老妈收到后说，没白疼我。</h1>
											</div> <br />
											<div class="j-odd2 j-margin50 j-table-padd5">
												<span class="j-table-left">订单编码：201609231999</span><br /> <span class="j-table-left">评价时间：2016-09-23 17:16</span>
											</div>
										</td>
										<td class="j-odd2">
											<div class="j-odd2 j-margin50 j-table-padd5">
												<span>阿鹏哥云南特产鲜花饼*1</span><br /> <span>阿鹏哥云南袋装普洱茶*2</span>
											</div>
										</td>
										<td class="j-table-padd5"><a onclick="reply()" name="">回复</a></td>
									</tr>
									<tr class="odd">
										<td class="j-odd2 j-table-padd5">用户10999</td>
										<td class="j-odd2">
											<div class="j-star j-table-left">
												<i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i> <i class="fa fa-star"></i>
											</div> <br />
											<div class="j-table-age j-table-left">
												<h1>送给老妈的，老妈收到后说，没白疼我。</h1>
											</div> <br />
											<div class="j-odd2 j-margin50 j-table-padd5">
												<span class="j-table-left">订单编码：201609231999</span><br /> <span class="j-table-left">评价时间：2016-09-23 17:16</span>
											</div> <br />
											<div class="j-table-padd5">
												<div class="alert alert-danger" role="alert">
													<h1 style="">回复：感谢您对商品的喜爱,祝您生活愉快!</h1>
												</div>
											</div>
										</td>
										<td class="j-odd2">
											<div class="j-odd2 j-margin50 j-table-padd5">
												<span>阿鹏哥云南特产鲜花饼*1</span><br /> <span>阿鹏哥云南袋装普洱茶*2</span>
											</div>
										</td>
										<td class="j-table-padd5">已回复</td>
									</tr>
								</tbody>
							</table>
							<div class="col-xs-my-6">
								<div class="j-odd2" id="simpledatatable_info" role="alert" aria-live="polite" aria-relevant="all">信息总条数：11条</div>
							</div>
							<div class="col-xs-my-23">
								<div id="simpledatatable_paginate" style="margin-top: -22px; float: right;">
									<ul class="pagination">
										<li class="prev disabled"><a href="#">上一页</a></li>
										<li class="active"><a href="#">1</a></li>
										<li><a href="#">2</a></li>
										<li><a href="#">3</a></li>
										<li><a href="#">4</a></li>
										<li><a href="#">...</a></li>
										<li class="next"><a href="#">下一页</a></li>
									</ul>
								</div>
							</div>
						</div>
					</div>
				</div>
				<!--留言板-->
			</div>
		</div>
		<!--订单详情-->
	</div>
</div>
<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<!--dialog页面的弹出引用js文件-->
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
	function reply(){
			art.dialog.open('<%=path %>/areases?form',{id:'send',title:'回复评价',width:650,height:250,lock:true, background:'#000000',
				close: function() {  
					location.reload();
	            }	
			});
	}
</script>