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
	
<%-- 				<a class="button button-action" href=" ">单品运费模板</a> <a class="button" href="<%=path %>/shopfreighttemplates/12?shops">店铺运费模板</a> --%>
<%-- 				<a class="button" href="<%=path %>/shopfreighttemplates/12?calculation">计算模式</a>	 --%>
		
			<div class="j-right">
				<div class="col-xs-my-48 j-form j-bodyRE">
					<form action="<%=path %>/shopfreighttemplates" method="post" id="form">
						<input type="hidden" name="productId" value="${productId }"/>
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">模板名称：</label>
							</div>
							<div class="col-xs-8 form-group">
								<input  type="text" maxlength="20" name="name" datatype="*" value="" class="col-xs-my-40 form-control save" placeholder="请输入模板名称">
							</div>
							<div class="col-xs-2"></div>
						</div>

						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">是否包邮：</label>
							</div>
							<div class="col-xs-8 form-group">
								<div class="col-xs-3">
									<label class="checkbox"><input id="clickss" name="freeShipping" type="radio"  onclick="Postage(0)" value="0"  checked/>自定义运费</label>
			                    </div>
			                    <div class="col-xs-3">
			                    	<label class="checkbox"><input name="freeShipping" type="radio"  onclick="Postage(1)" value="1" />卖家承担运费 </label>
       							</div>
							</div>
							<div class="col-xs-2"></div>
						</div>
	<div id="show" >					
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">计价方式：</label>
							</div>
							<div class="col-xs-8 form-group">
								<div class="col-xs-3">
									<label class="form-group fl checkbox"><input name="mode" type="radio" onclick="toggleTemplate(0)" value="0"  checked/>按件计算</label>
			                	 </div>
			                	 <div class="col-xs-3">
			                    	<label class="form-group fl checkbox"><input name="mode" type="radio"  onclick="toggleTemplate(1)" value="1" />按重量计算 </label>
       							</div>
							</div>
							<div class="col-xs-2"></div>
						</div>     
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">运费设置：</label>
							</div>
							<div class="col-xs-8 form-group">
							除指定区域外，其余地区的运费采用默认运费。
							</div>
							<div class="col-xs-2"></div>
						</div>
						<input type="hidden" class="input" name="shopFreightTemplateDetails[0].shopFreightTemplateDetailCities[0].provinces" value=""/>
						<div id="number">
						<div class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44" style="background: #F8F8F8; margin-top: 50px;">
								<div class="col-xs-my-48 j-register-top">
									<div class="col-xs-my-5" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<span class="j-color">*</span><label for="name">默认运费：</label>
									</div>
									<div class="col-xs-my-5 form-group">
										<input type="text" id="count1" datatype="n" name="shopFreightTemplateDetails[0].count" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-3" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">件内，</label>
									</div>
									<div class="col-xs-my-5 form-group">
										<input type="text" id="freight1" datatype="nd2" name="shopFreightTemplateDetails[0].freight" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-1" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">元</label>
									</div>
									<div class="col-xs-my-3">&nbsp;</div>
									<div class="col-xs-my-5" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">每增加</label>
									</div>
									<div class="col-xs-my-7 form-group">
										<input type="text" datatype="n" id="addCount1" name="shopFreightTemplateDetails[0].addCount" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-4" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">件，增加</label>
									</div>
									<div class="col-xs-my-7 form-group">
										<input type="text" datatype="nd2" id="addFreight1" name="shopFreightTemplateDetails[0].addFreight" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-1" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">元</label>
									</div>
									
									
									<div class="col-xs-my-2">&nbsp;</div>
								</div>
								
								<div class="col-xs-my-48"  id="showCityId">
								<div class="col-xs-my-48 j-register-top">
									<table class="table table-striped table-bordered table-hover dataTable no-footer" id="addTableId">
										<tr id="tr">
											<th>运送到</th>
											<th>首件（个）</th>
											<th>运费（元）</th>
											<th>续件（个）</th>
											<th>运费（元）</th>
											<th>操作</th>
										</tr>
									</table>
								</div>
						</div>
								
								
								<div class="col-xs-my-48 j-register-top">
									<a onclick="showCitys()" style="font-size: 14px; padding-top: 5px; text-align: center;">为指定地区添加运费</a>
								</div>
							</div>
							<div class="col-xs-my-2"></div>
						</div>
										<div class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44" style="background: #F8F8F8; margin-top: 50px;">
	
								
								<div class="col-xs-my-48"  id="showId">
								<div class="col-xs-my-48 j-register-top">
									<table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableId">
										<tr id="trs">
											<th>运送到</th>
											<th colspan=>设置包邮条件</th>
											
											<th>操作</th>
										</tr>
									</table>
								</div>
						</div>
								
								
								<div class="col-xs-my-48 j-register-top">
									<a onclick="showCity()" style="font-size: 14px; padding-top: 5px; text-align: center;">为指定地区添加包邮条件</a>
								</div>
							</div>
							<div class="col-xs-my-2"></div>
						</div>
				     </div>	
				     
				     
				     
				     
				     <div id="weight" style="display:none;">
						<div class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44" style="background: #F8F8F8; margin-top: 50px;">
								<div class="col-xs-my-48 j-register-top">
									<div class="col-xs-my-5" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<span class="j-color">*</span><label for="name">默认运费：</label>
									</div>
									<div class="col-xs-my-5 form-group">
										<input type="text" id="count2" datatype="n" name="shopFreightTemplateDetails[0].count" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-3" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name"> kg，</label>
									</div>
									<div class="col-xs-my-5 form-group">
										<input type="text" id="freight2" datatype="nd2" name="shopFreightTemplateDetails[0].freight" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-1" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">元</label>
									</div>
									<div class="col-xs-my-3">&nbsp;</div>
									<div class="col-xs-my-5" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">每增加</label>
									</div>
									<div class="col-xs-my-7 form-group">
										<input type="text" datatype="n" id="addCount2" name="shopFreightTemplateDetails[0].addCount" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-4" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name"> kg，增加</label>
									</div>
									<div class="col-xs-my-7 form-group">
										<input type="text" datatype="nd2" id="addFreight2" name="shopFreightTemplateDetails[0].addFreight" value="" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-1" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">元</label>
									</div>
								
									
									<div class="col-xs-my-2">&nbsp;</div>
								</div>
								
								<div class="col-xs-my-48"  id="showCityId">
								<div class="col-xs-my-48 j-register-top">
									<table class="table table-striped table-bordered table-hover dataTable no-footer" id="addTableIdKg">
										<tr id="trs">
											<th>运送到</th>
											<th>首重量（kg）</th>
											<th>首费（元）</th>
											<th>续重量（kg）</th>
											<th>续运（元）</th>
											<th>操作</th>
										</tr>
									</table>
								</div>
						</div>
								
								
								<div class="col-xs-my-48 j-register-top">
									<a onclick="showCitysKg()" style="font-size: 14px; padding-top: 5px; text-align: center;">为指定地区添加运费</a>
								</div>
							</div>
							<div class="col-xs-my-2"></div>
						</div>
										<div class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44" style="background: #F8F8F8; margin-top: 50px;">
	
								
								<div class="col-xs-my-48"  id="showId">
								<div class="col-xs-my-48 j-register-top">
									<table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableIdKg">
										<tr id="trskg">
											<th>运送到</th>
											<th colspan=>设置包邮条件</th>
											
											<th>操作</th>
										</tr>
									</table>
								</div>
						</div>
								
								
								<div class="col-xs-my-48 j-register-top">
									<a onclick="showCityKg()" style="font-size: 14px; padding-top: 5px; text-align: center;">为指定地区添加包邮条件</a>
								</div>
						
							
							</div>
							<div class="col-xs-my-2"></div>
						</div>
				     </div>	
				     <div class="col-xs-my-48 j-register-top">
						<input name="prior" type="checkbox" value="1" />单品运费优先店铺运费（仅限店铺运费与单品运费同时生效时取用）
  
                             注意：选择后单品的运费单独计算，即使订单金额满足店铺免邮，也会按照单品运费模板计算运费。请谨慎！
								</div>
	</div>	
				
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
		if($(".save").val()==''){
			alert('模板名称没有填写')
			return false
		}
		if($('input:radio[name="freeShipping"]:checked').val()==0){
		if($('input:radio[name="mode"]:checked').val()==0){
		
			var nLen = $("#number input").not('.input').length
		
			for(var i=0;i<nLen;i++){
				if($("#number input").not('.input').eq(i).val()=='' ||$("#number input").not('.input').eq(i).val()== null|| $(".save").val()==''){
					alert('未填写完整')
					return false
				}	
			}
		}else if($('input:radio[name="mode"]:checked').val() ==1){
		
			var wLen = $("#weight input").not('.input').length
			alert(wLen)
			for(var i=0;i<wLen;i++){
				if($("#weight input").not('.input').eq(i).val()=='' ||$("#weight input").not('.input').eq(i).val()== null|| $(".save").val()==''){
					alert('未填写完整')
					return false
				}	
			}
		}
		
		if($('#addTableId tr').length > 1){
			for (var i=1;i<$('#addTableId tr').length ;i++)
			{
			if($('#addTableId tr').eq(i).find('td').eq(0).text() == '添加城市'){
				alert('请添加城市')
				return false
			}
			}
		}
		if($('#tableId tr').length > 1){
			for (var i=1;i<$('#tableId tr').length ;i++)
			{
				if($('#tableId tr').eq(i).find('td').eq(0).text() == '添加城市'){
					alert('请添加城市')
					return false
				}
				for(var j=0;j<$(".i:checked ").length;j++){
				if($(".i:checked ").siblings('.input').val()==null || $(".i:checked ").siblings('.input').val()==''){
					alert('请填写完整')
					return false
				}
			}
			
			}
			
		}
		if($('#tableIdKg tr').length > 1){
			for (var i=1;i<$('#tableIdKg tr').length ;i++)
			{
			if($('#tableIdKg tr').eq(i).find('td').eq(0).text() == '添加城市'){
				alert('请添加城市')
				return false
			}}
			for(var j=0;j<$(".i:checked ").length;j++){
			if($(".i:checked ").siblings('.input').val()==null || $(".i:checked ").siblings('.input').val()=='' ){
				alert('请填写完整')
				return false
			}
			}	
		}
		
		if($('#addTableIdKg tr').length > 1 ){
			for (var i=1;i<$('#addTableIdKg tr').length ;i++)
			{
			if($('#addTableIdKg tr').eq(i).find('td').eq(0).text() == '添加城市'){
				alert('请添加城市')
				return false
			}
			}
			
		}
		}
	})
	var chk_value ="";
	var chk_name ="";	
		
	 var tr=1;
