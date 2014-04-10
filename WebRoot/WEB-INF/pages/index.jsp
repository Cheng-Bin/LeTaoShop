<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html>
<html lang="zh-cn">
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<title>欢迎来到乐淘购物</title>
		<link type="text/css" rel="stylesheet" href="${context_path}/css/index.css" />
		<script type="text/javascript" src="${context_path}/js/jquery-1.1.3.pack.js"></script>
		<script type="text/javascript" src="${context_path}/js/scroll.js"></script>
		<script>
			$(document).ready(function(){
				$("#scrollDiv1").Scroll({line:5,speed:500,timer:3000,left:"scroll_lt1",right:"scroll_rt1"}); //自动播放
				$("#scrollDiv2").Scroll({line:5,speed:500,timer:7000,left:"scroll_lt2",right:"scroll_rt2"});//自动播放
				$("#scrollDiv3").Scroll({line:4,speed:500,left:"scroll_lt3",right:"scroll_rt3"});

				$(".menunav_bar").find("a").click(
					function(){
						$(this).addClass("sltmenubg").siblings().removeClass("sltmenubg");
						var index = $(".menunav_bar a").index(this);
						$(".chgmenu").eq(index).show().siblings("ul").hide();
					}
				)
		});
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
			<h1>><a href="###">首页</a></h1>
			<span>
				<a href="###"></a>
			</span>
		</div>
	</div>

	<div class="product">
		<div class="prod_sort">
			<div class="menustyle">
				<h2>商品分类</h2>
			</div>
			<s:iterator value="categories">
			<dl>
				<dt>
					<a href="<s:url action="findByPid" namespace="/product"><s:param name="category.categoryId" value="categoryId" /></s:url>" title=""><s:property value="categoryName" /></a>
				</dt>
				<s:if test="!child.isEmpty">
					<s:iterator value="child">
						<dd>
							<a href="<s:url action="findByPid" namespace="/product"><s:param name="category.categoryId" value="categoryId" /></s:url>" title=""><s:property value="categoryName" /></a>
						</dd>
					</s:iterator>
				</s:if>
            </dl>
            </s:iterator>
		</div>
		
		<!-- 今日新品 -->
		<div class="prod_scroll product0">
			<div class="newprod_menu">
				<div class="newprodbg">
					<h3>今日新品</h3>
				</div>
			</div>
			<div>
				<div class="scroll_lt" id="scroll_lt1"><a href="javascript:void(0)"></a></div>
				<div id="scrollDiv1" class="scroll_ct">
					<ul>
						<s:iterator value="product_new">
						<li>
							<h3>
								<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>" target="_blank"><img width="96px" height="96px" src="<s:property value="%{context_path}"/>/upload/<s:property value="uploadFile.path"/>" /></a>
							</h3>
							<p>
								<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>" target="_blank"><s:property value="name" /></a>
							</p>
							<span>活动价：<em>￥<s:property value="sellPrice" /></em></span>
						</li>
						</s:iterator>
					</ul>
				</div>
				<div class="scroll_rt" id="scroll_rt1"><a href="javascript:"></a></div>
				<div class="clear"></div>	
			</div>


		<!-- 精品推荐 -->
		<div class="newprod_menu">
			<div class="newprodbg">
				<h3>精品推荐</h3>
			</div>
		</div>
		<div>
			<div class="scroll_lt" id="scroll_lt2"><a href="javascript:"></a></div>
			<div id="scrollDiv2" class="scroll_ct">
				<ul>
					<s:iterator value="product_commend">
					<li>
						<h3>
							<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>" target="_blank"><img src="${context_path}/upload/<s:property value="uploadFile.path"/>" width="96px" height="96px" /></a>
						</h3>
						<p>
							<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>" target="_blank"><s:property value="name"/></a>
						</p>
						<span>活动价：<em>￥<s:property value="sellPrice" /></em></span>
					</li>
					</s:iterator>
				</ul>
			</div>
			<div class="scroll_rt" id="scroll_rt2"><a href="javascript:"></a></div>
			<div class="clear"></div>
		</div>
	</div>
</div>

<div class="productbd">
	<div class="product product2">
		<div class="prod_sort">
			<div class="menustyle">
				<h2>商品快报</h2>
			</div>
			<div class="chgmenubg">
				<div class="menunav_bar">
					<a class="sltmenubg" href="javascript:">衣服</a>
					<script	language="javascript">
						$(function(){
							$("#ajax1").load("index_ajaxarticlelist.html");
						 });
					</script>
					<a href="javascript:">帽子</a>
					<script	language="javascript">
						$(function(){
							$("#ajax2").load("index_ajaxarticlelist.html");
						});
					</script>
				</div>
				<ul id="ajax1" class="chgmenu">
					<li>加载中...</li>
					<li>加载中...</li>
					<li>加载中...</li>
					<li>加载中...</li>
					<li>加载中...</li>
				</ul>
				<ul id="ajax2" class="chgmenu" style="display:none;">
					<li>加载中...</li>
					<li>加载中...</li>
					<li>加载中...</li>
					<li>加载中...</li>
					<li>加载中...</li>
				</ul>
			</div>
		</div>

	<div class="prod_scroll">
		<div class="newprod_menu">
			<div class="newprodbg">
				<h3>今日特价</h3>
			</div>
		</div>
		<ul class="todayprice">
			<s:iterator value="product_sale">
			<li>
				<h3>
					<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>" target="_blank">
						<img src="${context_path}/upload/<s:property value="uploadFile.path"/>" width="96px" height="96px" />
					</a>
				</h3>
				<p>
					<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>" target="_blank"><s:property value="name"/> </a>
				</p>
				<s>市场价：￥<s:property value="marketPrice" /></s><br />
				<span>活动价：<em><s:property value="sellPrice" /></em></span>
			</li>
			</s:iterator>
		</ul>                  
	</div>
</div>


</div>
	<div class="sortpic">
		<ul>
			<li>
				<a href="/"><img src="${context_path}/images/sort1.jpg" /></a>
			</li>
			<li class="mglt">
				<a href="/"><img src="${context_path}/images/sort2.jpg" /></a>
			</li>
			<li class="mglt">
				<a href="/"><img src="${context_path}/images/sort3.jpg" /></a>
			</li>
			<li class="mglt">
				<a href="/"><img src="${context_path}/images/sort4.jpg" /></a>
			</li>
		</ul>
	</div>
	
	<div class="product product3">
		<div class="prod_sort" >
			<div class="menustyle">
				<h2>合作伙伴</h2>
			</div>
			<ul class="ssht_list">
				<li class="lfirst">
					<a href="####" target="_blank"><img src="${context_path}/images/safe-120.jpg" /></a>
				</li>
			</ul>
		</div>
	</div>
	<div class="clear"></div>
</div>

<!--S=footer-->
<%@ include file="../comm/footer.jsp" %>
</body>
</html>