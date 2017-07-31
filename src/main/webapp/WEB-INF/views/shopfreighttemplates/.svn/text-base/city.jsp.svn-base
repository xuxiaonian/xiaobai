<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<div id="location">
<util:load-scripts></util:load-scripts>
<c:forEach items="${localities }" var="localitie" varStatus="status">
	<c:if test="${status.index%2==0 }">
		<div class="col-xs-my-48" style="background: #ffffff">
	</c:if>
	<c:if test="${status.index%2!=0 }">
		<div class="col-xs-my-48" style="background: #a3d3f3">
	</c:if>
	<div class="col-xs-my-8" style="line-height: 40px">
		<label class="col-xs-my-8">
			<input class="class${localitie.id }" onclick="selectAll(${localitie.id})" id="select${localitie.id}" type="checkbox" />
		</label>
		<div class="col-xs-my-40">
			<span class="city-span-title">${localitie.name }</span>
		</div>
	</div>
	<c:forEach items="${localitie.provinces }" var="province" varStatus="pstatus">
		<c:if test="${pstatus.index <=4 }">
			<div class="col-xs-my-8" style="line-height: 40px">
				<label class="col-xs-my-8">
					<input onclick="selectThis(${province.id })" id="checkbox${province.id }" class="class${localitie.id }" value="${province.id }" name="citys" type="checkbox" /> <input id="input${province.id }" type="hidden" name="" value="${province.provinceName }" class="hidden${localitie.id }" />
				</label>
				<div class="col-xs-my-40">
					<span class="city-span-con">${province.provinceName }</span>
				</div>
			</div>
		</c:if>
		<c:if test="${pstatus.index >4 }">
			<div class="col-xs-my-8" style="line-height: 40px">
				<label class="col-xs-my-8">&nbsp;</label>
				<div class="col-xs-my-40">&nbsp;</div>
			</div>
			<div class="col-xs-my-8" style="line-height: 40px">
				<label class="col-xs-my-8">
					<input onclick="selectThis(${province.id })" id="checkbox${province.id }" class="class${localitie.id }" value="${province.id }" name="citys" type="checkbox" /> <input id="input${province.id }" type="hidden" name="" value="${province.provinceName }" class="hidden${localitie.id }" />
				</label>
				<div class="col-xs-my-40">
					<span class="city-span-con">${province.provinceName }</span>
				</div>
			</div>
		</c:if>
	</c:forEach>
	</div>
</c:forEach>
</div>
<div class="col-xs-12">
	<div class="col-xs-5">&nbsp;</div>
	<div class="col-xs-3 j-register-top">
		<button type="button" onclick="sub()" class="button button-action button-rounded" id="Preservation">保存设置</button>
	</div>
	<div class="col-xs-4">&nbsp;</div>
</div>
<div class="clearfix"></div>
<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<script type="text/javascript">
$(document).ready(function(){ 
	var chk_value = art.dialog.data('chk_value');
	console.log(chk_value)
	$(chk_value).each(function(index){
		$("#checkbox"+chk_value[index]).remove();
	});
	var tag = $('#location').find('.col-xs-my-48');
	for(var i=0; i<tag.length; i++){
		var div = tag.eq(i).find('.col-xs-my-8').not('label').length;
		if(div >6){
			div=div-1;
		}
		var input = tag.eq(i).find('input').length;
// 		alert(div+'...'+input);
		if(div*2 !=(input+1)){
			tag.eq(i).find('.col-xs-my-8').not('label').eq(0).find('input').css('display','none')
		}
	}
});
	function selectAll(id){
		if($("#select"+id).prop("checked") == true){
			   $(".class"+id).prop("checked", true);
			   $(".hidden"+id).attr("name", "cityName");
		}else{
			   $(".class"+id).prop("checked", false);
			   $(".hidden"+id).attr("name", "");
		}
	}
	
	function selectThis(id){
		if($("#checkbox"+id).prop("checked") == true){
			  $("#input"+id).attr("name", "cityName");
		}else{
			$("#input"+id).attr("name", "");
		}
	}
	
	function sub(){
		var chk_value =[]; 
		$('input[name="citys"]:checked').each(function(){ 
			chk_value.push($(this).val()); 
		}); 
		
		var chk_name =[]; 
		$('input[name="cityName"]').each(function(){ 
			chk_name.push($(this).val()+" "); 
		});
		art.dialog.data('chk_name', chk_name);// 存储数据
		art.dialog.data('chk_value', chk_value);// 存储数据
		art.dialog.close();
	}
</script>