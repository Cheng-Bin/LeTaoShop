<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>——会员留言</title>
	<link type="text/css" rel="stylesheet" href="css/index.css" />
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
		function changeCode(){
			$("#changeCode").attr("src","/code.code?rnd="+Math.random());
		}
		var message = "${message}";
		if(message == "01"){
			alert("网站已经关闭留言功能！");
		}
		if(message == "02"){
			alert("请输入验证码！");
		}
		if(message == "03"){
			alert("验证码输入错误！");
		}
		if(message == "04"){
			alert("留言成功！");
		}

		function showPost(){
			$("#faq_notice").show();
		}
	</script>
	<SCRIPT language=JavaScript type=text/javascript>
		var clientWidth=(parseInt(window.screen.width)-960)/2-95;
		suspendcode12="<DIV id=\"ALayer1\" style='right:"+clientWidth+"px;PosITION:absolute;TOP:300px;FILTER: alpha(opacity=85);'><div id=\"goup\"><p id=\"gototop\"><a href=\"javascript:\" onclick=\"window.scroll(0,0);return false;\"><img src=\"images/top.gif\" /></a></p><p class=\"todayview\"><a href=\"#\">今日浏览</a></p><p class=\"gwc\"><a href=\"#\">购物车<br /><strong>(0)</strong></a></p></div></div>"
	</SCRIPT>
</head>

