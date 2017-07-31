<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%
	String path = request.getContextPath();
%>
<link rel="stylesheet" type="text/css" href="<%=path%>/css/bobo.css" />
<script src="<%=path%>/js/distpicker.data.js"></script>
<script src="<%=path%>/js/distpicker.js"></script>
<script src="<%=path%>/js/main.js"></script>

<link href="<%=path%>/css/fileinput.css" media="all" rel="stylesheet" type="text/css" />
<script src="<%=path%>/js/fileinput.js" type="text/javascript"></script>

<link href="<%=path%>/css/default/default.css" media="all" rel="stylesheet" type="text/css" />
<link href="<%=path%>/css/code/prettify.css" media="all" rel="stylesheet" type="text/css" />

<script src="<%=path%>/js/kindeditor.js"></script>
<script src="<%=path%>/js/zh_CN.js"></script>
<script src="<%=path%>/css/code/prettify.js"></script>
<script src="<%=path%>/js/Validform_v5.3.2_ncr_min.js"></script>
<link rel="stylesheet" href="<%=path %>/css/valid.css" />

<link href="<%=path%>/css/bootstrap-datetimepicker.min.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.min.js"></script>
<script type="text/javascript" src="<%=path%>/js/bootstrap-datetimepicker.zh-CN.js"></script>
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
#parameterId .o_detail_inp {margin-bottom:10px}

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
<%-- 						<li><a style="color: #1BBC9B" href="<%=path %>/shoppingproductses/${shoppingProducts.id }?updateCategoryFrom">切换类目</a></li> --%>
					</ul>
				</div>
			</div>
			<!--tab 内容切换-->
			<div class="o_content" style="overflow: hidden;">
				<form action="<%=path%>/shoppingproductses" method="post" onkeydown="if(event.keyCode==13)return false;" enctype="multipart/form-data" id="MyForm">
					<input type="hidden" name="method" value="update"/>
					<input type="hidden" name="id" value="${shoppingProducts.id }"/>
					<input type="hidden" name="version" value="${shoppingProducts.version }"/>
					<input id="categoryId" type="hidden" name="shoppingCategoryId" value="${shoppingProducts.shoppingCategoryId.id}"/>
					<input id="shoppingCategoryName" type="hidden" name="shoppingCategoryName" value="${shoppingProducts.shoppingCategoryName }"/>
					
					<div class="o_content_border">
						<h2 class="o_padding_left">基本信息</h2>
						<div class="o_detail">
							<div class="o_detail_inp clear">
								<span class="left width_20"><span style="color: red;">*</span>商品名称</span> 
								<div style="width: 35%; float:left">
								<div class="keyword" ></div>
								<input name="name" onchange="keyWord(this)" maxlength="15" datatype="*" value="${shoppingProducts.name }" class=" form-control" type="text" " /></div> <span class="right width_40 font_size14">商品名称长度至少3字符，最长15个汉字。品牌名+产品名，例：覆膜田红色米砖。</span>
							
								</div>

							<div class="o_detail_inp clear">
								<span class="left width_20">商家货号</span> <input name="productNumber" maxlength="20" value="${shoppingProducts.productNumber }" class="left width_40 form-control" type="text" style="width: 35%;" /> <span
									class="right width_40 font_size14" style="line-height: 19px;">商家货号是指商家管理商品的，买家不可见最多可输入20个字符</span>
							</div>
							<!-- </div> -->
	                   <!-- 预售商品 -->
	                    <c:if test="${shoppingProductsExpects!=null}"> 
							<div class="o_detail_inp clear">
							     <input type="hidden" name="shoppingProductsExpect_id" value="${shoppingProductsExpects.id }"/>
                                 <input type="hidden" name="shoppingProductsExpect_version" value="${shoppingProductsExpects.version}"/>
							    <input type="hidden" value="${shoppingProductsExpects.id}" name="expectsID"/>
					            <span class="left width_20"><span style="color: red;">*</span>预售商品 </span> 
									<label class="form-control-static">
										<input type="radio" name="is_expect_goods" checked="checked" value="1" />是
									</label>
									<label class="form-control-static">
										<input type="radio" name="is_expect_goods" value="0" />否
									</label>
							</div>
							<div class="is_expect_goods_con">
								<div class="o_detail_inp clear">
								       <span class="left width_20">预售期</span> 
								       <div class="col-sm-4">
								       		<input id="expect_time_begin" readonly="readonly" class="form-control"  value="${shoppingProductsExpects.expectTimeBegin}"  name="expectTimeBegin" size="16" type="text"/>
								       </div>
								       <span class="left">至</span>
								       <div class="col-sm-4">
								       		<input  id="expect_time_end"  readonly="readonly" class="form-control" value="${shoppingProductsExpects.expectTimeEnd}"  name="expectTimeEnd" size="16" type="text"/>
										</div>
								</div>
	                            <div class="o_detail_inp clear">
									 <span class="left width_20"><span style="color: red;">*</span>发货日期</span> 
									 <input class="form-control  left width_40 form-control" readonly="readonly" style="width: 35%;"  id="send_goods_time" name="sendGoodsTime" size="16" type="text" value="${shoppingProductsExpects.sendGoodsTime}" />
								</div>
	                            <div class="o_detail_inp clear">
							         <span class="left width_20"><span style="color: red;">*</span>预售结束转为普通商品 </span> 
							         <label class="form-control-static">
										 <input type="radio" name="isCommon"  <c:if test="${shoppingProductsExpects.isCommon==1}">checked="checked"</c:if> value="1" />是
									</label>
									<label class="form-control-static">
										<input type="radio" name="isCommon" <c:if test="${shoppingProductsExpects.isCommon==0}">checked="checked"</c:if>   value="0" />否
									</label>
								</div>
							</div>
					    </c:if>
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
									<c:forEach items="${shoppingProducts.shoppingProductsSpecs }" var="shoppingProductsSpec" varStatus="status">
										<tr id="tr${status.index }">
										<input type="hidden" name="shoppingProductsSpecs[${status.index }].id" value="${shoppingProductsSpec.id }" class="col-xs-my-48 form-control" />
										<input type="hidden" name="shoppingProductsSpecs[${status.index }].version" value="${shoppingProductsSpec.version }" class="col-xs-my-48 form-control" />
										<td class="o_border_right font_size14"><input type="text" datatype="*" name="shoppingProductsSpecs[${status.index }].specName" value="${shoppingProductsSpec.specName }" class="col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size14"><input type="text"   name="shoppingProductsSpecs[${status.index}].weight" value="${shoppingProductsSpec.weight }" class="col-xs-my-48 form-control lly" /></td>
										<td class="o_border_right font_size14"><input type="text" datatype="nd2"  id="shoppingProductsSpecs${status.index }orgPrice" name="shoppingProductsSpecs[${status.index }].orgPrice" value="${shoppingProductsSpec.orgPrice }" class="col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size14"><input type="text" datatype="nd2" id="shoppingProductsSpecs${status.index }price" name="shoppingProductsSpecs[${status.index }].price" value="${shoppingProductsSpec.price }" class=" col-xs-my-48 form-control" /></td>
									    <td class="o_border_right font_size4"><input type="text"   name="shoppingProductsSpecs[${status.index }].productsNum" value="${shoppingProductsSpec.productsNum }"  class=" col-xs-my-48 form-control" /></td>
										<td class="o_border_right font_size6"><input type="text"   name="shoppingProductsSpecs[${status.index }].warningNum" value="${shoppingProductsSpec.warningNum }"  class=" col-xs-my-48 form-control" /></td>
										
									   <c:if test="${status.index ==0}">
										<td></td>
								    	</c:if>
									  <c:if test="${status.index !=0}">
										<td><button type="button" onclick="delTr(${status.index })" title="删除" class="btn btn-default"><i class="glyphicon glyphicon-minus"></i></button></td>
								    	</c:if>
										
										<c:set var="trid" value="${status.index }"></c:set>
									</tr>
									</c:forEach>
								</table>
							</div>
							<div class="o_add text_right" style="margin-bottom: 100px;">
								<button type="button" onclick="addTr()" class="button btnFFF bond green" id="Preservation">添加规格</button>
							</div>
		                  <div class="o_detail_inp clear">
							<div class="o_detail_inp clear">
									<span class="left width_20"><span style="color: red;">*</span>库存</span> 
								 <input id="stock" name="stock" maxlength="7" value="${shoppingProducts.stock }"  class="left width_40 form-control" type="text" style="width: 35%;" />

							</div>
								
								 
							</div>

