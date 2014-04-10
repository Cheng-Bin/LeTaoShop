<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>乐淘购物——在线充值</title>
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
</script>
<script language=JavaScript type=text/javascript>
	var clientWidth=(parseInt(window.screen.width)-960)/2-95;
	suspendcode12="<DIV id=\"ALayer1\" style='right:"+clientWidth+"px;PosITION:absolute;TOP:300px;FILTER: alpha(opacity=85);'><div id=\"goup\"><p id=\"gototop\"><a href=\"javascript:\" onclick=\"window.scroll(0,0);return false;\"><img src=\"images/top.gif\" /></a></p><p class=\"todayview\"><a href=\"#\">今日浏览</a></p><p class=\"gwc\"><a href=\"#\">购物车<br /><strong>(0)</strong></a></p></div></div>";
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
    	<div class="bannerbg"><div class="banner">
			<img src="../images/banner.jpg" />
		</div></div>
        <div class="location">
       	  <div class="place">
           	  <h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 在线充值</h1>
            	<span>
					<a href="/not.html?id=${noticelist[0].id}">标题</a>
				</span>
          </div>
        </div>
        <div class="productnew">
        	<div class="prod_sorted">
            	<div class="menustyle"><h2>我的账户</h2></div>
            	<%@ include file="left.jsp"%>
            </div>
            <div class="prod_scrolled manage">
            	<h2>在线充值</h2>
				<form id="form1" name="form1" method="post" action="/u/bank_add_y.html">
                <ul class="recharge">
                	<li class="charge1">选择您的充值方式</li>
                    <li class="charge3">
                    	<span><input type="radio" name="message" id="radio" value="" />财付通</span>
						<span><input type="radio" name="message" id="radio" value="" />支付宝</span>
						<span><input type="radio" name="message" id="radio" value="" />网银在线</span>
						<span><input type="radio" name="message" id="radio" value="" />其他方式</span>
                    </li>
                    <li class="jine">充值金额：
                      <input type="text" name="bankMoney" id="bankMoney" />
                    </li>
					<li class="jine">备注信息：<textarea class="textctn" name="profileUser" id="profileUser" cols="45" rows="5"></textarea>
                    </li>
                    <li class="charge4">
                      <input type="submit" name="button2" id="button2" value="去网上银行付款" />
                    </li>
                </ul>
				</form>
          </div>
        </div>        
    </div>
    <div class="clear"></div>

	<%@ include file="../comm/footer.jsp"%>
</body>
</html>
