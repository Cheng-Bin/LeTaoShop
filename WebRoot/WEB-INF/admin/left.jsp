<%@ taglib uri="/struts-tags" prefix="s" %>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<div id="left">
	<dl>
        <dt class="dtlv_close" id="nav_0" onclick="displayNav(0)"><img src="${context_path}/images/unfold.gif" />基本功能</dt>
        <dd><a href="<s:url action="config" namespace="/admin" />">基本设置</a></dd>
        <dd><a href="<s:url action="edit_pass" namespace="/admin" />">修改密码</a></dd>
        <dd><a href="<s:url action="mail" namespace="/admin" />">邮件设置</a></dd>
        <dd><a href="<s:url action="ppt" namespace="/admin" />">幻灯片图片</a></dd>
		<dd><a href="<s:url action="ppt_add" namespace="/admin" />">添加幻灯片图片</a></dd>
		<!--<dd><a href="<s:url action="commentl" namespace="/admin"/>">网站留言</a></dd> -->
		<%--<dd><a href="<s:url action="page" namespace="/admin"/>">页面管理</a></dd>--%>
		<%--<dd><a href="<s:url action="page_add" namespace="/admin"/>">添加页面</a></dd>--%>
		<dd><a href="<s:url action="log" namespace="/admin"/>">系统日志</a></dd>
    </dl>
	<dl>
        <dt class="dtlv_close" id="nav_1" onclick="displayNav(1)"><img src="${context_path}/images/unfold.gif" />公告管理</dt>        
        <dd><a href="<s:url action="new_notice" namespace="/notice"/>">公告列表</a></dd>
		<dd><a href="<s:url action="notice_add" namespace="/notice"/>">添加公告</a></dd>
    </dl>
	<dl>
        <dt class="dtlv_close" id="nav_2" onclick="displayNav(2)"><img src="${context_path}/images/unfold.gif" />文章管理</dt>        
        <dd><a href="<s:url action="artcat_list" namespace="/articleType"/>">类别管理</a></dd>
		<dd><a href="<s:url action="artcat_add" namespace="/articleType"/>">添加类别</a></dd>
        <dd><a href="<s:url action="article_list" namespace="/article"/>">文章列表</a></dd>
		<dd><a href="<s:url action="article_add" namespace="/article"/>">添加文章</a></dd>
		<dd><a href="/admin/com.html">评论管理</a></dd>
    </dl>
	<dl>
        <dt class="dtlv_close" id="nav_3" onclick="displayNav(3)"><img src="${context_path}/images/unfold.gif" />商城管理</dt>        
        <dd><a href="<s:url action="category_list" namespace="/productType"/>">类别管理</a></dd>
		<dd><a href="<s:url action="product_list" namespace="/product"/>">商品列表</a></dd>
		<dd><a href="<s:url action="product_add" namespace="/product"/>">添加商品</a></dd>
		<dd><a href="<s:url action="list" namespace="/comment"/>">评论管理</a></dd>
		<dd><a href="<s:url action="product_order" namespace="/order"/>">订单管理</a></dd>
		<dd><a href="<s:url action="bank_info" namespace="/bank"/>">财务信息</a></dd>
		<dd><a href="<s:url action="api" namespace="/bank"/>">支付接口</a></dd>
		<dd><a href="<s:url action="api_add" namespace="/bank"/>">增加支付接口</a></dd>
    </dl>
	<dl>
        <dt class="dtlv_close" id="nav_4" onclick="displayNav(4)"><img src="${context_path}/images/unfold.gif" />友情链接</dt>        
        <dd><a href="<s:url action="link_list" namespace="/link"/>">链接列表</a></dd>
		<dd><a href="<s:url action="link_add" namespace="/link"/>">添加链接</a></dd>
    </dl>
	<dl>
        <dt class="dtlv_close" id="nav_5" onclick="displayNav(5)"><img src="${context_path}/images/unfold.gif" />会员管理</dt>
        <dd><a href="<s:url action="user_list" namespace="/customer"/>">会员列表</a></dd>
    </dl>
	
   
</div>