<!-- 							<div class="o_detail_inp clear"> -->
<%-- 								<span class="left width_20">库存预警值</span> <input name="stockWarning" maxlength="7" datatype="n" ignore="ignore" value="${shoppingProducts.stockWarning }"  class="left width_40 form-control" type="text" style="width: 35%;" /> <span class="right width_40 font_size14">库存预警数量必须为0-999999的整数</span> --%>
<!-- 							</div> -->
							<div class="o_detail_inp clear">
								<span class="left width_20">推荐理由</span>
									<div style="width: 35%; float:left">
								<div class="keyword" ></div>
								 <input name="recommendReason"  onchange="keyWord(this)"  maxlength="15"  value="${shoppingProducts.recommendReason }" class=" form-control" type="text" " />
								 </div> <span class="right width_40 font_size14">展示在商品主图上的水印文字，例：一口栗羊羹。甜蜜一座城或桂林山水孕育的野猪肉</span>
							</div>

							<div class="o_detail_inp clear" data-toggle="distpicker">
								<span class="left width_20"><span style="color: red;">*</span>产地</span> 
								<select name="provinces" datatype="*" class="left width_20 line_height form-control" data-province="${shoppingProducts.provinces.provinceName }" type="text" style="width: 20%;"></select> 
								<select name="cityId" datatype="*" data-city="${shoppingProducts.cityId.name }" class="left width_20 line_height form-control" style="margin-left: 20px;"></select><span
									class="right width_30 font_size14">商品展示在选择的产地城市列表中</span>
							</div>
							<div class="o_detail_inp clear">
								<span class="left width_20">商品品牌</span> 
								
								<select name="productBrandId" class="left width_20 line_height form-control" style="width: 20%;" id="brand">
										<option value=""></option>
									<c:forEach items="${product }" var="productbrand">
									
											<option value="${productbrand.id}">${productbrand.brandName }</option>
									
									</c:forEach>
								</select>
								<!--控件-->
							</div>

							<div class="o_detail_inp clear">
								<span class="left line_height" style="display: block; width: 100%;"><span style="color: red;">*</span>商品主图</span>
								<div class="col-xs-my-48" id="uploadDiv">
										<div class="form-group" style="width: 20%;float:left" id="uploadDiv0">
											<div class="kv-avatar center-block" id="shoppingProductPictures0">
												<input id="avatar-0" onchange="fileChange(this)" name="shoppingProductPictures[0]." type="file" class="file-loading">
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[0].id }">
													<input type="hidden" id="fileUpload0" name="shoppingProductPictures[0]" value="${shoppingProducts.shoppingProductPictures[0].id }"/>
												</c:if>
												<c:if test="${empty shoppingProducts.shoppingProductPictures[0].image}">
													<c:set var="fileUpload0Img" value="../img/default_avatar_male.png"></c:set>
												</c:if>
											<c:if test="${not empty shoppingProducts.shoppingProductPictures[0].image}">
													<c:set var="fileUpload0Img" value="${shoppingProducts.shoppingProductPictures[0].image }"></c:set>
												</c:if>
											</div>
										</div>
									<div class="form-group" style="width: 20%;float:left" id="uploadDiv1">
											<div class="kv-avatar center-block" id="shoppingProductPictures1">
												<input id="avatar-1" onchange="fileChange(this)" name="shoppingProductPictures[1]." type="file" class="file-loading">
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[1].id }">
													<input type="hidden" id="fileUpload1" name="shoppingProductPictures[1]" value="${shoppingProducts.shoppingProductPictures[1].id }"/>
												</c:if>
												<c:if test="${empty shoppingProducts.shoppingProductPictures[1].image}">
													<c:set var="fileUpload1Img" value="../img/default_avatar_male.png"></c:set>
												</c:if>
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[1].image}">
													<c:set var="fileUpload1Img" value="${shoppingProducts.shoppingProductPictures[1].image }"></c:set>
												</c:if>
											</div>
										</div>
										
										
									<div class="form-group" style="width: 20%;float:left" id="uploadDiv2">
											<div class="kv-avatar center-block"  id="shoppingProductPictures2">
												<input id="avatar-2" onchange="fileChange(this)" name="shoppingProductPictures[2]." type="file" class="file-loading">
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[2].id }">
												<input type="hidden" id="fileUpload2" name="shoppingProductPictures[2]" value="${shoppingProducts.shoppingProductPictures[2].id }"/>
												</c:if>
												<c:if test="${empty shoppingProducts.shoppingProductPictures[2].image}">
													<c:set var="fileUpload2Img" value="../img/default_avatar_male.png"></c:set>
												</c:if>
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[2].image}">
													<c:set var="fileUpload2Img" value="${shoppingProducts.shoppingProductPictures[2].image }"></c:set>
												</c:if>
											</div>
										</div>
										<div class="form-group" style="width: 20%;float:left" id="uploadDiv3">
											<div class="kv-avatar center-block"  id="shoppingProductPictures3">
												<input id="avatar-3" onchange="fileChange(this)" name="shoppingProductPictures[3]." type="file" class="file-loading">
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[3].id }">
												<input type="hidden" id="fileUpload3" name="shoppingProductPictures[3]" value="${shoppingProducts.shoppingProductPictures[3].id }"/>
												</c:if>
												<c:if test="${empty shoppingProducts.shoppingProductPictures[3].image}">
													<c:set var="fileUpload3Img" value="../img/default_avatar_male.png"></c:set>
												</c:if>
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[3].image}">
													<c:set var="fileUpload3Img" value="${shoppingProducts.shoppingProductPictures[3].image }"></c:set>
												</c:if>
											</div>
										</div>
										
										<div class="form-group" style="width: 20%;float:left" id="uploadDiv4">
											<div class="kv-avatar center-block"  id="shoppingProductPictures4">
												<input id="avatar-4" onchange="fileChange(this)" name="shoppingProductPictures[4]." type="file" class="file-loading">
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[4].id }">
												<input type="hidden" id="fileUpload4" name="shoppingProductPictures[4]" value="${shoppingProducts.shoppingProductPictures[4].id }"/>
												</c:if>
												<c:if test="${empty shoppingProducts.shoppingProductPictures[4].image}">
													<c:set var="fileUpload4Img" value="../img/default_avatar_male.png"></c:set>
												</c:if>
												<c:if test="${not empty shoppingProducts.shoppingProductPictures[4].image}">
													<c:set var="fileUpload4Img" value="${shoppingProducts.shoppingProductPictures[4].image }"></c:set>
												</c:if>
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
							<c:forEach items="${shoppingProducts.shoppingProductsParameters }" var="shoppingProductsParameter" varStatus="status">
								<div class="o_detail_inp clear" id="parameterAddId${status.index }">
									<span class="left width_20">商品参数</span> 
										<input class="left width_20 line_height form-control" name="shoppingProductsParameters[${status.index }].parameterType" value="${shoppingProductsParameter.parameterType }" type="text" style="width: 20%;" placeholder="商品类别：净重" /> 
										<input class="left width_20 line_height form-control" name="shoppingProductsParameters[${status.index }].parameterValue" value="${shoppingProductsParameter.parameterValue }" placeholder="参数值：1000g" style="margin-left: 20px;" />
										<div class="col-xs-my-1">&nbsp;</div>
										<c:if test="${status.index == 0}">
											<button type="button" onclick="addParameter()" tabindex="500" title="新增" class="btn btn-default"><i class="glyphicon glyphicon-plus"></i></button>
										</c:if>
										<c:if test="${status.index != 0}">
											<button type="button" onclick="delParameterAdd(${status.index})" tabindex="500" title="删除" class="btn btn-default"><i class="glyphicon glyphicon-minus"></i></button>
										</c:if>
								</div>
								</c:forEach>
							</div>
							

                            
				                 <div class="o_detail_inp clear">
										<span class="left width_20"><span style="color: red;">*</span>基础描述</span>
									
				                 <c:forEach items="${gsBig }" var="gsBig" varStatus="status">
									<c:if test="${gsBig.id==gsBigcategory.get(0).getParentId()}">
									<input type="radio" id="isCommon${gsBig.id }" name="isCommon"  onclick="Foundation(this)"  checked="checked"  value="${gsBig.id }" />${gsBig.name }
									<input id="help" type="hidden"value="${gsBig.id }">
									</c:if>
									<c:if test="${gsBig.id !=gsBigcategory.get(0).getParentId()}">
									<input type="radio" id="isCommon${gsBig.id }" name="isCommon"  onclick="Foundation(this)" value="${gsBig.id }" />${gsBig.name }
									</c:if>
									</c:forEach>
									
				                 </div>
				                  	<ul class="upLoadImgNeed line_height_20" style="margin-bottom: 60px;">
									<li class="font_size14 line_height_20">上传要求</li>
									<li class="font_size14">1、图片内容：图片清晰，主体突出，图片上无文字。</li>
									<li class="font_size14">2、图片尺寸：宽度690像素，高度388像素为宜。</li>
									<li class="font_size14">3、200KB以下，格式为jpg格式。</li>
								     </ul>
				                <div id="Foundation">
								<div id="Foundation1">
						
							
							     <c:forEach items="${shoppingProductsDetail }" var="detail" varStatus="status">
										<div class="o_detail_inp clear">
											<c:if test="${detail.type==1 && status.index==0}">
											<div class="col-xs-my-48" >
												<span class="left width_20"><span style="color: red;">*</span>${detail.bigcategoryName}</span>
											</div>
											<div class="keyword" ></div>
												<textarea id="shoppingProductsDetail${(status.index)*2 }"  onchange="keyWord(this)" name="shoppingProductsDetail[${(status.index)*2 }].content" onKeyDown="checkMaxInput(this)"  onKeyUp="checkMaxInput(this)" datatype="*"  maxlength="200" cols="100" rows="3" class="required">${detail.content}</textarea>
											 <font align="right" id=remLen><b></b></font>
											</c:if>
											
											
											
											<c:if test="${detail.type==1 && status.index!=0}">
											<div class="col-xs-my-48" >
												<span class="left width_20">${detail.bigcategoryName}(建议填写50-150字)</span>
											</div>
											<div class="keyword" ></div>
												<textarea name="shoppingProductsDetail[${(status.index)*2 }].content" onchange="keyWord(this)" maxlength="200" cols="100" rows="3" class="required">${detail.content}</textarea>
											</c:if>
											
											
										
											<input type="hidden" name="shoppingProductsDetail[${(status.index)*2 }].type" value="1">
					  					    <input type="hidden" name="shoppingProductsDetail[${(status.index)*2}].gsBigcategoryId" value="${detail.gsBigcategoryId}"> 
											<input type="hidden" name="shoppingProductsDetail[${(status.index)*2 }].bigcategoryImage" value="${detail.bigcategoryImage }"> 
											<input type="hidden" name="shoppingProductsDetail[${(status.index)*2 }].bigcategoryName" value="${detail.bigcategoryName }">
											
											<div class="col-xs-my-48" id="uploadDiv">
													<div class="form-group" style="width: 20%; float: left" id="shoppingProductsDetail${(status.index)*2+1 }">
													
															<input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].type" value="2"> 
															<input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].gsBigcategoryId" value="${detail.gsBigcategoryId}">
															 <input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].bigcategoryImage" value="${detail.bigcategoryImage }">
															 <input type="hidden" name="shoppingProductsDetail[${(status.index)*2+1 }].bigcategoryName" value="${detail.bigcategoryName }">
														  	<c:if test="${ detail.type==2}">
														 	<a href="javascript:;" class="a-upload">
																    <input type="file" onchange="fileDetailChange(this)"  id="${(status.index)*2+1 }" >点击这里上传图片
																</a> 
																<div id="shoppingProductsDetail${(status.index)*2+1 }">
																<div id="Detail${(status.index)*2+1 }">
														     	<img  style="height: 174px;width: 345px" src="${detail.content}"> 
														     	<span><a href="javascript:void(0)" onclick="Remove('Detail${(status.index)*2+1 }')">删除</a></span>
														     	 	<c:if test="${ detail.content  == www }">
															    <input type="hidden" id="shoppingDetail${(status.index)*2+1 }"  name="shoppingProductsDetail[${(status.index)*2+1 }].content"  value=""/>
																 	</c:if>
																 	<c:if test="${ detail.content != www }">
															    <input type="hidden" id="shoppingDetail${(status.index)*2+1 }"  name="shoppingProductsDetail[${(status.index)*2+1 }].content"  value="${detail.content}"/>
															    
															
																 	</c:if>
																</div>
																</div> 
													   	</c:if>
													   
													  
													
														  
															   
														</div>
													</div>
												</div>
										
									
								
								
							</c:forEach>
						
							
				  	</div>
					</div>
		<!--商品的基础描述 -->
		<div>
			<div class="col-xs-my-48 j-details j-uppadd" style="padding-top: 40px">商品的更多描述</div>
			<ul class="upLoadImgNeed line_height_20" style="margin-bottom: 60px;">
									<li class="font_size14 line_height_20">上传要求</li>
									<li class="font_size14">1、图片内容：图片清晰，主体突出。</li>
									<li class="font_size14">2、图片尺寸：宽度690像素，高度不限。</li>
									<li class="font_size14">3、200KB以下，格式为jpg格式。</li>
								     </ul>
			
			  <div id="ddd">
			<c:forEach items="${shoppingProductsContent }" var="content" varStatus="status">
			
					      <c:if test="${content.type==1 }">
					      <div>
								<input type="hidden" name="shoppingProductsContent[${(status.index) }].id" value="${(content.id) }"/>
								<input type="hidden" id="fileUpload0" name="shoppingProductsContent[${status.index}].type" value="${content.type }"/>
								<input type="hidden" id="fileUpload0" name="shoppingProductsContent[${status.index}].version" value="${content.version }"/>
							<div class="keyword" ></div>
							 <textarea   onchange="keyWord(this)" name="shoppingProductsContent[${status.index }].content" maxlength="800"  cols="120" rows="8"  class="required"  >     ${content.content }</textarea>
						
						</div>  
						</c:if> 
					
			 <c:if test="${content.type==2 }">
								
										<div id="ss${status.index}">
										 <input type="hidden" id="fileUpload0" name="shoppingProductsContent[${status.index}].id" value="${content.id }"/>
										 <input type="hidden" id="fileUpload0" name="shoppingProductsContent[${status.index}].type" value="2"/>
										<input type="hidden"  name="shoppingProductsContent[${status.index}].type" value="${content.type }"/>
										<input type="hidden"  name="shoppingProductsContent[${status.index}].version" value="${content.version }"/>
					
										<div id="s${status.index}">
										 <img  style="height: 200px;width: 250px" src="${content.content }">
										 	<input type="hidden"   name="shoppingProductsContent[${status.index}].content" value="${content.content }"/>
										 	<input type="hidden"   class='img'  name="shoppingProductsContent[${status.index}].picName" value="${content.picName }"/>
										<span>${content.picName }</span>
										 <span>
										 <a href="javascript:void(0)" onclick="picRemove(${status.index})">删除</a>
										 <a href="javascript:void(0)" onclick="picLeft(${status.index})">←</a>
										 <a href="javascript:void(0)" onclick="picRight(${status.index})">→</a>
										 </span>
								
										 </div>
										</div>
								
						</c:if> 
						
					</c:forEach>
					 </div>
				
			 	<div class="row text-right">
					    
					     <a href="javascript:;" class="a-upload">
								    <input type="file" id="img" name="img" onchange="fileContent(this)" multiple="multiple" >点击这里上传多张图片
								</a> 
					 	</div>		
			</div>
		
								
						
