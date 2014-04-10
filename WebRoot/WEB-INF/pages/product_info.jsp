<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>乐淘购物——<s:property value="title" /> </title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/index.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/page.js"></script>
	<script>
	
		function checkNumber(form) {
			var reg = /^[0-9]*[1-9][0-9]*$/;
			var dom = document.getElementById("buy_span");
			dom.innerHTML = "";
			var number = $.trim(document.getElementById("number").value);
			if (!reg.test(number)) {
				dom.innerHTML = "<font color='red'>请合法填写购买商品数量</font>";
				return false;
			} else {
				var id = $.trim(document.getElementById("id").value);
				var params = {"size" : number, "productId" : id};
				return loadData(dom, "${context_path}/cart/check_number", params, form);
			}
		}
		

		$(function(){
			var uleft = $(".prod_sorted");
			var uright = $(".prod_detscrolled");
			var ucenter = $(".product_list");
			if(uleft.height()<uright.height()){
				ucenter.height(uright.height());
			}
			else{
				ucenter.height(uleft.height());
			}
			
			$(".prodnav a").focus(function(){
				this.blur();
			});

			$(".prod_pic li").click(
				function(){
					$(".prod_pic li").removeClass("sltpicbg");
					$(this).addClass("sltpicbg");
					$("#prodid").attr("src",$(this).find("img").attr("src"));	
				}
			);
				
			$("#liself1,#liself2,#liself3").click(function(){
				if(uleft.height()<uright.height()){
				   ucenter.height(uright.height());
				}
				else{
					ucenter.height(uleft.height());
				}
			})
			
		});
		
		function add(url) {
			var id = $("#id").val();
			var params = {"productId" : id};
			$.post(url, params, 
			function(data) {
				result = data.exists;
				if (result == 0) {
					alert("收藏成功");
				} 
			}, "json");
		}
		

		
		function changeInfo(id){
			for(i=1;i<=3;i++){
				document.getElementById("show"+i).style.display="none";
				document.getElementById("liself"+i).className="";
			}
			document.getElementById("show"+id).style.display="block";
			document.getElementById("liself"+id).className="prodnav_slt";
			
		}
		
		function check(form) {
			var con = $.trim($("#comment").val());
			if (con.length == 0) {
				alert("请填写留言内容");
				return false;
			}
			return true;
		}
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
			<h1></h1><h1>&gt; <a href='<s:url action="index" />'>首页</a> &gt; 商品详细页面</h1>
			<span>
				<a href="##"></a>
			</span>
		 </div>
	</div>

	<div class="productnew product_list">
		<div class="prod_sorted">
			<div class="menustyle">
				<h2>商品分类</h2>
			</div>
			<ul class="sort_list">
				<s:iterator value="categories">
				<li>
					<a href="<s:url action="findByPid" namespace="/product"><s:param name="category.categoryId" value="categoryId" /></s:url>" title=""><span><s:property value="categoryName" /></span></a>
					<br />
				</li>
				</s:iterator>
			</ul>
			<div class="menustyle">
				<h2>最新商品</h2>
			</div>
			<ul class="lxqs_list">
				<s:iterator value="product_sale">
					<li>
						<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>"><img src="${context_path}/upload/<s:property value="uploadFile.path"/>" /></a>
						<p>
							<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>"><s:property value="name" /></a><br />
							<span>￥<em><s:property value="sellPrice" /></em></span>
						</p>
					</li>    
				</s:iterator>   
			</ul>
			

			<div class="menustyle">
				<h2>合作伙伴</h2>
			</div>
			  <ul class="xptg_list">
				<li><a href=""><img src="${context_path}/images/tj1.jpg" /></a></li>
				<li><a href=""><img src="${context_path}/images/tj2.jpg" /></a></li>
				<li><a href=""><img src="${context_path}/images/tj3.jpg" /></a></li>
			  </ul>
			</div>
			
			<div class="prod_detscrolled">
				<div class="detail_info">
					<div class="prod_pic">
						<p>
							<img id="prodid" src="${context_path}/upload/<s:property value="product.uploadFile.path"/>" />
						</p>
					 </div>
					 <ul class="prod_info">
						<s:form action="product_buy" method="post" namespace="/product" onsubmit="return checkNumber(this)">
						<li>名称： <span><s:property value="product.name" /></span></li>
						<li>售价： <span><s:property value="product.sellPrice" />元</span></li>
						<li>市场价： <s:property value="product.marketPrice" />元</li>
						<li>销售数量： <span><s:property value="product.sellCount" /></span></li>
						<li>商品类别： <span><s:property value="product.category.categoryName"/></span></li>
						<li>库存数量：<span><s:property value="product.count"/></span></li>
						<li>购买数量：<span><s:textfield value="1" name="number" size="5" onblur="checkNumber()" id="number"/>(单位：件)</span>&nbsp;&nbsp;<span id="buy_span"></span></li>
						<s:hidden id="id" name="id" value="%{product.id}"></s:hidden>
						<li class="prodbtn">
							<input class="btnbuy" type="submit" name="button2" id="button2"
							value="立即购买" />
							<input class="btnbuy btncard" type="button" name="button3" id="button3" value="收藏该商品" onclick="add('<s:url action="favorite_add" namespace="/favorite" />')" />
						</li>
						</s:form>
					</ul>
				</div>
				<div class="clear"></div>


				<div class="view_main">
					<ul class="prodnav">
						<li id="liself1" onclick="changeInfo(1)" class="prodnav_slt"><a href="javascript:">商品信息</a></li>
						<li id="liself2" onclick="changeInfo(2)"><a href="javascript:">相关商品</a></li>
						<li id="liself3" onclick="changeInfo(3)"><a href="javascript:">商品评论</a></li>
					 </ul>
					<div id="show1"><s:property value="product.description" escape="false" /></div>
					<div id="show2" style="display:none;">
						<ul class="newprod linkprod">
							<s:if test="%{product_same.size > 0}">
							<s:iterator value="product_same">
							<li>
								<p><a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>"><img src="${context_path}/upload/<s:property value="product.uploadFile.path"/>" /></a></p>
								<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>"><s:property value="product.name"/> </a><br />
								<span>售价:<s:property value="product.sellPrice" />元</span>
							</li>
							</s:iterator>
							</s:if>
							<s:else>
								<div class="newprod linkprod" style="width:80%; margin:0 auto;">
									<img src="${context_path}/images/null_icon.png" alt="提示" align="bottom" />
									<span style="font-size:16px;">对不起，暂时没有找到相关的商品</span>
								</div>
							</s:else>
						</ul>
				 	</div>
					<div id="show3" style="display:none;">
	        			<p class="spcmt">商品评论<span>0</span></p>
					<div>
           	  
					<table class="comment" width="100%" border="0" cellspacing="0" cellpadding="0">                
						<s:iterator value="comment_list">
						<tr>				  
							<td width="30%" height="35" align="center"><s:date name="addTime" format="yyyy-MM-dd hh:mm:ss EE" nice="false"/></td>
							<td width="50%" class="cmt"><s:property value="comment"/>&nbsp;</td>
							<td width="20%"><s:property value="addName"/>&nbsp;</td>
						</tr>
						</s:iterator>
	                </table>
            	</div>
	
				<p class="btncmt">
		            <s:form id="form1" namespace="/comment" name="form1" method="post" action="add" onsubmit="return check(this)">
						<p>评论人：<s:textfield name="addName" class="text1" style="width: 183px;"/></p>
						<p>&nbsp;</p>
						<p>
							<label>内&nbsp;&nbsp;容：</label>
							<s:textarea name="comment" id="comment" cols="30" rows=""></s:textarea>
							<s:hidden name="productId.id" value="%{product.id}" />
							<input type="submit" name="button4" id="button4" value="发表评论" />
						</p>
					</s:form>
	          </p>
        	</div>
      	</div>
    </div>
  </div>
</div>
<div class="clear"></div>


<!--S=footer-->
<%@ include file="../comm/footer.jsp" %>
</body>
</html>