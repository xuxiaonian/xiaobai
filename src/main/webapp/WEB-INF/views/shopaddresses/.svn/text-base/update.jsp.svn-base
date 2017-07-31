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
<div class="j-content">
	<!--content  form内容部分-->
	<div class="col-xs-my-1">&nbsp;</div>
	<div class="col-xs-my-40 j-Commodity-up">
		<!--form 注册表单-->
		<form action="<%=path%>/shopaddresses" method="post" role="form">
			<input type="hidden" name="_method" value="PUT"/>
			<input type="hidden" name="shopAddressId" value="${shopAddress.id }"/>
			<input type="hidden" name="version" value="${shopAddress.version }"/>
			<div>
				<div class="col-xs-12 j-register-top">
					<div class="col-xs-2 j-name">
						<span class="j-color">*</span><label for="name">联系人：</label>
					</div>
					<div class="col-xs-10 form-group">
						<input type="text" name="contact" value="${shopAddress.contact }" class="col-xs-my-43 form-control" placeholder="请输入公司名称">
					</div>
				</div>
				<!--联系人-->
				<div class="col-xs-12 j-register-top" data-toggle="distpicker">
					<div class="col-xs-2 j-name">
						<span class="j-color">*</span><label for="name">所在地区：</label>
					</div>
					<div class="col-xs-3 form-group">
						<select name="provinces" data-province="${shopAddress.provinces.provinceName }" class="col-xs-my-46 form-control" id="province7"></select>
					</div>
					<div class="col-xs-3 form-group">
						<select name="cities" data-city="${shopAddress.cities.name }" class="col-xs-my-46 form-control" id="city7"></select>
					</div>
					<div class="col-xs-3 form-group">
						<select name="areas" data-district="${shopAddress.areas.areaName }" class="col-xs-my-46 form-control" id="district1"></select>
					</div>
				</div>
				<!--所在地区-->
				<div class="col-xs-12 j-register-top">
					<div class="col-xs-2 j-name">
						<span class="j-color">*</span><label for="name">街道地址：</label>
					</div>
					<div class="col-xs-10 form-group">
						<textarea class="col-xs-my-43 form-control" name="address" rows="3" placeholder="不需要填写省/市/县">${shopAddress.address }</textarea>
					</div>
				</div>
				<!--街道地址-->
				<div class="col-xs-12 j-register-top">
					<div class="col-xs-2 j-name">
						<span class="j-color">*</span><label for="name">邮政编码：</label>
					</div>
					<div class="col-xs-10 form-group">
						<input type="text" name="zipcood" value="${shopAddress.zipcood }" class="col-xs-my-43 form-control" placeholder="请输入邮政编码">
					</div>
				</div>
				<!--邮政编码-->
				<div class="col-xs-12 j-register-top">
					<div class="col-xs-2 j-name">
						<span class="j-color">*</span><label for="name">手机号码：</label>
					</div>
					<div class="col-xs-10 form-group">
						<input type="text" name="phoneNumber" value="${shopAddress.phoneNumber }" class="col-xs-my-43 form-control" placeholder="请输入手机号码">
					</div>
				</div>
				<!--手机号码-->
				<div class="col-xs-12 j-register-top">
					<div class="col-xs-2 j-name">
						<label for="name">电话号码：</label>
					</div>
					<div class="col-xs-2 form-group">
						<input type="text" name="tel1" value="${shopAddress.tel1 }" class="col-xs-my-47 form-control" placeholder="区号">
					</div>
					<div class="col-xs-2 form-group">
						<input type="text" name="tel2" value="${shopAddress.tel2 }" class="col-xs-my-47 form-control" placeholder="电话">
					</div>
					<div class="col-xs-2 form-group">
						<input type="text" name="tel3" value="${shopAddress.tel3 }" class="col-xs-my-47 form-control" placeholder="分机号码">
					</div>
					<div class="col-xs-2 form-group j-code">区号-电话-分机号码</div>
				</div>
				<!--电话号码-->
				<div class="col-xs-12">
					<div class="col-xs-5">&nbsp;</div>
					<div class="col-xs-3 j-register-top">
						<button type="submit" class="button button-action button-rounded" id="Preservation">保存设置</button>
					</div>
					<div class="col-xs-4">&nbsp;</div>
				</div>
				<!--button 保存-->
			</div>
		</form>
		<!--form 注册表单-->
		<!--列表修改或删除地址-->
		<div>
			<div class="col-xs-my-1">&nbsp;</div>
			<div class="col-xs-my-46">
				<div id="tab1" class="tab_content" style="display: block;">
					<div class="table-scrollable">
						<table id="simpledatatable" class="table table-striped table-bordered table-hover dataTable no-footer" aria-describedby="simpledatatable_info">
							<thead>
								<tr role="row">
									<th class="">发货地址</th>
									<th class="">退货地址</th>
									<th class="">联系人</th>
									<th class="">所在地区</th>
									<th class="">街道地区</th>
									<th class="">邮政编码</th>
									<th class="">手机号</th>
									<th class="">电话号码</th>
									<th class="">操作</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${shopaddresses }" var="shopaddress">
									<tr class="odd">
										<td class="j-odd2">
											<div class="radio">
												<label> <c:if test="${shopaddress.sendProduct }">
														<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" onclick="changeSendProduct(${shopaddress.id})" checked> 默认
												</c:if> <c:if test="${!shopaddress.sendProduct }">
														<input type="radio" name="optionsRadios" id="optionsRadios1" value="option1" onclick="changeSendProduct(${shopaddress.id})"> 默认
												</c:if>
												</label>
											</div>
										</td>
										<td class="j-odd2">
											<div class="radio">
												<label> <c:if test="${shopaddress.returnProduct }">
														<input type="radio" name="optionsRadios1" id="optionsRadios1" value="option1" onclick="changeReturnProduct(${shopaddress.id})" checked> 默认
											</c:if> <c:if test="${!shopaddress.returnProduct }">
														<input type="radio" name="optionsRadios1" id="optionsRadios1" value="option1" onclick="changeReturnProduct(${shopaddress.id})"> 默认
											</c:if>
												</label>
											</div>
										</td>
										<td class="j-odd2">${shopaddress.contact }</td>
										<td class="j-odd2">${shopaddress.provinces.provinceName }${shopaddress.cities.name }${shopaddress.areas.areaName }</td>
										<td class="j-odd2">${shopaddress.address }</td>
										<td class="j-odd2">${shopaddress.zipcood }</td>
										<td class="j-odd2">${shopaddress.phoneNumber }</td>
										<td class="j-odd4">${shopaddress.tel1 }-${shopaddress.tel2 }-${shopaddress.tel3 }</td>
										<td><a href="<%=path %>/shopaddresses/${shopaddress.id}?form" class="j-odd6">编辑</a>
										<c:if test="${!shopaddress.sendProduct && !shopaddress.returnProduct}">
											<a onclick="deleteAddress(${shopaddress.id})" class="j-odd5">删除</a>
										</c:if>
										<br> <!--这里是dialog弹出--></td>
									</tr>
									<form action="<%=path %>/shopaddresses/${shopaddress.id}" method="post" id="deleteForm${shopaddress.id}">
											<input type="hidden" name="_method" value="DELETE">
										</form>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<div class="col-xs-my-1">&nbsp;</div>
		</div>
		<!--列表修改或删除地址-->
	</div>
