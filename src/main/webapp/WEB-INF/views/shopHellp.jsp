<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="page" tagdir="/WEB-INF/tags/page"%>
<%
	String path = request.getContextPath();
%>
<link href="<%=path%>/css/bootstrap-datetimepicker.min.css"
	rel="stylesheet" type="text/css" />
<div>
<style type="text/css">
	.col-xs-my-40{font-size:20px;padding:10px;box-sizing:border-box;}
	.col-xs-my-39{padding:10px;box-sizing:border-box;}
	table th,table td{font-size:20px;padding:10px;box-sizing:border-box;border:1px solid;}
	.title{font-size:30px;}
</style>
	<div class="j-content">
		<div  class="col-xs-my-39">
			<div class="col-xs-my-1">&nbsp;</div>
			<div class="col-xs-my-40 j-content-top title">7天无理由退换货的定义</div>
			<div class="col-xs-my-40 j-content-top">1）买家在签收商品之日起七天内，对支持七天无理由退货并符合完好标准的商品，可发起七天无理由退货申请。</div>
			<div class="col-xs-my-40 j-content-top">2）选择无理由退货的终端用户应当自收到商品之日起七天内向甲方发出退货通知。七天期间自物流显示签收商品的次日零时开始起算，满168小时为7天。</div>
			<div class="col-xs-my-40 j-content-top">3）买家退回的商品应当完好。</div>
			<div class="col-xs-my-40 j-content-top">4）乙方要求支持七天无理由退货的商品，卖家单方或买卖双方约定不支持七天无理由退货的行为无效。</div>
			<div class="col-xs-my-40 j-content-top">5）不同品类的商品七天无理由退货适用与否情形：</div>
			<p class="col-xs-my-40 j-content-top">
				<table border="1" cellspacing="0" cellpadding="0" width="800">
					<tr>
						<th>分类</th><th>类型</th><th>商品举例</th>
					</tr>
					<tr>
						<td rowspan=2>不支持“七天无理由退货”</td>
						<td>一、买家定作的，定制类商品；</td>
						<td>个性定制、设计服务；</td>
					</tr>
					<tr>
						<td>二、鲜活易腐类商品；</td>
						<td>鲜花绿植、水产肉类、新鲜蔬果、宠物；</td>
					</tr>
					<tr>
						<td rowspan=2>卖家可选支持“七天无理由退货”</td>
						<td>三、一经激活或者试用后价值贬损较大的商品，商用商品，或者短期内价值频繁波动的商品；</td>
						<td>智能商品、商用厨电、黄金等；</td>
					</tr>
					<tr>
						<td>四、拆封后影响人身安全或者生命健康的商品，或者拆封后易导致商品品质发生改变的商品；</td>
						<td>食品、保健品、贴身用品等；</td>
					</tr>
					<tr>
						<td>必须支持“七天无理由退货”</td>
						<td>五、除以上四类商品外的所有品类商品，均需支持“七天无理由退货”。</td>
						<td>服装服饰(除贴身用品)、数码产品及配件、家纺居家日用、</td>
					</tr>
				</table>
			</p>
			<p class="col-xs-my-40">6）“商品完好”具体指什么？</p>
			<p class="col-xs-my-40">通用完好标准：</p>
			<p class="col-xs-my-40">（1）终端用户应当确保退回商品和相关配（附）件（如吊牌、说明书、三包卡等）齐全，并保持原有品质、功能，无受损、受污、刮开防伪、产生激活（授权）等情形，无难以恢复原状的外观类使用痕迹、不合理的个人数据使用痕迹；</p>
			<p class="col-xs-my-40">（2）商品的外包装为商品不可分割的组成部分，退回时应当齐全、无严重破损、受污；</p>
			<p class="col-xs-my-40">（3）赠品遗失或破损、发票遗失不影响商品退货。赠品破损或遗失作折价处理，发票遗失由买家承担相应税款。</p>
			<p class="col-xs-my-40">“外包装”系指：生产厂商原包装（最小销售单元），不含商家或物流自行二次封装。</p>
			<p class="col-xs-my-40">1.退回商品的“退货运费”由谁承担？</p>
			<p class="col-xs-my-40">退回商品运费消费者承担，双方另有约定，按照约定。</p>
			<p class="col-xs-my-40">2.退回商品的“发货运费”由谁承担？</p>
			<p class="col-xs-my-40">三种情况：</p>
			<p class="col-xs-my-40">1）卖家未设置商品包邮，发货运费消费者承担；</p>
			<p class="col-xs-my-40">2）卖家设置商品包邮，发货运费卖家自行承担；</p>
			<p class="col-xs-my-40">3）卖家未设置商品包邮，但在宝贝页面说明满xx包邮，如退货后不能达到免运费活动要求，发货运费消费者承担。</p>
			<p class="col-xs-my-40">3.赠品要退回吗？</p>
			<p class="col-xs-my-40">消费者退货时应将商品本身、配件及赠品一并退回，无法退回需做折价处理。</p>
			<p class="col-xs-my-40">4.对退货方式是否有要求？</p>
			<p class="col-xs-my-40">消费者应妥善选择退货方式，因退货方式不当造成商品损失的，由消费者承担。涉及到第三方物流经营者责任的，消费者可以依法追偿。</p>
		</div>
			
		
	</div>
</div>
