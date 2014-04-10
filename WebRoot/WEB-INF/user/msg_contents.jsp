<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>——站内消息——</title>
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
		});
	</script>
	<script language=javaScript type=text/javascript>
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
			<h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a>  > <a href="/u/msg.html">站内消息</a> > 消息标题</h1>
			<span>
				<a href="/not.html?">标题</a>
			</span>
          </div>
        </div>
        <div class="productnew">
        	<div class="prod_sorted">
            	<div class="menustyle"><h2>我的账户</h2></div>
            	<%@ include file="left.jsp" %>
            </div>
            <div class="prod_scrolled manage">
            	<h2>站内消息</h2>
                <h3 class="sns_tit">标题</h3>
                <p class="sns_date">收件时间：2013-12-29日</p>
                <div class="sns_content">内容</div>
            </div>
        </div>        
    </div>
    <div class="clear"></div>
  
    <%@ include file="../comm/footer.jsp"%>
</body>
</html>