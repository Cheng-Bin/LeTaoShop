<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理后台 - 产品添加</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript" src="${context_path}/ckeditor/ckeditor.js"></script>
	<script type="text/javascript" src="${context_path}/ckfinder/ckfinder.js"></script>
	<script type="text/javascript">
		var editor = null;
		$(function(){
			 editor = CKEDITOR.replace("description", {
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
	</script>
</head>

<body>
	<div id="header">
		<s:include value="head.jsp"></s:include>
		<div class="notice">
			<div class="nt1">
				<a href="/admin/index.html">系统首页</a>
			</div>
			<div class="nt2">
				<span class="ntltbg"></span>
				<p>当前位置：管理后台 > 产品添加</p>
			</div>
			<div class="nt1 nt4">
				<a href="/login_edit.html">修改密码</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div id="right">
			<div class="content" style="overflow:scroll">
				<div class="rtbd">
					<div class="jyjl">
						<h2>
							<img src="${context_path}/images/ibg1.jpg" />产品添加
						</h2>
					</div>
					<div class="clear"></div>
					<s:form action="save" namespace="/product" method="post" enctype="multipart/form-data">
						<table class="tblist" width="100%" border="0" cellspacing="0"
							cellpadding="0">
							<tr>
								<th colspan="3"></th>
							</tr>
							<tr>
								<td align="right" width="150px">产品编号：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="no" id="no" size="30" readonly="true" value="%{product.no}" ></s:textfield>
								</td>
							</tr>
							<tr>
								<td align="right">产品名称：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="name" id="name" size="30"></s:textfield>
								</td>
							</tr>
							<tr>
								<td align="right">产品标签：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="tag" id="tag" size="30" ></s:textfield>
								</td>
							</tr>
							<tr>
								<td align="right">产品图片：</td>
								<td>&nbsp;</td>
								<td>
									<s:file name="picFile" id="picFile" accept="image*/*" ></s:file>
								</td>
							</tr>
							<tr>
								<td align="right">产品类别：</td>
								<td>&nbsp;</td>
								<td>
									<s:select list="categoryMap" name="category.categoryId"></s:select>
								</td>
							</tr>
							<tr>
								<td align="right">市场价：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="marketPrice" id="marketPrice" size="30" value=""></s:textfield>
								</td>
							</tr>
							<tr>
								<td align="right">销售价：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="sellPrice" id="sellPrice" size="30" value="" />
								</td>
							</tr>
							<tr>
								<td align="right">库存：</td>
								<td>&nbsp;</td>
								<td>
									<s:textfield name="count" id="count" size="30" value="" />
								</td>
							</tr>
							<tr>
								<td align="right">适合性别：</td>
								<td>&nbsp;</td>
								<td>
									<s:select name="sexRequest" list="#{'0':'男','1':'女','2':'不限'}"></s:select>
								</td>
							</tr>
							<tr>
								<td align="right">是否推荐：</td>
								<td>&nbsp;</td>
								<td>
									<s:radio name="commend" list="#{'true':'推荐', 'false':'不推荐'}"></s:radio>
								</td>
							</tr>
							<tr>
								<td align="right">是否特价：</td>
								<td>&nbsp;</td>
								<td>
									<s:radio name="sale" list="#{'true':'是', 'false':'否'}"></s:radio>	
								</td>
							</tr>
							<tr>
								<td align="right">是否促销：</td>
								<td>&nbsp;</td>
								<td>
									<s:radio name="promotion" list="#{'true':'是', 'false':'否'}"></s:radio>	
								</td>
							</tr>
							<tr>
								<td align="right">是否限量：</td>
								<td>&nbsp;</td>
								<td>
									<s:radio name="limit" list="#{'true':'是', 'false':'否'}"></s:radio>		
								</td>
							</tr>
							<tr>
								<td align="right">产品介绍：</td>
								<td>&nbsp;</td>
								<td style="padding: 20px 100px 20px 0px;">
									<textarea name="description" id="description"></textarea>
								</td>
							</tr>
							<tr>
								<th class="edit" colspan="3">
									<input name="id" type="hidden" value="" />
									<input type="submit" name="button2" id="button2" value="确定" />
								</th>
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