<!-- 					商品的更多描述 -->
							<div class="o_detail_inp clear">
								<div class="col-xs-3">
								<span style="color: red;">*</span>标签
								<input   id="shoppingProductMarkName" name="shoppingProductMarkName" type ="hidden" value="${shoppingProducts.shoppingProductMarkName }" class="left width_40 form-control" type="text" style="width: 35%;" />	 
			                	</div>
			                	<div  class="col-xs-2">
									<div class="keyword" ></div>
			                	 <input id="qwer0" value=""  onchange="keyWord(this)"  maxlength="5"  style="width:150px;height:30px;">
			                	 	</div>
				            	<div  class="col-xs-2">
				            		<div class="keyword" ></div>
				                 <input id="qwer1" value=""  onchange="keyWord(this)"  maxlength="5"  style="width:150px;height:30px;">
				                 </div>
				            	 <div  class="col-xs-2">
				            		<div class="keyword" ></div>
				                 <input id="qwer2" value=""  onchange="keyWord(this)"  maxlength="5"  style="width:150px;height:30px;">
				                 </div>
							
<!-- 								<span class="right width_40 font_size14" -->
<!-- 									style="line-height: 19px;">多个标签请用“；”分开，每个标签不超过五个字</span> -->
							</div>

							<div class="o_tag" style="overflow: hidden; ">
								<span style="font-size: 14px; color: #999; display: block; line-height: 35px;">参考标签</span>
								<c:forEach items="${specialMarks }" var="specialMark" varStatus="status">
								<div class="width_20 clear left">
									<input type="checkbox" onclick="addMark(this)" class="left" id="${specialMark.name }"  value="${specialMark.name }" style="margin-top: 10px; display: block; height: 15px; width: 20px;" /> <span class="left"
										style="margin-left: 18px;">${specialMark.name }</span>
								</div>
								</c:forEach>
							</div>
						</div>
					
					<div class="o_content_border">
						<h2 class="o_padding_left">物流信息</h2>
						<div class="o_detail">
							<span>运费</span>
							
							
							<div class="clear line_height" style="margin-bottom: 10px;">
								<label class="width_20 clear left">
								<div id="baoyou">
								<c:if test="${shoppingProducts.isCost }">
									  <c:if test="${shoppingProducts.cost.toString() !=0.00  }">
										<input type="radio" name="isCost" onclick="dianji(true)" data-val="baoyou" checked="checked" value="true" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									  </c:if> 
									   <c:if test="${shoppingProducts.cost.toString() ==0.00  }">
										<input type="radio" name="isCost" checked="checked" onclick="dianji(true)" data-val="baoyou" checked="checked" value="true" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									     
									      <div id="baoyou1">
										 <input name="cost" value="${shoppingProducts.cost }" type="hidden" /> 
										 </div>
										 	 
									  </c:if> 
									</c:if>
									</div>
									<c:if test="${!shoppingProducts.isCost }">
										<input type="radio" name="isCost" onclick="dianji(true)" data-val="baoyou" checked="checked" value="true" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									</c:if>
									 <span
										class="left" style="margin-left: 18px;">包邮</span>
										
								</label>								
							</div>
							
							<div class="clear line_height" style="margin-bottom: 40px;">
								<div class="width_20 clear left">
									<c:if test="${shoppingProducts.isCost }">
									  <c:if test="${shoppingProducts.cost.toString() ==0.00  }">
										<input type="radio" name="isCost"value="true"  onclick="dianji1(true)" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									  </c:if> 
									   <c:if test="${shoppingProducts.cost.toString() !=0.00  }">
										<input type="radio" name="isCost" onclick="dianji1(true)"   checked="checked"  value="true" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									
									  </c:if> 
									</c:if>
									<c:if test="${!shoppingProducts.isCost }">
										<input type="radio" name="isCost" onclick="dianji1(true)" value="true" class="left" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									</c:if>
									 <span class="left" style="margin-left: 18px;">运费</span>
										 <div id="guding">
											<c:if test="${shoppingProducts.isCost }">
									  
									   <c:if test="${shoppingProducts.cost.toString() !=0.00  }">
									
									
									  <div id="guding1">
									 <input class="left width_40 form-control" name="cost" value="${shoppingProducts.cost }"  style="width: 60%;" /> 
									  </div>
									 
									  </c:if> 
									</c:if>
									</div>
								</div>
								
							</div>

							<div class="clear line_height">
								<div class="width_20 clear left">
									<c:if test="${!shoppingProducts.isCost }">
									<input  id="shopFr" type="radio" class="left" name="isCost" checked="checked" value="false" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									</c:if>
										<c:if test="${shoppingProducts.isCost }">
									<input id="shopFr"  type="radio" class="left"  onclick="dianji2"  name="isCost" value="false" style="margin-top: 10px; display: block; height: 15px; width: 20px;" />
									</c:if>
									 <span class="left" style="margin-left: 18px;">使用运费模板</span>
								</div>
								<select class="width_40 left form-control" id="shopFre" style="height: 34px;" name="shopFre">
										<option value="">请选择</option>
									<c:forEach items="${shopFreight }" var="shopfreighttemplate">
										<c:if test="${shopfreighttemplate.id==shoppingProducts.shopFreightTemplate.id }">
											<option selected="selected" value="${shopfreighttemplate.id }">${shopfreighttemplate.name }</option>
										</c:if>
										<c:if test="${shopfreighttemplate.id!=shoppingProducts.shopFreightTemplate.id }">
											<option value="${shopfreighttemplate.id },${shopfreighttemplate.mode }">${shopfreighttemplate.name }</option>
										</c:if>
									</c:forEach>
								</select> <span onclick="template(true)" style="padding: 5px 15px; border: 1px solid #017e43; color: #017e43; border-radius: 4px; margin-left: 20px; cursor: pointer;">新建运费模板</span>
							</div>
							
								<!-- ------  附加包邮条件 开始 -------- -->
							<c:if test="${shoppingproducts_isPostage==false}">
								<div class="clear line_height baoyouSet" style="margin-bottom: 40px;  display:none"  >
								   <label><input type="checkbox" name="isPostage"  value="true"/>&nbsp;附加包邮条件,满</label>
								   <input name="wrapPostageNum" type="number" min="1" style="height: 25px; width:50px;" value="${shoppingProducts.wrapPostageNum}"/><label>&nbsp;件 包邮</label>
								</div> 
							</c:if>
							<c:if test="${shoppingproducts_isPostage==true}">
								<div class="clear line_height baoyouSet" style="margin-bottom: 40px;"  >
								   <label><input type="checkbox" name="isPostage" checked="checked" value="true"/>&nbsp;附加包邮条件,满</label>
								   <input name="wrapPostageNum" type="number" min="1" style="height: 25px; width:50px;" value="${shoppingProducts.wrapPostageNum}"/><label>&nbsp;件 包邮</label>
								</div> 
							</c:if>
							
							<!-- ------  附加包邮条件 结束 -------- -->
						</div>
					</div>
		           <div class="o_content_border">
						<h2 class="o_padding_left">发货地址</h2>
						<div class="clear line_height">
							
								<select class="width_40 left form-control" style="height: 34px;"   name="address">
								<c:forEach items="${shopaddresses }" var="address">
										<c:if test="${address.id==shoppingProducts.address }">
											<option selected="selected" value="${address.id }">发货地址：${address.provinces.provinceName }${address.cities.name }${address.areas.areaName }${address.address }</option>
										</c:if>
										<c:if test="${address.id!=shoppingProducts.address }">
											<option value="${address.id }">发货地址：${address.provinces.provinceName }${address.cities.name }${address.areas.areaName }${address.address }</option>
										</c:if>
									</c:forEach>
									
								</select> 
						        <span onclick="address(true)" id="send"  style="padding: 5px 15px; border: 1px solid #017e43; color: #017e43; border-radius: 4px; margin-left: 20px; cursor: pointer;">新建发货地址</span>
							</div>
							<div>	<span id="address"></span></div>	
					</div>

					<div class="o_content_border">
						<h2 class="o_padding_left">服务承诺</h2>
						<div class="o_detail" style="background: #f6f7f9;">
						      <c:if test="${shoppingProducts.is_send_st==true}">   该商品支持72小时发货   </c:if>	
					          <c:if test="${shoppingProducts.is_customer==true}">  商家提供售后      </c:if>	 
					          <c:if test="${is_return_goods==true}"> 
					                               该商品支持7天无理由退货
					          </c:if>
						</div>
					</div>

					<div class="o_content_border" style="padding: 60px 0;">
						<div class="clear" style="text-align: center;">
							<div style="width: 300px; margin: 0 auto;" class="clear">
							    <input type="hidden" id="keep" value= "0" >
								<button type="button"  id="baocun"  onclick="sub(false)" class="left" style="padding: 5px 15px; border: 1px solid #017e43; border-radius: 4px; background: #017e44; color: #fff;">上传提交审核</button>
								<button type="button"  id="baocun1"  onclick="sub(true)" class="left" style="padding: 5px 15px; border: 1px solid #f0c01e; border-radius: 4px; margin-left: 20px; color: #fff; background: #f0c01e;">保存到仓库</button>
							<input type="hidden" name="url" value="${zhan}"/>
							</div>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
