<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>乐淘购物——注册登录</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/index.css" />
	<script language="javaScript" src="${context_path}/js/jquery.js"></script>
	<script language="javaScript">
	<!--
		function checkForm(){
			var userName = $("#cusName").val();
			var password = $("#cusPassword").val();
		
			if(userName == ""){
				alert("请输入用户名！");
				$("#cusName").focus();
				return false;
			}
			if(password == ""){
				alert("请输入密码！");
				$("#cusPassword").focus();
				return false;
			}
			return true;
		}

		function changeCode(){
			$("#changeCode").attr("src","<s:url action="securityCodeImageAction" namespace="/security"></s:url>?timestamp="+new Date().getTime());
		}
	//-->
	</script>
</head>

<body>
<!--S=header-->
<div id="header">
	<div id="header">
		<!--header-->
		<%@ include file="../comm/header.jsp" %>
	</div>
	<%@ include file="../comm/nav.jsp" %>
</div>

<!--S=main-->
<div id="main">
	<div class="bannerbg">
		<div class="banner">
			<img src="${context_path}/images/banner.jpg" />
		</div>
	</div>

	<div class="location">
		<div class="place">
			<h1>> <a href="/">首页</a> > 注册/登录</h1>
			<span>
				<a href="notice.html">你有1个</a>
			</span>
		</div>
	</div>


	<div class="product reglogin">
		<div id="login">
			<h2>用户登录</h2> 
			<s:form id="form1" method="post" action="login_in" namespace="/customer" onsubmit="checkForm()">
				<ul>
					<li>账号：<s:textfield name="cusName" id="cusName" cssClass="tbname" /></li>
					<li>密码：<s:password  name="cusPassword" id="cusPassword" cssClass="tbname" /></li>
					<li class="dlbtn">
						<input class="btnlogin" type="submit" name="button2" id="button2" value="登 录" />
					</li>
					<li class="forget">
						<a href="/reg_getPassword.html">忘记账号？</a>
						<a href="/reg_getPassword.html">忘记密码？</a>
					</li>
				</ul>
			</s:form>
		</div>
		
		<div id="reg">
			<h2>新用户注册</h2>
			<s:form id="form1" name="form1" method="post" action="register" namespace="/customer" onsubmit="return checkForm2()">
			<ul>
				<li>
					<label>账号：</label>
					<s:textfield name="cusName" id="cusName" cssClass="tbname" />
				</li>
				<li>
					<label>密码：</label>
					<s:password name="cusPassword" id="cusPassword" cssClass="tbname" />
				</li>
				<li>
					<label>确认密码：</label>
					<s:password  name="password2" id="password2" cssClass="tbname" />
				</li>
				<li>
					<label>姓名：</label>
					<s:textfield name="cusRealName" id="cusRealName" cssClass="tbname tbbd" />
				</li>
				<li>
					<label>性别：</label>
					<input type="radio" value="无" name="cusSex" checked="checked"/>保密
					&nbsp;&nbsp;<input type="radio" value="男" name="cusSex" />男
					&nbsp;&nbsp;<input type="radio" value="女" name="cusSex" />女
				</li>
				<li>
					<label>验证码：</label>
					<s:textfield name="checkCode" cssClass="tbname tbbd" cssStyle="width:50px;"></s:textfield>
					<a href="javascript:changeCode();">
						<img id="changeCode" src="<s:url action="securityCodeImageAction" namespace="/security"></s:url>"/>
					</a>
				</li>
				<li class="read">
					<label><input type="checkbox" name="checkbox2" id="agree" /></label>
					我已阅读并同意<a href="/page.html?id=使用条款" target="_blank">《用户使用条款》</a>
				</li>
				<li class="regnow">
					<input class="btnlogin btnblue" type="submit" name="button2" id="button2" value="立即注册" />
				</li>                    
			</ul>
			</s:form>
		</div>
	</div>      
</div>

<!--footer-->
<%@ include file="../comm/footer.jsp" %>
</body>
</html>
