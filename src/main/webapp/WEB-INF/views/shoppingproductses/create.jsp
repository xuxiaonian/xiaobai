<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/bobo.css" />
<link rel="stylesheet" href="<%=path%>/css/jcrop/jquery.Jcrop.css">
<script src="<%=path%>/js/jcrop/jquery.Jcrop.js"></script>
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<link href="<%=path%>/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="<%=path%>/js/fileinput.js" type="text/javascript"></script>

<%-- <link href="<%=path%>/css/default/default.css" media="all" rel="stylesheet" type="text/css" /> --%>
<link href="<%=path%>/css/code/prettify.css" media="all" rel="stylesheet" type="text/css" />

<script src="<%=path%>/js/kindeditor.js"></script>
<script src="<%=path%>/js/zh_CN.js"></script>
<script src="<%=path%>/css/code/prettify.js"></script>
<script src="<%=path%>/js/multiimage.js"></script>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>

<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>

<link rel="stylesheet" href="<%=path%>/js/webuploader.css">
<link rel="stylesheet" href="<%=path%>/js/image-upload/uploaderstyle.css">

<link rel="stylesheet" href="<%=path%>/css/valid.css" />
<script src="<%=path%>/js/webuploader.js"></script>
<style type="text/css">
	#ddd {overflow:hidden}
	#ddd>div>div {float:left; margin:10px;}
	#ddd>div>div>span {display:block; text-align:center!important;}
	#ddd>div>div>span>a {display:inline-block; padding:5px; text-decoration: none;}
	/*a  upload */
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
</style>
<div>
	<div class="j-content">
		<!--content  左边下部部分-->
		<div class="col-xs-my-1">&nbsp;</div>
		<div class="col-xs-my-46 j-Commodity-up">
			<div class="j-Guidepage col-xs-my-48">
				<div class="col-xs-my-20">
					<ul>
						<li>类目:</li>
						<li>${shoppingProducts.shoppingCategoryName }</li>
						<li><a style="color: #1BBC9B" onclick="rec()">切换类目</a></li>
					</ul>
				</div>
			</div>
			<!--tab 内容切换-->
			<div class="o_content">
				<form action="<%=path%>/shoppingproductses" method="post" onkeydown="if(event.keyCode==13)return false;" enctype="multipart/form-data" id="myForm">
					<input id="categoryId" type="hidden" name="shoppingCategoryId" value="${shoppingProducts.shoppingCategoryId.id}" /> <input id="shoppingCategoryName" type="hidden" name="shoppingCategoryName"
						value="${shoppingProducts.shoppingCategoryName }" />
					<div class="o_content_border">
						<h2 class="o_padding_left">基本信息</h2>
						<div class="o_detail">
							<div class="o_detail_inp clear">
								<span class="left width_20">
								<span style="color: red;">*</span>商品名称</span> 
								<div style="width: 35%; float:left">
								<div class="keyword" ></div>
								<input name="name" onchange="keyWord(this)" maxlength="15" datatype="*" class="form-control" type="text"  />
								</div>
								<span class="right width_40 font_size14">商品名称长度至少3字符，最长15个汉字。品牌名+产品名，例：覆膜田红色米砖。</span>
							</div>

							<div class="o_detail_inp clear">
								<span class="left width_20">商家货号</span> <input name="productNumber" class="left width_40 form-control" type="text" maxlength="20" style="width: 35%;" /> <span
									class="right width_40 font_size14" style="line-height: 19px;">商家货号是指商家管理商品的，买家不可见最多可输入20个字符</span>
							</div>
							
							<!-- 预售商品 -->
							<div class="o_detail_inp clear">
					            <span class="left width_20"><span style="color: red;">*</span>预售商品 </span> 
								<label class="form-control-static">
									<input type="radio" name="is_expect_goods" value="1" />是
								</label>
								<label class="form-control-static">
									<input type="radio" name="is_expect_goods" value="0" checked="checked" />否
								</label>
							</div>
							<div class="is_expect_goods_con" style="display:none">
								<div class="o_detail_inp clear">
								       <span class="left width_20">预售期</span> 
								       <div class="col-sm-4">
								       		<input id="expect_time_begin" readonly="readonly"  class="form-control" readonly="readonly" name="expectTimeBegin" size="16" type="text"/>
								       </div>
								       <span class="left">至</span>
								       <div class="col-sm-4">
								       		<input  id="expect_time_end" readonly="readonly"   class="form-control"  name="expectTimeEnd" size="16" type="text"/>
										</div>
								</div>
	                            <div class="o_detail_inp clear">
									 <span class="left width_20"><span style="color: red;">*</span>发货日期</span> 
									 <input class="form-control  left width_40 form-control" readonly="readonly"  style="width: 35%;"  id="send_goods_time" name="sendGoodsTime" size="16" type="text" value="">
								</div>
	                            <div class="o_detail_inp clear">
							         <span class="left width_20"><span style="color: red;">*</span>预售结束转为普通商品 </span> 
							         <label class="form-control-static">
										 <input type="radio" name="isCommon"  checked="checked" value="1" />是
									</label>
									<label class="form-control-static">
										<input type="radio" name="isCommon"  value="0" />否
									</label>
								</div>
							</div>
                            <!-- 预售商品 结束-->
                            
							<div class="o_detail_inp clear">
								<span class="left width_20"><span style="color: red;">*</span>商品销售规格</span>
								<table class="width_80 left" id="table">
									<tr>
										<td class="o_border_right bond">商品规格</td>
										<td class="o_border_right bond">重量（KG）</td>
										<td class="o_border_right bond">市场价（元）</td>
										<td class="o_border_right bond">销售价（元）</td>
										<td class="o_border_right bond">库存</td>
										<td class="o_border_right bond">库存预警值</td>
										
										<td class="bond">操作</td>
									</tr>
									<tr id="tr0">
										<td class="o_border_right font_size9"><input type="text" id="" datatype="*" name="shoppingProductsSpecs[0].specName" class="col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size9"><input type="text"   name="shoppingProductsSpecs[0].weight" class="col-xs-my-48 form-control lly" /></td>
										<td class="o_border_right font_size9"><input type="text"   name="shoppingProductsSpecs[0].orgPrice" class="col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size9"><input type="text"   name="shoppingProductsSpecs[0].price" class=" col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size4"><input type="text"   name="shoppingProductsSpecs[0].productsNum" class=" col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size6"><input type="text"   name="shoppingProductsSpecs[0].warningNum" class=" col-xs-my-48 form-control" /></td>
										
										<td style="width: 51px"></td>
									</tr>
								</table>
							</div>
							<div class="o_add text_right" style="margin-bottom: 100px;">
								<button type="button" onclick="addTr()" class="button btnFFF bond green" id="Preservation">添加规格</button>
							</div>

						
							<div class="o_detail_inp clear">

								<span class="left width_20"><span style="color: red;">*</span>库存</span> 
								 <input id="stock" name="stock" maxlength="7" value="" class="left width_40 form-control" type="text" style="width: 35%;" />

							</div>
