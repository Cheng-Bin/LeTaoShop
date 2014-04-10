<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理 - 首页</title>
<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
<script type="text/javascript" src="${context_path}/js/sys.js"></script>
</head>
<body>
<div id="header">
	<s:include value="head.jsp"></s:include>
	<div class="notice">
		<div class="nt1">
			<a href="/admin/index.html">系统首页</a>
		</div>
		<div class="nt2">
			<span class="ntltbg"></span>
			<p>当前位置：系统管理 > 首页</p>
		</div>
		<div class="nt1 nt4">
			<a href="/login_edit.html">修改密码</a>
		</div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />登录成功</h2>
				</div>
				<div class="clear"></div>
			</div>
			<div class="rtbd">
				<div class="jyjl">
					<h2>辅助功能：</h2>
				</div>
				<p><a href="/admin/mobileMsg.html">发送手机短信</a></p>
				<div class="clear"></div>
			</div>
		</div>
	</div>
	<s:include value="left.jsp"></s:include>
</div>
<div id="footer"></div>
</body>
</html>
