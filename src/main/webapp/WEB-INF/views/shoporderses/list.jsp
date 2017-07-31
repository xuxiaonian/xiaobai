<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<style>
.fj1 {
	position: absolute;
	width: 100px
}

.fd {
	position: relative;
	background: #FFF;
	z-index: 1;
	margin-top: 17px;
}
</style>
<div class="j-content">
	<!--content  左边下部部分-->
	<div class="col-xs-my-1">&nbsp;</div>
    <input type="hidden" value="<%=path %>" id="shop_path"/>
	<div class="col-xs-my-40">
		<form action="<%=path%>/shoporderses" method="get" id="queryForm">
			<input type="hidden" id="pageId" name="page" value="1" /> <input type="hidden" id="hiddenId" />
			<div class="j-right">
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" id="selectDate" onchange="changeDate(this)" class="form-control">
							<c:if test="${(!empty shopOrdersQuery.orderTimeStart)||!empty shopOrdersQuery.orderTimeEnd }">
								<option selected="selected" value="orderTime">下单时间</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.orderTimeStart) && empty shopOrdersQuery.orderTimeEnd }">
								<option value="orderTime">下单时间</option>
							</c:if>
							<c:if test="${(!empty shopOrdersQuery.payedAtStart)||!empty shopOrdersQuery.payedAtEnd }">
								<option selected="selected" value="payedAt">支付时间</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.payedAtStart) && empty shopOrdersQuery.payedAtEnd }">
								<option value="payedAt">支付时间</option>
							</c:if>
							<c:if test="${(!empty shopOrdersQuery.sendTimeStart)||!empty shopOrdersQuery.sendTimeEnd }">
								<option selected="selected" value="sendTime">发货时间</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.sendTimeStart) && empty shopOrdersQuery.sendTimeEnd }">
								<option value="sendTime">发货时间</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<c:if test="${(!empty shopOrdersQuery.orderTimeStart)}">
							<input class="form-control datetimepicker" id="postDateStart" name="orderTimeStart" size="16" type="text"
								value="<fmt:formatDate value="${shopOrdersQuery.orderTimeStart }" pattern="yyyy-MM-dd"/>">
						</c:if>

						<c:if test="${(!empty shopOrdersQuery.payedAtStart)}">
							<input class="form-control datetimepicker" id="postDateStart" name="orderTimeStart" size="16" type="text" value="<fmt:formatDate value="${shopOrdersQuery.payedAtStart }" pattern="yyyy-MM-dd"/>">
						</c:if>
						<c:if test="${(!empty shopOrdersQuery.sendTimeStart)}">
							<input class="form-control datetimepicker" id="postDateStart" name="orderTimeStart" size="16" type="text"
								value="<fmt:formatDate value="${shopOrdersQuery.sendTimeStart }" pattern="yyyy-MM-dd"/>">
						</c:if>
						<c:if test="${(empty shopOrdersQuery.orderTimeStart) && (empty shopOrdersQuery.payedAtStart) && (empty shopOrdersQuery.sendTimeStart)}">
							<input class="form-control datetimepicker" id="postDateStart" name="orderTimeStart" size="16" type="text" value="">
						</c:if>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="demo">
					<div class="col-xs-my-1 h4">-</div>
				</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<c:if test="${(!empty shopOrdersQuery.orderTimeEnd)}">
							<input class="form-control datetimepicker" id="postDateEnd" name="orderTimeEnd" size="16" type="text" value="<fmt:formatDate value="${shopOrdersQuery.orderTimeEnd }" pattern="yyyy-MM-dd"/>">
						</c:if>
						<c:if test="${(!empty shopOrdersQuery.payedAtEnd)}">
							<input class="form-control datetimepicker" id="postDateEnd" name="orderTimeEnd" size="16" type="text" value="<fmt:formatDate value="${shopOrdersQuery.payedAtEnd }" pattern="yyyy-MM-dd"/>">
						</c:if>
						<c:if test="${(!empty shopOrdersQuery.sendTimeEnd)}">
							<input class="form-control datetimepicker" id="postDateEnd" name="orderTimeEnd" size="16" type="text" value="<fmt:formatDate value="${shopOrdersQuery.sendTimeEnd }" pattern="yyyy-MM-dd"/>">
						</c:if>

						<c:if test="${(empty shopOrdersQuery.orderTimeEnd) && (empty shopOrdersQuery.payedAtEnd) && (empty shopOrdersQuery.sendTimeEnd)}">
							<input class="form-control datetimepicker" id="postDateEnd" name="orderTimeEnd" size="16" type="text" value="">
						</c:if>
					</div>
					<div id="datePlugin"></div>
				</div>
				<div class="col-xs-my-3">&nbsp;</div>
				<div class="col-xs-my-7">
					<div class="demo">
						<select name="" id="inputNumber" onchange="changeName(this)" class="form-control">
							<c:if test="${(!empty shopOrdersQuery.orderNumber)}">
								<option selected="selected" value="orderNumber">订单编号</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.orderNumber)}">
								<option value="orderNumber">订单编号</option>
							</c:if>
							<c:if test="${(!empty shopOrdersQuery.productName)}">
								<option selected="selected" value="productName">商品名称</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.productName)}">
								<option value="productName">商品名称</option>
							</c:if>
							<c:if test="${(!empty shopOrdersQuery.att1)}">
								<option selected="selected" value="att1">收货人</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.att1)}">
								<option value="att1">收货人</option>
							</c:if>
							<c:if test="${(!empty shopOrdersQuery.att2)}">
								<option selected="selected" value="att2">收货人联系方式</option>
							</c:if>
							<c:if test="${(empty shopOrdersQuery.att2)}">
								<option value="att2">收货人联系方式</option>
							</c:if>
						</select>
					</div>
				</div>
				<div class="col-xs-my-6 ">
					<div class="demo">
						<input type="text" name="orderNumber" id="postText" value="${shopOrdersQuery.orderNumber }${shopOrdersQuery.productName }${shopOrdersQuery.att1 }${shopOrdersQuery.att2 }" class="form-control"
							placeholder="请输入订单编号">
					</div>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<button type="submit" class="button  button-rounded button-action  button-small" style="float: right;">搜索</button>
				</div>
				<div class="col-xs-my-1">&nbsp;</div>
				<div class="col-xs-my-4 j-btn-act">
					<a href="<%=path%>/shoporderses?page=1" class="button  button-rounded button-action  button-small">重置</a>
				</div>
			</div>
		</form>
	</div>
	<!--content  右边上部部分-->
	<!--tab切换-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-content-top">
		<c:if test="${ empty shopOrdersQuery.orderStatus.id }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)">全部订单</button>
		</c:if>
		<c:if test="${ !(empty shopOrdersQuery.orderStatus.id) }">
			<button class="button " onclick="queryShopOrdersByStatus(this.value)">全部订单</button>
		</c:if>

		<c:if test="${shopOrdersQuery.orderStatus.id == 1 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="1">待付款</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id != 1 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="1">待付款</button>
		</c:if>

		<c:if test="${shopOrdersQuery.orderStatus.id == 2 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="2">待发货</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id != 2 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="2">待发货</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id == 3 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="3">已发货</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id != 3 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="3">已发货</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id == 4 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="4">交易成功</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id != 4 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="4">交易成功</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id == 5 }">
			<button class="button button-action" onclick="queryShopOrdersByStatus(this.value)" value="5">交易失败</button>
		</c:if>
		<c:if test="${shopOrdersQuery.orderStatus.id != 5 }">
			<button class="button" onclick="queryShopOrdersByStatus(this.value)" value="5">交易失败</button>
		</c:if>
		<!--tab 内容切换-->
		<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
			   <div  id="import_excel"> 
			         <a href="<%=path%>/Excel/物流信息的导入.xls" title="物流信息的导入.xls">下载导入模板(物流信息的导入.xls)</a>
			         <input type="file" name="file_excel" id="file_excel" txlFillIn="isNotNull" title="链接图片" value="请选择需要导入的excel文件"/>
			         <button class="button"   onclick="importExcel()" >导入</button>
			         <button class="button"   onclick="exportExcel()">导出</button>
			   </div>
			    <div id="export_excel"> 
			         <button class="button"   onclick="exportExcel()">导出</button>
			    </div>
			   
			   
				<div class="table-scrollable">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">订单编号</th>
								<th class="">下单时间</th>
								<th class="">商品信息</th>
								<th class="">收货人信息</th>
								<th class="">订单金额</th>
								<th class="">交易状态</th>
								<th class="">退款状态</th>
								<th class="">操作</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${shoporderses }" var="shoporder">
								<tr class="odd">
									<td class="j-odd1">${shoporder.orderNumber }</td>
									<td class="j-odd2"><fmt:formatDate value="${shoporder.orderTime}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
									<td class="j-odd2"><c:forEach items="${shoporder.shopOrderList }" var="shopOrderList">
										${shopOrderList.productName } * ${shopOrderList.buyCouts }
										</br>
										</c:forEach></td>
									<td class="j-odd2">
										<div class="fj1">
											${shoporder.att1 } 
											<c:if test="${!empty shoporder.remarks }">
												<img onmouseout="fdhidden(${shoporder.id})" onmouseover="fd(${shoporder.id})" style="position: absolute; border: 0px; padding: 0px; width: 12px; height: 17px; float: right;" class="img " src="<%=path%>/images/message.png">
											</c:if>
											</br>${shoporder.att2 }
										</div>
										<div id="fd${shoporder.id}" style="display: none;" class="fd">${shoporder.remarks }</div>
									</td>
									<td class="j-odd3">${shoporder.collect }</td>
									<td class="j-odd4">${shoporder.orderStatus.name }</td>
									
									<td class="j-odd4">${shoporder.shopOrderRetruns[0].shopOrderRetrunType.name }</td>
							
									<td><c:if test="${shoporder.orderStatus.id==2 && !shoporder.isReturn}">
											<a href="<%=path%>/shoporderses/${shoporder.id}" class="j-odd5">发货</a>
											</br>
										</c:if> <c:if test="${shoporder.isReturn &&!shoporder.isReturnSucc}">
											<a href="<%=path%>/shoporderretruns/${shoporder.id}?orderToShow" class="j-odd5">处理退款</a>
											</br>
										</c:if> <c:if test="${shoporder.isReturn && shoporder.isReturnSucc}">
											<a href="<%=path%>/shoporderretruns/${shoporder.id}?orderToShow" class="j-odd5">查看已处理退款</a>
											</br>
										</c:if> <a href="<%=path%>/shoporderses/${shoporder.id}" class="j-odd6">订单详情</a> <!-- </br> <a href="#" class="j-odd7">取消订单</a> --></td>
								</tr>
							</c:forEach>
						</tbody>
					</table>
					<page:page maxPages="${maxPages}" page="${page }" url="shoporderses" parameter="&${list}"></page:page>
				</div>
			</div>
		</div>
	</div>
