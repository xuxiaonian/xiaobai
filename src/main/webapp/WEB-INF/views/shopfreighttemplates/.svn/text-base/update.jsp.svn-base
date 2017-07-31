<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%> 
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
			<div class="j-right">
				<div class="col-xs-my-48 j-form j-bodyRE">
					<form action="<%=path %>/shopfreighttemplates" method="post" id="form">
						<input type="hidden" name="_method" value="PUT"/>
						<input type="hidden" name="id" value="${shopFreightTemplate.id }"/>
						<input type="hidden" name="version" value="${shopFreightTemplate.version }"/>
						<input type="hidden" name="_method" value="PUT"/>
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">模板名称：</label>
							</div>
							<div class="col-xs-8 form-group">
								<input type="text" maxlength="20" name="name" datatype="*" value="${shopFreightTemplate.name }" class="col-xs-my-40 form-control save" placeholder="请输入模板名称">
								<input type="hidden" name="templateType"  value="${shopFreightTemplate.templateType }">
							</div>
							<div class="col-xs-2"></div>
						</div>
					
				     <div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">是否包邮：</label>
							</div>
							<div class="col-xs-8 form-group">
								<c:if test="${shopFreightTemplate.freeShipping==0 }">
								自定义运费<input type="hidden" name="freeShipping" value=0>
								</c:if>
								<c:if test="${shopFreightTemplate.freeShipping==1 }">
								卖家承担运费 <input type="hidden" name="freeShipping" value=1>
								</c:if>
							</div>
							<div class="col-xs-2"></div>
						</div>
				<c:if test="${shopFreightTemplate.freeShipping !=1 }">			
					 <div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">计价方式：</label>
							</div>
							<div class="col-xs-8 form-group">
								<c:if test="${shopFreightTemplate.mode==0 }">
								按件计算 <input type="hidden" name="mode" value=0>
								</c:if>
								<c:if test="${shopFreightTemplate.mode==1 }">
								按重量计算<input type="hidden" name="mode" value=1>
								</c:if>
							</div>
							<div class="col-xs-2"></div>
						</div>
						<input type="hidden" class="input" name="shopFreightTemplateDetails[0].shopFreightTemplateDetailCities[0].provinces" value=""/>
					<div id="cssd">
						<div  class="col-xs-my-48">
							<div class="col-xs-my-2">&nbsp;</div>
							<div class="col-xs-my-44" style="background: #F8F8F8; margin-top: 50px;">
								<div class="col-xs-my-48 j-register-top">
									<div class="col-xs-my-5" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<span class="j-color">*</span><label for="name">默认运费：</label>
									</div>
									<div class="col-xs-my-5 form-group">
										<input type="text" id="count" datatype="n" name="shopFreightTemplateDetails[0].count" value="${shopFreightTemplate.shopFreightTemplateDetails[0].count }" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-3" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">件内，</label>
									</div>
									<div class="col-xs-my-5 form-group">
										<input type="text" id="freight" datatype="nd2" name="shopFreightTemplateDetails[0].freight" value="${shopFreightTemplate.shopFreightTemplateDetails[0].freight }" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-1" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">元</label>
									</div>
									<div class="col-xs-my-3">&nbsp;</div>
									<div class="col-xs-my-5" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">每增加</label>
									</div>
									<div class="col-xs-my-7 form-group">
										<input type="text" id="addCount" datatype="n" name="shopFreightTemplateDetails[0].addCount" value="${shopFreightTemplate.shopFreightTemplateDetails[0].addCount }" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-4" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">件，增加</label>
									</div>
									<div class="col-xs-my-7 form-group">
										<input type="text" id="addFreight" datatype="nd2" name="shopFreightTemplateDetails[0].addFreight" value="${shopFreightTemplate.shopFreightTemplateDetails[0].addFreight }" class="col-xs-my-48 form-control" placeholder="">
									</div>
									<div class="col-xs-my-1" style="font-size: 14px; padding-top: 5px; text-align: center;">
										<label for="name">元</label>
									</div>
								
									<div class="col-xs-my-2">&nbsp;</div>
								</div>
								<div class="col-xs-my-48 j-register-top">
									<table class="table table-striped table-bordered table-hover dataTable no-footer" id="addTableId">
										<tr id="tr0">
											<th>运送到</th>
											<th>首件（个）</th>
											<th>运费（元）</th>
											<th>续件（个）</th>
											<th>运费（元）</th>
											<th>操作</th>
										</tr>
										<c:forEach begin="1" end="${fn:length(shopFreightTemplate.shopFreightTemplateDetails)-1}" step="1" varStatus="status">
											<tr id="tr${status.index }">
												<td id="td${status.index }">
													<c:forEach items="${shopFreightTemplate.shopFreightTemplateDetails[status.index].shopFreightTemplateDetailCities }" var="shopFreightTemplateDetailCities" varStatus="sfStatus">
														${shopFreightTemplateDetailCities.provinces.provinceName }
														<input type="hidden"  class="lly" name="shopFreightTemplateDetails[${status.index }].shopFreightTemplateDetailCities[${sfStatus.index }].provinces" value="${shopFreightTemplateDetailCities.provinces.id }"/>
													</c:forEach>
												</td>
												<td><input type="text" class="form-control" id="count" datatype="n" name="shopFreightTemplateDetails[${status.index }].count" value="${shopFreightTemplate.shopFreightTemplateDetails[status.index].count}"></td>
												<td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails[${status.index }].freight" value="${shopFreightTemplate.shopFreightTemplateDetails[status.index].freight}"></td>
												<td><input type="text" class="form-control" id="count" datatype="n" name="shopFreightTemplateDetails[${status.index }].addCount" value="${shopFreightTemplate.shopFreightTemplateDetails[status.index].addCount}"></td>
												<td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails[${status.index }].addFreight" value="${shopFreightTemplate.shopFreightTemplateDetails[status.index].addFreight}"></td>
												<td><a onclick="delTr(${status.index })">删除</a></td>
												<c:set var="fileid" value="${status.index }"></c:set>
											</tr>
										</c:forEach>
									</table>
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
									<table class="table table-striped table-bordered table-hover dataTable no-footer" id="tableIds">
										<tr id="trs">
											<th>运送到</th>
											<th colspan=>设置包邮条件</th>
											
											<th>操作</th>
										</tr>

											<c:forEach items="${shopFreightTemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping" varStatus="statu">
											<tr id="trs${statu.index }">
												<td id="tds${statu.index }">
													<c:forEach items="${shopFreightTemplate.shopFreightFreeShipping[statu.index].shopFreightFreeShippingCity }" var="shopFreightFreeShippingCity" varStatus="sfStatu">
														${shopFreightFreeShippingCity.provinces.provinceName }
														<input type="hidden" class="llys" name="shopFreightFreeShipping[${statu.index }].shopFreightFreeShippingCity[${sfStatu.index }].provinces" value="${shopFreightFreeShippingCity.provinces.id }"/>
													</c:forEach>
												</td>
											
												<td class="o_border_right font_size6">
													<c:if test="${shopFreightFreeShipping.count==0 }">
												<div class="col-xs-5"><label class="form-group fl checkbox"><input class="i" name="shopFreightFreeShipping[${statu.index }].count" type="radio" value="0" checked />满<input name="shopFreightFreeShipping[${statu.index }].numbers" type="text"  class="input" value="${shopFreightTemplate.shopFreightFreeShipping[statu.index].numbers}"  />件包邮</label></div>'
					                                   <div class="col-xs-5"><label class="form-group fl checkbox"><input name="shopFreightFreeShipping[${statu.index }].count" type="radio"  class="i"   value="1" />满<input name="shopFreightFreeShipping[${statu.index }].freight" type="text"  class="input"  value="${shopFreightTemplate.shopFreightFreeShipping[statu.index].freight}"  />元包邮 </label></div>
					                                 </c:if>
					                                 	<c:if test="${shopFreightFreeShipping.count==1 }">
												<div class="col-xs-5"><label class="form-group fl checkbox"><input name="shopFreightFreeShipping['${statu.index }].count" type="radio" value="0"  class="i"  />满<input name="shopFreightFreeShipping[${statu.index }].numbers" type="text" class="input"  value="${shopFreightTemplate.shopFreightFreeShipping[statu.index].numbers}"  />件包邮</label></div>'
					                                  <div class="col-xs-5"><label class="form-group fl checkbox"><input name="shopFreightFreeShipping[${statu.index }].count" type="radio"   value="1" class="i"  checked/>满<input name="shopFreightFreeShipping[${statu.index }].freight"  class="input"  type="text" value="${shopFreightTemplate.shopFreightFreeShipping[statu.index].freight}"  />元包邮 </label></div>
					                                 </c:if>
					                               </td>
											    <td><a onclick="dellTr(${statu.index })">删除</a></td>
												
											</tr>
										</c:forEach>
									</table>
								</div>
						</div>
						</div>		
								
								<div class="col-xs-my-48 j-register-top">
									<a onclick="showCity()" style="font-size: 14px; padding-top: 5px; text-align: center;">为指定地区添加包邮条件</a>
								</div>
							</div>
							<div class="col-xs-my-2"></div>
						</div>
                   <div class="col-xs-my-48 j-register-top">
                       <c:if test="${shopFreightTemplate.prior !=1 }">
						<input name="prior" type="checkbox" value="1" />
						</c:if>
						<c:if test="${shopFreightTemplate.prior==1 }">
						<input name="prior" type="checkbox" value="1"  checked="checked" />
						</c:if>
						单品运费优先店铺运费（仅限店铺运费与单品运费同时生效时取用）
  
                             注意：选择后单品的运费单独计算，即使订单金额满足店铺免邮，也会按照单品运费模板计算运费。请谨慎！
								</div>
                    </c:if>
                   
                    
                    
                    
						<div class="col-xs-12">
							<div class="col-xs-3">&nbsp;</div>
							<div class="col-xs-3 j-register-top">
								<button type="submit" class="button button-action button-rounded" id="Preservation1">保存设置</button>
							</div>
							<div class="col-xs-2 j-register-top">
								<button type="reset" class="button button-action button-rounded" id="Preservation">取消</button>
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
// 		tiptype:3
// 	});
	
	
	$("#Preservation1").on('click',function(){
		if($(".save").val()==''){
			alert('模板名称没有填写')
			return false
		}

		
			var nLen = $("#cssd input").not('.input').length
		
			for(var i=0;i<nLen;i++){
				if($("#cssd input").not('.input').eq(i).val()=='' ||$("#cssd input").not('.input').eq(i).val()== null|| $(".save").val()==''){
					alert('未填写完整')
					return false
				}	
			}
		
		if($('#addTableId tr').length > 1){
			
			for (var i=1;i<$('#addTableId tr').length ;i++){
			if($('#addTableId tr').eq(i).find('td').eq(0).text() == '添加城市'){
				alert('请添加城市')
				return false
			}
		}
		}
		if($('#tableIds tr').length > 1){
			for (var i=1;i<$('#tableIds tr').length ;i++)
			{
			if($('#tableIds tr').eq(i).find('td').eq(0).text() == '添加城市'){
				alert('请添加城市')
				return false
			}
			}
			for(var j=0;j<$(".i:checked ").length;j++){
				if($(".i:checked ").eq(j).siblings('.input').val()==null || $(".i:checked ").eq(j).siblings('.input').val()==''){
					alert('请填写完整')
					return false
				}
			}
			
			
		}

	
	})
	        var arr ='';
	    
	var chk_name='';
		var addTrId = 0;
		function addCity(id){
			arr = $('.lly');
			var chk_value = [];
			for(var i=0; i<arr.length; i++){
				chk_value.push(arr.eq(i).val());
			}
			art.dialog.data('chk_value', chk_value);
			art.dialog.data('chk_name', chk_name);
			art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
				close: function() {  
					 chk_value = art.dialog.data('chk_value');
					$(chk_value).each(function(index){
						$("#tr"+id).append('<input type="hidden" class="lly" name="shopFreightTemplateDetails['+id+'].shopFreightTemplateDetailCities['+index+'].provinces" value="'+this+'"/>');
					});
					var ss = art.dialog.data('chk_name');
					
					if(ss.length == 0 ){
						$("#td"+id).html('<a id="city" onclick="addPostage('+id+')">添加城市</a>')
					}else{
						$("#td"+id).html(ss);
					}
// 					var chk_name = art.dialog.data('chk_name');
// 					$("#td"+id).html(chk_name);
	            }	
			});
		}
		function addTr(){
			if(addTrId==0){
				addTrId=${fileid}+1;
			}
			var otherCount = $("#count").val();
			var otherFreight =$("#freight").val();
			var otherAddCount =$("#addCount").val();
			var otherAddFreight =$("#addFreight").val();
			if(otherCount==null){
				otherCount="";
			}
			if(otherFreight==null){
				otherFreight="";
			}
			if(otherAddCount==null){
				otherAddCount="";
			}
			if(otherAddFreight==null){
				otherAddFreight="";
			}
			$("#addTableId").append('<tr id="tr'+addTrId+'"><td id="td'+addTrId+'"><a id="city" onclick="addCity('+addTrId+')">添加城市</a></td><td><input class="form-control" type="text" id="count" datatype="n" name="shopFreightTemplateDetails['+addTrId+'].count" value="'+otherCount+'"></td><td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails['+addTrId+'].freight" value="'+otherFreight+'"></td><td><input type="text" class="form-control" id="count" datatype="n" name="shopFreightTemplateDetails['+addTrId+'].addCount" value="'+otherAddCount+'"></td><td><input type="text" class="form-control" id="count" datatype="nd2" name="shopFreightTemplateDetails['+addTrId+'].addFreight" value="'+otherAddFreight+'"></td><td><a onclick="delTr('+addTrId+')">删除</a></td></tr>');
			addTrId++;
		}
		function showCitys(){
			$("#showCityId").css("display","block");
			$("#otherCount").val($("#count").val());
			$("#otherFreight").val($("#freight").val());
			$("#otherAddCount").val($("#addCount").val());
			$("#otherAddFreight").val($("#addFreight").val());
			addTr();
		}
		
		function delTr(id){
			
			$("#tr"+id).remove();
		}
		
		
		
		
		
		
		
		
		
		
		
		
		
