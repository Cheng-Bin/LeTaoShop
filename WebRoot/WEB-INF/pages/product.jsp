<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>乐淘购物——<s:property value="title" /></title>
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
			
			$("#goup a").focus(function(){
				this.blur();
			});
			
			
		})
	</script>
	<script language="javascript">
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
				<h1>> <a href="<s:url action="index" namespace="/" />">首页</a> > <s:property value="title" /></h1>
				<span>
					<a href="">this is my blog</a>
				</span>
			</div>
        </div>

        <div class="productnew">
        	<div class="prod_sorted">
            	<div class="menustyle"><h2>商品分类</h2></div>
            	<ul class="sort_list">
            		 <s:iterator value="categories">
					 <li>
						<a href="<s:url action="findByPid" namespace="/product"><s:param name="category.categoryId" value="categoryId" /></s:url>" title=""><span><s:property value="categoryName" /></span></a>
					 </li>
					 </s:iterator>             	
                </ul>

                <div class="menustyle">
					<h2>特价商品</h2>
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
                	<li><a href="/"><img src="${context_path}/images/tj1.jpg" /></a></li>
                    <li><a href="/"><img src="${context_path}/images/tj2.jpg" /></a></li>
                    <li><a href="/"><img src="${context_path}/images/tj3.jpg" /></a></li>
                </ul>
            </div>


            <div class="prod_scrolled">         	
				<p><img src="${context_path}/images/banner3.jpg" /></p>
                <p class="notice"><s:property value="title" /></p>
                    <div class="newprod_menu">
                        <div class="newprodbg newprodbd">
							<h3>商品列表<label>&nbsp;</label></h3>
						</div>
                    </div>
                    <div class="clear"></div>
                    
                    <s:if test="pageModel.list.size != 0">
					<ul class="newprod">
					    <s:iterator value="pageModel.list">
                        <li>
                            <p>
								<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>"><img src="${context_path}/upload/<s:property value="uploadFile.path"/>" width="178px" height="154px" /></a>
							</p>
							<a href="<s:url action="product_info" namespace="/product"><s:param name="id" value="id" /></s:url>"><s:property value="name" /></a><br />
							<span>￥售价:<s:property value="sellPrice" /></span>
                        </li>
						</s:iterator>  
                    </ul>

                    <div class="clear"></div>
                    <p class="page">
                    	<s:url action="new_product" namespace="/product" var="first">
							<s:param name="pageNo" value="1"></s:param>
						</s:url>
						<s:url action="new_product" namespace="/product" var="previous">
							<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
						</s:url>
						<s:url action="new_product" namespace="/product" var="last">
							<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
						</s:url>
						<s:url action="new_product" namespace="/product" var="next">
							<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
						</s:url>
						<s:include value="../comm/page.jsp"></s:include>
                    </p>
                   <br />
                   </s:if>
                   <s:else>
                   		<div style="width:50%;color:Red;margin:0 auto;margin-top:50px;text-align:center;font-size:13px;">抱歉，暂无搜索结果</div>
                   </s:else>
                   <!--S=top-->     
			</div>
        </div>      
        <div class="clear"></div>  
    </div>
    
    <%@ include file="../comm/footer.jsp" %>
</body>
</html>
