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
								<input type="text" name="name"  maxlength="20" datatype="*" value="${shopFreightTemplate.name }" class="col-xs-my-40 form-control" placeholder="请输入模板名称">
								<input type="hidden" name="templateType"  value="${shopFreightTemplate.templateType }">
							</div>
							<div class="col-xs-2"></div>
						</div>
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-2 j-name">
								<span class="j-color">*</span><label for="name">地区设置：</label>
							</div>
							<div class="col-xs-8 form-group" id="region">
							<div id="shou">
							<c:forEach items="${shopFreightTemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping" varStatus="statu">
													<c:forEach items="${shopFreightTemplate.shopFreightFreeShipping[statu.index].shopFreightFreeShippingCity }" var="shopFreightFreeShippingCity" varStatus="sfStatu">
													
														<input type="hidden" name="shopFreightFreeShipping[${statu.index }].shopFreightFreeShippingCity[${sfStatu.index }].provinces" value="${shopFreightFreeShippingCity.provinces.id }"/>
													</c:forEach>
										</c:forEach>
							</div>
							<a onclick="showCity(0)" style="font-size: 14px; padding-top: 5px; text-align: center;">选择城市</a>
								<input  id="shows" disabled="disabled"  class="col-xs-my-40 form-control" value="<c:forEach items="${shopFreightTemplate.shopFreightFreeShipping }" var="shopFreightFreeShipping" varStatus="statu"><c:forEach items="${shopFreightTemplate.shopFreightFreeShipping[statu.index].shopFreightFreeShippingCity }" var="shopFreightFreeShippingCity" varStatus="sfStatu">${shopFreightFreeShippingCity.provinces.provinceName } </c:forEach></c:forEach>" >
									
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
						<c:if test="${shopFreightTemplate.shopFreightFreeShipping[0].fixedFreight ==0 }">
							<div class="col-xs-12"><label class="form-group fl checkbox"><input id="choose0" name="shopFreightFreeShipping[0].fixedFreight" type="radio" value="0"  checked />
							每张订单满<input id="fixed0"  name="shopFreightFreeShipping[0].freight" type="text" value="${shopFreightTemplate.shopFreightFreeShipping[0].freight }"  />元以及以上包邮，不足时收取运费
				                       <input id="fixed1"  name="shopFreightFreeShipping[0].charge" type="text" value="${shopFreightTemplate.shopFreightFreeShipping[0].charge }"  />元</label></div>
						    <div class="col-xs-5"><div class="form-group fl checkbox"><input id="choose1" name="shopFreightFreeShipping[0].fixedFreight" type="radio"  value="1" />固定运费<input id="fixed2" name="charge" type="text" value=""  />元包邮 </div></div>
						</c:if>
						<c:if test="${shopFreightTemplate.shopFreightFreeShipping[0].fixedFreight !=0 }">
								<div class="col-xs-12"><label class="form-group fl checkbox"><input id="choose0"   name="shopFreightFreeShipping[0].fixedFreight" type="radio" value="0"    />
							每张订单满<input  id="fixed0"  name="shopFreightFreeShipping[0].freight" type="text" value=""  />元以及以上包邮，不足时收取运费
				                       <input id="fixed1"  name="shopFreightFreeShipping[0].charge" type="text" value=""  />元</label></div>	                              

						    <div class="col-xs-5"><div class="form-group fl checkbox"><input  id="choose1" name="shopFreightFreeShipping[0].fixedFreight" type="radio"  value="1" checked />固定运费<input id="fixed2"  name="charge" type="text" value="${shopFreightTemplate.shopFreightFreeShipping[0].charge }"  />元包邮 </div></div>
						
							</c:if>
							</div>
							<div class="col-xs-2"></div>
						</div>
		
							</div>
							<div class="col-xs-my-2"></div>
						</div>
                
						<div class="col-xs-12">
							<div class="col-xs-3">&nbsp;</div>
							<div class="col-xs-3 j-register-top">
								<button  type="submit" class="button button-action button-rounded" id="Preservation1">保存设置</button>
							</div>
							<div class="col-xs-2 j-register-top">
								<button type="reset" class="button button-action button-rounded" id="Preservation">取消</button>
							</div>
							<div class="col-xs-4">&nbsp;</div>
						</div>
						              <input type="hidden" id="city"  value="${city }">
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
	var chk_value =$("#city").val().split(",");
	var chk_name ="";	

// 	 选择城市
	function showCity(id){
		$("#shou").remove();
		art.dialog.data('chk_value', chk_value);
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


  
</script>