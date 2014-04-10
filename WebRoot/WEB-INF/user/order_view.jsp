<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">\
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>——我的订单</title>
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
					<a href="/not.html">hahh</a>
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
									<td style="text-indent:25px;" width="30%">订单编号</td>
									<td width="30%">时间</td>
									<td width="10%">价格</td>
									<td width="20%">支付方式</td>
									<td width="10%">订单状态</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table class="tblist" width="94%" border="0" cellspacing="0" cellpadding="0">                        
								<s:iterator value="pageModel.list" >
								<tr>
									<td width="30%" align="left" class="tddate"><s:property value="orderId"/></td>
									<td width="30%" align="left"><s:property value="createTime"/></td>
									<td width="10%" align="left"><s:property value="totalPrice"/>元</td>
									<td width="20%" align="left"><s:property value="paymentWay.name"/></td>
									<td width="10%" align="left"><s:property value="orderState.name" /></td>
								</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
                </table>

				
			</div>
        </div>        
    </div>
    <div class="clear"></div>
    
    <%@ include file="../comm/footer.jsp"%>
</body>
</html>