</div>


<div class="modal fade" id="modalId" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="btn_close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">下载</h4>
      </div>
      <div class="modal-body" id="download"></div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->




<link href="<%=path%>/css/common.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript" src="<%=path%>/js/ajaxfileupload.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
	$(function(){
		var type=$("div.j-content-top .button-action").attr("value");
		if(type==undefined ||  type=="undefined"){
			type=0;
		}
		excel(type);
		var selected = $("#selectDate option:selected").val();
		$("#postDateStart").attr("name", selected + "Start");
		$("#postDateEnd").attr("name", selected + "End");
		var value = $("#inputNumber option:selected").val();
		$("#postText").attr("name", value);
		$("#btn_close").click(function(){
			 $('#modalId').css({'display':'none','opacity':'-1'});
		});
		
	});
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
<script type="text/javascript">
	function fd(id) {
		$("#fd"+id).attr("style", "display: block;");
	}
	function fdhidden(id){
		$("#fd"+id).attr("style", "display: none;");
	}
	
	function queryShopOrdersByStatus(id) {
		$("#pageId").val("1");
		$("#hiddenId").after('<input type="hidden" name="orderStatus" value="'+id+'"/>');
		$("#queryForm").submit();
	}
    
	function excel(id){
		 if(id==2){
		    	$("#import_excel").attr("style", "display: block");
		    	$("#export_excel").attr("style", "display: none");
		    }else{
		    	$("#import_excel").attr("style", "display: none");
		    	$("#export_excel").attr("style", "display: block");
		    }
	}
	
	function changeName(obj) {
		var index = obj.selectedIndex; // 选中索引
		var value = obj.options[index].value;
		$("#postText").attr("name", value);
	}

	function changeDate(obj) {
		var index = obj.selectedIndex; // 选中索引
		var value = obj.options[index].value;
		$("#postDateStart").attr("name", value + "Start");
		$("#postDateEnd").attr("name", value + "End");
	}
