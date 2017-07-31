<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" />
<div class="j-content">
	<!--content  左边下部部分-->
	
<form class="form-horizontal" action="<%=path%>/offerReward?addsss" method="post"  enctype="multipart/form-data" id="myForm">
<div class="col-xs-my-40" style="padding-top:10px">
	<div id="info" class="form-group">　
		<div class="col-xs-offset-1">
	 		<input type="button"  data-toggle="modal" data-target="#modalId" class="btn button-rounded button-action  button-small" value="添加商品">
		</div>
	</div>	


	 	
<!-- 	 			商品名称		 -->
		<div id="shopName" class="">
		</div>


		
	<div class="form-group">
		<label class="col-xs-2 control-label">开始时间</label>
		<div class="col-xs-5">
			<input readOnly="true" class="form-control datetimepicker" id="starttime"  size="16" type="text"
								value="<fmt:formatDate value="${shopOrdersQuery.orderTimeStart }" pattern="yyyy-MM-dd"/>">
		</div>	
	</div>
	<div class="form-group">
		<label class="col-xs-offset-2">   开始时间须是24小时之后</label>
	</div>
	
	<!-- 		结束时间 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">结束时间</label>
		<div class="col-xs-5">
			<input readOnly="true"  class="form-control datetimepicker" id="endtime"  size="16" type="text" value="<fmt:formatDate value="${shopOrdersQuery.orderTimeEnd }" pattern="yyyy-MM-dd"/>">
    	</div>
    </div>
    

    
    
<!-- 			商家悬赏 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">商家悬赏</label>
		<div class="col-xs-5 form-inlin">
			<label class="form-group fl checkbox">悬赏金额为商品金额的
			</label>
			<div class="col-xs-4">						
				<div class="input-group">
				  <input  name="rewardRatio"  maxlength="7" datatype="n" ignore="ignore" class="form-control" type="text" />
				  <span class="input-group-addon" id="basic-addon2">%</span>
				</div>
			</div>
		
       	</div>
	</div>
	
<!-- 	<div class="form-group"> -->
<!-- 		<label class="col-xs-offset-2">悬赏后可获得更多订单哦！<input type="button"  data-toggle="modal" data-target="#myModal" class="btn button-rounded button-action  button-small" value="什么是商家悬赏"></label> -->
<!-- 	</div> -->
		<!-- 		结束时间 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">备注</label>
		<div class="col-xs-5">
		<textarea    name="remarks" onKeyDown="checkMaxInput(this)"  onKeyUp="checkMaxInput(this)" datatype="*"  maxlength="50" cols="65" rows="3" class="required"></textarea>
	 <font align="right" id=remLen><b></b></font>
	</div>
    </div>
    
	<div class="form-group">
		<div class="col-xs-offset-3">
			<button type="button" class="btn btn-success"   onclick="sub()" class="left" >提交</button>
		
		     <a href=/shop/promotion class="btn btn-default">取消</a>

		</div>
			</div>

                
	</div>
</form>

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


<div class="modal fade" id="modalId" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">添加</h4>
      </div>
      <div class="modal-body">

			<form action="<%=path%>/promotion/add" method="page"
			id="queryForm">
				<input name="page" value=1 type="hidden"/>
					
						
						<div class="row form-horizontal" style="padding-top:6px;">
							<label class="col-xs-1 control-label">分类</label>
							<div class="col-xs-3">
								<select name="shoppingCategoryId" id="selectDate" class="form-control">
									<option value="">请选择</option>
									<c:forEach items="${shoppingCategories }" var="shoppingCategory">
										<c:if
											test="${shoppingProductQuery.shoppingCategoryId ==  shoppingCategory.id}">
											<option selected="selected" value="${shoppingCategory.id }">${shoppingCategory.name
												}</option>
										</c:if>
										<c:if
											test="${shoppingProductQuery.shoppingCategoryId !=  shoppingCategory.id}">
											<option value="${shoppingCategory.id }">${shoppingCategory.name
												}</option>
										</c:if>
									</c:forEach>
								</select>
							</div>
							<div class="col-xs-3">
								<input type="text" name="content" id="postText"
									value="${shoppingProductQuery.name}${shoppingProductQuery.sysNumber}${shoppingProductQuery.productNumber}"
									class="form-control" placeholder="请输入商品名称">
							</div>
							<input name="state" value="7" type="hidden">
							<div class="col-xs-3">
								<button type="submit" class="button  button-rounded button-action  button-small">搜索</button>
							
								<a href="<%=path%>/promotion/22?add&page=1&size=4&state=7" class="button  button-rounded button-action  button-small">重置</a>
							</div>
							
						</div>
				</form>
			

			<!--tab 内容切换-->
			<div class="tab_container">
				<div id="tab1" class="tab_content" style="display: block;">
					<div class="table-scrollable">
						<table id="simpledatatable"
							class="table table-striped table-bordered table-hover dataTable no-footer"
							aria-describedby="simpledatatable_info">
							<thead>
								<tr role="row">
								
									<th class="">商品名称</th>
									<th class="">分类</th>
									<th class="">销售价格</th>
									<th class="">库存</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${shoppingproductses }" var="shoppingproduct">
									<tr class="odd">										
										<td class="j-odd2">
		                            
										<a href='javascript:void(0)'  onclick='add("${shoppingproduct.id},${shoppingproduct.name}")'>${shoppingproduct.name}</a></td>
										<td class="j-odd2">
											${shoppingproduct.shoppingCategoryId.name}</td>
										<td class="j-odd2">￥${shoppingproduct.price}元</td>
									
											<td class="j-odd2">${shoppingproduct.stock }个</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						<page:page maxPages="${maxPages}"  page="${page }" url="" parameter=""></page:page>
						
					</div>
				</div>
			</div>

      </div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> -->