</div>
<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<!--dialog页面的弹出引用js文件-->
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<!--dialog页面的弹出引用js文件-->
<script>
	function deleteAddress(id){
		art.dialog({
			lock: true,
			fixed: true,
			title:"提示",
		    content: '确定要删除这个地址码?',
		    button: [
				{
				    name: '取消'
				},
		        {
		            name: '确定',
		            callback: function () {
		            	$("#deleteForm"+id).submit();
		            	this.close();
		                return false;
		            },
		            focus: true
		        }
		    ],
		    cancel: true
		});
	}
	function changeSendProduct(id){
		 $.ajax({
 			url : '<%=path%>/shopaddresses?method=updateSendProduct&shopAddressId='+id,
 			type: 'POST',
 			contentType : "application/json",//application/xml
 			processData : true,//contentType为xml时，些值为false
 			dataType : "html",//json--返回json数据类型；xml--返回xml
 			success : function(data) {
 				window.location.reload();//刷新当前页面.
 			},
 		});
	}
	
	function changeReturnProduct(id){
		 $.ajax({
			url : '<%=path%>/shopaddresses?method=updateReturnProduct&shopAddressId='+id,
			type: 'POST',
			contentType : "application/json",//application/xml
			processData : true,//contentType为xml时，些值为false
			dataType : "html",//json--返回json数据类型；xml--返回xml
			success : function(data) {
				window.location.reload();//刷新当前页面.
			},
		});
	}
</script>