function exportExcel(){
	    $('#modalId').css({'display':'block','opacity':'1'});
		var type=$("div.j-content-top .button-action").attr("value");
		if(type==undefined ||  type=="undefined"){
			type=0;
		}
		var selectDate=$("#selectDate").find("option:selected").val();
		var postDateStart= $("#postDateStart").val();
		var postDateEnd =$("#postDateEnd").val();
		
		var inputNumber=$("#inputNumber").find("option:selected").val();
		var postText=$("#postText").val();
		
		var param="&type="+type+"&selectDate="+selectDate+"&postDateStart="+postDateStart+"&postDateEnd="+postDateEnd+"&inputNumber="+inputNumber+"&postText="+postText
		var url=$("#shop_path").val()+"/shoporderses?method=exportExcel"+param;
		$.ajax({ 
			　　type:'get', //请求类型 ： post get 两种 
			　　url:url, 
			　　async:false, //设置异步/同步 默认为true true：异步 false：同步
			　　datatype: "json",//返回数据的格式"xml", "html", "script", "json", "jsonp", "text". 
			　　success:function(data){ //回掉函数 执行成功后 
				if(data==null || data==""){
					alert("导出失败");
					return;
				}
				if(data=="0"){
					alert("没有数据要导出");
					return;
				}
			    var urlPath=$("#shop_path").val()+"/"+data;
			    $("#download").empty().append("<a href='"+urlPath+"'>请下载</a> ");
		    	}
			}); 
	}		
	
