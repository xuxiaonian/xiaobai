<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<style type="text/css">
	
.a-upload {
    padding: 4px 10px;
    height: 20px;
    line-height: 20px;
    position: relative;
    cursor: pointer;
    color: #888;
    background: #fafafa;
    border: 1px solid #ddd;
    border-radius: 4px;
    overflow: hidden;
    display: inline-block;
    *display: inline;
    *zoom: 1
}

.a-upload  input {
    position: absolute;
    font-size: 100px;
    right: 0;
    top: 0;
    opacity: 0;
    filter: alpha(opacity=0);
    cursor: pointer
}

.a-upload:hover {
    color: #444;
    background: #eee;
    border-color: #ccc;
    text-decoration: none
}

.ztree{z-index:999995}
#classifyTree,.tree-container{position:absolute;top:30px;left:0;z-index:95; background:#FFF;border:1px solid #DDD;border-radius:5px;box-shadow:1px 1px 10px rgba(0,0,0,.2)}
#classifyTree .close,.tree-container .close{position:absolute;top:5px;right:5px;font-size:16px;color:#666}



</style>
<div class="j-content ">
	<!--content  左边下部部分-->
	<div class="col-xs-my-40">
				<a class="button" href="<%=path %>/shopses">店铺信息</a> <a class="button" href="<%=path %>/companys">企业信息</a>
					
				<a class="button " href="<%=path %>/companys/12?contract">合同信息</a>   <a class="button button-action" href="">品牌信息</a>
		
			</div>
	
