<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<title>乐淘购物——购物车</title>
	<link type="text/css" rel="stylesheet" href="../css/index.css" />
	<script type="text/javascript" src="../js/jquery-1.1.3.pack.js"></script>
	<script type="text/javascript" src="${context_path}/js/page.js"></script>
	<script>
		var flag = true;
		$(function(){
			var uleft = $(".prod_sorted");
			var uright = $(".prod_scrolled");
			if(uleft.height()<uright.height()){
				uleft.height(uright.height());
			}
			else
			{
				uright.height(uleft.height());
			}
			
			$("#slectall").click(function() { 
				$("input[@name='orderid']").each(function() { 
				$(this).attr("checked", true); 
				}); 
			});
		})
		function silde(form) {
			form.readOnly = false;
			form.style.background = "";
		}
		
		function lose(form) {
			form.readOnly = true;
			form.style.background = "";
			var reg = /^[0-9]*[1-9][0-9]*$/;
			var number = $.trim(form.value);
			if (!reg.test(number)) {
				form.style.color = "red";
				form.style.background = "#d0c9d3";
				flag = false;
			} else {
				var id = form.nextSibling.nextSibling.value;
				var start = form.previousSibling.previousSibling.value;
				var params = {"size" : form.value, "productId" : id, "start":start};
				loadData("${context_path}/cart/check_number", params, form);
			}
		}
		
		function loadData(url, params, form) {
			$.post(url, params, 
			function(data) {
				result = data.exists;
				if (result == 0) {
					form.style.color = "red";
					form.style.background = "#d0c9d3";
					alert("购买数量不能大于库存数");
					flag = false;
				} else {
				    form.readOnly = true;
					form.style.background = "";
					form.style.color = "";
					edit_data("${context_path}/cart/cart_edit", params, form);
					flag = true;
				}
			}, "json");
		}
		
		function edit_data(url, params, form) {
			$.post(url, params, 
			function(data) {
				var a = document.getElementById("label_"+form.id);
				var price = form.nextSibling.nextSibling.nextSibling.nextSibling.value;
				a.innerHTML = price *　params['size'];
			}, "json");
		}
		
		function check() {
			return flag;
		}
	</script>
	<script language=JavaScript type=text/javascript>
		var clientWidth=(parseInt(window.screen.width)-960)/2-95;
		suspendcode12="<DIV id=\"ALayer1\" style='right:"+clientWidth+"px;PosITION:absolute;TOP:300px;FILTER: alpha(opacity=85);'><div id=\"goup\"><p id=\"gototop\"><a href=\"javascript:\" onclick=\"window.scroll(0,0);return false;\"><img src=\"images/top.gif\" /></a></p><p class=\"todayview\"><a href=\"#\">今日浏览</a></p><p class=\"gwc\"><a href=\"#\">购物车<br /><strong>(0)</strong></a></p></div></div>"
	</script>
</head>

<body>

	<!--S=header-->
	<div id="header">
		<div id="header">
			<!--header-->
			<%@ include file="../comm/header.jsp"%>
		</div>
		<%@ include file="../comm/nav.jsp"%>
	</div>

	<!--S=main-->
	<div id="main">
		<div class="bannerbg">
			<div class="banner">
				<img src="../images/banner.jpg" />
			</div>
		</div>
		<div class="location">
			<div class="place">
				<h1>
					> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 购物车
				</h1>
				<span> <a href="#">这是标题</a> </span>
			</div>
		</div>

		<div class="productnew">
			<div class="prod_sorted">
				<div class="menustyle">
					<h2>我的账户</h2>
				</div>
				<%@ include file="left.jsp"%>
			</div>
			<div class="prod_scrolled manage">
				<h2>我的购物车</h2>
				<s:if test="%{items.size != 0}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tbtit">
								<tr>
									<td style="text-indent:30px;" width="13%">&nbsp;</td>
									<td width="52%">商品名</td>
									<td width="8%">数量</td>
									<td width="15%">小计（元）</td>
									<td width="12%">操作</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table width="94%" border="0" cellspacing="0" cellpadding="0"
								class="tbgoods">
								<s:set value="%{0}" var="sumall"></s:set>
								<s:iterator value="items" status="status" var="cart">
          						<s:set value="%{#sumall+productPrice*amount}" var="sumall"/>
								<tr>
									<td width="4%" align="right">&nbsp;</td>
									<td width="17%" align="center">
										<p>
											<a href="##" target="_blank"> 
												<img src="${context_path}/upload/<s:property value="path"/>" width="50" height="50"/>
											</a>
										</p>
									</td>
									<td width="43%" align="left">
										<a href="" target="_blank"><s:property value="productName" /> </a>
									</td>
									<td width="8%" align="center">
										<s:hidden name="amount"  value="%{amount}" />
										<s:textfield name="proNumber" value="%{amount}" size="5" readonly="true" id="%{productId}" ondblclick="silde(this)" onblur="lose(this)" /> 
										<s:hidden name="productId"  value="%{productId}" />
										<s:hidden id="productPrice" name="productPrice"  value="%{productPrice}" /> 
									</td>
									<td width="13%" align="center" class="price">
										<span id="label_<s:property value="%{productId}" />"><s:property value="%{productPrice*amount}" /></span>
									</td>
									<td width="15%" align="center" class="oprt">
										<a href="<s:url action="cart_delete" namespace="/cart"><s:param name="productId" value="productId"></s:param></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
									</td>
								</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
				</table>
				<div class="jiesuan">
					<s:form name="pay_page" action="pay_page" method="post" namespace="/order" onsubmit="return check()" >
						<input class="btnjs" type="submit" name="button2" id="button2" value="结 算" />
					</s:form>
				</div>
				</s:if>
				<s:else>
					<div align="center" style="width:100%;margin:0px auto;margin-top:50px;">
						<img src="${context_path}/images/empty_cart.png" align="middle" />
						<span>您的购物车还是空的，赶紧行动吧！您可以：</span><br />
						<span>首页 <a href="<s:url action="index" namespace="/" />">搜喜欢的商品</a></span><br />
						<span>看看 <a href="">已买到的宝贝</a></span>
					</div>
				</s:else>
			</div>
		</div>
	</div>
	<div class="clear"></div>

	<%@ include file="../comm/footer.jsp"%>
</body>
</html>
