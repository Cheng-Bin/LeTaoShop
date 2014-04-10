<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>乐淘购物——新闻资讯</title>
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
	<script language=javaScript type=text/javascript>
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
				<h1>> <a href="<s:url action="index" />">首页</a> > 新闻资讯</h1>
            	<span>
					<a href="">你有一个新消息</a>
				</span>
			</div>
        </div>

        <div class="productnew">
        	<div class="prod_sorted">
				<div class="menustyle">
					<h2>关于我们</h2>
				</div>
            	<ul class="sort_list user_nav news_nav">
					<li>
						<a href="##"><span>我不知道</span></a>
					</li>
					<li class="sortbd"></li>
				</ul>
            </div>

            <div class="prod_scrolled manage">
				<h2>新闻资讯</h2>
                <ul class="newslist">
					<li class="newstit">
						<span>时间</span>标题
					</li>
					<s:iterator value="pageModel.list">
                    <li class="news">
						<span><s:property value="addTime" /></span>
						<a href="<s:url action="article_content" namespace="/article"><s:param name="articleId" value="articleId" /></s:url>"><s:property value="articleTitle" /></a>
					</li>
					</s:iterator>
					
                </ul>
                <p class="news_page">
                	<s:url action="article" namespace="/article" var="first">
						<s:param name="pageNo" value="1"></s:param>
					</s:url>
					<s:url action="article" namespace="/article" var="previous">
						<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
					</s:url>
					<s:url action="article" namespace="/article" var="last">
						<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
					</s:url>
					<s:url action="article" namespace="/article" var="next">
						<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
					</s:url>
					<s:include value="../comm/page.jsp"></s:include>
                </p>
			</div>
        </div>        
    </div>
    <div class="clear"></div>

	<!--footer-->
    <%@ include file="../comm/footer.jsp" %>
</body>
</html>