<!-- 							<div class="o_detail_inp clear"> -->
<!-- 								<span class="left width_20">库存预警值</span> <input name="stockWarning" maxlength="7" datatype="n" ignore="ignore" class="left width_40 form-control" type="text" style="width: 35%;" /> <span -->
<!-- 									class="right width_40 font_size14">库存预警数量必须为0-999999的整数</span> -->
<!-- 							</div> -->
							<div class="o_detail_inp clear">
						
								<span class="left width_20">推荐理由</span> 
									<div style="width: 35%; float:left">
								<div class="keyword" ></div>
								<input onchange="keyWord(this)" name="recommendReason" maxlength="15" class="form-control" type="text" " />	</div> <span
									class="right width_40 font_size14">展示在商品主图上的水印文字，例：一口栗羊羹。甜蜜一座城或桂林山水孕育的野猪肉</span>
						
							</div>

							<div class="o_detail_inp clear" data-toggle="distpicker">
								<span class="left width_20"><span style="color: red;">*</span>产地</span> <select name="provinces" datatype="*" class="left width_20 line_height form-control" type="text" style="width: 20%;"></select>
								<select name="cityId" datatype="*" class="left width_20 line_height form-control" style="margin-left: 20px;"></select><span
									class="right width_30 font_size14">商品展示在选择的产地城市列表中</span>
							</div>
							<div class="o_detail_inp clear">
								<span class="left width_20">商品品牌</span> <select name="productBrandId" class="left width_20 line_height form-control" style="width: 20%;">
										<option value=""></option>
									<c:forEach items="${product }" var="productbrand">
										<option value="${productbrand.id}">${productbrand.brandName }</option>
									</c:forEach>
								</select>
								<!--控件-->
							</div>

							<div class="o_detail_inp clear">
								<span class="left line_height" style="display: block; width: 100%;"><span style="color: red;">*</span>商品主图 </span>
								<div class="col-xs-my-48" id="uploadDiv">
<!-- 									<div class="form-group" style="width: 20%; float: left" id="uploadDiv0"> -->
<!-- 										<div class="kv-avatar center-block" id="shoppingProductPictures0"> -->
<!-- 											<input id="avatar-0"   name="shoppingProductPictures[0]." datatype="*" onchange="fileChange(this)" type="file" class="file-loading"> -->