<div id="_view" style="display:none;">
<div class="con">
<h3 class="tit"><a class="close">×</a>商品预览</h3>
<div id="add"><iframe frameborder="no" border="0" marginwidth="0" marginheight="0" scrolling="yes"></iframe></div>
</div>
</div>
<style type="text/css">
#_view {
	position:fixed; top:10px; height:30%; width:100%; height:100%; z-index:998; display:none;
}
#_view .tit {padding:0; margin:0; width:100%; border-bottom:1px solid #888; margin:0 auto; font-size:14px; background:#FFF; text-align:center; color:#333; padding:15px 0;}
#_view .tit .close {margin-right:20px;}
#_view .con {
position:absolute; top:50%; left:20%; transform:translate(0,-50%); -webkit-transform:translate(0,-50%);
width:320px; height:520px; margin:0 auto; background:#FFF; box-shadow:2px 2px 20px rgba(0,0,0,0.5)}
#_view .con iframe {width:320px; height:480px;}
</style>
	
</div>
<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script><!--dialog页面的弹出引用js文件-->
<script src="<%=path %>/js/artDialog/iframeTools.js"></script><!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
function enter(){
	//enter的KEYCODE的值是13，通过监听可以控制。
  if(window.event.keyCode==13){
        window.event.returnValue= false;
  }
}
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


