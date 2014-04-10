<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理系统 - 商品评论管理</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript">
		function checkForm(){
			
		}
		function del(){
			var n = $("input[name=ids]:checked").size();
			if(n<1){
				alert("至少选择一个！");
				return;
			}
			$("#formaaaaa").attr("action","procom_delAll.html");
			$("#formaaaaa").submit();
		}
		function fangxuan(){
			//$("input[name=ids]").attr("checked",!$(this).attr("checked"));
			$("input[name=ids]").each(function(){
				$(this).attr("checked",!$(this).attr("checked"));
			});
		}
		var message = "";
		if(message != null && message != ""){
			alert(message);
		}
	</script>
</head>

<body>
<div id="header">
	<s:include value="head.jsp"></s:include>
	<div class="notice">
		<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
		<div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 商品评论管理</p></div>
		<div class="nt1 nt4"><a href="/login_edit.html">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />商品评论管理</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<form id="formaaaaa" onsubmit="return checkForm()" method="post" action="">
					<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>评论人</th>
							<th>内容</th>
							<th>商品名称</th>
							<th>评论时间</th>        
							<th>操作</th>    
						</tr>
						<s:iterator value="pageModel.list">
						<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
							<td><s:property value="addName"/></td>
							<td><s:property value="comment"/></td>
							<td><s:property value="productId.name" /></td>
							<td><s:date name="addTime" format="yyyy-MM-dd EE" nice="false" /></td>
							<td>
								<a href="###">回复</a> | 
								<a href="<s:url action="comment_delete" namespace="/comment"><s:param name="id" value="id" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
							</td>                    
						</tr>
						</s:iterator>
						<tr>
							<td colspan="6" class="tbbtm">
								<s:url action="list" namespace="/comment" var="first">
									<s:param name="pageNo" value="1"></s:param>
								</s:url>
								<s:url action="list" namespace="/comment" var="previous">
									<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
								</s:url>
								<s:url action="list" namespace="/comment" var="last">
									<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
								</s:url>
								<s:url action="list" namespace="/comment" var="next">
									<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
								</s:url>
							<s:include value="../comm/page.jsp"></s:include>
							</td>
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
