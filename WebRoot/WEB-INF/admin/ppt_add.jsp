<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理 - 幻灯片</title>
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
				<p>当前位置：系统管理 > 幻灯片</p>
			</div>
			<div class="nt1 nt4">
				<a href="/login_edit.html">修改密码</a>
			</div>
		</div>
	</div>
	<form onsubmit="return checkForm()" method="post"
		action="ppt_save.html" enctype="multipart/form-data">
		<div id="container">
			<div id="right">
				<div class="content">
					<div class="rtbd">
						<div class="jyjl">
							<h2>
								<img src="${context_path}/images/ibg1.jpg" />幻灯片
							</h2>
						</div>
						<div class="clear"></div>
						<table class="tblist" width="100%" border="0" cellspacing="0"
							cellpadding="0">

							<tr>
								<th colspan="3"></th>
							</tr>
							<tr>
								<td align="right">标题：</td>
								<td>&nbsp;</td>
								<td><input name="pptName" type="text" id="pptName"
									size="30" value="" /></td>
							</tr>

							<tr>
								<td align="right">上传图片：</td>
								<td>&nbsp;</td>
								<td><input type="file" name="proPicFile" id="proPicFile" />
									<img src="" width="100px" /> &nbsp;&nbsp;</td>
							</tr>
							<tr>
								<td align="right">链接地址：</td>
								<td>&nbsp;</td>
								<td><input name="pptUrl" type="text" id="linkUrl" size="30"
									value="" /></td>
							</tr>
							<tr>
								<td align="right">排序：</td>
								<td>&nbsp;</td>
								<td><input name="pptIndex" type="text" id="linkIndex"
									size="30" value="" /></td>
							</tr>
							<tr>
								<td align="right">是否启用：</td>
								<td>&nbsp;</td>
								<td><input type="radio" name="isUse" value="true"
									checked="checked" />启用 <input type="radio" name="isUse"
									value="false" />不启用</td>
							</tr>
							<tr>
								<td align="right">备注：</td>
								<td>&nbsp;</td>
								<td><textarea name="pptProfile" id="linkProfile" rows="10"
										cols="80">tt</textarea></td>
							</tr>

							<tr>
								<th class="edit" colspan="4"><input name="id" type="hidden"
									value="1" /> <input type="submit" name="button2" id="button2"
									value="确定" /></th>
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