// 	 快递的新增
	function showCitys(){
			
		$("#addTableId").append('<tr id="tr'+tr+'">'
				+'<td id="td'+tr+'" class="o_border_right font_size6"><a id="city" onclick="addCity('+tr+')">添加城市</a></td>'
				+'<td><input class="form-control" type="text" id="count" datatype="n" name="shopFreightTemplateDetails['+tr+'].count" value=""></td>'
				+'<td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails['+tr+'].freight" value=""></td>'
				+'<td><input type="text" class="form-control" id="count" datatype="n" name="shopFreightTemplateDetails['+tr+'].addCount" value=""></td>'
				+'<td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails['+tr+'].addFreight" value=""></td>'
				+'<td><a   onclick="delTr('+tr+')"  class="__web-inspector-hide-shortcut__">删除</a></td></tr>');
		tr++;
		}
// 	快的 的  选择城市
	function addCity(id){
		art.dialog.data('chk_value', chk_value);
		art.dialog.data('chk_name', chk_name);
		art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
			close: function() {  
				chk_value= art.dialog.data('chk_value');
				$(chk_value).each(function(index){
					$("#tr"+id).append('<input type="hidden" name="shopFreightTemplateDetails['+id+'].shopFreightTemplateDetailCities['+index+'].provinces" value="'+this+'"/>');
				});
				var ss = art.dialog.data('chk_name');
				if(ss.length ==0 ){
					$("#td"+id).html('<a id="city" onclick="addCity('+id+')">添加城市</a>')
				}else{
					$("#td"+id).html(ss);
				}
		
            }	
		});
	}