<!--         <button type="button" class="btn btn-primary">确定</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->







<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">
function add(obj){
	strs=obj.split(","); 
	var sid=strs[0];
	var sName=strs[1];
	var htm ='<div class="form-group">';
	htm+='<label class="col-xs-2 control-label">商品名称：</label><div><input type="hidden" name="productId" value="'+sid+'" /></div>';
	htm+='	<div  class="col-xs-5 form-control-static"><input id="productName" value="'+sName+'" name="productName"  class="form-control" type="text" /></div><div class="col-xs-offset-1">';
	htm+='	<input type="button"  data-toggle="modal" data-target="#modalId" class="btn button-rounded button-action  button-small" value="修改商品">';
	htm+='</div>';
	htm+='  </div>';
	$('#shopName').empty().append(htm);
	$("#info").hide();
	$('[data-dismiss="modal"]').trigger('click');

	
}



$(document).ready(function() {
	
	if(${state}==7){
	
		$('[data-target="#modalId"]').trigger('click');
	}
		var selected = $("#selectDate option:selected").val();
		$("#postDateStart").attr("name", selected + "Start");
		$("#postDateEnd").attr("name", selected + "End");

		var value = $("#inputNumber option:selected").val();
		$("#postText").attr("name", value);
	});


     var day3 = new Date();
     day3.setTime(day3.getTime()+24*60*60*1000);
	$("#starttime").datetimepicker({
// 		startView:2,
		format:"yyyy-mm-dd hh:ii:00",
		startDate: day3,
// 		minView:"month",
// 		todayBtn : "linked", 
// 		todayHighlight : true,
		language: "zh-CN",
		showMeridian:true,
		autoclose:true,
		}).on('changeDate',function(ev){
		var starttime=$("#starttime").val();
		$("#endtime").datetimepicker('setStartDate',starttime);
		$("#starttime").datetimepicker('hide');
		});
		
	$("#starttime").datetimepicker({
		autoclose:true,
		showMeridian:true,
		}).on('show',function(ev){
		 $("#endtime").datetimepicker('hide');
		 
		});
 $("#endtime").datetimepicker({
// 		startView:2,
// 		minView:"month",
		format:"yyyy-mm-dd hh:ii:00",
// 		todayBtn : "linked",
// 		todayHighlight : true,
		language: "zh-CN",
		autoclose:true,
		showMeridian:true,
		}).on('changeDate',function(ev){
		 var starttime=$("#starttime").val();
		 var endtime=$("#endtime").val();
		 $("#starttime").datetimepicker('setEndDate',endtime);
		 $("#endttime").datetimepicker('hide');
		});
		 
       $("#endtime").datetimepicker({
		autoclose:true,
		showMeridian:true,
		}).on('show',function(ev){
		 $("#starttime").datetimepicker('hide');
		 
		});	 
		 
	function sub(str){
		var ccc = $("input[name='partake']:checked").val();
// 		var ccc = $("input[name='partake']").val();
         var endtime=$("#endtime").val();
         var starttime=$("#starttime").val();
         $("#myForm").append('<input type="hidden" name="Start" value="'+starttime+'"/>');
         $("#myForm").append('<input type="hidden" name="End" value="'+endtime+'"/>');
	
			
	 		var sss= $("input[name='rewardRatio']").val();
	 		
	 		if(sss==""){
	 			alert("请填写佣金比例");
				 return false	
	 		}
		
	
		if($("#productName").val()=="" ||$("#productName").val()==null){
			alert("请选择商品");
			 return false	
			
		}
		
	
		if($("#starttime").val()==""){
			alert("请填写开始时间");
			 return false	
			
		}
		if($("#endtime").val()==""){
			alert("请填写结束时间");
			 return false	
			
		}
	
	 
		document.forms['myForm'].submit();
	}
	$("#productNum").change(function(){
	
		 var productNum=$("#productNum").val();
		 productNum=Number(productNum)
	     var pNum=$("#pNum").val();
		 pNum=Number(pNum)
	     if(productNum>pNum){
	    		alert("参与数量不能大于库存");
	    		 $("#productNum").val("");
	    		return false	
	    		
	     }
	});
	$("#rebatePrice").change(function(){
     var price=$("#price").val();
     var rebatePrice=$("#rebatePrice").val();
     if(rebatePrice>price){
    		alert("活动价不能大于销售价");
    		 $("#rebatePrice").val("");
    		return false	
    		
     }
	
	});
	
	maxLen = 50; //定义用户可以输入的最多字数
	function checkMaxInput(obj) {
		
	if (obj.value.length > maxLen){ //如果输入的字数超过了限制
	obj.value = obj.value.substring(0, maxLen); //就去掉多余的字
	remLen.innerText = '您输入的内容超出了字数限制'
	}
	else{
	remLen.innerText = '还剩下' + (maxLen - obj.value.length) + '字';//计算并显示剩余字数
	}
	}
</script>
