<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>系统管理 - 发送邮件</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript" src="${context_path}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${context_path}/ckfinder/ckfinder.js"></script>
	<script type="text/javascript">
	var editor = null;
	$(function(){
		 editor = CKEDITOR.replace("changePage", {
		 	customConfig: "${context_path}/ckeditor/myconfig.js",
		 	on: {
                instanceReady: function( ev ) {
                    this.dataProcessor.writer.setRules("p", {
                        indent: false,
                        breakBeforeOpen: false,   //<p>之前不加换行
                        breakAfterOpen: false,    //<p>之后不加换行
                        breakBeforeClose: false,  //</p>之前不加换行
                        breakAfterClose: false    //</p>之后不加换行
                    });
                }
            }
		 });
		 CKFinder.setupCKEditor(editor, "${context_path}/ckfinder/");
	});
	
	function check(form) {
		var title = $.trim($("#subject").val());
		$("#subject").next().empty();
		if (title.length == 0) {
			$("#subject").after(createEmpySpanText("标题"));
			return false;
		}
		return true;
	}
	
	function createEmpySpanText(name) {
		return $("<span/>").css("color","red").html("&nbsp;&nbsp;对不起，"+name+"不能为空！");
	}
	
	</script>
</head>

<body>
<div id="header">
	<div class="header_top">
		<div class="navbar">
			<h1>管理后台</h1>
		</div>
		<div class="loginbar">
			<div>
				<a href="#">退出</a>
			</div>
			<p></p>
		</div>
	</div>
    <div class="notice">
    	<div class="nt1"><a href="">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：系统管理  > 发送邮件</p></div>
        <div class="nt1 nt4"><a href="#">修改密码</a></div>
	</div>
</div>

<s:form method="post" namespace="/mail" action="send_email" onsubmit="return check(this)">
<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />发送邮件</h2>
				</div>
				<div class="clear"></div>
				<table class="tblist" width="100%" border="0" cellspacing="0" cellpadding="0">
					<tr>
						<th colspan="3"></th>
					</tr>
					<tr>
						<td align="right" width="10%">收件人：</td>
						<td>&nbsp;</td>
						<td>
							<s:property value="%{customer.cusName}" />
							[<s:property value="%{customer.cusEmail}" />]
							<s:hidden name="toAddress" value="%{customer.cusEmail}"></s:hidden>
						</td>
					</tr>
					<tr>
						<td align="right">标题：</td>
						<td>&nbsp;</td>
						<td>
							<input name="subject" type="text" id="subject" size="30" />
						</td>
					</tr>
					<tr>
						<td align="right">内容：</td>
						<td>&nbsp;</td>
						<td>
							<textarea class="ckeditor" name="content" id="content" rows="3" cols="30"></textarea>
						</td>
					</tr>
					<tr>
						<th class="edit" colspan="4">    
						<input type="hidden" value="" />
						<input type="submit" name="button2" id="button2" value="确定" />               
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