// 		指定运费 指定条件包邮
		var trid=20;
		function showCity(){
			
			$("#tableIds").append('<tr id="trs'+trid+'">'
					+'<td id="tage'+trid+'" class="o_border_right font_size6"><a id="city" onclick="addPostage('+trid+')">添加城市</a></td>'
					+'<td class="o_border_right font_size6"><div class="col-xs-5"><label class="form-group fl checkbox"><input name="shopFreightFreeShipping['+trid+'].count"  class="i" checked="checked" type="radio" value="0"  />满<input name="shopFreightFreeShipping['+trid+'].numbers" class="input"  type="text" value=""  />件包邮</label></div>'
					+'<div class="col-xs-5"><label class="form-group fl checkbox"><input name="shopFreightFreeShipping['+trid+'].count" type="radio"  class="i"   value="1" />满<input name="shopFreightFreeShipping['+trid+'].freight"  class="input"  type="text" value=""  />元包邮 </label></div></td>'
					+'<td><a   onclick="dellTr('+trid+')"  class="__web-inspector-hide-shortcut__">删除</a></td></tr>');
 			trid++;
			
		}
		
	     var arr1 ="" ;
		var chk_name1 ="";
// 		指定条件包邮
		function addPostage(id){
			arr1=$('.llys')
			console.log(arr1);
			var chk_value1 = [];
			for(var i=0; i<arr1.length; i++){
				chk_value1.push(arr1.eq(i).val());
			}
// 			alert(chk_value1)
			art.dialog.data('chk_value', chk_value1);
			art.dialog.data('chk_name', chk_name1);
			art.dialog.open('<%=path %>/shopfreighttemplates?city',{id:'send',title:'选择区域',width:650,height:490,lock:true, background:'#000000',
				close: function() {  
					chk_value = art.dialog.data('chk_value');
					$(chk_value).each(function(index){
						
						$("#trs"+id).append('<input type="hidden" class="llys" name="shopFreightFreeShipping['+id+'].shopFreightFreeShippingCity['+index+'].provinces" value="'+this+'"/>');
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
		
		
		
		
		
</script>