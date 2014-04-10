<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set><!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理系统 - 网站留言管理</title>
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
			$("#formaaaaa").attr("action","coml_delAll.html");
			$("#formaaaaa").submit();
		}
		function setsorts(){
			var n = $("input[name=ids]:checked").size();
			if(n<1){
				alert("至少选择一个！");
				return;
			}
			$("#formaaaaa").attr("action","pht_setSorts.html");
			$("#formaaaaa").submit();
		}
		function fangxuan(){
			//$("input[name=ids]").attr("checked",!$(this).attr("checked"));
			$("input[name=ids]").each(function(){
				$(this).attr("checked",!$(this).attr("checked"));
			});
		}
		var message = "${message}";
		if(message != null && message != ""){
			//alert(message);
		}
	</script>
</head>
<body>

<div id="header">
	<s:include value="head.jsp"></s:include>
    <div class="notice">
    	<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 网站留言管理</p></div>
        <div class="nt1 nt4"><a href="/login_edit.html">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />网站留言管理</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<form id="formaaaaa" onsubmit="return checkForm()" method="post" action="">
					<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<th>&nbsp;</th>
							<th>评论人</th>
							<th>内容</th>
							<th>IP</th>
							<th>评论时间</th>        
							<th>操作</th>    
						</tr>
						<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
							<td><input type="checkbox" name="ids" value="${test.id}"/></td>
							<td>内容名称</td>
							<td>内容</td>
							<td>IP</td>
							<td>2013-12-12</td>
							<td>
								<a href="coml_add.html?id=#">回复</a> | 
								<a href="coml_del.html?id=#" onClick="return confirm('确定要删除吗？')">删除</a>
							</td>                    
						</tr>
						<tr>
							<td colspan="6" class="tbbtm">
								<input type="checkbox" onClick="fangxuan();" />反选&nbsp;&nbsp;&nbsp;
								<input type="button" value="删除" name="B1" onClick="del()" />
							</td>
						</tr>
						<tr>
							<td colspan="6" class="tbbtm">pageToolBar</td>
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