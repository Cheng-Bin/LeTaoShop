<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>乐淘购物——我要结算</title>
	<link type="text/css" rel="stylesheet" href="../css/index.css" />
	<script type="text/javascript" src="../js/jquery-1.1.3.pack.js"></script>
	<script type="text/javascript" src="../js/zone.js"></script>
	<script>
		$(function(){
			var uleft = $(".prod_sorted");
			var uright = $(".prod_scrolled");
			if(uleft.height()<uright.height()){
				uleft.height(uright.height());
			}
			else{
				uright.height(uleft.height());
			}
		})
		
		$("#slectall").click(function() { 
			$("input[@name='orderid']").each(function() { 
			$(this).attr("checked", true); 
			}); 
		});

		var number = 0;
		var money = 0;
		
		function edit(obj) {
			obj.readOnly= false;
		}
		function out(obj) {
			obj.readOnly = true;
		}
	</script>
	<script language=javascript type=text/javascript>
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
				<h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 我要结算</h1>
				<span>
					<a href="/not.html?id=${noticelist[0].id}">你有1条未读消息</a>
				</span>
			</div>
		</div>
		<div class="productnew">
			<div class="prod_sorted">
				<div class="menustyle"><h2>我的账户</h2></div>
				<%@ include file="left.jsp"%>
			</div>
            <div class="prod_scrolled manage">
				<h2>我的订单</h2>
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbtit">
								<tr>
									<td style="text-indent:25px;" width="18%">商品编号</td>
									<td width="34%">商品名称</td>
									<td width="16%">价格</td>
									<td width="16%">数量</td>
									<td width="16%">小记(单位：元)</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table class="tblist" width="94%" border="0" cellspacing="0" cellpadding="0"> 
								<s:set value="%{0}" var="sumall"></s:set>     
								<s:set value="%{0}" var="total"></s:set>         
								<s:iterator value="items">
								<s:set value="%{#sumall+productPrice*amount}" var="sumall"/>   
								<s:set value="%{#total + amount}" var="total"></s:set>          
								<tr>
									<td width="15%" align="left" class="tddate"><s:property value="productId"  /></td>
									<td width="38%" align="left" class="tddate" style="padding-right:8px;">
										<a href="" target="_blank"><s:property value="productName" /></a>
									</td>
									<td width="18%" align="left"><s:property value="productPrice" /></td>
									<td width="16%" align="left" class="price"><s:property value="amount" /></td>
									<td width="20%" align="left"><s:property value="amount*productPrice" /></td>
								</tr>
								</s:iterator>
								<tr>
									<td  colspan="6" style="text-align: right;color: red;font-weight: bolder;">
										共<s:property value="#total" />件商品，费用为<s:property value="#sumall" />元
									</td>
								</tr>
							</table>
						</td>
					</tr>
				</table>

			<s:form action="order_confirm" namespace="/order" method="post">
				<table align="center" width="80%" style="margin:5px auto; border:1px solid #ddd;">
					<tr>
						<th colspan="2" style="border-bottom:#EEEEEE 1px solid;">温馨提示：双击文本框可对信息进行修改</th>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">收货人</th>
						<td style="border-bottom:#EEEEEE 1px solid;">
							<s:textfield value="%{name}" name="name" readonly="true" ondblclick="edit(this)" onblur="out(this)" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">收货地址</th>
						<td style="border-bottom:#EEEEEE 1px solid;">
							<s:textfield value="%{address}" name="address" readonly="true" ondblclick="edit(this)" onblur="out(this)" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">邮编</th>
						<td style="border-bottom:#EEEEEE 1px solid;">
							<s:textfield value="%{post}" name="post" readonly="true" ondblclick="edit(this)" onblur="out(this)" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">联系电话</th>
						<td style="border-bottom:#EEEEEE 1px solid;">
							<s:textfield value="%{mobile}" name="mobile" readonly="true" ondblclick="edit(this)" onblur="out(this)" />
						</td>
					</tr>
				</table>
				
				<table align="center" width="80%" style="margin:5px auto; border:1px solid #ddd;">
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">支付方式</th>
						<td style="border-bottom:#EEEEEE 1px solid;">
							<input type="radio" name="payType" id="radio2" value="01" checked="checked" />
							<label for="payType">在线支付</label>
							<input type="radio" name="payType" id="radio6" value="02" />
							<label for="payType">其他支付方式</label>
						</td>
					</tr>
					<tr>
						<th width="20%" bgcolor="#eeeeee">备注</th>
						<td>
							<s:textarea name="remarks" id="remarks" cols="45" rows="5" ></s:textarea>
						</td>
					</tr>
				</table>


				<div class="pagediv" style="text-align:center; padding:10px 0px;">
					<s:hidden name="totalPrice" value="%{sumall}" />
					<input type="submit" value="下一步" style="font-size:14px;font-weight:bold;" />
				</div>

				</s:form>
			</div>
		</div>        
	</div>
    <div class="clear"></div>
    
    <%@ include file="../comm/footer.jsp"%>
     <script language="javascript">
        setup() 
    </script>
</body>
</html>
