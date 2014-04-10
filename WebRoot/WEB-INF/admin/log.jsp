<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理系统 - 系统日志</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
</head>
<body>

<div id="header">
	<s:include value="head.jsp"></s:include>
    <div class="notice">
    	<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 系统日志</p></div>
        <div class="nt1 nt4"><a href="/login_edit.html">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />系统日志</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>人员</th>
						<th>时间</th>
						<th>区域</th>
						<th>动作</th>
						<th>IP</th>
						<th>相关链接</th>   
					</tr>
					<tr onmouseover="" onmouseout="">
						<td>管理员</td>
						<td>2013-12-23</td>
						<td>222</td>
						<td>add</td>
						<td>172.121.232.22</td>
						<td>edit.php</td>                    
					</tr>
					<tr>
						<td colspan="7" class="tbbtm">Tool</td>
					</tr>
				</table>
			</div>
		</div>
	</div>
    <s:include value="left.jsp"></s:include>
</div>


<div id="footer"></div>

</body>
</html>
