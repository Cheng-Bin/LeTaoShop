<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>乐淘购物——消费明细</title>
	<link type="text/css" rel="stylesheet" href="../css/index.css" />
	<script type="text/javascript" src="js/jquery-1.1.3.pack.js"></script>
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
				<h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 消费明细</h1>
				<span>
					<a href="not.html">消息</a>
				</span>
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
            	<h2>消费明细</h2>
                <table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0" class="tbtit">
								<tr>
									<td style="text-indent:32px;" width="26%">订单号</td>
									<td width="11%">时间</td>
									<td width="20%">商品名称</td>
									<td width="13%">商品价格</td>
									<td width="9%">运费</td>
									<td width="12%">支付状态</td>
									<td width="9%">备注</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table class="tblist" width="94%" border="0" cellspacing="0" cellpadding="0">
								<tr>
									<td width="22%" align="left" class="tddate">ID</td>
									<td width="13%" align="left" class="tddate">2013-09-12</td>
									<td width="23%" align="left">USER</td>
									<td width="15%" align="left" class="price">5600</td>
									<td width="10%" align="left" class="yunfei">5YUAN</td>
									<td width="12%" align="left">是否付款</td>
									<td width="5%" align="left">Admin</td>
								</tr>
							</table>
						</td>
					</tr>
                </table>
                <p class="tbpage">TOOLBAR</p>
            </div>
        </div>
		<div class="clear"></div>
    </div>
    
    <%@ include file="../comm/footer.jsp"%>
	
</body>
</html>
