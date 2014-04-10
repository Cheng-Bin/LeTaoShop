<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理后台 - 产品管理</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
</head>
<body>

<div id="header">
	<s:include value="head.jsp"></s:include>
    <div class="notice">
    	<div class="nt1"><a href="${context_path}/index.jsp">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：管理后台 > 产品管理</p></div>
        <div class="nt1 nt4"><a href="<s:url action="product_add" namespace="/product"/>" style="color: red">添加</a><a href="/login_edit.html">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />产品管理</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th>产品编号</th>
						<th>产品名称</th>
						<th>产品类别</th>
						<th>发布时间</th>
						<th>点击率</th>
						<th>操作</th>
					</tr>
					<s:if test="pageModel.list.size != 0">
					<s:iterator value="pageModel.list">
					<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
						<td><s:property value="no" /></td>
						<td><s:property value="name" /></td>
						<td><s:property value="category.categoryName" /></td>
						<td><s:date name="addTime" format="yyyy-MM-dd hh:mm:ss EE" nice="false" /></td>
						<td><s:property value="clickCount" /></td>
						<td class="sd">
							<a href="<s:url action="edit" namespace="/product"><s:param name="id" value="id" /></s:url>">修改</a> | 
							<a href="<s:url action="delete" namespace="/product"><s:param name="id" value="id" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
						</td>
					</tr>
					</s:iterator>
					<tr>
						<td colspan="6" class="tbbtm">
							<s:url action="product_list" namespace="/product" var="first">
								<s:param name="pageNo" value="1"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:url action="product_list" namespace="/product" var="previous">
								<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:url action="product_list" namespace="/product" var="last">
								<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:url action="product_list" namespace="/product" var="next">
								<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:include value="../comm/page.jsp"></s:include>
						</td>
					</tr>
					</s:if>
					<s:else>
						<tr>
							<td colspan="6">暂无内容</td>
						</tr>
					</s:else>
				</table>
			</div>
		</div>
	</div>
	<s:include value="left.jsp"></s:include>
</div>

<div id="footer"></div>

</body>
</html>
