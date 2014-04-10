<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理 - 产品类别添加</title>
<link type="text/css" rel="stylesheet"
	href="${context_path}/css/user.css" />
<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
<script type="text/javascript" src="${context_path}/js/check.js"></script>
<script type="text/javascript">
	function checkForm(form) {
		var dom = $("#categoryName");
		var params = {
			categoryName : dom.val()
		};
		return true;
		//return loadData(dom, "${context_path}/articleType/articleType_already", params, form, "产品类别");
	}
</script>

</head>
<body>
	<s:include value="head.jsp" />
	<div class="notice">
		<div class="nt1">
			<a href="${context_path}/index.jsp">系统首页</a>
		</div>
		<div class="nt2">
			<span class="ntltbg"></span>
			<p>当前位置：系统管理  > 添加产品分类</p>
		</div>
		<div class="nt1 nt4">
			<a href="">修改密码</a>
		</div>
	</div>
	<s:form method="post" action="save" namespace="/productType" onsubmit="return checkForm(this)">
		<div id="container">
			<div id="right">
				<div class="content">
					<div class="rtbd">
						<div class="jyjl">
							<h2>
								<img src="${context_path}/images/ibg1.jpg" />添加产品分类
							</h2>
						</div>
						<div class="clear"></div>
						<table class="tblist" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<th colspan="2"></th>
							</tr>
							<tr>
								<td align="right">分类名称：</td>
								<td style="width:750px">
									<s:textfield name="categoryName" id="categoryName" size="30"></s:textfield>
								</td>
							</tr>
							<tr>
								<td align="right">所属类别：</td>
								<td>
									<s:select list="map" name="categoryId"></s:select>
								</td>
							</tr>
							<tr>
								<th class="edit" colspan="2">&nbsp;
									<s:token />
									<s:hidden name="id" id="id" value="" />
									<s:submit name="button2" id="button2" value="添加" />
								</th>
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
