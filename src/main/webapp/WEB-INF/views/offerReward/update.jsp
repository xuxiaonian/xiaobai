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
	
<form class="form-horizontal" action="<%=path%>/promotion/wew?updateKept" method="post"  enctype="multipart/form-data" id="myForm">
<div class="col-xs-my-40" style="padding-top:10px">
<!-- 	<div class="form-group"> -->
<!-- 		<div class="col-xs-offset-1"> -->
<!-- 	 		<input type="button"  data-toggle="modal" data-target="#modalId" class="btn button-rounded button-action  button-small" value="添加商品"> -->
<!-- 		</div> -->
<!-- 	</div>	 -->

	<div class="form-group">
		<label class="col-xs-2 control-label">商品名称</label>
		<div class="col-xs-5"><input id="rebateName"  name="rebateName" maxlength="7" datatype="n" ignore="ignore" value="${zListPromotion.rebateName }" class="form-control" type="text" />
		<input id="productId"  name="productId"  value="${zListPromotion.productId }" type="hidden" /> 
		 </div>
	</div>
	 	
<!-- 	 			商品名称		 -->
<!-- 		<div class="form-group">'; -->
<%-- 	<label class="col-xs-2 control-label">商品名称：</label><div><input type="hidden" name="productId" value="${shoppingProducts.id}" /></div> --%>
<%-- 		<div  class="col-xs-5 form-control-static">${shoppingProducts.name}</div> --%>
<!-- 	 </div> -->
<!-- 		规格 -->
		<div id="tableHtml" class="">	
				<div class="form-group"> <div class="col-xs-10 col-xs-offset-2"><table class="table table-bordered"><thead><tr><td></td><td>规格</td><td>库存</td><td>市场价格</td><td>销售价格</td></tr></thead><tbody>';
       		<c:forEach items="${shoppingProductsSpec }" var="list" varStatus="status">
       			<tr>
       			  <c:if test="${list.id == zListPromotion.productsSpecId}">
       		<td><input type="radio" name="productsSpecId" value="${list.id }" checked></td>
       		</c:if>
       		 <c:if test="${list.id != zListPromotion.productsSpecId}">
       		<td><input type="radio" name="productsSpecId" value="${list.id }" ></td>
       		</c:if>
       			<td>${list.specName }</td>
       		   <td>${list.productsNum }</td><input type="hidden" id="pNum" name="price" value="${list.productsNum }" />
       			<td>${list.orgPrice }</td><input type="hidden"  id="price" name="price" value="${list.orgPrice }" />
       			</td><input type="hidden"  id="orgPrice" name="orgPrice" value="${list.price }" />
       			</tr>  
       		</c:forEach>
       		
       		</tbody></table></div></div>
		</div>
<!-- 		活动价 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">活动价</label>
		<div class="col-xs-5"><input id="rebatePrice" name="rebatePrice" maxlength="7"  value="${zListPromotion.rebatePrice }" datatype="n" ignore="ignore" class="form-control" type="text" /> </div>
	</div>

<!-- 		*  参与活动数量 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">参与活动数量</label>
		<div class="col-xs-5">
			<input name="productNum"  id="productNum" maxlength="7" value="${zListPromotion.productNum }"   datatype="n" ignore="ignore" class="form-control" type="text" />
		</div>
	</div>
		<input name="id" type="hidden" value="${zListPromotion.id }">
		<div class="form-group">
		<label class="col-xs-2 control-label">开始时间</label>
		<div class="col-xs-5">
			<input class="form-control datetimepicker" id="starttime"  size="16" type="text"
								value="<fmt:formatDate value="${startTime }" pattern="yyyy-MM-dd hh:mm:ss"/>">
		</div>	
	  </div>
	
	<!-- 		结束时间 -->
	<div class="form-group">
		<label class="col-xs-2 control-label">结束时间</label>
		<div class="col-xs-5">
			<input class="form-control datetimepicker" id="endtime"  size="16" type="text" value="<fmt:formatDate value="${endTime }" pattern="yyyy-MM-dd hh:mm:ss"/>">
    	</div>
    </div>
     <div class="form-group">
		<label class="col-xs-2 control-label">每个用户限购数量</label>
		<div class="col-xs-3">
				<select id="brand" name="productLimit" class="form-control">
				
				    	<option value=0>不限制</option>
				    	<option value=1>1</option>
				    	<option value=2>2</option>
				    	<option value=3>3</option>
				    	<option value=4>4</option>
				    	<option value=5>5</option>
				    	<option value=6>6</option>
				    	<option value=7>7</option>
				    	<option value=8>8</option>
				    	<option value=9>9</option>
				    									
					</select>
		</div>
	</div>
    
    
    
<!-- 			商家悬赏 -->
<!-- 	<div class="form-group"> -->
<!-- 		<label class="col-xs-2 control-label">商家悬赏</label> -->
<!-- 		<div class="col-xs-5 form-inlin"> -->
<!-- 			<label class="form-group fl checkbox"> -->
			
<%-- 				<c:if test="${partake == 0}"> --%>
<!-- 			<input id="partake" name="partake" type="radio" value="0" checked/> -->
<%-- 			</c:if> --%>
<%-- 				  <c:if test="${partake != 0}"> --%>
<!-- 			<input id="partake" name="partake" type="radio" value="0" /> -->
<%-- 			</c:if> --%>
<!-- 				参与，悬赏金额为商品金额的 -->
<!-- 			</label> -->
<!-- 			<div class="col-xs-3">						 -->
<!-- 				<div class="input-group"> -->
<%-- 				<c:if test="${partake == 1}"> --%>
<!-- 				  <input name="rewardRatio" id="rewardRatio" maxlength="7"  datatype="n" ignore="ignore" class="form-control" type="text" /> -->
<%-- 				</c:if> --%>
<%-- 				<c:if test="${partake != 1}"> --%>
<%-- 				  <input name="rewardRatio" id="rewardRatio" maxlength="7" value="${zListPromotion.rewardRatio }" datatype="n" ignore="ignore" class="form-control" type="text" /> --%>
<%-- 				</c:if> --%>
<!-- 				  <span class="input-group-addon" id="basic-addon2">%</span> -->
<!-- 				</div> -->
<!-- 			</div> -->
			
