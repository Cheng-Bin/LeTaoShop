<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<div class="header_top">
	<div class="navbar">
	<h1>管理后台</h1>
	</div>
	<div class="loginbar">
		<div>
			<a onclick="return confirm('确定退出系统？')" href="<s:url action="logout" namespace="/admin"/>">退出</a>
		</div>
  </div>
</div>