// 		快递的删除
		function delTr(id){
			$("#tr"+id).remove();
		}
		
		
		
		
		
		
		
		
		
// 		指定运费 指定条件包邮
		var trid=0;
		function showCity(){
			
			$("#tableId").append('<tr id="trs'+trid+'">'
					+'<td id="tage'+trid+'" class="o_border_right font_size6"><a id="city" onclick="addPostage('+trid+')">添加城市</a></td>'
					+'<td class="o_border_right font_size6"><input  type="hidden" name="shopFreightFreeShipping['+trid+'].mold"    value=0><div class="col-xs-5"><label class="form-group fl checkbox"><input checked="true" name="shopFreightFreeShipping['+trid+'].count" class="i" type="radio" value="0"  />满<input class="input" name="shopFreightFreeShipping['+trid+'].numbers" type="text" value=""  />件包邮</label></div>'
					+'<div class="col-xs-5"><label class="form-group fl checkbox"><input class="i" name="shopFreightFreeShipping['+trid+'].count" type="radio"   value="1" />满<input class="input" name="shopFreightFreeShipping['+trid+'].freight" type="text" value=""  />元包邮 </label></div></td>'
					+'<td><a   onclick="dellTr('+trid+')"  class="__web-inspector-hide-shortcut__">删除</a></td></tr>');
 			trid++;
			
		}
		
		var chk_value1 ="";
		var chk_name1 ="";
