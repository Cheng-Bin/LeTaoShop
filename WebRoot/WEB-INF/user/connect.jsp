<%@ page language="java" import="java.util.*" pageEncoding="GBK"%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>连接易宝</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
</head>

<body onload="javascript:document.forms[0].submit()">
	正在跳转....
	<form name="yeepay"
		action="https://www.yeepay.com/app-merchant-proxy/node" method='post'>
		<input type='hidden' name='p0_Cmd' value="${p0_Cmd}">
		<!-- 请求命令,在线支付固定为Buy -->
		<input type='hidden' name='p1_MerId' value="${p1_MerId}">
		<!-- 商家ID -->
		<input type="hidden" name="p2_Order" value="${orderid}">
		<!-- 商家的交易定单号 -->
		<input type='hidden' name='p3_Amt' value="${amount}">
		<!-- 订单金额 -->
		<input type='hidden' name='p4_Cur' value="${p4_Cur}">
		<!-- 货币单位 -->
		<input type='hidden' name='p5_Pid' value="${p5_Pid}">
		<!-- 商品ID -->
		<input type='hidden' name='p6_Pcat' value="${p6_Pcat}">
		<!-- 商品种类 -->
		<input type='hidden' name='p7_Pdesc' value="${p7_Pdesc}">
		<!-- 商品描述 -->
		<input type='hidden' name='p8_Url' value="${p8_Url}">
		<!-- 交易结果通知地址 -->
		<input type='hidden' name='p9_SAF' value="${P9_SAF}">
		<!-- 需要填写送货信息 0：不需要 1:需要 -->
		<input type='hidden' name='pa_MP' value="${pa_MP}">
		<!-- 商家扩展信息 -->
		<input type='hidden' name='pd_FrpId' value="${pd_FrpId}">
		<!-- 银行ID -->
		<!-- 应答机制 为“1”: 需要应答机制;为“0”: 不需要应答机制 -->
		<input type="hidden" name="pr_NeedResponse" value="0"> <input
			type='hidden' name='hmac' value="${hmacValue}">
		<!-- MD5-hmac验证码 -->
	</form>
</body>
</html>
