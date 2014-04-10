<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>

	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>用户管理系统 - 会员管理</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript">
		function checkForm(){
			
		}
		//var message = "${message}";
		if(message != null && message != ""){
			//alert(message);
		}
		function changelev(id,arg){
			location.href="user_changLev.html?id="+id+"&message=" + arg;
		}
	</script>
</head>
<body>

<div id="header">
	<s:include value="head.jsp"></s:include>
	<div class="notice">
		<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
		<div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理 > 会员管理</p></div>
		<div class="nt1 nt4"><a href="/login_edit.html">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />会员管理</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<th>用户名</th>
					<th>邮箱</th>
					<th>注册时间</th>  
					<th>操作</th>
				</tr>
				<s:iterator value="pageModel.list">
				<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
					<td><s:property value="cusName"/></td>
					<td><s:property value="cusEmail"/></td>
					<td><s:property value="cusBirthday"/></td>
					<td>
						<a href="#">解除锁定</a>
						| <a href="<s:url action="customer_delete" namespace="/customer"><s:param name="cusId" value="cusId" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
						| <a href="<s:url action="mail_add" namespace="/mail"><s:param name="id" value="cusId" /></s:url>">发送邮件</a> 
						| <a href="#">发送站内短信</a> 
					</td>                    
				</tr>
				</s:iterator>
				<tr>
					<td colspan="5" class="tbbtm">
						<s:url action="user_list" namespace="/customer" var="first">
							<s:param name="pageNo" value="1"></s:param>
						</s:url>
						<s:url action="user_list" namespace="/customer" var="previous">
							<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
						</s:url>
						<s:url action="user_list" namespace="/customer" var="last">
							<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
						</s:url>
						<s:url action="user_list" namespace="/customer" var="next">
							<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
						</s:url>
						<s:include value="../comm/page.jsp"></s:include>
					</td>
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
