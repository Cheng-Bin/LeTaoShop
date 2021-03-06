<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理系统 - 公告管理</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
</head>
<body>
<div id="header">
	<s:include value="head.jsp"></s:include>
    <div class="notice">
    	<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 公告管理</p></div>
        <div class="nt1 nt4"><a href="/login_edit.html">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />公告管理</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<form id="formaaaaa" onsubmit="return checkForm()" method="post" action="">
					<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>标题</th>
							<th>添加时间</th>  
							<th>操作</th>
						</tr>
						<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
							<td>这是标题</td>
							<td>2012-12-13</td>
							<td>
								<a href="not_add.html?id=${test.id}">修改</a> | 
								<a href="not_del.html?id=${test.id}" onclick="return confirm('确定要删除吗？')">删除</a>
							</td>                    
						</tr>
						<tr>
							<td colspan="3" class="tbbtm">ToolBar</td>
						</tr>
					</table>
				</form>
			</div>
		</div>
	</div>
	<s:include value="left.jsp"></s:include>
</div>
<div id="footer"></div>

</body>
</html>