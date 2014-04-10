<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>用户管理系统 - 订单管理</title>
<link type="text/css" rel="stylesheet"
	href="${context_path}/css/user.css" />
<script type="text/javascript" src="${context_path}/js/jquery.js"></script>
<script type="text/javascript" src="${context_path}/js/menubar.js"></script>
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
				<p>当前位置：系统管理 > 订单管理</p>
			</div>
			<div class="nt1 nt4">
				<a href="/login_edit.html">修改密码</a>
			</div>
		</div>
	</div>

	<div id="container">
		<div id="right">
			<div class="content">
				<div class="rtbd">
					<div class="jyjl">
						<h2>
							<img src="${context_path}/images/ibg1.jpg" />订单管理
						</h2>
						<div class="jyjlrt">&nbsp;</div>
					</div>
					<div class="clear"></div>
					<table class="jyjs_list" width="100%" border="0" cellspacing="0"
						cellpadding="0">
						<tr>
							<th>订单号</th>
							<th>金额</th>
							<th>购买时间</th>
							<th>订单状态</th>
							<th>是否支付</th>
							<th>操作</th>
						</tr>
						<s:iterator value="pageModel.list">
						<tr onmouseover="this.className='listhover';"
							onmouseout="this.className='';">
							<td><s:property value="orderId"/></td>
							<td><s:property value="totalPrice"/> </td>
							<td><s:date name="createTime" format="yyyy-MM-dd EE" nice="false" /></td>
							<td><s:property value="paymentWay.name"/> </td>
							<td><s:property value="orderState.name"/></td>
							<td>
								<s:if test="%{('等待卖家发货').equals(orderState.name)}">
									<a href="<s:url action="order_send" namespace="/order"><s:param name="id" value="id" /></s:url>" onclick="return confirm('确定要设置为已发货吗？')">设置为已发货</a>
								</s:if>
								<s:elseif test="%{orderState.next() == null}">
									<a href="<s:url action="order_del" namespace="/order"><s:param name="id" value="id" /></s:url>" onclick="return confirm('确定要删除吗？')">删除</a>
								</s:elseif>
								<s:else>
									<s:property value="orderState.next()"/>
								</s:else>
							</td>
						</tr>
						</s:iterator>
						<tr>
							<td colspan="6" class="tbbtm">
								<s:url action="product_order" namespace="/order" var="first">
									<s:param name="pageNo" value="1"></s:param>
								</s:url>
								<s:url action="product_order" namespace="/order" var="previous">
									<s:param name="pageNo" value="pageModel.pageNo-1"></s:param>
								</s:url>
								<s:url action="product_order" namespace="/order" var="last">
									<s:param name="pageNo" value="pageModel.bottomPageNo"></s:param>
								</s:url>
								<s:url action="product_order" namespace="/order" var="next">
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