</script>
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

function fileContentChange(obj){
	  document.getElementById("baocun").disabled = true;
		document.getElementById("baocun1").disabled = true;
	var fd = new FormData();
 	var index = obj.name.match(/([^\[\]]+)(?=\])/g);
// 	var index = obj.id.substr(obj.id.length-2,2);
	if(isNaN(index)){
		index= index.substr(index.length-2,2);
	}
	
	fd.append("imgFile", obj.files[0]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			
			$("#inputshoppingProductsContent"+index).remove();
			$("#shoppingProductsContent"+index).append("<input type='hidden'  name='shoppingProductsContent["+index+"].content' value='"+data+"'/>")
			 document.getElementById("baocun").disabled = false; 
		     document.getElementById("baocun1").disabled = false; 
		}
	})
} 
var images = $('#ddd img');
//多图上传
function fileContent(obj){
	
	for(var i=0;i<obj.files.length;i++){
		//console.log();
// 		setTimeout(fileContentss(obj,i),300);
 		fileContentss(obj,i)
	}
	 $("#img").val("");
	} 


	var cc=0
function fileContentss(obj,i){
	
	console.log(i);
	var fd = new FormData();
	fd.append("imgFile", obj.files[i]);
	$.ajax({
		url : '<%=path%>/uploadFile?updateImgs',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			var arr=data.split('**********'); 
			cc=cc+1;
			var ss=(images.length)+cc;
			
		console.log(ss);
			$("#ddd").append("<div  id='ss"+ss+"'><div id='s"+ss+"'><img  style='height: 200px;width: 250px' src='"+arr[0]+"'>  <input type='hidden'  name='shoppingProductsContent["+ss+"].content'  value='"+arr[0]+"' />"
			+"<input type='hidden' name='shoppingProductsContent["+ss+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+ss+"].picName'  value='"+arr[1]+"' /><span>"+arr[1]+"</span><span><a href='javascript:void(0)'  onclick='picRemove("+ss+")'>删除</a>"
			+"<a href='javascript:void(0)'  onclick='picLeft("+ss+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+ss+")'>→</a></span></div></div>")
		}
	})
	} 
