<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%@ taglib prefix="util" tagdir="/WEB-INF/tags/util"%>
<%
	String path = request.getContextPath();
%>
<util:load-scripts></util:load-scripts>
<link rel="stylesheet" href="<%=path%>/css/jcrop/jquery.Jcrop.css">
<script src="<%=path%>/js/jcrop/jquery.Jcrop.js"></script>
<div class="col-xs-my-1">&nbsp;</div>
<div class="col-xs-my-46">
	<img id="element_id" src="">
	<form id="myfrom">
		  <input type="hidden" id="imgFile" name="imgFile" value="">
          <input type="hidden" id="x" name="x" value="253">
          <input type="hidden" id="y" name="y" value="121">
          <input type="hidden" id="w" name="w" value="205">
          <input type="hidden" id="h" name="h" value="205">
          <input class="button blue" type="button" onclick="sub()" value="裁剪图像">
     </form>
</div>
<div class="clearfix"></div>
<script src="<%=path %>/js/artDialog/artDialog.js?skin=default"></script>
<!--dialog页面的弹出引用js文件-->
<script src="<%=path %>/js/artDialog/iframeTools.js"></script>
<!--dialog页面的弹出引用js文件-->
<script type="text/javascript">
	$(document).ready(function(){
		art.dialog.data('cutimg', "null");
		$('#element_id').attr("src","");
		var obj = art.dialog.data('img');
		$('#element_id').attr("src",obj);
		$('#imgFile').attr("value",obj)
		 $('#element_id').Jcrop({
			    aspectRatio: 16/9,
			    onSelect: updateCoords
			  });
	})
	
	function updateCoords(c){
	  $('#x').val(c.x);
	  $('#y').val(c.y);
	  $('#w').val(c.w);
	  $('#h').val(c.h);
	};
  
	function sub(){
	  if (parseInt($('#w').val())) {
	    $.ajax({
			url : '<%=path %>/uploadFile?updateImgCut',
			type : "POST",
			data : $("#myfrom").serialize(),
			success : function(data) {
				art.dialog.data('cutimg', data);
				art.dialog.close();
			}
		})
	  }else{
		  alert('请先选择要裁剪的区域后，再提交。');
		  return false;
	  }
	};

</script>