<!-- 										</div> -->
<!-- 									</div> -->
									<div class="form-group" style="width: 20%;float:left" id="uploadDiv0">
										<div class="kv-avatar center-block">
											<input id="avatar-0" name="shoppingProductPictures[0].attachment" datatype="*" type="file" class="file-loading">
										</div>
									</div>
									<div class="form-group" style="width: 20%; float: left" id="uploadDiv1">
										<div class="kv-avatar center-block" id="shoppingProductPictures1">
											<input id="avatar-1" name="shoppingProductPictures[1].attachment" type="file"  class="file-loading">
										</div>
									</div>

									<div class="form-group" style="width: 20%; float: left" id="uploadDiv2">
										<div class="kv-avatar center-block" id="shoppingProductPictures2">
											<input id="avatar-2" name="shoppingProductPictures[2].attachment" type="file" class="file-loading">
										</div>
									</div>
									<div class="form-group" style="width: 20%; float: left" id="uploadDiv3">
										<div class="kv-avatar center-block" id="shoppingProductPictures3">
											<input id="avatar-3" name="shoppingProductPictures[3].attachment" type="file" class="file-loading">
										</div>
									</div>
									<div class="form-group" style="width: 20%; float: left" id="uploadDiv4">
										<div class="kv-avatar center-block" id="shoppingProductPictures4">
											<input id="avatar-4" name="shoppingProductPictures[4].attachment" type="file"  class="file-loading">
										</div>
									</div>
								</div>
								<ul class="upLoadImgNeed line_height_20" style="margin-bottom: 60px;">
									<li class="font_size14 line_height_20">上传要求</li>
									<li class="font_size14">1、图片内容：图片清晰，主体突出，图片上无文字。</li>
									<li class="font_size14">2、图片尺寸：宽度690像素，高度422像素为宜。</li>
									<li class="font_size14">3、200KB以下，格式为jpg格式。</li>
								</ul>
							</div>
							<div id="parameterId">
								<div class="o_detail_inp clear">
									<span class="left width_20">商品参数</span> <input class="left width_20 line_height form-control" name="shoppingProductsParameters[0].parameterType" type="text" style="width: 20%;"
										placeholder="商品类别：净重" /> <input class="left width_20 line_height form-control" name="shoppingProductsParameters[0].parameterValue" placeholder="参数值：1000g" style="margin-left: 20px;" />
									<div class="col-xs-my-1">&nbsp;</div>
									<button type="button" onclick="addParameter()" tabindex="500" title="新增" class="btn btn-default">
										<i class="glyphicon glyphicon-plus"></i>
									</button>
								</div>

							</div>

							
								<div>
									<div class="o_detail_inp clear">
										<span class="left width_20"><span style="color: red;">*</span>基础描述</span>
									
									
									<c:forEach items="${gsBig }" var="gsBig" varStatus="status">
									<c:if test="${gsBig.id==gsBigcategory.get(0).getParentId()}">
									<input type="radio" id="isCommon${gsBig.id }" name="is_Common" onclick="Foundation(this)"  checked="checked"  value="${gsBig.id }" />${gsBig.name }
								    <input id="help" type="hidden"value="${gsBig.id }">
									</c:if>
									<c:if test="${gsBig.id !=gsBigcategory.get(0).getParentId()}">
									<input type="radio" id="isCommon${gsBig.id }" name="is_Common"  onclick="Foundation(this)" value="${gsBig.id }" />${gsBig.name }
									</c:if>
									</c:forEach>
									</div>
									
									
									<ul class="upLoadImgNeed line_height_20" style="margin-bottom: 60px;">
									<li class="font_size14 line_height_20">上传要求</li>
									<li class="font_size14">1、图片内容：图片清晰，主体突出，图片上无文字。</li>
									<li class="font_size14">2、图片尺寸：宽度690像素，高度388像素为宜。</li>
									<li class="font_size14">3、200KB以下，格式为jpg格式。</li>
								     </ul>
								</div>
								<div id="Foundation">
								<div id="Foundation1">
								<input type="hidden" name="gsBigcategoryId" value="${gsBigcategory.get(0).getParentId() }" />
								<c:forEach items="${gsBigcategory }" var="gsBigcategory" varStatus="status">

									<div id="parameterId">
										<div class="o_detail_inp clear">
											
											<c:if test="${gsBigcategory.isRequired==1}">
											<div class="col-xs-my-48" >
												<span class="left width_20"><span style="color: red;">*</span>${gsBigcategory.name}</span>
											</div>
											
								         <div class="keyword" ></div>
												<textarea  onchange="keyWord(this)" id="shoppingProductsDetail${(status.index)*2 }" name="shoppingProductsDetail[${(status.index)*2 }].content" onKeyDown="checkMaxInput(this)"  onKeyUp="checkMaxInput(this)" datatype="*"  maxlength="200" cols="100" rows="3" class="required"></textarea>
											
											 <font align="right" id=remLen><b></b></font>
											</c:if>
											<c:if test="${gsBigcategory.isRequired!=1}">
											<div class="col-xs-my-48" >
												<span class="left width_20">${gsBigcategory.name}(建议填写50-150字)</span>
											</div>
										    <div class="keyword" ></div>
												<textarea onchange="keyWord(this)" name="shoppingProductsDetail[${(status.index)*2 }].content" maxlength="200" cols="100" rows="3" class="required"></textarea>
											
											</c:if>
											<input type="hidden" name="shoppingProductsDetail[${(status.index)*2 }].type" value="1">
					  					    <input type="hidden" name="shoppingProductsDetail[${(status.index)*2}].gsBigcategoryId" value="${gsBigcategory.id }"> 
											<input type="hidden" name="shoppingProductsDetail[${(status.index)*2 }].bigcategoryImage" value="${gsBigcategory.tempPic }"> 
											<input type="hidden" name="shoppingProductsDetail[${(status.index)*2 }].bigcategoryName" value="${gsBigcategory.name }">
											
											<div class="o_detail_inp clear">
												<div class="col-xs-my-48" id="uploadDiv">
													<div class="form-group" style="width: 20%; float: left" id="shoppingProductsDetail${(status.index)*2+1 }">
														<div class="kv-avatar center-block">
															<input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].type" value="2"> 
															<input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].gsBigcategoryId" value="${gsBigcategory.id }">
															 <input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].bigcategoryImage" value="${gsBigcategory.tempPic }">
															 <input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].bigcategoryName" value="${gsBigcategory.name }">
														
																<a href="javascript:;" class="a-upload">
																    <input type="file" onchange="fileDetailChange(this)"  id="${(status.index)*2+1 }" >点击这里上传图片
																</a> 
																<div id="shoppingProductsDetail${(status.index)*2+1 }">
																<div id="detail${(status.index)*2+1 }">
																<input type="hidden" id="shoppingDetail${(status.index)*2+1 }"  name="ss"  value=""/>
															
																</div>
																</div> 
														</div>
													</div>
												</div>
												
											</div>
											
										</div>
									</div>
								</c:forEach>
							</div>
							</div>
							<div id="parameterId" class="row" style="margin-bottom: 20px">
								<div class="o_detail_inp clear">
                                  <div class="col-xs-my-48" >
									<span class="left width_20"><span style="color: red;"></span>更多描述</span> <input type="hidden" name="shoppingProductsContent[0].type" value="1">
									</div>
										<div style="width: 35%; float:left">
								<div class="keyword" ></div>
									<textarea onchange="keyWord(this)" name="shoppingProductsContent[0].content" maxlength="200" cols="120" rows="8" class="required"></textarea>
                                   </div>

								</div>
									<ul class="upLoadImgNeed line_height_20" style="margin-bottom: 60px;">
									<li class="font_size14 line_height_20">上传要求</li>
									<li class="font_size14">1、图片内容：图片清晰，主体突出。</li>
									<li class="font_size14">2、图片尺寸：宽度690像素，高度不限。</li>
									<li class="font_size14">3、200KB以下，格式为jpg格式。</li>
								     </ul>
			

								<div class="row text-right">
								<a href="javascript:;" class="a-upload">
								    <input type="file" id="img"name="img" onchange="fileContent(this)" multiple="multiple" >点击这里上传多张图片
								</a> 
									 					       
							        <div id="ddd"></div>
								</div>
							</div>
                              



							<div class="o_detail_inp clear">
								<div class="col-xs-3">
									<span style="color: red;">*</span>标签
									<input id="shoppingProductMarkName" name="shoppingProductMarkName"  type="hidden"  /> 
								</div>
								<div  class="col-xs-2">
									<div class="keyword" ></div>
									<input id="qwer0" value=""  onchange="keyWord(this)" maxlength="5" style="width:150px;height:30px;">
				            	</div>
				            	<div  class="col-xs-2">
				            		<div class="keyword" ></div>
				                	<input id="qwer1" value="" onchange="keyWord(this)"  maxlength="5"  style="width:150px;height:30px;">
				            	</div>
				            	<div  class="col-xs-2">
				            		<div class="keyword" ></div>
				                	<input id="qwer2" value=""  onchange="keyWord(this)" maxlength="5" style="width:150px;height:30px;">
								</div>
								</div>

							<div class="o_tag" style="overflow: hidden;">
								<span style="font-size: 14px; color: #999; display: block; line-height: 35px;">参考标签</span>
								<c:forEach items="${specialMarks }" var="specialMark" varStatus="status">
									<div class="width_20 clear left">
										<input type="checkbox" onclick="addMark(this)" id ="${specialMark.name }" class="left" name="shoppingProductMarks[${status.index}].name" value="${specialMark.name }"
											style="margin-top: 10px; display: block; height: 15px; width: 20px;" /> <span class="left" style="margin-left: 18px;">${specialMark.name }</span>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>



					<div class="o_content_border">
						<h2 class="o_padding_left">物流信息</h2>
						<input id="parameter" value="0" type="hidden"  /> 
						<div class="o_detail">
							<span>运费</span>
							<div class="clear line_height" style="margin-bottom: 10px;">
								<label class="width_20 clear left">
									<input type="radio" name="isCost" onclick="dianji(true)" data-val="baoyou" checked="checked" value="true" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" /> <span
										class="left" style="margin-left: 18px;">包邮</span>
								</label>								
							</div>
							
							<div class="clear line_height" style="margin-bottom: 10px;">
								<label class="width_20 clear left"><input type="radio" name="isCost" data-val="guding" onclick="dian(true)" value="true" class="left"
										style="margin-top: 10px; display: block; height: 15px; width: 20px;" /> <span class="left" style="margin-left: 18px;">固定运费</span>
								</label>
								<div id="yunfei" style="display: none;">
									<input class="left width_40 form-control" id="cost" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" datatype="*" name="cost" value="0" style="width: 20%;" />
								</div>
								<div id="yunfei" style="display: none;">
									<input class="left width_40 form-control" id="cost" onkeyup="this.value=this.value.replace(/[^0-9-]+/,'');" datatype="*" name="cost" value="0" style="width: 20%;" />
								</div>
							</div>

							<div class="clear line_height">
								<label class="width_20 clear left">
									<input type="radio" id="shopFr" class="left" name="isCost" data-val="moban" value="false" style="margin-top: 10px; display: block; height: 15px; width: 20px;" /> <span class="left" style="margin-left: 18px;">使用运费模板</span>

								</label>
								<select class="width_40 left form-control" style="height: 34px;" id="shopFre" name="">
									<c:forEach items="${shopFreight }" var="shopfreighttemplate">
										<option value="${shopfreighttemplate.id },${shopfreighttemplate.mode }">名称：${shopfreighttemplate.name }</option>
									</c:forEach>
								</select> <span onclick="template(true)" style="padding: 5px 15px; border: 1px solid #017e43; color: #017e43; border-radius: 4px; margin-left: 20px; cursor: pointer;">新建运费模板</span>
							</div>
							
							
							<!-- ------  附加包邮条件 开始 -------- -->