//多图上传的删除
function picRemove(obj){
	
	$("#ss"+obj).remove();

}
//基本描述的删除
function Remove(obj){
	
	$("#"+obj).remove();

}
//多图上传的←
function picLeft(obj){
	var This=$("#ss"+obj).find('img').attr('src');
	var str=$("#ss"+obj).prev().attr('id');
	var ThisName=$("#ss"+obj).find('.img').val()
	
	var left=str.replace('ss','');
	
	var Other=$("#ss"+left).find('img').attr('src');
	var OtherName=$("#ss"+left).find('.img').val();

	if(Other!=null){
	
		$("#s"+obj).remove();
	
		$("#ss"+obj).append("<div id='s"+obj+"'><img  style='height: 200px;width: 250px' src='"+Other+"'>  <input type='hidden'  name='shoppingProductsContent["+obj+"].content'  value='"+Other+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+obj+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+obj+"].picName'  value='"+OtherName+"' /><span>"+OtherName+"</span><span><a href='javascript:void(0)'  onclick='picRemove("+obj+")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+obj+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+obj+")'>→</a></span></div></div>")

		$("#s"+left).remove();
		
		$("#ss"+left).append("<div id='s"+left+"'><img  style='height: 200px;width: 250px' src='"+This+"'>  <input type='hidden'  name='shoppingProductsContent["+left+"].content'  value='"+This+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+left+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+left+"].picName'  value='"+ThisName+"' /><span>"+ThisName+"</span><span><a href='javascript:void(0)'  onclick='picRemove("+left+")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+left+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+left+")'>→</a></span></div></div>")
	
	
	}

	
}
//多图上传的→
function picRight(obj){
	var str=$("#ss"+obj).next().attr('id');
	var ThisName=$("#ss"+obj).find('.img').val()
	var left=str.replace('ss','');

	var This=$("#ss"+obj).find('img').attr('src');
 	var Other=$("#s"+left).find('img').attr('src');
 	var OtherName=$("#ss"+left).find('.img').val();

	if(Other!=null){
	
		$("#s"+obj).remove();
		
		$("#ss"+obj).append("<div id='s"+obj+"'><img  style='height: 200px;width: 250px' src='"+Other+"'>  <input type='hidden'  name='shoppingProductsContent["+obj+"].content'  value='"+Other+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+obj+"].type'  value='"+2+"' /><input type='hidden' class='img'  name='shoppingProductsContent["+obj+"].picName'  value='"+OtherName+"' /><span>"+OtherName+"</span><span><a href='javascript:void(0)'  onclick='picRemove("+obj+")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+obj+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+obj+")'>→</a></span></div></div>")
		$("#s"+left).remove();
		
		$("#ss"+left).append("<div id='s"+left+"'><img  style='height: 200px;width: 250px' src='"+This+"'>  <input type='hidden'  name='shoppingProductsContent["+left+"].content'  value='"+This+"' />"
				+"<input type='hidden' name='shoppingProductsContent["+left+"].type'  value='"+2+"' /><input type='hidden' class='img' name='shoppingProductsContent["+left+"].picName'  value='"+ThisName+"' /><span>"+ThisName+"</span><span><a href='javascript:void(0)'  onclick='picRemove("+left+")'>删除</a>"
				+"<a href='javascript:void(0)'  onclick='picLeft("+left+")'>←</a><a href='javascript:void(0)'  onclick='picRight("+left+")'>→</a></span></div></div>")
	
	
	}

	
}
function deleteDiv(obj){
	var divObj = $(obj).parent().parent().parent();
	// $(divObj).find("img").attr("src","../img/default_avatar_male.png");
	$(divObj).find("input[type='hidden']").remove();
	//$(divObj).children().children().children().children().children().find("img").attr("src","");
	setTimeout(function () { 
		$(divObj).find("img").attr("src","../img/default_avatar_male.png");
    }, 1);
	
}


