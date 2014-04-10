<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理 - 网站基本设置</title>
<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
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
				<p>当前位置：系统管理 > 网站基本设置</p>
			</div>
			<div class="nt1 nt4">
				<a href="/login_edit.html">修改密码</a>
			</div>
		</div>
	</div>

	<form onsubmit="return checkForm()" method="post"
		action="cfg_save.html" enctype="multipart/form-data">
		<div id="container">
			<div id="right">
				<div class="content">
					<div class="rtbd">
						<div class="jyjl">
							<h2>
								<img src="${context_path}/images/ibg1.jpg" />网站基本设置
							</h2>
						</div>
						<div class="clear"></div>
						<table class="tblist" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<th colspan="3"></th>
							</tr>
							<tr>
								<td align="right">网站名称：</td>
								<td>&nbsp;</td>
								<td><input name="siteName" type="text" id="siteName"
									size="30" value="网站名称" />
								</td>
							</tr>
							<tr>
								<td align="right">网站关键词：</td>
								<td>&nbsp;</td>
								<td><input name="keyWords" type="text" id="keyWords"
									size="30" value="keywords" /> &nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">网站描述：</td>
								<td>&nbsp;</td>
								<td><input name="descripe" type="text" id="descripe"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">手机号码：</td>
								<td>&nbsp;</td>
								<td><input name="mobile" type="text" id="mobile" size="30"
									value="18284064241" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">邮箱地址：</td>
								<td>&nbsp;</td>
								<td><input name="email" type="text" id="email" size="30"
									value="997155652@qq.com" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">流量统计代码：</td>
								<td>&nbsp;</td>
								<td><textarea rows="2" cols="20" name="webTongji"
										id="webTongji" size="30">web</textarea>&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">是否允许评论：</td>
								<td>&nbsp;</td>
								<td><input type="radio" value="true" name="allowCommend"
									checked="checked" />是 <input type="radio" value="false"
									name="allowCommend" />否</td>
							</tr>
							<tr>
								<td align="right">联系地址：</td>
								<td>&nbsp;</td>
								<td><input name="address" type="text" id="address"
									size="30" value="四川" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">网站域名：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="domain" id="domain" size="30"
									value="域名" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">网站备案号：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="icpNumber" id="icpNumber"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">站长真实姓名：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="userRealName"
									id="userRealName" size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">站长年龄：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="age" id="age" size="30"
									value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">出生日期：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="dateBrith" id="dateBrith"
									size="30" value="" />&nbsp;&nbsp;[格式如：1983-01-25]</td>
							</tr>
							<tr>
								<td align="right">站长星座：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="xingzuo" id="xingzuo"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">站长性别：</td>
								<td>&nbsp;</td>
								<td><input type="radio" value="男" name="userSex"
									checked="checked" />男 <input type="radio" value="女"
									name="userSex" />女</td>
							</tr>
							<tr>
								<td align="right">上传头像：</td>
								<td>&nbsp;</td>
								<td><input type="file" name="proPicFile" id="proPicFile" />
									已经存在，重新上传将覆盖原来文件</td>
							</tr>
							<tr>
								<td align="right">婚姻状况：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend1" id="extend1"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">血型：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend2" id="extend2"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">故乡：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend3" id="extend3"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">职业：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend4" id="extend4"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">公司名称：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend5" id="extend5"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">公司所在地：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend6" id="extend6"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">详细地址：</td>
								<td>&nbsp;</td>
								<td><input type="text" name="extend7" id="extend7"
									size="30" value="" />&nbsp;&nbsp;</td>
							</tr>
							<tr>
								<th class="edit" colspan="3"><input type="submit"
									name="button2" id="button2" value="确定" />
								</th>
							</tr>
						</table>
					</div>
				</div>
			</div>
			<s:include value="left.jsp"></s:include>
		</div>
	</form>


	<div id="footer"></div>

</body>
</html>