<body>
	<!--S=header-->
	<div id="header">
    	<div class="topbar">
			<div class="topbarbd">
				<div class="topreg">您好，欢迎来奥络商城！
					<a href="/u/index.html">进入会员中心</a>
					<!--
						<a href="/log.html">[请登录]</a><span>，新用户？</span><a href="/reg.html">[免费注册]</a>
					-->
				</div>
				<div class="topinfo"><a href="/u/fav.html">收藏的商品</a> | <a href="javascript:void(0)" onClick="window.external.addFavorite('http://www.safe-120.com/','杭州云乐科技有限公司');" rel="sidebar">收藏本站</a> | <a href="javascript:void(0)" onclick="this.style.behavior='url(#default#homepage)';this.setHomePage('http://www.safe-120.com/');">设为首页</a></div>
			</div>
			<div class="clear"></div>
		</div>
		<div class="topsearch">
			<p class="logo"><a href="/"><img src="images/logo.jpg" /></a></p>
			<div class="search">
				<div class="searchform">
				<form method="post" action="/pro_list.html">
				  <input class="tbkey" type="text" name="keyWords" /><input class="btnsearch" type="submit" name="button" id="button" value="搜 索" />
				</form>
				</div>
				<p class="grade_search"><a class="grade" href="javascript:void(0)">搜索商品</a> 热搜：
					<a href="/pro_list.html?keyWords=花苞裙">花苞裙</a> 
					<a href="/pro_list.html?keyWords=雪纺裙">雪纺裙</a> 
					<a href="/pro_list.html?keyWords=吊带裙">吊带裙</a> 
					<a href="/pro_list.html?keyWords=真丝裙">真丝裙</a> 
					<a href="/pro_list.html?keyWords=背心裙">背心裙</a>
				</p>
			</div>
		</div>
		<div class="clear"></div>
		<div class="nav nav2">
			<div class="navlist navlist2">
				<ul>
					<li><a href="/">首页</a></li>
					<li><a id="zuixinspin" href="/pro_list.html">最新商品</a></li>
					<li><a id="tuijianspin" href="/pro_list.html?isComment=1">推荐商品</a></li>
					<li><a id="xinwenzxun" href="/art_list.html">新闻资讯</a></li>
					<li><a id="xianliangspin" href="/pro_list.html?isXianliang=1">限量商品</a></li>
					<li><a id="tejiaspin" href="/pro_list.html?isTejia=1">特价商品</a></li>
					<li><a id="chuxiaospin" href="/pro_list.html?isChuxiao=1">促销商品</a></li>                
				</ul>
				<div class="goodscart"><p><a href="/u/bank.html">我的账户</a> <span><a href="/u/pro_carList.html">我的购物车</a></span></p>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<SCRIPT LANGUAGE="JavaScript">
		<!--
			var url = location.href;
			if(url.indexOf("isComment=1")!=-1){
				$("#tuijianspin").addClass("navslt");
			}else if(url.indexOf("isXianliang=1")!=-1){
				$("#xianliangspin").addClass("navslt");
			}else if(url.indexOf("isTejia=1")!=-1){
				$("#tejiaspin").addClass("navslt");
			}else if(url.indexOf("isChuxiao=1")!=-1){
				$("#chuxiaospin").addClass("navslt");
			}else if(url.indexOf("art_list.html")!=-1){
				$("#xinwenzxun").addClass("navslt");
			}else{
				$("#zuixinspin").addClass("navslt");
			}
		//-->
		</SCRIPT>
    </div>


    <!--S=main-->
    <div id="main">
    	<div class="bannerbg">
			<div class="banner">
				<img src="images/banner3.jpg" />
			</div>
		</div>

        <div class="location">
       	  <div class="place">
           	  <h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 会员留言</h1>
            	<span>
					<a href="/not.html?id=${noticelist[0].id}">welcome</a>
				</span>
          </div>
        </div>

        <div class="productnew">
        	<div class="prod_sorted">
            	<div class="menustyle">
					<h2>我的账户</h2>
				</div>
            	<ul class="sort_list user_nav">
					<li><a href="msg.html"><span>站内消息</span></a></li>
					<li><a href="pro_carList.html"><span>购物车</span></a></li>
					<li><a href="order_buyList.html"><span>已购买商品</span></a></li>
					<li><a href="order.html"><span>我的订单</span></a></li>
					<li><a href="fav.html"><span>我的收藏</span></a></li>
					<li><a href="bank_tuikuan.html"><span>退款申请</span></a></li>
					<li class="sortbd"><a href="user.html"><span>个人信息</span></a></li>
					<li><a href="user_pass.html"><span>修改密码</span></a></li>
					<li><a href="bank_yufukuan.html"><span>在线充值</span></a></li>
					<li><a href="bank.html"><span>消费明细</span></a></li>
					<li><a href="log_out.html"><span>注销会员</span></a></li>
					<li class="sortbd"><a href="comment.html"><span>会员留言</span></a></li>
				</ul>
            </div>
            <div class="prod_scrolled manage">
            	<h2>会员留言</h2>
				<form id="form1" name="form1" method="post" action="/com_save.html">
                <ul class="userword">
                	<li><span>姓名</span><strong>程斌</strong></li>
                    <li><span>电子邮件</span>997155658@qq.com</li>
                    <li>
						<span>内容</span>
						<textarea class="textctn" name="commentContent" id="commentContent" cols="45" rows="5" style="width:444px;"></textarea>
                    </li>
                    <li class="qdxg wordbtn">
						<span>&nbsp;</span>
						<input name="commentName"  class="fm1" type="hidden" value="" />
						<input name="commentMail"  class="fm1" type="hidden" value="" />
						<input class="confirm" type="submit" name="button2" id="button2" value="确 定" />
                    </li>
                </ul>
				</form>
            </div>
        </div>        
    </div>
    <div class="clear"></div>

	<div class="footer" id="footer">
		<div class="linkbg">友情链接</div>
		<ul class="links_list">
			<li>
				<p>
					<a href="test.linkUrl" target="_blank">
						<img src="images/nyzg.jpg" />
					</a>
				</p>
			</li>
		</ul>

		<div class="footbg"></div>

		<div class="footinfo">
			<a href="page.html">广告服务</a> | 
			<a href="page.html">联系我们</a> |
			<a href="/page.html">法律声明</a> |
			<a href="/page.html">招聘信息</a> |
			<a href="/page.html">关于我们</a> |
			<a href="/page.html">使用条款</a><br />
			<span>浙ICP证110358号 2001-2011 RAYLI.COM ALL RIGHT RESERVED 电信业务审批</span><br />
			<span>版权所有 不得转载</span>
		</div>
	</div>
</body>
</html>
