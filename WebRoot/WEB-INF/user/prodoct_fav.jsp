<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>乐淘购物——我的收藏</title>
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
				<h1>
					> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 我的收藏
				</h1>
				<span> <a href="/not.html?id=${noticelist[0].id}">标题</a> </span>
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
				<h2>我的收藏</h2>
				<s:if test="%{map.size != 0}">
				<table width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<td>
							<table width="100%" border="0" cellspacing="0" cellpadding="0"
								class="tbtit">
								<tr>
									<td width="50%" style="text-indent:50px;">商品名</td>
									<td width="30%">单价（元）</td>
									<td width="20%">操作</td>
								</tr>
							</table>
						</td>
					</tr>
					<tr>
						<td align="center">
							<table width="94%" border="0" cellspacing="0" cellpadding="0"
								class="tbgoods">
								<s:iterator value="map" id="column">
								<tr>
									<td width="40%" align="center">
										<s:property value="value.name" />
									</td>
									<td width="30%" align="center" class="price"><s:property value="value.sellPrice" /></td>
									<td width="30%" align="center" class="oprt">
										<a href="<s:url action="favorite_delete" namespace="/favorite"><s:param name="id" value="#column.key" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
									</td>
								</tr>
								</s:iterator>
							</table>
						</td>
					</tr>
				</table>
				<p class="jiesuan">
						<s:url action="favorite_list" namespace="/favorite" var="first">
							<s:param name="pageNo" value="1"></s:param>
						</s:url>
						<s:url action="favorite_list" namespace="/favorite" var="previous">
							<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
						</s:url>
						<s:url action="favorite_list" namespace="/favorite" var="last">
							<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
						</s:url>
						<s:url action="favorite_list" namespace="/favorite" var="next">
							<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
						</s:url>
						<s:include value="../comm/page.jsp"></s:include>
					</p>
				</s:if>
				<s:else>
					<div align="center" style="width:100%;margin:0px auto;margin-top:50px;">
						<img src="${context_path}/images/empty_cart.png" align="middle" />
						<span>您暂无收藏，赶紧行动吧！您可以：</span><br />
						<span>首页 <a href="<s:url action="index" namespace="/" />">搜喜欢的商品</a></span><br />
						<span>看看 <a href="">已买到的宝贝</a></span>
					</div>
				</s:else>
				<br />
			</div>
		</div>
	</div>
	<div class="clear"></div>
	<%@ include file="../comm/footer.jsp"%>
</body>
</html>