<!-- 							<div class="clear line_height baoyouSet" style="margin-bottom: 40px; display:none"> -->
<!-- 							   <label><input type="checkbox" name="isPostage" value="true"/>&nbsp;附加包邮条件,满</label><input name="wrapPostageNum" type="number" min="1" style="height: 25px; width:50px;" /><label>&nbsp;件 包邮</label> -->
<!-- 							</div> -->
							<!-- ------  附加包邮条件 结束 -------- -->
							
							
						</div>
					</div>

					<div class="o_content_border">
						<h2 class="o_padding_left">发货地址</h2>
						<div class="clear line_height">

							<select id="fahuo" class="width_40 left form-control" style="height: 34px;" name="address">
								<c:forEach items="${shopaddresses }" var="address">
									<option value="${address.id }">发货地址：${address.provinces.provinceName }${address.cities.name }${address.areas.areaName }${address.address }</option>
								</c:forEach>
							</select> <span onclick="address(true)" id="send" style="padding: 5px 15px; border: 1px solid #017e43; color: #017e43; border-radius: 4px; margin-left: 20px; cursor: pointer;">新建发货地址</span>

						</div>
						<div>
							<span id="address"></span>
						</div>
					</div>

					<div class="o_content_border">
						<h2 class="o_padding_left">服务承诺${is_return_goods}</h2>
						<div class="o_detail" style="background: #f6f7f9;">
							<span id="promise">该商品支持72小时发货</span>
							<span style="margin-left: 20px;">商家提供售后</span>
							<c:if test="${is_return_goods==true}"><span>该商品支持7天无理由退货</span></c:if>
						</div>
					</div>

					<div class="o_content_border" style="padding: 60px 0;">
						<div class="clear" style="text-align: center;">
							<div style="width: 350px; margin: 0 auto;" class="clear">
								<button type="button" id="baocun"  onclick="sub(false)" class="left" style="padding: 5px 15px; border: 1px solid #017e43; border-radius: 4px; background: #017e44; color: #fff;">上传提交审核</button>
								<button type="button" id="baocun1" onclick="sub(true)" class="left" style="padding: 5px 15px; border: 1px solid #f0c01e; border-radius: 4px; margin-left: 20px; color: #fff; background: #f0c01e;">保存到仓库</button>
								<!-- <button type="button" onclick="sut(true)" class="left" style="padding: 5px 15px; border: 1px solid #f0c01e; border-radius: 4px; margin-left: 20px; color: #fff; background: rgb(248, 45, 59);">保存并预览</button> -->
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</div>




<script src="<%=path%>/js/artDialog/artDialog.js?skin=default"></script>
<!--dialog页面的弹出引用js文件-->
<script src="<%=path%>/js/artDialog/iframeTools.js"></script>
<script type="text/javascript">
function getDateStr(AddDayCount) {
    var dd = new Date();
    dd.setDate(dd.getDate()+AddDayCount);//获取AddDayCount天后的日期
    var y = dd.getFullYear();
    var m = dd.getMonth()+1;//获取当前月份的日期
    var d = dd.getDate();
    return y+"-"+m+"-"+d;
}
$("#expect_time_begin").datetimepicker({
    format: 'yyyy-mm-dd',
    minView:'month',
    language: 'zh-CN',
    autoclose:true,
    startDate:getDateStr(1)
}).on("changeDate",function(){
	var starttime=$("#expect_time_begin").val();
	$("#expect_time_end").datetimepicker('setStartDate',starttime);
	$("#expect_time_begin").datetimepicker('hide');
	
	
   // $("#expect_time_begin").datetimepicker("setEndDate",$("#expect_time_end").val())
});
$("#expect_time_end").datetimepicker({
    format: 'yyyy-mm-dd',
    minView:'month',
    language: 'zh-CN',
    autoclose:true,
    startDate:getDateStr(2)
}).on("changeDate",function(){
	 var starttime=$("#expect_time_begin").val();
	 var endtime=$("#expect_time_end").val();
	 if(starttime!="" && endtime!=""){
		 if(starttime >= endtime){
			 $("#expect_time_end").val("");
			 alert("结束时间需要大于开始时间");
		 }
	 }
	 $("#expect_time_begin").datetimepicker('setEndDate',endtime);
	 $("#expect_time_begin").datetimepicker('hide');
   // $("#expect_time_end").datetimepicker("setStartDate",$("#expect_time_begin").val())
});
$("#send_goods_time").datetimepicker({
    format: 'yyyy-mm-dd',
    minView:'month',
    language: 'zh-CN',
    autoclose:true,
    startDate:getDateStr(2)
}).on("changeDate",function(){
	  var starttime=$("#expect_time_begin").val();
	  var endtime=$("#expect_time_end").val();
	  var sendtime=$("#send_goods_time").val();
	  if(starttime!="" && sendtime!=""){
			 if(starttime >= sendtime){
				 $("#send_goods_time").val("");
				 alert("发货时间需要大于开始时间");
			 }
		 }
	  if(endtime!="" && sendtime!=""){
			 if(endtime > sendtime){
				 $("#send_goods_time").val("");
				 alert("发货时间需要大于或等于结束时间");
			 }
		 }
	 $("#expect_time_begin").datetimepicker('setEndDate',endtime);
	 $("#expect_time_begin").datetimepicker('hide'); 
  // $("#send_goods_time").datetimepicker("setStartDate",$("#expect_time_end").val())
});



/* 	$('.datetimepicker').datetimepicker({
		language : 'zh-CN',
		format : "yyyy-mm-dd",
		weekStart : 1,
		todayBtn : 1,
		autoclose : 1,
		todayHighlight : 1,
		startView : 2,
		minView : 2,
		forceParse : 0
	}); */
</script>
<!--dialog页面的弹出引用js文件-->
<script>
maxLen = 150; //定义用户可以输入的最多字数
function checkMaxInput(obj) {
	
if (obj.value.length > maxLen){ //如果输入的字数超过了限制
obj.value = obj.value.substring(0, maxLen); //就去掉多余的字
remLen.innerText = '您输入的内容超出了字数限制'
}
else{
remLen.innerText = '还剩下' + (maxLen - obj.value.length) + '字';//计算并显示剩余字数
}
}
//多图上传
function fileContent(obj){
	var fd = new FormData();
	$("#ddd").append("<div id='Prompt' style='width:300px; height:200px'><h8>图片上传中,请稍等！</h8></div>")
	for(var i=0;i<obj.files.length;i++){
		//console.log();
// 		setTimeout(fileContentss(obj,i),300);
 		fileContentss(obj,i)
	}
       $("#img").val("");
	} 
	var cc=0
function fileContentss(obj,i){
// 	console.log(i);
	var fd = new FormData();
	fd.append("imgFile", obj.files[i]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImgs',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
// 			art.dialog.data('img', data);
	
	var arr=data.split('**********'); 
	console.log(arr[0]);
	console.log(arr[1]);
			cc=cc+1;
			var ss=0+cc;
// 		console.log(ss);
	$("#Prompt").remove();
			$("#ddd").append("<div  id='d"+ss+"'><div id='s"+ss+"'><img  style='height: 200px;width: 250px' src='"+arr[0]+"'>  <input type='hidden'  name='shoppingProductsContent["+ss+"].content'  value='"+arr[0]+"' />"
			+"<input type='hidden' name='shoppingProductsContent["+ss+"].type'  value='"+2+"' /><input  class='img' type='hidden' name='shoppingProductsContent["+ss+"].picName'  value='"+arr[1]+"' /><span>"+arr[1]+"</span><span><a href='javascript:void(0)'  onclick='picRemove(\"d"+ss+"\")'>删除</a>"
			+"<a href='javascript:void(0)'  onclick='picLeft("+ss+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+ss+")'>→</a></span></div></div>")
		}
	})
	} 
