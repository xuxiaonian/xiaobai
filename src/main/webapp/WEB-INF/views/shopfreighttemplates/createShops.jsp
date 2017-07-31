<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/valid.css" />
<div>
	<div class="j-content">
		<!--content  左边下部部分-->
		<div class="col-xs-my-1">&nbsp;</div>
		<div class="col-xs-my-40">
	
<!-- 				<a class="button " href="/shop/shopfreighttemplates?form">单品运费模板</a> <a class="button button-action" href="">店铺运费模板</a> -->
<%-- 				<a class="button " href="<%=path %>/shopfreighttemplates/12?calculation">计算模式</a>	 --%>
		
			<div class="j-right">
			<div class="col-xs-my-48 j-form j-bodyRE">
			<form action="<%=path %>/shopfreighttemplates" method="post" id="form">
				
					<input type="hidden" name="templateType"  value=1 />
						<input type="hidden" name="productId" value="${productId }"/>
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">模板名称：</label>
							</div>
							<div class="col-xs-8 form-group">
								<input type="text" maxlength="20" name="name" datatype="*" value="" class="col-xs-my-40 form-control" placeholder="请输入模板名称">
							</div>
							<div class="col-xs-2"></div>
						</div>
						
							<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">地区设置：</label>
							</div>
							<div class="col-xs-8 form-group" id="region">
							<a onclick="showCity(0)" style="font-size: 14px; padding-top: 5px; text-align: center;">选择城市</a>
								<input  id="shows" type="text" disabled="disabled"  class="col-xs-my-40 form-control" >
							</div>
							<div class="col-xs-2"></div>
						</div>
	                     <div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">运送方式：</label>
							</div>
							<div class="col-xs-8 form-group" id="region">
							
								<input  id="shows"  name="shipping" type="text" disabled="disabled"  value="快递" class="col-xs-my-40 form-control" >
							</div>
							<div class="col-xs-2"></div>
						</div>
						  <div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name"> 计费规则：</label>
							</div>
							<div class="col-xs-8 form-group" id="region">
							
							<input type="hidden" name="shopFreightFreeShipping[0].mold"  value=1>
							<div class="col-xs-12"><label class="form-group fl checkbox"><input id="choose0" name="shopFreightFreeShipping[0].fixedFreight" type="radio" value="0"  checked />每张订单满<input id="fixed0" name="shopFreightFreeShipping[0].freight" type="text" value=""  />元以及以上包邮，不足时收取运费
							                                                                                                                                               <input id="fixed1" name="shopFreightFreeShipping[0].charge" type="text" value=""  />元</label></div>'
						    <div class="col-xs-5"><div class="form-group fl checkbox"><input id="choose1"  name="shopFreightFreeShipping[0].fixedFreight" type="radio"  value="1" />固定运费<input id="fixed2" name="shopFreightFreeShipping[0].charge" type="text" value=""  />元包邮 </div></div>
							</div>
							<div class="col-xs-2"></div>
						</div>
						
				  
<%-- 	             <input type="hidden" id="shop"  value="${shop }"> --%>
	              <input type="hidden" id="city"  value="${city }">
			  
						<div class="col-xs-12">
							<div class="col-xs-3">&nbsp;</div>
							<div class="col-xs-3 j-register-top">
								<button type="submit" class="button button-action button-rounded" id="Preservation1">保存并返回</button>
							</div>
							<div class="col-xs-2 j-register-top">
								<button type="reset" class="button button-action button-rounded" id="Preservation">重置</button>
							</div>
							<div class="col-xs-4">&nbsp;</div>
						</div>
					</form>
				</div>
			</div>
			
		</div>
		<!--content  中右边上部部分-->
	</div>
</div>
	<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
	<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
	<script type="text/javascript">
// 	$("#form").Validform({
// 		tiptype:1
// 	});
	$("#Preservation1").on('click',function(){
		if($('input[name="name"]').val()==''){
			alert('模板名称没有填写')
			return false
		}
		 if($("#shows").val()==''){
			  alert('请选择城市')
			  return false
		  }
		 
		  var shopFr = $('input[id="choose1"]').filter(':checked').val();
	
		  if(shopFr !=null){
			  if($("#fixed2").val()==''){
				  alert('请填写固定运费')
				  return false
			  }
			  $("#fixed1").val($("#fixed2").val());  
			  $("#fixed0").val(0); 
		  }else{
			  if($("#fixed0").val()==''){
				  alert('请填写包邮条件')
				  return false
			  }
			  if($("#fixed1").val()==''){
				  alert('请补全包邮条件')
				  return false
			  }
		  }
		  
	})
	
	var chk_value =  $("#city").val().split(",");
	var chk_name =""; 	

// 	 选择城市
	function showCity(id){
		art.dialog.data('chk_value', chk_value);
		console.log(chk_value)
		art.dialog.data('chk_name', chk_name);
		art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
			close: function() {  
				chk_value = art.dialog.data('chk_value');
				$(chk_value).each(function(index){
				
					$("#region").append('<input type="hidden" name="shopFreightFreeShipping['+id+'].shopFreightFreeShippingCity['+index+'].provinces" value="'+this+'"/>');
				});
				chk_name = art.dialog.data('chk_name');
				$("#shows").val(chk_name);
            }	
		});
	}

	function sub(str){
		  var shopFr = $('input[id="choose1"]').filter(':checked').val();
		  if(shopFr !=null){
			  
			  $("#fixed1").val($("#fixed2").val());  
			  $("#fixed0").val(0); 
		  }
		 
		document.forms['form'].submit();
	}
	
</script>