<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>系统管理 - 新闻类别添加</title>
<link type="text/css" rel="stylesheet"
	href="${context_path}/css/user.css" />
<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
<script type="text/javascript" src="${context_path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${context_path}/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${context_path}/js/check.js"></script>
<script type="text/javascript">
	var editor = null;
	$(function(){
		 editor = CKEDITOR.replace("categoryIntro", {
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
	
	function checkForm(form) {
		var dom = $("#categoryName");
		var idText = $("#categoryId");
		
		var params = {
			categoryName : dom.val(),
			categoryId : idText.val()
		};
		return loadData_edit(dom, "${context_path}/articleType/articleType_repeat", params, form, "新闻类别");
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
			<p>当前位置：系统管理 > 修改文章分类</p>
		</div>
		<div class="nt1 nt4">
			<a href="/login_edit.html">修改密码</a>
		</div>
	</div>
	<s:form method="post" action="articleType_save" namespace="/articleType" onsubmit="return checkForm(this)">
		<div id="container">
			<div id="right">
				<div class="content">
					<div class="rtbd">
						<div class="jyjl">
							<h2>
								<img src="${context_path}/images/ibg1.jpg" />修改新闻类别
							</h2>
						</div>
						<div class="clear"></div>
						<table class="tblist" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<th colspan="2"></th>
							</tr>
							<tr>
								<td align="right">名称：</td>
								<td>
									<s:textfield name="categoryName" id="categoryName" value="%{type.categoryName}"  size="30" />
								</td>
							</tr>
							<tr>
								<td align="right">类别介绍：</td>
								<td style="padding: 20px 100px 20px 0px;">
									<textarea id="categoryIntro" name="categoryIntro" cols="50" rows="50"><s:property value="type.categoryIntro" /></textarea>
								</td>
							</tr>
							<tr>
								<th class="edit" colspan="2">
									<s:token />
									<s:hidden name="categoryId" id="categoryId" value="%{type.categoryId}" />
									<s:submit name="button2" id="button2" value="修改" />
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
