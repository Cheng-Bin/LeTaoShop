<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
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
<script type="text/javascript" src="${context_path}/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="${context_path}/ckfinder/ckfinder.js"></script>
<script type="text/javascript" src="${context_path}/js/check.js"></script>
<script type="text/javascript">
	var editor = null;
	$(function(){
		 editor = CKEDITOR.replace("articleContent", {
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
		var msg = "新闻";
		return checkEmpty($("#articleTitle"), msg);
	}
</script>
</head>
<body>
	<div id="header">
		<s:include value="head.jsp"></s:include>
		<div class="notice">
			<div class="nt1">
				<a href="${context_path}/">系统首页</a>
			</div>
			<div class="nt2">
				<span class="ntltbg"></span>
				<p>当前位置：系统管理 > 文章</p>
			</div>
			<div class="nt1 nt4">
				<a href="/login_edit.html">修改密码</a>
			</div>
		</div>
	</div>
	
	<s:form onsubmit="return checkForm()" method="post" action="article_save" namespace="/article" enctype="multipart/form-data">
		<div id="container">
			<div id="right" >
				<div class="content" style="overflow:scroll">
					<div class="rtbd">
						<div class="jyjl">
							<h2>
								<img src="${context_path}/images/ibg1.jpg" />修改新闻
							</h2>
						</div>
						<div class="clear"></div>
						<table class="tblist" width="100%" border="0" cellspacing="0" cellpadding="0" >
							<tr>
								<th colspan="3"></th>
							</tr>
							<tr>
								<td align="right" width="120">标题：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="articleTitle" id="articleTitle" size="30" value="%{article.articleTitle}" />
								</td>
							</tr>
							<tr>
								<td align="right">标签：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="articleLabel" id="articleLabel" size="30" value="%{article.articleLabel}"></s:textfield>
								</td>
							</tr>
							<tr>
								<td align="right">上传图片：</td>
								<td>&nbsp;</td>
								<td>
									<s:file id="file" name="file" ></s:file>
								</td>
							</tr>
							<tr>
								<td align="right">转载地址：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="articleAddress" id="articleAddress" size="30" value="%{article.articleAddress}" />
								</td>
							</tr>
							<tr>
								<td align="right">文章类别：</td>
								<td>&nbsp;</td>
								<td>
									<s:select value="%{article.category.categoryId}" list="map" name="category.categoryId" ></s:select>
								</td>
							</tr>
							<tr>
								<td align="right">摘要：</td>
								<td>&nbsp;</td>
								<td>
									<s:textarea id="articleStatement" name="articleStatement" value="%{article.articleStatement}"></s:textarea>
								</td>
							</tr>
							<tr>
								<td align="right">内容：</td>
								<td>&nbsp;</td>
								<td style="padding: 20px 100px 20px 0px;">
									<textarea id="articleContent" name="articleContent" cols="50" rows="100"><s:property value="article.articleContent"/></textarea>
								</td>
							</tr>
							<tr>
								<th class="edit" colspan="4">
									<s:hidden name="articleId" id="articleId" value="%{article.articleId}" />
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