//多图上传的删除
function picRemove(obj){
	
	$("#"+obj).remove();
}
//多图上传的←
function picLeft(obj){	
	var This=$("#d"+obj).find('img').attr('src');
	var ThisName=$("#d"+obj).find('.img').val();
	var left=obj-1;
	var Other=$("#d"+left).find('img').attr('src');
	var OtherName=$("#d"+left).find('.img').val();
	if(Other!=null){
	
		$("#s"+obj).remove();
	
		$("#d"+obj).append("<div id='s"+obj+"'><img  style='height: 200px;width: 250px' src='"+Other+"'>  <input type='hidden'  name='shoppingProductsContent["+obj+"].content'  value='"+Other+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+obj+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+obj+"].picName'  value='"+OtherName+"' /><span>"+OtherName+"</span><span><a href='javascript:void(0)'  onclick='picRemove(\"d"+obj+"\")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+obj+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+obj+")'>→</a></span></div></div>")
		$("#s"+left).remove();
		
		$("#d"+left).append("<div id='s"+left+"'><img  style='height: 200px;width: 250px' src='"+This+"'>  <input type='hidden'  name='shoppingProductsContent["+left+"].content'  value='"+This+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+left+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+left+"].picName'  value='"+ThisName+"' /><span>"+ThisName+"</span><span><a href='javascript:void(0)'  onclick='picRemove(\"d"+left+"\")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+left+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+left+")'>→</a></span></div></div>")
	
	
	}

	
}
//多图上传的→
function picRight(obj){
	
	var This=$("#d"+obj).find('img').attr('src');
	var ThisName=$("#d"+obj).find('.img').val();
	var left=obj+1;
	var Other=$("#d"+left).find('img').attr('src');
	var OtherName=$("#d"+left).find('.img').val();
	if(Other!=null){
	
		$("#s"+obj).remove();
		
		$("#d"+obj).append("<div id='s"+obj+"'><img  style='height: 200px;width: 250px' src='"+Other+"'>  <input type='hidden'  name='shoppingProductsContent["+obj+"].content'  value='"+Other+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+obj+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+obj+"].picName'  value='"+OtherName+"' /><span>"+OtherName+"</span><span><a href='javascript:void(0)'  onclick='picRemove(\"d"+obj+"\")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+obj+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+obj+")'>→</a></span></div></div>")
		$("#s"+left).remove();
		
		$("#d"+left).append("<div id='s"+left+"'><img  style='height: 200px;width: 250px' src='"+This+"'>  <input type='hidden'  name='shoppingProductsContent["+left+"].content'  value='"+This+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+left+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+left+"].picName'  value='"+ThisName+"' /><span>"+ThisName+"</span><span><a href='javascript:void(0)'  onclick='picRemove(\"d"+left+"\")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+left+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+left+")'>→</a></span></div></div>")
	
	
	}

	
}

