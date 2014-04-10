<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />    
	<title>乐淘购物——确认订单</title>
	<link type="text/css" rel="stylesheet" href="../css/index.css" />
	<script type="text/javascript" src="../js/jquery-1.1.3.pack.js"></script>
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
				<h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 我的订单</h1>
				<span>
					<a href="###"></a>
				</span>
			</div>
        </div>
        <div class="productnew">
        	<div class="prod_sorted">
            	<div class="menustyle"><h2>我的账户</h2></div>
            	<%@ include file="left.jsp"%>
            </div>
            <div class="prod_scrolled manage">
            	<h2>确认订单</h2>
            	<br />
            	<span style="margin-left: 70px">温馨提示：订单最多为您保留 12 小时，若逾期未付款订单将被过期，需重新下单。小美过时不候哦~ </span>
            	<hr />
            	<s:form namespace="/order" action="order_pay" method="post">
	            <table align="center" width="80%" style="margin:5px auto; border:1px solid #ddd;">
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">订单编号</th>
						<td colspan="3" style="border-bottom:#EEEEEE 1px solid;">
							<s:property value="%{orderId}" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">收货人姓名</th>
						<td colspan="3" style="border-bottom:#EEEEEE 1px solid;">
							<s:property value="%{name}" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">联系电话</th>
						<td colspan="3" style="border-bottom:#EEEEEE 1px solid;">
							<s:property value="%{mobile}" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">收货地址</th>
						<td colspan="3" style="border-bottom:#EEEEEE 1px solid;">
							<s:property value="%{address}" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">邮编</th>
						<td colspan="3" style="border-bottom:#EEEEEE 1px solid;">
							<s:property value="%{post}" />
						</td>
					</tr>
					<tr>
						<th width="20%" height="24" bgcolor="#eeeeee">支付金额</th>
						<td style="border-bottom:#EEEEEE 1px solid;">
							<s:property value="totalPrice"/><em>元</em>
						</td>
					</tr>
					<tr>
						<th colspan="4" height="24" bgcolor="#eeeeee">请您选择在线支付银行</th>
					</tr>
					<tr>
        				<td width="26%" height="25"><input type="radio" name="pd_FrpId" value="CMBCHINA-NET" checked="checked" />招商银行 </td>
        				<td width="25%" height="25"><input type="radio" name="pd_FrpId" value="ICBC-NET" />工商银行</td>
        				<td width="25%" height="25"><input type="radio" name="pd_FrpId" value="ABC-NET" />农业银行</td>
        				<td width="24%" height="25"><input type="radio" name="pd_FrpId" value="CCB-NET" />建设银行 </td>
      				</tr>
      				<tr>
				        <td height="25"><input type="radio" name="pd_FrpId" value="CMBC-NET" />中国民生银行总行</td>
				        <td height="25"><input type="radio" name="pd_FrpId" value="CEB-NET" />光大银行 </td>
				        <td height="25"><input type="radio" name="pd_FrpId" value="BOCO-NET" />交通银行</td>
				        <td height="25"><input type="radio" name="pd_FrpId" value="SDB-NET" />深圳发展银行</td>
      				</tr>
      				<tr>
				        <td height="25"><input type="radio" name="pd_FrpId" value="BCCB-NET" />北京银行</td>
				        <td height="25"><input type="radio" name="pd_FrpId" value="CIB-NET" />兴业银行 </td>
				        <td height="25"><input type="radio" name="pd_FrpId" value="SPDB-NET" />上海浦东发展银行 </td>
				        <td><input type="radio" name="pd_FrpId" value="ECITIC-NET" />中信银行</td>
					</tr>
					<tr>
						<th height="20" colspan="4" bgcolor="#eeeeee">
							<s:hidden name="order.orderId" value="%{orderId}" />
							<s:hidden name="order.totalPrice" value="%{totalPrice}" />
							<s:hidden name="order.name" value="%{name}" />
							<s:hidden name="order.mobile" value="%{mobile}" />
							<s:hidden name="order.address" value="%{address}" />
							<s:hidden name="order.post" value="%{post}" />
						</th>
					</tr>
					<tr>
				        <th colspan="4">
				        	<s:submit value="确认支付" />
				      	</th>
					</tr>
				</table>
				</s:form>
				<br />
			</div>
        </div>        
    </div>
    <div class="clear"></div>
    
    <%@ include file="../comm/footer.jsp"%>
</body>
</html>