<div class="col-xs-10">
<form class="form-horizontal" action="<%=path%>/companys/123?addsss" method="post"  enctype="multipart/form-data" id="myForm">
	 <div class="col-xs-12 j-register-top">
	 <div class="col-xs-2 j-name control-label">
	   <input type="hidden" name="id" value="${brand.id }">
	   <input type="hidden" name="version" value="${brand.version }">
	 	<label for="name">品牌名称</label>
	 </div>
	 <div class="col-xs-8 form-group">
	 	<input type="text" name="brandName" value="${brand.brandName}"  class="col-xs-my-48 form-control" placeholder="品牌介绍"/>
	 </div>
	 <div class="col-xs-2">
	 </div>
	 </div>

	 <div class="col-xs-12 j-register-top">
	 	<div class="col-xs-2 j-name control-label">
	 		<label for="name">品牌 LOGO</label>
     	</div>
		<div class="col-xs-7 form-group">
		<a href="javascript:;" class="a-upload">
		  <input type="file" onchange="brandLogos(this)" id="1"  >点击上传图片
		</a> 
			
	<div id="brandLogo1">
		<div id="detail1">
	    <input type="hidden" name="brandLogo" value="${brand.brandLogo}">
	    <c:if test="${brand.brandLogo !=null and brand.brandLogo !=''}">
	    <img style="height: 150px;width: 130px" src="${brand.brandLogo}">
	   <div>
	   <a href="javascript:void(0)" onclick="picRemove('detail1')">删除</a>
       </div>
       </c:if>
	</div>
	</div> 
	</div>
	</div>

	 <div class="col-xs-12 j-register-top">
	<div class="col-xs-2 j-name control-label">
		<label for="name">品牌分类</label>
	</div>
	
	<div class="col-xs-10 ">
		<input type="hidden" class="input"  value="${brand.categoryId }">
	<c:forEach items="${shoppingss }" var="shoppingss" varStatus="status">
	 <label class="control-label col-xs-2" style="margin-bottom:10px">
			<input type="checkbox" name="categoryId"  value="${shoppingss.id }" />
			${shoppingss.name }
		</label>

	</c:forEach>
	  </div>
	</div>

	<div class="col-xs-12 j-register-top">
		<div class="col-xs-2 j-name control-label">
			<label for="name">品牌故事</label>
		</div>
			<div class="col-xs-10 form-group">
				<textarea id="brandStory" name="brandStory" row="6" class="form-control">${brand.brandStory}</textarea>
			</div>
	</div>

	<div class="col-xs-12 j-register-top">
	<div class="col-xs-2 j-name control-label">
		<label for="name">品牌资质</label>
	</div>
	<div id="logoAtt">
		<div class="col-xs-2 form-group">
		<a href="javascript:;" class="a-upload">
		  <input type="file" onchange="shopAtt(this)" id="att1"  >资质1
		</a> 

		<div id="satt1">
        <div id="logottatt1">
         <input type="hidden" name="att1" value="${brand.att1 }">
          <c:if test="${brand.att1 !='' and brand.att1 !=null }">
        <img style="height: 174px;width: 120px" src="${brand.att1 }">
        <div><a href="javascript:void(0)" onclick="picRemove('logottatt1')">删除</a></div>
       </c:if>
        </div>
		</div> 
	</div>
	<div class="col-xs-2 form-group">
	<a href="javascript:;" class="a-upload">
	<input type="file" onchange="shopAtt(this)"  id="att2" >资质2
	</a> 

	<div id="satt2">
		   <div id="logottatt2">
         <input type="hidden" name="att2" value="${brand.att2 }">
          <c:if test="${brand.att2 !='' and brand.att2 !=null}">
        <img style="height: 174px;width: 120px" src="${brand.att2 }">
        <div><a href="javascript:void(0)" onclick="picRemove('logottatt2')">删除</a></div>
       </c:if>
        </div>
	</div> 
	</div>
	<div class="col-xs-2 form-group">
		<a href="javascript:;" class="a-upload">
	  <input type="file" onchange="shopAtt(this)" id="att3" >资质3
		</a> 
	
		<div id="satt3">
	   <div id="logottatt3">
         <input type="hidden" name="att3" value="${brand.att3 }">
          <c:if test="${brand.att3 !='' and brand.att3 !=null }">
        <img style="height: 174px;width: 120px" src="${brand.att3 }">
        <div><a href="javascript:void(0)" onclick="picRemove('logottatt3')">删除</a></div>
       </c:if>
        </div>
	</div> 
		</div>
		<div class="col-xs-2 form-group">
		<a href="javascript:;" class="a-upload">
	  <input type="file" onchange="shopAtt(this)"  id="att4" >资质4
		</a> 

		<div id="satt4">
   <div id="logottatt4">
         <input type="hidden" name="att4" value="${brand.att4 }">
          <c:if test="${brand.att4 !='' and brand.att4 !=null }">
        <img style="height: 174px;width: 120px" src="${brand.att4 }">
        <div><a href="javascript:void(0)" onclick="picRemove('logottatt4')">删除</a></div>
       </c:if>
        </div>
		</div> 
		</div>
		<div class="col-xs-2 form-group">
			<a href="javascript:;" class="a-upload">
	 <input type="file" onchange="shopAtt(this)"  id="att5" >资质5
	</a> 
	
		<div id="satt5">
   <div id="logottatt5">
         <input type="hidden" name="att5" value="${brand.att5 }">
          <c:if test="${brand.att5 !='' and brand.att5 !=null }">
        <img style="height: 174px;width: 120px" src="${brand.att5 }">
        <div><a href="javascript:void(0)" onclick="picRemove('logottatt5')">删除</a></div>
       </c:if>
        </div>
		</div> 
	</div>
	</div>	
	</div> 
	<div class="col-sm-12 text-center">
   			<input type="hidden" name="shopId" value="${shopId }">
   				<button type="button" class="btn btn-success"   onclick="sub()" class="left" >保存</button>