function fileChange(obj){
	var fd = new FormData();
	arr=obj.files[0].name.split(".")
	var index = obj.name.substr(24,1);
// 	if(obj.files[0].size>204800){
// 		return false
// 	}
// 	var sss="jpg";
// 	var sss1=arr[arr.length-1];
// 	if(sss1.toLowerCase() != sss.toLowerCase()){
// 		return false
// 	}
	document.getElementById("baocun").disabled = true;
	document.getElementById("baocun1").disabled = true;
	fd.append("imgFile", obj.files[0]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
// 			alert("上传成功,请进行切图！");
			art.dialog.data('img', data);
			$("#inputshoppingProductPictures"+index).remove();
			$("#shoppingProductPictures"+index).append("<input type='hidden' id='inputshoppingProductPictures"+index+"' name='shoppingProductPictures["+index+"].image' value='"+data+"'/>")
	             document.getElementById("baocun").disabled = false; 
			     document.getElementById("baocun1").disabled = false; 
<%-- 			art.dialog.open('<%=path%>/shoppingproductses?Jcrop',{id:'send',title:'截图',lock:true, background:'#000000',cancel:false, --%>
// 				close: function() {
// 					var cutimg = art.dialog.data('cutimg');
// 					if(typeof(cutimg)!="undefined" && cutimg!="null"){
// 						$("#shoppingProductPictures"+index+" img").attr("src",cutimg)
// 						$("#inputshoppingProductPictures"+index).remove();
// 						$("#shoppingProductPictures"+index).append("<input type='hidden' id='inputshoppingProductPictures"+index+"' name='shoppingProductPictures["+index+"].image' value='"+cutimg+"'/>")
// 					}
// 		         }	
// 			});
		}
	})
} 

  function fileDetailChange(obj){


	    document.getElementById("baocun").disabled = true;
		document.getElementById("baocun1").disabled = true;
		var fd = new FormData();
// 		var index1 = obj.name.match(/([^\[\]]+)(?=\])/g);
		var index = obj.id;
		fd.append("imgFile", obj.files[0]);
		$.ajax({
			url : '<%=path%>/uploadFile?updateImg',
			type : "POST",
			processData : false,
			contentType : false,
			data : fd,
			success : function(data) {
// 				alert("上传成功,请进行切图！");
				art.dialog.data('img', data);
 				$("#detail"+index).remove();
				   
				$("#shoppingProductsDetail"+index).append("<div id='detail"+index+"'><img  style='height: 174px;width: 345px' src='"+data+"'><input type='hidden' id='shoppingDetail"+index+"' name='shoppingProductsDetail["+index+"].content' value='"+data+"'/>"
				+"<span><a href='javascript:void(0)'  onclick='picRemove(\"detail"+index+"\")'>删除</a></div>")
                  document.getElementById("baocun").disabled = false; 
			     document.getElementById("baocun1").disabled = false; 
<%-- 				art.dialog.open('<%=path%>/shoppingproductses?Jcrop',{id:'send',title:'截图',lock:true, background:'#000000',cancel:false, --%>
// 					close: function() {  
// 						var cutimg = art.dialog.data('cutimg');
// 						if(typeof(cutimg)!="undefined" && cutimg!="null"){
// 						$("#shoppingProductsDetail"+index+" img").attr("src",cutimg)
// 						$("#inputshoppingProductsDetail"+index).remove();
// 						$("#shoppingProductsDetail"+index).append("<input type='hidden' id='inputshoppingProductsDetail"+index+"' name='shoppingProductsDetail["+index+"].content' value='"+cutimg+"'/>")
// 						}
// 			         }	
// 				});
			}
		})
	} 
  
  function fileContentChange(obj){
	  document.getElementById("baocun").disabled = true;
	document.getElementById("baocun1").disabled = true;
		var ss=Number($("#keep").val());
        ss=ss+1;
      $("#keep").val(ss);
		var fd = new FormData();
		var index = obj.name.match(/([^\[\]]+)(?=\])/g);
		fd.append("imgFile", obj.files[0]);
		$.ajax({
			url : '<%=path%>/uploadFile?updateImg',
			type : "POST",
			processData : false,
			contentType : false,
			data : fd,
			success : function(data) {
				     document.getElementById("baocun").disabled = false; 
				     document.getElementById("baocun1").disabled = false; 
				$("#shoppingProductsContent"+index).append("<input type='hidden' id='inputshoppingProductsContent"+index+"' name='shoppingProductsContent["+index+"].content' value='"+data+"'/>")
			}
		})
	} 
  
$("#myForm").Validform({
	tiptype:1
});

function addMark(obj){
	var mark = $(obj).val();
	 var checkbox = document.getElementById(mark);
	
	var qwer0 = $("#qwer0").val();
	var qwer1 = $("#qwer1").val();
	var qwer2 = $("#qwer2").val();

	 if(checkbox.checked){
		
		 //选中了
		    if(qwer0==""){
		    	$("#qwer0").val(mark);
		    }else{
		    	if(qwer1==""){
			    	$("#qwer1").val(mark);
			    }else{
			    	if(qwer2==""){
				    	$("#qwer2").val(mark);
				    }else{
				    	ss="#"+mark;
				    	
				    	 $(ss).attr("checked",false);
				    	alert("标签超过三个")
				    	
				    }
			    }
		    	
		    }
		  }else{
			 if(qwer0==mark){
				 $("#qwer0").val("");
			 }
           if(qwer1==mark){
           	 $("#qwer1").val("");
			 }
             if(qwer2==mark){
           	  $("#qwer2").val("");
      }
		  }
}

var trid = 0;
var parameterId = 1;

function addTr(){
	trid++;
	$("#parameter").val(trid);
	var shoppingProductsSpecs0orgPrice = $("#shoppingProductsSpecs0orgPrice").val();
	var shoppingProductsSpecs0price = $("#shoppingProductsSpecs0price").val();
	$("#table").append('<tr id="tr'+trid+'"><td class="o_border_right font_size14"><input type="text"  name="shoppingProductsSpecs['+trid+'].specName" class="col-xs-my-48 form-control"/></td><td class="o_border_right font_size9"><input type="text"   name="shoppingProductsSpecs['+trid+'].weight" class="col-xs-my-48 form-control lly" /></td> <td class="o_border_right font_size14"><input type="text" id="shoppingProductsSpecs'+trid+'orgPrice" name="shoppingProductsSpecs['+trid+'].orgPrice" value="" class="col-xs-my-48 form-control"/></td><td class="o_border_right font_size14"><input type="text" id="shoppingProductsSpecs'+trid+'price" name="shoppingProductsSpecs['+trid+'].price" value="" class="col-xs-my-48 form-control"/></td>'
		+'<td class="o_border_right font_size6"><input type="text"   name="shoppingProductsSpecs['+trid+'].productsNum" class=" col-xs-my-48 form-control" /></td>'
		+'<td class="o_border_right font_size6"><input type="text"   name="shoppingProductsSpecs['+trid+'].warningNum" class=" col-xs-my-48 form-control" /></td>'
			
		+'<td><button type="button" onclick="delTr('+trid+')" title="删除" class="btn btn-default"><i class="glyphicon glyphicon-minus"></i></button></td></tr>');

}
function delTr(id){
	$("#tr"+id).remove();
	var tableId = document.getElementById("table"); 
	var cc=0;
	
	for(var i=0;i<100;i++) 
	{ 
		var a = $("input[name='shoppingProductsSpecs["+i+"].productsNum']").val();
		if(a==null){
			a=0
		}
		a=Number(a) 
		
		
		cc=Number(cc)
		cc=cc+a
	}	
	$("#stock").val(cc);
}
function sub(str){

	if($("#fahuo").val()=="" || $("#fahuo").val()==null){
		alert("必须添加一个发货地址");
		 return false
	}
	
   var strq =$("#shopFre").val()
       
    
       var shopFr = $('input[id="shopFr"]').filter(':checked').val();
       if(shopFr !=null){
    	   var strsq= new Array(); //定义一数组 
           strsq=strq.split(","); //字符分割 
           $("#myForm").append('<input type="hidden" name="shopFreightTemplate" value="'+strsq[0]+'"/>');
    	   var lly = $('.lly');
    	 
    	      if(Number(strsq[1])==1){ 
    	    	  for(var i=0;i<lly.length;i++){
    	    		  if(lly.eq(i).val()==''){
    	    			  alert('商品销售规格的重量为必填项不能为空');
    	    			  lly.eq(i).focus();
    	    		  }
    	    	  }
    	      }
       }
      
        var keyword=$(".keyword").text();
    
        if(keyword.length !=0){
    		alert("标红部分存在敏感词，请修改后重新提交。");
    		 return false
    	}
	if($("#shoppingDetail1").val()==""){
		alert("添加商品亮点的图");
		 return false
	}
	if($("#avatar-0").val()==""){
		alert("添加主图");
		 return false
	}
	
	if($("#shoppingProductsDetail0").val().length<50){
		
		alert("商品亮点字数50-150，至少50.");
		 return false
	}

	var qwer0 = $("#qwer0").val();
	var qwer1 = $("#qwer1").val();
	var qwer2 = $("#qwer2").val();
	if(qwer0==""){
		if(qwer1==""){
			ss=qwer2
		}else{
			if(qwer2==""){
				ss=qwer1
			}else{
				ss=qwer1+";"+qwer2
			}
		}
	}else{
		if(qwer1==""){
			if(qwer2==""){
				ss=qwer0
			}else{
				ss=qwer0+";"+qwer2
			}
		}else{
			if(qwer2==""){
				ss=qwer0+";"+qwer1
			}else{
				ss=qwer0+";"+qwer1+";"+qwer2
			}
		}
		
	}
	if(ss==""){
		alert("请选择标签")
		 return false
	}
	var expectTimeEnd=$("input[name='expectTimeEnd']").val();
	var expectTimeBegin=$("input[name='expectTimeBegin']").val();
	var sendGoodsTime=$("input[name='sendGoodsTime']").val();
	if(expectTimeEnd!=null){
		if(sendGoodsTime < expectTimeEnd){
			alert("发货日期必须大于预售结束日期");
			return;
		}
	}else{
		if(expectTimeBegin!=null){
			if(sendGoodsTime < expectTimeBegin){
				alert("发货日期必须大于预售开始日期");
				return;
			}
		}
	}
	var wrapPostageNum =$("input[name='wrapPostageNum']").val();
	if(wrapPostageNum!=null && wrapPostageNum!=""){
		  var r = /^\+?[1-9][0-9]*$/;　　//正整数  
		  var flag=r.test(wrapPostageNum); 
		  if(!flag){
			  alert("必须是整数");
			  return;
		  }
	}
	$("#shoppingProductMarkName").val(ss);
	
	$("#myForm").append('<input type="hidden" name="store" value="'+str+'"/>');
 
	document.forms['myForm'].submit();
}
function sut(str){
	
	$("#myForm").append('<input type="hidden" name="store" value="'+str+'"/>');
	
	$("#myForm").append('<input type="hidden" name="sut" value="'+str+'"/>');
	$("#myForm").submit();
}
function template(str){
	
	$("#myForm").append('<input type="hidden" name="template" value="'+str+'"/>');
	$("#myForm").submit();
}
function address(str){
	$("#myForm").append('<input type="hidden" name="template" value="'+str+'"/>');
	$("#myForm").append('<input type="hidden" name="address" value="2"/>');
	$("#myForm").submit();
}

function addParameter(){
	$("#parameterId").append('<div class="o_detail_inp clear" id="parameterId'+parameterId+'"><span class="left width_20">&nbsp;</span><input class="left width_20 line_height form-control" name="shoppingProductsParameters['+parameterId+'].parameterType" type="text" style="width: 20%;" placeholder="商品类别：净重" /><input class="left width_20 line_height form-control" name="shoppingProductsParameters['+parameterId+'].parameterValue" placeholder="参数值：1000g" style="margin-left: 20px;" /><div class="col-xs-my-1">&nbsp;</div><button type="button" onclick="delParameter('+parameterId+')" tabindex="500" title="删除" class="btn btn-default"><i class="glyphicon glyphicon-minus"></i></button></div>');
	parameterId++;
}

function delParameter(id){
	$("#parameterId"+id).remove();
}
KindEditor.ready(function(K) {
	var editor1 = K.create('textarea[name="details"]', {
		cssPath : '../plugins/code/prettify.css',
		uploadJson : '<%=path%>/uploadFile?upload',
		fileManagerJson : '../jsp/file_manager_json.jsp',
		allowFileManager : true,
		 afterBlur: function(){this.sync();},
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['myForm'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['myForm'].submit();
			});
		}
	});
	prettyPrint();
});
var btnLeft = '<button type="button" class="btn btn-default" title="左移" ' + 
    'onclick="leftDiv(this)">' +
    '<i class="glyphicon glyphicon-chevron-left"></i>' +
    '</button>'; 
