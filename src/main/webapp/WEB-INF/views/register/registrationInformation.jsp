<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>
<script src="<%=path%>/js/email.js"></script>
<script src="<%=path%>/js/jquery.ztree.all.min.js"></script>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/zTreeStyle.css" />
<script src="<%=path%>/js/emailAutoComplete.js"></script>

<link rel="stylesheet" href="<%=path%>/css/lanrenzhijia.css"  />

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


.auto-tip {background:#FFF; padding:10px; width:auto!important;}

</style>
<link rel="stylesheet" href="<%=path %>/css/valid.css" />
<!--title部分-->
<div class="j-register col-xs-my-48">
	<div class="col-xs-my-7">&nbsp;</div>
	<div class="col-xs-my-7">
		<div class="col-xs-12">
			<img src="<%=path %>/img/logo.png" />
		</div>
		<div class="col-xs-12">
			<p>途有铃动，必有乾坤</p>
		</div>
	</div>
	<div class="col-xs-my-1 j-line"></div>
	<div class="col-xs-my-22">
		<div class="col-xs-12 j-register-font">商家管理后台</div>
		<div class="col-xs-12 j-register-fontE">Merchant&nbsp;system</div>
	</div>
	<div class="col-xs-my-11 j-register-a">
		<a href="<%=path %>/login">登录|</a> <a href="<%=path %>/register">注册</a>
	</div>
</div>
<!--content部分-->
<<div class="col-xs-my-4">&nbsp;</div>
	<div class="col-xs-my-40 j-bodyRE">
		<div>
			<!--注册进度条-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2">&nbsp;</div>
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">1.注册</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register1">
						<div class="j-Nav">2.提交入驻信息</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">3.入驻信息审核</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register2">
						<div class="j-Nav2">4.签订合同</div>
					</div>
				</div>
				<div class="col-xs-my-9">
					<div class="j-register3">
						<div class="j-Nav3">5.开始营业</div>
					</div>
				</div>
			</div>
			<!--/注册进度条-->
			<!--注册表单内容-->
			<div class="col-xs-my-48">
				<div class="col-xs-my-2">&nbsp;</div>
				<div class="col-xs-my-44 j-form">
					<!--form 注册表单-->
						<form  action="<%=path %>/register?information" method="post"  id="myForm" >
		

						<!--公司地址(以上部分需要添加js选择城市)-->
			    	<input type="hidden" name="moId" value=${id}>
					<h2 style="padding:1em; font-size:24px; font-weight:bold; text-align:center; color:#333">入驻信息</h2>
						
					<h3 style="padding:1em; font-size:18px; font-weight:bold; text-align:center; color:#333">企业信息</h3>
					  <!--公司名称-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">公司名称</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text"  id="cname" name="name" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入公司名称"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
					
							<!--注册地址-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">注册地址</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="address" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入注册地址"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						
						<!--法人名称-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">法人名称</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="legalPersion" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入法人名称"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<!--法人证件号-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">法人证件号</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="legalPersionCard" id="legalPersionCard"   value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入法人证件号"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<!--联系人-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">联系人</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="contactPerson" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入联系人"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<!--手机号-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">手机号</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" onchange="chePhone(this)"  id="phone"  name="phone" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入手机号"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
							<!--邮箱-->
						<!--邮箱-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">邮箱</label>
							</div>
							<div class="parentCls col-xs-5" style="width:58.333333%">
								<input type="text" name="email" value="" datatype="*"  class="inputElem col-xs-my-48  form-control"  placeholder="请输入邮箱" style="width:100%; height:34px; padding:6px 12px"/>
							</div>
						</div>
						<!--企业社会统一信用代码-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">企业社会统一信用代码</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="creditCode" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入企业社会统一信用代码"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						
							
						<h3 style="padding:1em; font-size:18px; font-weight:bold; text-align:center; color:#333">账户信息</h3>
<!-- 					开户行 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">开户行</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="openBank" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入开户行"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
<!-- 						户名 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">户名</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="accountName" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入户名"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
<!-- 						账号 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">账号</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="accountNumber" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入账号"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						
						
					<h3 style="padding:1em; font-size:18px; font-weight:bold; text-align:center; color:#333">店铺基础信息</h3>
<!-- 					店铺名称 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">店铺名称</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="shopName" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="请输入店铺名称"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
<!-- 						经营品类 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">经营品类</label>
							</div>
							<div class="col-xs-9 form-group">
<!-- 							 <select name="isExpect" id="isExpect" class="form-control" style="margin-top:5px"> -->
					      <c:forEach items="${shopping }" var="shopping" varStatus="status">
					         		<label class="control-label col-xs-2" style="margin-bottom:10px">
										<input type="checkbox" name="shopCategoryCommissionRela"  value="${shopping.id }" />
										${shopping.name }
									</label>
					        </c:forEach>
<!-- 					     </select> -->
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						
						
<!-- 							经营地址 -->
						<div class="col-xs-12 j-register-top" data-toggle="distpicker">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">经营地址</label>
							</div>
							<div class="col-xs-3 form-group">
								<select name="provincesId" class="col-xs-my-48 form-control" id="province7"></select>
							</div>
							<div class="col-xs-1"></div>
							<div class="col-xs-3 form-group">
								<select name="citiesId" datatype="*" class="col-xs-my-48 form-control" id="city7"></select>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<label for="name">&nbsp;</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="shopAddress" datatype="*" value="" class="col-xs-my-48 form-control" placeholder="请输入公司详细地址">
							</div>
							<div class="col-xs-2">
							</div>
						</div>
					
<!-- 						联系人 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">联系人</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="shopPersion" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="联系人"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
<!-- 						手机号 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">手机号</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" onchange="checkPhone(this)"  id="shopPhone" name="shopPhone" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="手机号"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
<!-- 						客服电话 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">客服电话</label>
							</div>
							<div class="col-xs-3 form-group">
								<input type="text" name="shopServicePhone" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="客服电话"/>
							</div>
							<div class="col-xs-1 text-center form-control-static">转</div>
							<div class="col-xs-3 form-group">
								<input type="text" name="shopsPhone" value=""  class="col-xs-my-48 form-control" placeholder="分机号"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
<!-- 						店铺介绍 -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<span class="j-color">*</span><label for="name">店铺介绍</label>
							</div>
							<div class="col-xs-7 form-group">
								<input type="text" name="shopContent" value="" datatype="*" class="col-xs-my-48 form-control" placeholder="店铺介绍"/>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						
						
						
						
<!-- 						店铺 LOGO -->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<label for="name">店铺 LOGO</label>
							</div>
							<div class="col-xs-7 form-group">
								<a href="javascript:;" class="a-upload">
							  <input type="file" onchange="shopLogo(this)"  id="1" >点击这里上传图片
								</a> 
								<div id="logo">
								<div id="detail1">
								<input type="hidden" id="shoppingDetail1"  name="ss"  value=""/>
							
								</div>
								</div> 
							</div>
							<div class="col-xs-2">
							</div>
						</div>

						
						
						<!-- 			企业资质-->
						<div class="col-xs-12 j-register-top">
							<div class="col-xs-3 j-name">
								<label for="name">企业资质</label>
							</div>
							<div class="col-xs-7 form-group">
								<a href="javascript:;" class="a-upload">
							  <input type="file" id="img"name="img" onchange="comPany(this)" multiple="multiple" >点击这里上传多张图片
								</a> 
								<input type="button"  data-toggle="modal" data-target="#myModal" class="btn button-rounded button-action  button-small" value="企业资质">
								
								<div id="ddd"></div>
							</div>
							<div class="col-xs-2">
							</div>
						</div>
						
						
							
						<div class="col-xs-5">&nbsp;</div>
						<div class="col-xs-3 j-register-top">
								<button type="button" class="btn btn-success"   onclick="sub()" class="left" >注册</button>
						
						</div>
					
						<div class="col-xs-4">&nbsp;</div>
					</form>
					<!--form 注册表单-->
				</div>
				<div class="col-xs-my-2">&nbsp;</div>
			</div>
			<!--注册表单内容-->
		</div>
	</div>
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog">
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title">企业资质</h4>
      </div>
      <div class="modal-body">
<h1 style="font-size:20px ">您需要上传那些资质</h1>
<h1 style="font-size:20px ">①工商营业执照（三证/五证未合一需提供工商营业执照、组织机构代码证、税务登记证）</h1>
<h1 style="font-size:20px ">②开户行许可证</h1>
<h1 style="font-size:20px ">④公司法人身份证扫描件（正反面）</h1>
<h1 style="font-size:20px ">⑤知识产权证明文件（有则提交）</h1>
<h1 style="font-size:20px ">⑥食品生产许可和食品流通许可(食品类目需提交）</h1>
<h1 style="font-size:20px ">⑦肉品品质检验合格证明（生鲜肉制品）＋动物防疫条件合格证（鸡鸭等禽类）</h1>
	</div>
      <div class="modal-footer">
<!--         <button type="button" class="btn btn-default" data-dismiss="modal">取消</button> -->
<!--         <button type="button" class="btn btn-primary">确定</button> -->
      </div>
    </div><!-- /.modal-content -->
  </div><!-- /.modal-dialog -->
</div><!-- /.modal -->
	<!--content 部分-->

<div class="col-xs-my-4">&nbsp;</div>
<div class="clearfix"></div>

<div id="classifyTree" class="ztree tree-container"><!--树容器--></div>

<script>
$("#myForm").Validform({
	tiptype:1
});

// 品牌LOGO
function brandLogo(obj){

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

			   
			$("#brandLogo"+index).append("<div id='detail"+index+"'><img  style='height: 150px;width: 130px' src='"+data+"'><input type='hidden'  name='productBrand["+index+"].brandLogo' value='"+data+"'/>"
			+"<div><a href='javascript:void(0)'  onclick='picRemove(\"detail"+index+"\")'>删除</a></div></div>") 
          

		}
	})
} 
// 店铺LOGO
function shopLogo(obj){

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
			

		
				$("#detail"+index).remove();
			   
			$("#logo").append("<div id='detail"+index+"'><img  style='height: 150px;width: 130px' src='"+data+"'><input type='hidden'  name='shopsImg' value='"+data+"'/>"
			+"<div><a href='javascript:void(0)'  onclick='picRemove(\"detail"+1+"\")'>删除</a></div></div>")
         

		}
	})
} 
//品牌资质
function shopAtt(obj){
	var images = $('#logoAtt img');
	ss=images.length+1
	
	var att=obj.id
	var atts= att.slice(1);
 	var asd= att.slice(0,1);
	
	var fd = new FormData();
	 
	fd.append("imgFile", obj.files[0]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			
//				alert("上传成功,请进行切图！");   
			$("#s"+att).append("<div id='logott"+att+"'><img  style='height: 174px;width: 120px' src='"+data+"'><input type='hidden'  name='productBrand["+asd+"]."+atts+"' value='"+data+"'/>"
			+"<div><a href='javascript:void(0)'  onclick='picRemove(\"logott"+att+"\")'>删除</a></div></div>")
         

		}
	})
} 
//多图上传
function comPany(obj){
	var fd = new FormData();
	$("#ddd").append("<div id='Prompt' style='width:300px; height:200px'><h8>图片上传中,请稍等！</h8></div>")
	for(var i=0;i<obj.files.length;i++){

		comPanyss(obj,i)
	}
       $("#img").val("");
	} 
	var cc=0