function setContent(str) {
		str = str.replace(/<\/?[^>]*>/g,''); //去除HTML tag
		str.value = str.replace(/[ | ]*\n/g,'\n'); //去除行尾空白
		return str;
	}	
function importExcel(){
	    var urlVar=$("#shop_path").val()+"/shoporderses?method=importExcel";
	    if($("#file_excel").val()==""){
	    	return;
	    }
        $.ajaxFileUpload({
                url: urlVar, //用于文件上传的服务器端请求地址
                type: "POST",  
                secureuri: false, //是否需要安全协议，一般设置为false
                fileElementId: 'file_excel', //文件上传域的ID
                dataType: 'json', //返回值类型 一般设置为json
                success: function (data)  //服务器成功响应处理函数
                {   
                	var result =setContent(data);
                	if(result=="0"){
                		alert("文件格式错误");
                	}else{
                		 $('#modalId').css({'display':'block','opacity':'1'});
                		 var urlExcel=result.split("#")[1];
                    	 var urlPath=$("#shop_path").val()+"/"+urlExcel;
                    	 var html=result.split("#")[0];
                		 if(urlExcel!=null && urlExcel!="null" && urlExcel!="" ){
                			 html+="<a href="+urlPath+">请下载</a>";
                		 }
         			     $("#download").empty().append(html);
                	}
                }
            }
        ) 
        return false;
}
</script>