var btnRight = '<button type="button" class="btn btn-default" title="右移" ' + 
    'onclick="rightDiv(this)">' +
    '<i class="glyphicon glyphicon-chevron-right"></i>' +
    '</button>'; 
$(".file-loading").fileinput({
	language: 'zh',
    overwriteInitial: true,
    maxFileSize: 2000,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: '删除',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="<%=path%>/img/default_avatar_male.png" alt="Your Avatar" style="width:100%;height:255px"><h6 class="text-muted"></h6>',
	layoutTemplates : {
	main2 : '{preview} {remove} ' + btnLeft+''+btnRight+'{browse}'
	},
	allowedFileExtensions : [ "jpg", "png", "gif","jpeg"]
});
	
function leftDiv(obj){
	var divObj = $(obj).parent().parent().parent();
	var divId = divObj.attr("id");
	var index = divId.substr(9,9);
	if(index>0){
		var $div1 = $("#uploadDiv"+index);
	    var $div3 = $("#uploadDiv"+(index-1));
	    var $temobj1 = $("<div></div>");
	    var $temobj2 = $("<div></div>");
	    $temobj1.insertBefore($div1);
	    $temobj2.insertBefore($div3);
	    $div1.insertAfter($temobj2);
	    $div3.insertAfter($temobj1);
	    $temobj1.remove();
	    $temobj2.remove();
		
		var newDivId = "uploadDiv"+(index-1);
		$("#uploadDiv"+(index-1)).attr("id","uploadDiv7");
		$("#uploadDiv"+index).attr("id",newDivId);
		$("#uploadDiv7").attr("id","uploadDiv"+index);
		
		$("#avatar-"+(index-1)).attr("id","avatar-7");
		$("#avatar-"+index).attr("name","shoppingProductPictures["+(index-1)+"].attachment");
		$("#avatar-"+index).attr("id","avatar-"+(index-1));
		$("#avatar-7").attr("name","shoppingProductPictures["+index+"].attachment");
		$("#avatar-7").attr("id","avatar-"+index);
		
	}else{
		alert("亲，不能再移了！");
	}
}


function rightDiv(obj){
	var divObj = $(obj).parent().parent().parent();
	var divId = divObj.attr("id");
	var index = divId.substr(9,9);
	if(4>index){
		var $div1 = $("#uploadDiv"+index);
	    var $div3 = $("#uploadDiv"+(index*1+1*1));
	    var $temobj1 = $("<div></div>");
	    var $temobj2 = $("<div></div>");
	    $temobj1.insertBefore($div1);
	    $temobj2.insertBefore($div3);
	    $div1.insertAfter($temobj2);
	    $div3.insertAfter($temobj1);
	    $temobj1.remove();
	    $temobj2.remove();

		
		var newDivId = "uploadDiv"+(index*1+1*1);
		$("#uploadDiv"+(index*1+1*1)).attr("id","uploadDiv7");
		$("#uploadDiv"+index).attr("id",newDivId);
		$("#uploadDiv7").attr("id","uploadDiv"+index);
		
		$("#avatar-"+(index*1+1*1)).attr("id","avatar-7");
		$("#avatar-"+index).attr("name","shoppingProductPictures["+(index*1+1*1)+"].attachment");
		$("#avatar-"+index).attr("id","avatar-"+(index*1+1*1));
		$("#avatar-7").attr("name","shoppingProductPictures["+index+"].attachment");
		$("#avatar-7").attr("id","avatar-"+index);
		
	}else{
		alert("亲，不能再移了！");
	}
}


function dianji(obj) {
	document.getElementById("yunfei").style.display="none";
	document.getElementById("cost").value = "0";

}
function dian(obj) {
	$("#yunfei").show()
	document.getElementById("cost").value = "";

}


