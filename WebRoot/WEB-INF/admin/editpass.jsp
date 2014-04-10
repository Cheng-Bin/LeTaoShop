<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统-修改密码</title>
<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
<script type="text/javascript">
		function checkForm(form){
			var p = $.trim($("#adminPassword").val());
			if (p == null || p.length == 0) 
			{
				alert("原始密码不能为空");
				return false;
			}
			var adminPassword = $.trim($("#password").val());
			var adminPassword2 = $.trim($("#adminPassword2").val());
			if(adminPassword != adminPassword2) {
				alert("两次输入的密码不同，请重新输入！");
				return false;
			}
			
			var url = "${context_path}/admin/check";
			var params = {"userName" : $("#userName").val(), "password": $("#adminPassword").val()};
			$.post(url, params, 
				function(data) {
					result = data.info;
					if (result == 0) 
					{
						alert("密码修改成功");
						form.submit();
					}
					else 
					{
						alert("与原密码不同");
					}
				}, "json");
				return false;
		}
	</script>
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
				<p>当前位置：系统管理 > 修改密码</p>
			</div>
			<div class="nt1 nt4">
				<a href="#">修改密码</a>
			</div>
		</div>
	</div>

	<s:form namespace="/admin" action="edit_password" onsubmit="return checkForm(this)">
		<div id="container">
			<div id="right">
				<div class="content">
					<div class="rtbd">
						<div class="jyjl">
							<h2>
								<img src="${context_path}/images/ibg1.jpg" />修改密码
							</h2>
						</div>
						<div class="clear"></div>
						<table class="tblist" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<th colspan="3">为了您的账号安全，不要将密码设置过于简单，建议英文加字母加数字组合</th>
							</tr>
							<tr>
								<td align="right">用&nbsp;&nbsp;户&nbsp;&nbsp;名：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="userName" id="userName" value="%{user.userName}" />
								</td>
							</tr>
							<tr>
								<td align="right">请输入您的旧密码：</td>
								<td>&nbsp;<label id="info"/></td>
								<td><input name="adminPassword" type="password"
									id="adminPassword" size="30" /> (长度6～14位) *</td>
							</tr>
							<tr>
								<td align="right">请输入您的新密码：</td>
								<td>&nbsp;</td>
								<td><input name="password" type="password"
									id="password" size="30" /> (长度6～14位) *</td>
							</tr>
							<tr>
								<td align="right">请确认新密码：</td>
								<td>&nbsp;</td>
								<td><input name="adminPassword2" type="password"
									id="adminPassword2" size="30" />
								</td>
							</tr>
							<tr>
								<td align="right"></td>
								<td>&nbsp;</td>
								<td>
									<s:hidden name="userId" value="%{user.userId}"></s:hidden>
									<input type="submit" name="button2" id="button2"
									value="修改" />
								</td>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<s:include value="left.jsp"></s:include>
		</div>
	</s:form>

	<div id="footer"></div>

</body>
</html>