<!--          	<button type="submit" class="btn btn-sm btn-success" >保存</button>  -->
    </div>
	
 </form>
	<div class="tab_container">
			<div id="tab1" class="tab_content" style="display: block;">
				<div class="table-scrollable">
					<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
						<thead>
							<tr role="row">
								<th class="">序号</th>
								<th class="">品牌名</th>
								<th class="">品牌分类</th>
								<th class="">状态</th>	
							
								<th class="">操作</th>
								
							</tr>
						</thead>
						<tbody>
							 	<c:forEach items="${productBrand }" var="list" varStatus="status">
								<tr>
									<td class="j-odd3">${(status.index+1)}</td>
									<td class="j-odd4">${list.brandName }</td>
									<td class="j-odd4">${list.categoryName }</td>
									<td class="j-odd4">
									 <c:if test="${list.auditStatus == 0 }">
								    待审核
									  </c:if>
									<c:if test="${list.auditStatus == 2 }">
								     	通过
									  </c:if>
									  <c:if test="${list.auditStatus == 3 }">
									  不通过
									
												<img onmouseout="fdhidden(${list.id})" onmouseover="fd(${list.id})" style="position: absolute; border: 0px; padding: 0px; width: 12px; height: 17px; float: right;" class="img " src="<%=path%>/images/message.png">
											
									  </c:if>
									  <div id="fd${list.id}" style="display: none;" class="fd">${list.auditReasion }</div>
									</td>
									 
								
									
									
									<td class="j-odd4">
									  <c:if test="${list.auditStatus == 0 }">
									 <a style="color: #1BBC9B" onclick="rec(${list.id })">删除</a>
									  </c:if>
									    <c:if test="${list.auditStatus == 3 }">
									    <a style="color: #1BBC9B" onclick="rec(${list.id })">删除</a>
									
									  </c:if>
									<a href="/shop/companys/${list.id }?update" ">编辑</a></td>
								
							
								</tr>
							</c:forEach>
						</tbody>
					</table>
				
					
				</div>
			</div>
		</div>
<!-- 		<button type="button"   onclick="brandAdd(this)" class="left" style="padding: 5px 15px; border: 1px solid #017e43; border-radius: 4px; background: #017e44; color: #fff;">添加品牌</button>  -->
    
      
        
</div>

</div>
<script>

//品牌资质
function shopAtt(obj){
	var images = $('#logoAtt img');
	ss=images.length+1
	
	var att=obj.id
	
	var fd = new FormData();
	 
	fd.append("imgFile", obj.files[0]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			$("#logott"+att).remove();
//				alert("上传成功,请进行切图！");   
			$("#s"+att).append("<div id='logott"+att+"'><img  style='height: 174px;width: 120px' src='"+data+"'><input type='hidden'  name='"+att+"' value='"+data+"'/>"
			+"<div><a href='javascript:void(0)'  onclick='picRemove(\"logott"+att+"\")'>删除</a></div></div>")
         

		}
	})
} 
//品牌LOGO
function brandLogos(obj){
	
	var fd = new FormData();
	var index = obj.id;
	fd.append("imgFile", obj.files[0]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			$("#detail1").remove();
			$("#brandLogo1").append("<div id='detail1'><img  style='height: 150px;width: 130px' src='"+data+"'><input type='hidden'  name='brandLogo' value='"+data+"'/>"
			+"<div><a href='javascript:void(0)'  onclick='picRemove(\"detail"+index+"\")'>删除</a></div></div>") 
          

		}
	})
} 
function picRemove(obj){
	
	$("#"+obj).remove();
}
$(function(){
	//复选框回写
	(function(){
		var input = $('.input');
		for(var i=0; i<input.length; i++){
			var value = input.eq(i).val();
			value = value.split(',');
			console.log(value);
			for(var x=0; x<value.length; x++){
				input.eq(i).parent().find('input[value="'+$.trim(value[x])+'"]').attr('checked',true);
			}
		}

	})();
	  
})
function rec(id)  
{  
    var mymessage=confirm("是否确定删除！");  
    if(mymessage){ 
    	window.location.href="<%=path%>/companys/"+id+"?delete"; 
    }
    
}
function sub(str){

	if($("input[name='brandName']").val()==''){
		alert("请填写品牌名称");
		 return false	
		
	}
	if($("input[name='brandLogo']").val()=='' || $("input[name='brandLogo']").val()==null ){
		alert("请上传品牌LOGO");
		 return false	
		
	}
	if($("input[name='categoryId']:checked").val()=='' || $("input[name='categoryId']:checked").val()==null){
		alert("请选择品牌分类");
		 return false	
		
	}
	if($("#brandStory").val()==""){
		alert("请填写品牌故事");
		 return false	
		
	}

	if($("input[name='att1']").val()=='' || $("input[name='att1']").val()==null){
		alert("请上传品牌资质1");
		 return false	
		
	}
	

	document.forms['myForm'].submit();
}
function fdhidden(id){
	$("#fd"+id).attr("style", "display: none;");
}
function fd(id) {
	$("#fd"+id).attr("style", "display: block;");
}
</script>