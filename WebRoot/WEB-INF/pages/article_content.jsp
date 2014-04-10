<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>——新闻资讯——</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/index.css" />
	<script type="text/javascript" src="${context_path}/js/jquery-1.1.3.pack.js"></script>
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
	<script language=JavaScript type="text/javascript">
		var clientWidth=(parseInt(window.screen.width)-960)/2-95;
		suspendcode12="<DIV id=\"ALayer1\" style='right:"+clientWidth+"px;PosITION:absolute;TOP:300px;FILTER: alpha(opacity=85);'><div id=\"goup\"><p id=\"gototop\"><a href=\"javascript:\" onclick=\"window.scroll(0,0);return false;\"><img src=\"images/top.gif\" /></a></p><p class=\"todayview\"><a href=\"#\">今日浏览</a></p><p class=\"gwc\"><a href=\"#\">购物车<br /><strong>(0)</strong></a></p></div></div>"
	</script>
</head>

<body>
	<!--S=header-->
	<div id="header">
    	<%@ include file="../comm/header.jsp" %>
		<%@ include file="../comm/nav.jsp" %>
    </div>


    <!--S=main-->
    <div id="main">
		<%@ include file="../comm/banner.jsp" %>
		<div class="location">
			<div class="place">
				<h1>> <a href="<s:url action="index" namespace="/product"/>">首页</a> >  <a href="<s:url action="article" namespace="/article" />">新闻资讯</a> > <s:property value="article.articleTitle" /></h1>
				<span>
					<a href="not.html">你有一条新消息</a>
				</span>
			</div>
		</div>

		<div class="productnew">
			<div class="prod_sorted">
				<div class="menustyle">
					<h2>相关新闻</h2>
				</div>
				<ul class="sort_list user_nav news_nav">
					<s:iterator value="pageModel.list">
					<li>
						<a href="<s:url action="article_content" namespace="/article"><s:param name="articleId" value="articleId" /></s:url>"><span><s:property value="articleTitle" /></span></a>
					</li>
					</s:iterator>
				</ul>
			</div>
			<div class="prod_scrolled manage">
				<h3 class="news_tit"><s:property value="article.articleTitle" /></h3>
				<p class="sns_date">发布时间：<s:date name="article.addTime" format="yyyy-MM-dd EE" nice="false" /></p>
				<div class="sns_content">
					<s:property escape="false" value="article.articleContent" />
				</div>
			</div>
			<div class="clear"></div>
		</div>
	</div>
	

	<!--footer-->
    <%@ include file="../comm/footer.jsp" %>
</body>
</html>