$(document).ready(function(){ 
	var markName = $("#shoppingProductMarkName").val();
     
        var strs= new Array(); //定义一数组 

    	strs=markName.split(";"); //字符分割 
    		for(var i=0;i<strs.length;i++){
    			var ss="#qwer"+i
    			var pp="#"+strs[i]
    			$(pp).attr("checked",true);
    			$(ss).val(strs[i]); 
    		}
 	}); 
	
function address(str){
	
	$("#MyForm").append('<input type="hidden" name="template" value="'+str+'"/>');
	$("#MyForm").append('<input type="hidden" name="address" value="2"/>');
	$("#MyForm").submit();
}
function fileChange(obj){
	 document.getElementById("baocun").disabled = true;
	document.getElementById("baocun1").disabled = true;
	var fd = new FormData();
	var index = obj.name.substr(24,1);
	fd.append("imgFile", obj.files[0]);
	$.ajax({
		url : '<%=path %>/uploadFile?updateImg',
		type : "POST",
		processData : false,
		contentType : false,
		data : fd,
		success : function(data) {
			
// 			alert("上传成功,请进行切图！" );
			art.dialog.data('img', data);
			$("#inputshoppingProductPictures"+index).remove();
			$("#shoppingProductPictures"+index).append("<input type='hidden' id='inputshoppingProductPictures"+index+"' name='shoppingProductPictures["+index+"].image' value='"+data+"'/>")
                     document.getElementById("baocun").disabled = false; 
				     document.getElementById("baocun1").disabled = false; 
<%-- 			art.dialog.open('<%=path %>/shoppingproductses?Jcrop',{id:'send',title:'截图',lock:true, background:'#000000',cancel:false, --%>
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
//	 		var index1 = obj.name.match(/([^\[\]]+)(?=\])/g);
			var index = obj.id;
			fd.append("imgFile", obj.files[0]);
			$.ajax({
				url : '<%=path%>/uploadFile?updateImg',
				type : "POST",
				processData : false,
				contentType : false,
				data : fd,
				success : function(data) {
//	 				alert("上传成功,请进行切图！");
					art.dialog.data('img', data);
	 				$("#Detail"+index).remove();
				
					$("#shoppingProductsDetail"+index).append("<div id='Detail"+index+"'><img  style='height: 174px;width: 345px' src='"+data+"'><input type='hidden' id='shoppingDetail"+index+"' id='shoppingDetail"+index+"' name='shoppingProductsDetail["+index+"].content' value='"+data+"'/>"
					+"<span><a href='javascript:void(0)'  onclick='Remove(\"Detail"+index+"\")'>删除</a></div>")
	                  document.getElementById("baocun").disabled = false; 
				     document.getElementById("baocun1").disabled = false; 
	<%-- 				art.dialog.open('<%=path%>/shoppingproductses?Jcrop',{id:'send',title:'截图',lock:true, background:'#000000',cancel:false, --%>
//	 					close: function() {  
//	 						var cutimg = art.dialog.data('cutimg');
//	 						if(typeof(cutimg)!="undefined" && cutimg!="null"){
//	 						$("#shoppingProductsDetail"+index+" img").attr("src",cutimg)
//	 						$("#inputshoppingProductsDetail"+index).remove();
//	 						$("#shoppingProductsDetail"+index).append("<input type='hidden' id='inputshoppingProductsDetail"+index+"' name='shoppingProductsDetail["+index+"].content' value='"+cutimg+"'/>")
//	 						}
//	 			         }	
//	 				});
				}
			})
		} 
	  
$("#MyForm").Validform({
	tiptype:1
});
$('#_view .close').click(function(){
	$('#_view').hide();
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
	if(trid==0){
		trid=${trid}+1;
	}

	$("#table").append('<tr id="tr'+trid+'"><td class="o_border_right font_size14"><input type="text" name="shoppingProductsSpecs['+trid+'].specName" class="col-xs-my-48 form-control"/></td>	<td class="o_border_right font_size9"><input type="text"   name="shoppingProductsSpecs['+trid+'].weight" class="col-xs-my-48 form-control lly" /></td><td class="o_border_right font_size14"><input type="text" id="shoppingProductsSpecs'+trid+'orgPrice" name="shoppingProductsSpecs['+trid+'].orgPrice" class="col-xs-my-48 form-control"/></td><td class="o_border_right font_size14"><input type="text" id="shoppingProductsSpecs'+trid+'price" name="shoppingProductsSpecs['+trid+'].price" class="col-xs-my-48 form-control"/></td>'
			+'<td class="o_border_right font_size6"><input type="text"   name="shoppingProductsSpecs['+trid+'].productsNum" class=" col-xs-my-48 form-control" /></td>'
			+'<td class="o_border_right font_size6"><input type="text"   name="shoppingProductsSpecs['+trid+'].warningNum" class=" col-xs-my-48 form-control" /></td>'
				
			+'<td><button type="button" onclick="delTr('+trid+')" title="删除" class="btn btn-default"><i class="glyphicon glyphicon-minus"></i></button></td></tr>');
	trid++;
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
	   var strq =$("#shopFre").val()
       
	      var shopFr = $('input[id="shopFr"]').filter(':checked').val();
	       if(shopFr !=null){
	    	   var strsq= new Array(); //定义一数组 
		       strsq=strq.split(","); //字符分割 
		    
		       $("#MyForm").append('<input type="hidden" name="shopFreightTemplate" value="'+strsq[0]+'"/>');
		    
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
	$.ajax({
		url : '<%=path %>/shoppingproductses?method=checksWord&keysWord='+${shoppingProducts.id },
		type: 'POST',
		dataType : "html",//json--返回json数据类型；xml--返回xml
		success : function(data) {
		
			if(data != "101" ){
				
				alert("该商品正在参加促销活动，不能进行修改！");
		  		 return false
			}
		},
	});
	 
	  var keyword=$(".keyword").text();
	  if(keyword.length !=0){
  		alert("标红部分存在敏感词，请修改后重新提交。");
  		 return false
  	}
if($("#shoppingProductsDetail0").val().length<50){
	
	alert("商品亮点字数50-150，至少50.");
	 return false
}

if($("#shoppingDetail3").val()==null){
	alert("添加商品亮点的图");
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
		  var r = /^\+?[0-9][0-9]*$/;　　//正整数  
		  var flag=r.test(wrapPostageNum); 
		  if(!flag){
			  alert("必须大于零");
			  return;
		  }
	}
	$("#shoppingProductMarkName").val(ss);
	$("#MyForm").append('<input type="hidden" name="store" value="'+str+'"/>');
	$("#MyForm").submit();
}

function template(str){
	$("#MyForm").append('<input type="hidden" name="template" value="'+str+'"/>');

	$("#MyForm").submit();
}


function addParameter(){
	$("#parameterId").append('<div class="o_detail_inp clear" id="parameterId'+parameterId+'"><span class="left width_20">&nbsp;</span><input class="left width_20 line_height form-control" name="shoppingProductsParameters['+parameterId+'].parameterType" type="text" style="width: 20%;" placeholder="商品类别：净重" /><input class="left width_20 line_height form-control" name="shoppingProductsParameters['+parameterId+'].parameterValue" placeholder="参数值：1000g" style="margin-left: 20px;" /><div class="col-xs-my-1">&nbsp;</div><button type="button" onclick="delParameter('+parameterId+')" tabindex="500" title="删除" class="btn btn-default"><i class="glyphicon glyphicon-minus"></i></button></div>');
	parameterId++;
}
function delParameter(id){
	$("#parameterId"+id).remove();
}
function delParameterAdd(id){
	$("#parameterAddId"+id).remove();
}
KindEditor.ready(function(K) {
	var editor1 = K.create('textarea[name="details"]', {
		cssPath : '../plugins/code/prettify.css',
		uploadJson : '<%=path %>/uploadFile?upload',
		fileManagerJson : '../jsp/file_manager_json.jsp',
		allowFileManager : true,
		 afterBlur: function(){this.sync();},
		afterCreate : function() {
			var self = this;
			K.ctrl(document, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
			K.ctrl(self.edit.doc, 13, function() {
				self.sync();
				document.forms['example'].submit();
			});
		}
	});
	prettyPrint();
});
var btnLeft = '<button type="button" class="btn btn-default" title="Add picture tags" ' + 
'onclick="leftDiv(this)">' +
'<i class="glyphicon glyphicon-chevron-left"></i>' +
'</button>'; 
var btnRight = '<button type="button" class="btn btn-default" title="Add picture tags" ' + 
'onclick="rightDiv(this)">' +
'<i class="glyphicon glyphicon-chevron-right"></i>' +
'</button>'; 


$("#avatar-0").fileinput({
	language: 'zh',
    overwriteInitial: true,
    maxFileSize: 8000,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: '删除',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="${fileUpload0Img}" alt="Your Avatar" style="width:180px;height:255px"><h6 class="text-muted">点击上传</h6>',
	layoutTemplates : {
		main2 : '{preview} {remove} ' + btnLeft+''+btnRight+ '{browse}'
	},
	allowedFileExtensions : [ "jpg", "png", "gif","jpeg" ]
	});
$("#avatar-1").fileinput({
	language: 'zh',
    overwriteInitial: true,
    maxFileSize: 8000,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: '删除',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="${fileUpload1Img}" alt="Your Avatar" style="width:180px;height:255px"><h6 class="text-muted">点击上传</h6>',
	layoutTemplates : {
		main2 : '{preview} {remove} ' + btnLeft+''+btnRight+ '{browse}'
	},
	allowedFileExtensions : [ "jpg", "png", "gif","jpeg" ]
	});
$("#avatar-2").fileinput({
	language: 'zh',
    overwriteInitial: true,
    maxFileSize: 8000,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: '删除',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="${fileUpload2Img}" alt="Your Avatar" style="width:180px;height:255px"><h6 class="text-muted">点击上传</h6>',
	layoutTemplates : {
		main2 : '{preview} {remove} ' + btnLeft+''+btnRight+ '{browse}'
	},
	allowedFileExtensions : [ "jpg", "png", "gif","jpeg" ]
	});
$("#avatar-3").fileinput({
	language: 'zh',
    overwriteInitial: true,
    maxFileSize: 8000,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: '删除',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="${fileUpload3Img}" alt="Your Avatar" style="width:180px;height:255px"><h6 class="text-muted">点击上传</h6>',
	layoutTemplates : {
		main2 : '{preview} {remove} ' + btnLeft+''+btnRight+ '{browse}'
	},
	allowedFileExtensions : [ "jpg", "png", "gif","jpeg" ]
	});
$("#avatar-4").fileinput({
	language: 'zh',
    overwriteInitial: true,
    maxFileSize: 8000,
    showClose: false,
    showCaption: false,
    showBrowse: false,
    browseOnZoneClick: true,
    removeLabel: '',
    removeIcon: '<i class="glyphicon glyphicon-remove"></i>',
    removeTitle: '删除',
    elErrorContainer: '#kv-avatar-errors-2',
    msgErrorClass: 'alert alert-block alert-danger',
    defaultPreviewContent: '<img src="${fileUpload4Img}" alt="Your Avatar" style="width:180px;height:255px"><h6 class="text-muted">点击上传</h6>',
	layoutTemplates : {
		main2 : '{preview} {remove} ' + btnLeft+''+btnRight+ '{browse}'
	},
	allowedFileExtensions : [ "jpg", "png", "gif","jpeg" ]
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
function smallChange(obj) {
    var smObj = document.getElementsByName("stock");
  c=obj.checked;

    if (obj.checked == true)
    	$(".clickJide").hide();
    
    else {
        b = true;
        for (var i = 0; i < smObj.length; i++) {
            if (smObj[i].checked == true)
                b = false;
       	 var  str = " <span class='clickJide'><input name='stock' maxlength='7' datatype='n' class='left width_40 form-control' type='text' style='width: 35%;'' /> <span class='right width_40 font_size14'>商铺库存数量必须为0-999999的整数</span></span>";
     	   
      	$("#stock").html(str);
        }
        if (b == true)
            bigObj.checked = c;
    }
}
function dianji1(obj) {

	$("#baoyou1").remove();
	   var  str = " <div id='guding1'><input class='left width_40 form-control' name='cost' value='' style='width: 60%;' />   </div>";

	$("#guding").html(str);

}
function dianji(obj) {

	$("#guding1").remove();
   var  str = "<input type='radio' name='isCost'  onclick='dianji(true)'  checked='checked' class='left' style='margin-top: 10px; display: block; height: 15px; width: 20px;' /> <div id='baoyou1'><input name='cost' value='0' type='hidden'/>  </div>";

	$("#baoyou").html(str);


}
function dianji2(obj) {
	$("#guding1").remove();
	$("#baoyou1").remove();


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
			//$("#promise").hide();
		}else{
			//$("#promise").fadeIn();
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
	        	    	tml+='</div>';	
	        	     	tml+='<textarea id="shoppingProductsDetail'+i*2+'" name="shoppingProductsDetail['+i*2+'].content" onKeyDown="checkMaxInput(this)"  onKeyUp="checkMaxInput(this)" datatype="*"  maxlength="200" cols="100" rows="3" class="required"></textarea>';  
	        	        tml+='<font align="right" id=remLen><b></b></font>';	
	        	        
	                }else{
			        	tml+='<div class="col-xs-my-48" >';
		       	     	tml+='<span class="left width_20">'+data[i].name+'(建议填写50-150字)</span>';
		       	      	tml+='</div>';	
		       	        tml+='<textarea  name="shoppingProductsDetail['+i*2+'].content" maxlength="200" cols="100" rows="3" class="required"></textarea>';  
		       
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

var brand='${shoppingProducts.productBrandId.id}';//这里后台传到页面的值  
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