// 		指定条件包邮
		function addPostage(id){

			art.dialog.data('chk_value', chk_value1);
			art.dialog.data('chk_name', chk_name1);
			art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
				close: function() {  
					chk_value1 = art.dialog.data('chk_value');
					
					$(chk_value1).each(function(index){
						$("#trs"+id).append('<input type="hidden" name="shopFreightFreeShipping['+id+'].shopFreightFreeShippingCity['+index+'].provinces" value="'+this+'"/>');
					});
					var ss = art.dialog.data('chk_name');
					if(ss.length ==0 ){
						$("#tage"+id).html('<a id="city" onclick="addPostage('+id+')">添加城市</a>')
					}else{
						$("#tage"+id).html(ss);
					}
// 					chk_name1 = art.dialog.data('chk_name');
// 					$("#tage"+id).html(chk_name1);
	            }	
			});
		}
// 		指定运费的删除
	function dellTr(id){		
			$("#trs"+id).remove();
		}
		
		
		
		
		
		
// 		卖家承担运费
		function Postage(id){
	if(id==0){
		$("#show").show();
	}else{
	 var mymessage=confirm("选择“卖家承担运费”后，所有区域的运费将设置为0且原运费设置无法恢复，请保存原有运费设置。");  
	 if(mymessage){
		$("#show").hide();
	 }else{
		 click();
		
	 }
	}
 
		}
// 		卖家承担运费	 取消
		function click(id){	
			
			document.getElementById("clickss").click(); 
		}	
// 		切换模板
		function toggleTemplate(id){
	  
	if(id==0){
		$("#number").show();
		$("#weight").hide();
	 $("#count2").attr("disabled",true);
	 $("#count1").attr("disabled",false);
	 $("#freight2").attr("disabled",true);
	 $("#freight1").attr("disabled",false);
	 $("#addCount2").attr("disabled",true);
	 $("#addCount1").attr("disabled",false);
	 $("#addFreight2").attr("disabled",true);
	 $("#addFreight1").attr("disabled",false);
	}else{
		$("#number").hide();
		$("#weight").show();
	 $("#count1").attr("disabled",true);
	 $("#count2").attr("disabled",false);
	 $("#freight1").attr("disabled",true);
	 $("#freight2").attr("disabled",false);
	 $("#addCount1").attr("disabled",true);
	 $("#addCount2").attr("disabled",false);
	 $("#addFreight1").attr("disabled",true);
	 $("#addFreight2").attr("disabled",false);
		
	 }
	}







		
		 var trkg=1;