function comPanyss(obj,i){

	var fd = new FormData();
	fd.append("imgFile", obj.files[i]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			
// 			art.dialog.data('img', data);
			
			var ss=cc;
			cc++;
	$("#Prompt").remove();
			$("#ddd").append("<div  id='d"+ss+"'><div id='s"+ss+"'><img  style='height: 200px;width: 250px' src='"+data+"'>  <input type='hidden'  name='mobileUsersAuthLicePic["+ss+"].licePic'  value='"+data+"' />"
			+"<span><a href='javascript:void(0)'  onclick='picRemove(\"d"+ss+"\")'>删除</a>"
			+"</span></div></div>")
		}
	})
	} 
//多图上传的删除
function picRemove(obj){
	
	$("#"+obj).remove();
}



// 店铺的手机号验证
function  checkPhone(obj){
	
	var str = parseInt($(obj).val());

    var  re = /^1\d{10}$/
    if (re.test(str)) {
       
    } else {
    	
        alert("手机号错误,请重新填写");
        $("#shopPhone").val("");
    }
}
//企业的手机号验证
function  chePhone(obj){

	var str = parseInt($(obj).val());

    var  re = /^1\d{10}$/
    if (re.test(str)) {
       
    } else {
    	
        alert("手机号错误,请重新填写");
        $("#phone").val("");
    }
}

	function sub(str){
		
	var ccc = $("input[name='shopCategoryCommissionRela']:checked").val();
	if(ccc==null){
		alert("请选择经营品类")
		return false
	}

	if($("#cname").val()==''){
		alert("请填写公司名称")
		return false
	}
	if($("input[name='address']").val()==''){
		alert("请填写注册地址")
		return false
	}
	if($("input[name='legalPersion']").val()==''){
		alert("请填写法人名称")
		return false
	}
	if($("input[name='legalPersionCard']").val()==''){
		alert("请填写法人证件号")
		return false
	}
	if($("input[name='contactPerson']").val()==''){
		alert("请输入联系人")
		return false
	}
	if($("input[name='phone']").val()==''){
		alert("请填写公司的手机号")
		return false
	}
	if($("input[name='email']").val()==''){
		alert("请输入邮箱")
		return false
	}
	if($("input[name='creditCode']").val()==''){
		alert("请输入企业社会统一信用代码")
		return false
	}
	if($("input[name='openBank']").val()==''){
		alert("请输入开户行")
		return false
	}
	if($("input[name='accountName']").val()==''){
		alert("请输入户名")
		return false
	}
	if($("input[name='accountNumber']").val()==''){
		alert("请输入账号")
		return false
	}
	if($("input[name='shopName']").val()==''){
		alert("请输入店铺名称")
		return false
	}
	if($("input[name='shopAddress']").val()==''){
		alert("请输入商铺地址")
		return false
	}
	if($("input[name='shopPersion']").val()==''){
		alert("请输入商铺联系人")
		return false
	}
	if($("input[name='shopPhone']").val()==''){
		alert("请输入商铺手机号")
		return false
	}
	if($("input[name='shopServicePhone']").val()==''){
		alert("请输入客服电话")
		return false
	}
	if($("input[name='shopContent']").val()==''){
		alert("请输入店铺介绍")
		return false
	}
	
		document.forms['myForm'].submit();
	}
</script>