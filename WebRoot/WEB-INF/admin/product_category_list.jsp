<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s" %>
<s:set var="context_path" value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<title>管理后台 - 产品分类管理</title>
	<link type="text/css" rel="stylesheet" href="${context_path}/css/user.css" />
	<link rel="stylesheet" href="${context_path}/js/thickbox/thickbox.css" type="text/css" media="screen" />
	<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
	<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
	<script type="text/javascript" src="${context_path}/js/thickbox/thickbox-compressed.js"></script>
	<script type="text/javascript">
		function checkForm(arg){

			var sortName = arg.sortName.value;
			var parentSortId = arg.parentSortId.value;
			if(sortName == null || sortName == ""){
				alert("分类名称不能为空");
				return false;
			}
			if(parentSortId == null || parentSortId == ""){
				arg.sortLevel.value="1";
			}else{
				arg.sortLevel.value="2";
			}
			
		}
		
		function edit(id,name,level,pid){
			$("#id").val(id);
			$("#sortName").val(name);
			$("#sortLevel").val(level);
			$("#parentSortId").val(pid);
			//$("#parentSortId option[value="+pid+"]").attr("selected",true);
		}
	</script>	
</head>

<body>
<div id="header">
	<s:include value="head.jsp"></s:include>
    <div class="notice">
    	<div class="nt1"><a href="/admin/index.html">系统首页</a></div>
        <div class="nt2"><span class="ntltbg"></span><p>当前位置：管理后台 > 产品分类管理</p></div>
        <div class="nt1 nt4"><a href="<s:url action="category_add" namespace="/productType"></s:url>"  class="thickbox" style="color: red">添加分类</a><a href="###">修改密码</a></div>
	</div>
</div>

<div id="container">
	<div id="right">
		<div class="content">
			<div class="rtbd">
				<div class="jyjl">
					<h2><img src="${context_path}/images/ibg1.jpg" />产品分类管理</h2>
					<div class="jyjlrt">&nbsp;</div>
				</div>
				<div class="clear"></div>
				<form onsubmit="return checkForm()" method="post" action="cfg_save.html">
				<table class="jyjs_list" width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#FFFFFF">
					<tr>
						<th>类别名称</th>
						<th>操作</th>
					</tr>
					<s:iterator var="model" value="pageModel.list" status="statu">
					<tr onmouseover="this.className='listhover';" onmouseout="this.className='';">
						<s:if test="#statu.even">
							<td align="center" style="background:#E1F2FB">
								<s:property value="categoryName"  />	
							</td>
							<td class="sd" style="background:#E1F2FB">
								<a href="<s:url action="category_edit" namespace="/productType"><s:param name="categoryId" value="categoryId" /></s:url>" class="thickbox" onclick="">修改</a> 
								<a href="<s:url action="delete" namespace="/productType"><s:param name="categoryId" value="categoryId" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
							</td>
						</s:if>	
						<s:else>
							<td align="center">
								<s:property value="categoryName"  />	
							</td>
							<td class="sd">
								<a href="<s:url action="category_edit" namespace="/productType"><s:param name="categoryId" value="categoryId" /></s:url>" class="thickbox" onclick="">修改</a> 
								<a href="<s:url action="delete" namespace="/productType"><s:param name="categoryId" value="categoryId" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
							</td>
						</s:else>
					</tr>
					</s:iterator>
					<tr>
						<td colspan="2" class="tbbtm">
							<s:url action="category_list" namespace="/productType" var="first">
								<s:param name="pageNo" value="1"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:url action="category_list" namespace="/productType" var="previous">
								<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:url action="category_list" namespace="/productType" var="last">
								<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
								<s:param name="pid" value="pid"></s:param>
							</s:url>
							<s:url action="category_list" namespace="/productType" var="next">
								<s:param name="pageNo" value="pageModel.pageNo+1"></s:param>
								<s:param name="pid" value="pid"></s:param>
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
