<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')"></s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="pragma" content="no-cache" />
	<meta http-equiv="cache-control" content="no-cache" />
	<meta http-equiv="expires" content="0" />
	<title>系统登陆</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/login.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript">
		function changeCode(){
			$("#changeCode").attr("src","<s:url action="securityCodeImageAction" namespace="/security"></s:url>?timestamp="+new Date().getTime());
		}
		
		function check(form) {
			var userName = trim(form.userName.value);
			var password = trim(form.password.value);
			var code = trim(form.checkCode.value);
			
			if (userName.length == 0) {
				$(".emptyInfo").html("用户名不能为空");
				form.userName.focus();
				return false;
			}
			if (password.length == 0) {
				$(".emptyInfo").html("密码不能为空");
				form.password.focus();
				return false;
			}
			if (code.length == 0) {
				$(".emptyInfo").html("验证码不能为空");
				form.checkCode.focus();
				return false;
			}
			
			$(".emptyInfo").html("");
			return true;
		}
		
	</script>
</head>

<body>
	<div class="login">
		<s:form namespace="/admin" action="login_in" id="form1" name="form1" method="post" onsubmit="return check(this)">
			<ul>
				<li>
					<label>管理员：</label>
					<span>
						<s:textfield name="userName"/>
					</span>
				</li>
				<li>
					<label>密&nbsp;&nbsp;&nbsp;&nbsp;码：</label>
					<span>
						<s:password name="password"  />
					</span>
				</li>
				<li>
					<label>验证码：</label>
					<span class="yzm">
						<s:textfield class="password" name="checkCode" style="width:65px;" />
					</span>
					<a href="javascript:changeCode();">
						<img id="changeCode" border="0"  src="<s:url action="securityCodeImageAction" namespace="/security"></s:url>" />
					</a>
				</li>
				<li class="btn">
					<label></label>
					<input type="hidden" name="url" id="url" value="url" />
					<input type="submit" class="tblg" name="tbtj" value="&nbsp;" />
					<span class="emptyInfo">
						<s:fielderror cssClass="errorInfo" name="error"/>
					</span>
				</li>
			</ul>
		</s:form>
	</div>
</body>
</html>