//	 	 快递的新增（kg）
		function showCitysKg(){
				
			$("#addTableIdKg").append('<tr id="trkg'+trkg+'">'
					+'<td id="tdkg'+trkg+'" class="o_border_right font_size6"><a id="city" onclick="addCityKg('+trkg+')">添加城市</a></td>'
					+'<td><input class="form-control" type="text" id="count" datatype="n" name="shopFreightTemplateDetails['+trkg+'].count" value=""></td>'
					+'<td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails['+trkg+'].freight" value=""></td>'
					+'<td><input type="text" class="form-control" id="count" datatype="n" name="shopFreightTemplateDetails['+trkg+'].addCount" value=""></td>'
					+'<td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails['+trkg+'].addFreight" value=""></td>'
					+'<td><a   onclick="delTrKg('+trkg+')"  class="__web-inspector-hide-shortcut__">删除</a></td></tr>');
			trkg++;
			}
		var chk_value2 ="";
		var chk_name2 ="";
//	 	快的 的  选择城市（kg）
		function addCityKg(id){
			art.dialog.data('chk_value', chk_value2);
			art.dialog.data('chk_name', chk_name2);
			art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
				close: function() {  
					chk_value2 = art.dialog.data('chk_value');
					$(chk_value2).each(function(index){
						$("#trkg"+id).append('<input type="hidden" name="shopFreightTemplateDetails['+id+'].shopFreightTemplateDetailCities['+index+'].provinces" value="'+this+'"/>');
					});
					var ss = art.dialog.data('chk_name');
					if(ss.length ==0 ){
						$("#tdkg"+id).html('<a id="city" onclick="addCityKg('+id+')">添加城市</a>')
					}else{
						$("#tdkg"+id).html(ss);
					}
// 					chk_name2 = art.dialog.data('chk_name');
// 					$("#tdkg"+id).html(chk_name2);
					
	            }	
			});
		}
//	 		快递的删除 （kg）
			function delTrKg(id){
				$("#trkg"+id).remove();
			}
//	 		指定运费 （kg）
			var tridkg=0;
			function showCityKg(){
			
				$("#tableIdKg").append('<tr id="trskg'+tridkg+'">'
						+'<td id="Postagekg'+tridkg+'" class="o_border_right font_size6"><a id="city" onclick="addPostageKg('+tridkg+')">添加城市</a></td>'
						+'<td class="o_border_right font_size6"><input type="hidden" name="shopFreightFreeShipping['+tridkg+'].mold"  value=0><div class="col-xs-5"><label class="form-group fl checkbox"><input name="shopFreightFreeShipping['+tridkg+'].count"  checked="true"  class="i" type="radio" value="0"  />满<input name="shopFreightFreeShipping['+tridkg+'].numbers" type="text" value=""  class="input" />kg包邮</label></div>'
						+'<div class="col-xs-5"><div class="form-group fl checkbox"><input name="shopFreightFreeShipping['+tridkg+'].count"  class="i" type="radio"  value="1" />满<input name="shopFreightFreeShipping['+tridkg+'].freight" type="text" value=""  class="input" />元包邮 </div></div></td>'
						+'<td><a   onclick="dellTrKg('+tridkg+')"  class="__web-inspector-hide-shortcut__">删除</a></td></tr>');
				tridkg++;
				
			}
			var chk_value3 ="";
			var chk_name3 ="";
//	 		指定条件包邮 （kg）
			function addPostageKg(id){
				art.dialog.data('chk_value', chk_value3);
				art.dialog.data('chk_name', chk_name3);
				art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
					close: function() {  
						 chk_value3 = art.dialog.data('chk_value');
						$(chk_value3).each(function(index){
							$("#trskg"+id).append('<input type="hidden" name="shopFreightFreeShipping['+id+'].shopFreightFreeShippingCity['+index+'].provinces" value="'+this+'"/>');
						});
						var ss = art.dialog.data('chk_name');
						if(ss.length ==0 ){
							$("#Postagekg"+id).html('<a id="city" onclick="addPostageKg('+id+')">添加城市</a>')
						}else{
							$("#Postagekg"+id).html(ss);
						}
// 						chk_name3 = art.dialog.data('chk_name');
// 						$("#Postagekg"+id).html(chk_name3);
		            }	
				});
			}
//	 		指定运费的删除（kg）
		function dellTrKg(id){		
				$("#trskg"+id).remove();
			}
			
			
		
</script>