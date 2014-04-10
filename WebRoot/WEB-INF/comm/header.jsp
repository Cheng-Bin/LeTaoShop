<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<div class="topbar">
	<div class="topbarbd">
			<div class="topreg">
				您好，欢迎来乐淘商城！
				<s:if test="cus_session == null">
				<a href="<s:url action="login" namespace="/customer" />">[请登录]</a>
				<span>，新用户？</span>
				<a href="<s:url action="login" namespace="/customer" />">[免费注册]</a>
				</s:if>
				<s:else>
					<span>
						<a href="<s:url action="personal" namespace="/customer" />">[<s:property value="cus_session.cusName" />]</a>
						<a href="<s:url action="logout" namespace="/customer" />">退出登录</a>
					</span>
				</s:else>
			</div>
			<div class="topinfo">
				<a href="###">收藏的商品</a> | 
				<a href="###" onclick="favorite()" rel="sidebar">收藏本站</a> | 
				<a href="###" onclick="setHome()">设为首页</a>
			</div>
	</div>
	<div class="clear"></div>
</div>
<div class="topsearch">
	<p class="logo"><a href="#"><img src="${context_path}/images/logo.jpg" /></a>
	</p>
	<div class="search">
		<div class="searchform">
			<s:form action="product_list" namespace="/product">
				<input class="tbkey" type="text" name="keyWords" /><input class="btnsearch" type="submit" name="button" id="button" value="搜 索" />
			</s:form>
		</div>
		<p class="grade_search">
			<a class="grade" href="javascript:void(0)">搜索商品</a> 热搜：
			<a href="#">花苞裙</a> 
			<a href="#">雪纺裙</a> 
			<a href="#">吊带裙</a> 
			<a href="#">真丝裙</a> 
			<a href="#">背心裙</a>
		</p>
	</div>
</div>
<div class="clear"></div>
<script>
	function favorite()
	{
		try{
			var ua = navigator.userAgent.toLowerCase();
			if(ua.indexOf("msie 8")>-1)
			{
				window.external.AddToFavoritesBar(document.location.href,document.title, "");//IE8
			}else{
				if (document.all) 
				{
					window.external.addFavorite(document.location.href, document.title);
				}else if(window.sidebar)
				{
					window.sidebar.addPanel( document.title, document.location.href, "");//firefox
				}
			}

		}
		catch (e){alert("无法自动添加到收藏夹，请使用 Ctrl + d 手动添加");}
	}
	function setHome()
	{
		var url = document.location.href;
		if (document.all){
			document.body.style.behavior='url(#default#homepage)';
			document.body.setHomePage(url);
		}else if (window.sidebar){
			if(window.netscape){
				 try{
					  netscape.security.PrivilegeManager.enablePrivilege("UniversalXPConnect");
				 }catch (e){
					   alert("该操作被浏览器拒绝，如果想启用该功能，请在地址栏内输入 about:config,然后将项 signed.applets.codebase_principal_support 值该为true");
				 }
		}
		var prefs = Components.classes['@mozilla.org/preferences-service;1'].getService(Components. interfaces.nsIPrefBranch);
		prefs.setCharPref('browser.startup.homepage',url);}
	}
</script>