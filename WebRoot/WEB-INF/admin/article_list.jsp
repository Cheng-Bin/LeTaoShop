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
    	<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 文章列表</p></div>
        <div class="nt1 nt4"><a href="/login_edit.html">修改密码</a></div>
  </div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />文章列表</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<s:form id="formaaaaa" onsubmit="return del()" method="post" action="article_dels" namespace="/article">
					<table id="table" class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th></th>
							<th>标题</th>
							<th>类别</th>
							<th>添加时间</th>  
							<th>操作</th>
						</tr>
						<s:iterator value="pageModel.list">
						<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
							<td><s:checkbox id="ids" value="false" fieldValue="%{articleId}" name="ids"/></td>
							<td><s:property value="articleTitle" /> </td>
							<td><s:property value="category.categoryName"/></td>
							<td>
								<s:date name="addTime" format="yyyy-MM-dd EE" nice="false" />
							</td>
							<td>
								<a href="<s:url action="article_edit" namespace="/article"><s:param name="articleId" value="articleId" /></s:url>">修改</a> | 
								<a href="<s:url action="article_delete" namespace="/article"><s:param name="articleId" value="articleId" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
							</td>                    
						</tr>
						</s:iterator>
						<tr>
							<td colspan="5" class="tbbtm">
								<input type="checkbox" onclick="fangxuan(this);" id="myradio" size="14" align="middle" />全选
								&nbsp;&nbsp;&nbsp;
								<s:submit value="删除所选记录" />
							</td>
						</tr>
						<tr>
							<td colspan="5" class="tbbtm">
								<s:url action="article_list" namespace="/article" var="first">
									<s:param name="pageNo" value="1"></s:param>
									<s:param name="pid" value="pid"></s:param>
								</s:url>
								<s:url action="article_list" namespace="/article" var="previous">
									<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
									<s:param name="pid" value="pid"></s:param>
								</s:url>
								<s:url action="article_list" namespace="/article" var="last">
									<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
									<s:param name="pid" value="pid"></s:param>
								</s:url>
								<s:url action="article_list" namespace="/article" var="next">
									<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
									<s:param name="pid" value="pid"></s:param>
								</s:url>
								<s:include value="../comm/page.jsp"></s:include>
							</td>
						</tr>
					</table>
				</s:form>
			</div>
		</div>
	</div>
	<s:include value="left.jsp"></s:include>
</div>

<div id="footer"></div>

</body>
</html>