function rec()  
{  
    var mymessage=confirm("确定会使待保存的数据丢失！");  
    if(mymessage){
    	window.location.href="<%=path%>/shoppingproductses?createCategoryFrom"; 
    }
    
}  
// $("#shoppingProductMarkName").change(function(){
// 	var markName = $("#shoppingProductMarkName").val();
// 	var strs= new Array(); //定义一数组 
// 	strs=markName.split(/[;；]/); //字符分割 
// 	if(strs.length>3){
// 		alert("标签只能添加三个")
// 		return false;
// 	}
// 	for (i=0;i<strs.length ;i++ ) {
// 		cc=strs[i].length;
// 	if(cc>5){
// 		alert("标签的字数最大为5")
// 		return false;
// 	}
// 	}
// 	});
$(function(){
	$('#table').on('change','input',function(){
		var tableId = document.getElementById("table"); 
		var cc=0;
		
		for(var i=0;i<100;i++) 
		{ 
			var a = $("input[name='shoppingProductsSpecs["+i+"].productsNum']").val();
			if(a==null){
				a=0
			}
			
			a=Number(a) 
			
			cc=Number(cc)
			cc=cc+a
		}	
		$("#stock").val(cc);
		var first = $(this).parents('tr:eq(0)').find('td').eq(2).find('input').val();
		var second = $(this).parents('tr:eq(0)').find('td').eq(3).find('input').val();
		var oneq = $(this).parents('tr:eq(0)').find('td').eq(4).find('input').val();
		var twoq = $(this).parents('tr:eq(0)').find('td').eq(5).find('input').val();
		oneq=Number(oneq)
		twoq=Number(twoq)
		if(twoq > oneq){
			
			alert("库存预警值不能大于库存");
			$(this).parents('tr:eq(0)').find('td').eq(5).find('input').val('');
			$(this).parents('tr:eq(0)').find('td').eq(5).find('input').focus();
		}else{
			$(this).parents('tr:eq(0)').find('td').eq(4).find('input').val(oneq);
			if(twoq==0){
				$(this).parents('tr:eq(0)').find('td').eq(5).find('input').val();
			}else{
				$(this).parents('tr:eq(0)').find('td').eq(5).find('input').val(twoq);
			}
				
		}
		var one=Number(first).toFixed(2);
		var one1=Number(first);
		var two1=Number(second);
		if(second!=""){
			var two=Number(second).toFixed(2);
		}
		if(two1 > one1){
		
			alert("销售价格不能高于市场价格");
			$(this).parents('tr:eq(0)').find('td').eq(3).find('input').val('');
			$(this).parents('tr:eq(0)').find('td').eq(3).find('input').focus();
		}else{
			$(this).parents('tr:eq(0)').find('td').eq(2).find('input').val(one);
			$(this).parents('tr:eq(0)').find('td').eq(3).find('input').val(two);	
		}
		
	
	});
	$('#table').on('keyup','input',function(){
		var first = $(this).parents('tr:eq(0)').find('td').eq(2).find('input').val();
		var second = $(this).parents('tr:eq(0)').find('td').eq(3).find('input').val();
		first=first.replace(/[^\d\.]/g,'');
		second=second.replace(/[^\d\.]/g,'');
		$(this).parents('tr:eq(0)').find('td').eq(2).find('input').val(first);
		$(this).parents('tr:eq(0)').find('td').eq(3).find('input').val(second);
	
	});
	$('[name="is_expect_goods"]').change(function(){
		var val = $(this).val();
		if(val==1){
			$('.is_expect_goods_con').fadeIn();
			$("#promise").hide();
		}else{
			$("#promise").fadeIn();
			$('.is_expect_goods_con').hide();
		}
	});
	//包邮
	$('[name="isCost"]').change(function(){
		var val = $(this).data('val');
		if(val=='baoyou'){
			$('.baoyouSet').hide();
			$('[name="isPostage"]').prop('checked',false);
			$('[name="wrapPostageNum"]').val('');
			
		}else{
			$('.baoyouSet').fadeIn();
		}
	});
	
	$('[name="wrapPostageNum"]').focus(function(){
		$('[name="isPostage"]').prop('checked',true);
	});
	
	$('[name="isPostage"]').change(function(){
		if($(this).is(':checked')){
			
		}else{
			$('[name="wrapPostageNum"]').val('');
		}
	});
});	














function Foundation(obj)  
{  
	 var mymessage=confirm("确定会使商品基础描述的内容丢失！");  
	 var help=$("#help").val();
	  var sid=obj.value
	 if(mymessage){

  $.ajax({
      type : "post",
      url : '<%=path%>/shoppingproductses?updateFoundation',

         data:"sid="+sid, 
     
       success: function(data){
    	  var data = JSON.parse(data);
//     	  console.log(data.length);
//     	   alert(typeof(data)) ;
	         
	           var tml="<div id='Foundation'>";
	            tml+='<input type="hidden" name="gsBigcategoryId" value="'+sid+'" />';
	           for (var i=0;i<data.length;i++){
	        	    tml+='<div ><div class="o_detail_inp clear">';
	        	    if(data[i].isRequired==1){
	        	    	
	        	    	tml+='<div class="col-xs-my-48" >';
	        	    	tml+='<span class="left width_20"><span style="color: red;">*</span>'+data[i].name+'</span>';
	        	    	tml+='</div>   <div class="keyword" ></div>';	
	        	     	tml+='<textarea onchange="keyWord(this)"  id="shoppingProductsDetail'+i*2+'" name="shoppingProductsDetail['+i*2+'].content" onKeyDown="checkMaxInput(this)"  onKeyUp="checkMaxInput(this)" datatype="*"  maxlength="200" cols="100" rows="3" class="required"></textarea>';  
	        	        tml+='<font align="right" id=remLen><b></b></font>';	
	        	        
	                }else{
			        	tml+='<div class="col-xs-my-48" >';
		       	     	tml+='<span class="left width_20">'+data[i].name+'(建议填写50-150字)</span>';
		       	      	tml+='</div>  <div class="keyword" ></div>';	
		       	        tml+='<textarea onchange="keyWord(this)"  name="shoppingProductsDetail['+i*2+'].content" maxlength="200" cols="100" rows="3" class="required"></textarea>';  
		       
	             }
	        	    tml+='<input type="hidden" name="shoppingProductsDetail['+i*2+'].type" value="1">';
					tml+=' <input type="hidden" name="shoppingProductsDetail['+i*2+'].gsBigcategoryId" value="'+data[i].id+'"> ';
					tml+='<input type="hidden" name="shoppingProductsDetail['+i*2+'].bigcategoryImage" value="'+data[i].tempPic+'"> ';
					tml+='<input type="hidden" name="shoppingProductsDetail['+i*2+'].bigcategoryName" value="'+data[i].name+'">';
					tml+='<div class="o_detail_inp clear">';
					tml+='<div class="col-xs-my-48" ">';
					tml+='<div class="form-group" style="width: 20%; float: left" id="shoppingProductsDetail'+((i*2)+1)+'">';
					tml+='<div class="kv-avatar center-block">';
					tml+='	<input type="hidden" name="shoppingProductsDetail['+((i*2)+1)+'].type" value="2"> ';
					tml+='	<input type="hidden" name="shoppingProductsDetail['+((i*2)+1)+'].gsBigcategoryId" value="'+data[i].id+'">';
					tml+='	 <input type="hidden" name="shoppingProductsDetail['+((i*2)+1)+'].bigcategoryImage" value="'+data[i].tempPic+'">';
					tml+='	 <input type="hidden" name="shoppingProductsDetail['+((i*2)+1)+'].bigcategoryName" value="'+data[i].name+'">';
                    tml+='	<a href="javascript:;" class="a-upload">';
					tml+='    <input type="file" onchange="fileDetailChange(this)"  id="'+((i*2)+1)+'" >点击这里上传图片';
					tml+='	</a> ';
					tml+='<div id="shoppingProductsDetail'+((i*2)+1)+'">';
					tml+='<div id="detail'+((i*2)+1)+'">';
					tml+='<input type="hidden" id="shoppingDetail'+((i*2)+1)+'"  name="ss"  value=""/>';
				    tml+='</div></div> </div> </div> </div></div></div></div></div>';
									
			}
	           $("#Foundation1").remove();
	           $("#help").val(sid); 
			   $("#Foundation").html(tml);
	           }
		})
	    }else{
	    
    	$("#isCommon"+sid).attr("checked",false);
        $("#isCommon"+help).prop("checked",true);
	    }
}	
  function keyWord(obj){
	var keyWord = $(obj).val();
	var sms = $(obj).val();
	$.ajax({
	url : '<%=path %>/shoppingproductses?method=checkWord&keyWord='+keyWord,
	type: 'POST',
	dataType : "html",//json--返回json数据类型；xml--返回xml
	success : function(data) {
	
		if(data != "null"){
			
			$(obj).css({'background':'#ffe7e7'});
			$(obj).prev().html(data);
			
		}else{
			$(obj).css({'background':'#fff'});
			$(obj).prev().html('');
			
		}
	},
});
}
</script>
