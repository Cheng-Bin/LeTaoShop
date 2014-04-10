<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div class="nav nav2">
	<div class="navlist">
		<ul class="menuList">
			<li><a id="index" href="<s:url action="index" namespace="/" />">首页</a></li>
			<li><a id="zuixinspin"  href="<s:url action="new_product" namespace="/product" />">最新商品</a></li>
			<li><a id="tuijianspin" href="<s:url action="product_recommend" namespace="/product" />">推荐商品</a></li>
			<li><a id="xianliangspin" href="<s:url action="product_limit" namespace="/product" />">限量商品</a></li>
			<li><a id="tejiaspin" href="<s:url action="product_special" namespace="/product" />">特价商品</a></li>
			<li><a id="chuxiaospin" href="<s:url action="product_sale" namespace="/product" />">促销商品</a></li>
			<li><a id="xinwenzxun" href="<s:url action="article" namespace="/article" />">新闻资讯</a></li>              
		</ul>
		<div class="goodscart">
			<p>
				<a href="<s:url action="cart_list" namespace="/cart" />">我的账户</a> 
				<span><a href="<s:url action="cart_list" namespace="/cart" />">我的购物车</a></span>
			</p>
		</div>
		<div class="clear"></div>
	</div>
</div>
<script type="text/javascript">
<!--
	var url = location.href;
	if(url.indexOf("product_recommend.action")!=-1){
		$("#tuijianspin").addClass("navslt");
	}else if(url.indexOf("product_limit.action")!=-1){
		$("#xianliangspin").addClass("navslt");
	}else if(url.indexOf("product_special.action")!=-1){
		$("#tejiaspin").addClass("navslt");
	}else if(url.indexOf("product_sale.action")!=-1){
		$("#chuxiaospin").addClass("navslt");
	}else if(url.indexOf("article.action")!=-1){
		$("#xinwenzxun").addClass("navslt");
	}else if (url.indexOf("new_product.action") != -1) {
		$("#zuixinspin").addClass("navslt");
	} else if (url.indexOf("article_content.action") != -1) {
		$("#xinwenzxun").addClass("navslt");
	} else if (url.indexOf("index.action") != -1){
		$("#index").addClass("navslt");
	}
//-->
</script>