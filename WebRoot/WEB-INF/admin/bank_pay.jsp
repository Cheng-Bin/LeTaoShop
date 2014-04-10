<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理系统 - 财务信息</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript">
		function edit(id){
			$("#id").val(id);
			$("#message").val($("#javazj_" + id).html());
		}
	</script>
</head>

<body>
<div id="header">
	<s:include value="head.jsp"></s:include>
	<div class="notice">
		<div class="nt1"><a href="index.html">系统首页</a></div>
		<div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 财务信息</p></div>
		<div class="nt1 nt4"><a href="login_edit.html">修改密码</a></div>
  </div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />财务信息</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>用户名</th>
						<th>金额</th>
						<th>用户备注</th>
						<th>管理员备注</th>
						<th>添加时间</th>
						<th>状态</th>
						<th>操作</th>
					</tr>
					<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
						<td>程斌</td>
						<td>399</td>
						<td>暂无备注</td>
						<td>暂无备注</td>
						<td>2013-12-12 12:34:12</td>
						<td>
						进行中&nbsp;&nbsp;&nbsp;
						</td>
						<td>
							<a href="#TB_inline?&1=1&height=200&width=300&inlineId=addNewsSort" class="thickbox" onclick="return edit('${test.id}')">添加管理员备注</a>
							<div id="javazj_${test.id}" style="display:none">暂未有</div>
							<a href="bank_del.html?id=${test.id}" onclick="return confirm('确定要删除吗？')">删除</a>
						</td>                    
					</tr>
					<tr>
						<td colspan="7" class="tbbtm">pageToolBar</td>
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