<!--        		<label class="checkbox"> -->
       		
<%--        		<c:if test="${partake == 1}"> --%>
<!--        		<input name="partake" type="radio" value="1" checked/>不参与 </label> -->
<%--        		</c:if> --%>
<%--        		<c:if test="${partake != 1}"> --%>
<!--        		<input name="partake" type="radio" value="1" />不参与 </label> -->
<%--        		</c:if> --%>
<!--        		</div> -->
<!--        	</div> -->
	</div>
	
	<div class="form-group">
		<label class="col-xs-offset-2">悬赏后可获得更多订单哦！</label>
	</div>
	
	<div class="form-group">
		<div class="col-xs-offset-3">
			<button type="button" class="btn btn-success"   onclick="subd()" class="left" >提交</button>
<!-- 			<button type="reset" class="btn btn-warning">取消</button> -->
			 <a href=/shop/promotion class="a-upload">取消</a>
		</div>
		
	</div>

                
	</div>
</form>


<script type="text/javascript" src="<%=path%>/js/jquery-1.9.1.js"></script>
<script type="text/javascript" src="<%=path%>/js/date.js"></script>
<script type="text/javascript" src="<%=path%>/js/iscroll.js"></script>
<script type="text/javascript" src="<%=path%>/js/myjs.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript"
	src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
<script type="text/javascript">

var brand='${zListPromotion.productLimit}';//这里后台传到页面的值  

if(brand!=""){  
    var s = document.getElementById("brand"); //获取select对象  
    var ops = s.options;    
    for(var i=0;i<ops.length; i++){    
        var tempValue = ops[i].value;   
        if(tempValue == brand)  
        {    
            ops[i].selected = true;  //如果后台的值与下拉列表的某一个value相等，就设置此项为选中项  
            break;    
        }    
    }     
}  

// $(function({
// 	$('.datetimepicker').datetimepicker({
// 		language: "zh-CN",
// 		format:"yyyy-mm-dd",
//         weekStart: 1,
//         todayBtn:  1,
// 		autoclose: 1,
// 		todayHighlight: 1,
// 		startView: 2,
// 		minView: 2,
// 		forceParse: 0
//     });
// 	/* $('.datetimepicker').datetimepicker({
// 	    format: 'yyyy-mm-dd hh:ii'
// 	}); */
	
// })
$(document).ready(function() {
	
	
		var selected = $("#selectDate option:selected").val();
		$("#postDateStart").attr("name", selected + "Start");
		$("#postDateEnd").attr("name", selected + "End");

		var value = $("#inputNumber option:selected").val();
		$("#postText").attr("name", value);
	});

// 	$('.datetimepicker').datetimepicker({
// 		language : 'zh-CN',
// 		format : "yyyy-mm-dd hh:mm:ss",
// 		weekStart : 1,
// 		todayBtn : 1,
// 		autoclose : 1,
// 		todayHighlight : 1,
// 		startView : 2,
// 		minView : 2,
// 		forceParse : 0
// 	});
// 	(new Date()).setTime((new Date()).getTime()+24*60*60*1000)
//      var ss=new Date()
     var day3 = new Date();
     day3.setTime(day3.getTime()+72*60*60*1000);
	$("#starttime").datetimepicker({
		startView:2,
		format:"yyyy-mm-dd hh:mm:ss",
		startDate: day3,
		minView:"month",
		todayBtn : "linked", 
		todayHighlight : true,
		language: "zh-CN",
		showMeridian:true,
		autoclose:true,
		}).on('changeDate',function(ev){
		var starttime=$("#starttime").val();
		$("#endtime").datetimepicker('setStartDate',starttime);
// 		$("#starttime").datetimepicker('hide');
		});
		
 $("#endtime").datetimepicker({
		startView:2,
		minView:"month",
		format:"yyyy-mm-dd hh:mm:ss",
		todayBtn : "linked",
		todayHighlight : true,
		language: "zh-CN",
		autoclose:true,
		showMeridian:true,
		}).on('changeDate',function(ev){
		 var starttime=$("#starttime").val();
		 var endtime=$("#endtime").val();
		 $("#starttime").datetimepicker('setEndDate',endtime);
		 $("#endttime").datetimepicker('hide');
		});
		 
		 
 
		 
 function subd(str){
		var ccc = $("input[name='partake']:checked").val();
		 var endtime=$("#endtime").val();
         var starttime=$("#starttime").val();
//          alert(ccc)
         $("#myForm").append('<input type="hidden" name="Start" value="'+starttime+'"/>');
         $("#myForm").append('<input type="hidden" name="End" value="'+endtime+'"/>');
		    if(ccc=="0"){
// 		    	alert($("#rewardRatio").val().length)
			if($("#rewardRatio").val().length==0){
				alert("佣金比例");
				 return false
			}
			
			
		}
		   
			if($("#rebateName").val()==""){
				alert("请填写活动名称");
				 return false	
				
			}
			if($("#rebatePrice").val()==""){
				alert("请填写活动价");
				 return false	
				
			}
			if($("#productNum").val()==""){
				alert("请填写参与活动数量");
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
		 alert(productNum)
	     var pNum=$("#pNum").val();
		 pNum=Number(pNum)
		  alert(pNum)
	     if(productNum > pNum){
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
</script>
