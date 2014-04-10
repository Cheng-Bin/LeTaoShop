<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<ul class="sort_list user_nav">
	<li><a href="<s:url action="message" namespace="/customer" />"><span>站内消息</span></a></li>
	<li><a href="<s:url action="cart_list" namespace="/cart" />"><span>购物车</span></a></li>
	<li><a href="<s:url action="orders" namespace="/order" />"><span>已购买商品</span></a></li>
	<li><a href="<s:url action="order_list" namespace="/order" />"><span>我的订单</span></a></li>
	<li><a href="<s:url action="favorite_list" namespace="/favorite" />"><span>我的收藏</span></a></li>
	<li><a href="<s:url action="tuikuan_menu" namespace="/product" />"><span>退款申请</span></a></li>
	<li class="sortbd"><a href="<s:url action="personal" namespace="/customer" />"><span>个人信息</span></a></li>
	<li><a href="<s:url action="editpass" namespace="/customer" />"><span>修改密码</span></a></li>
	<li><a href="<s:url action="charge" namespace="/customer" />"><span>在线充值</span></a></li>
	<li><a href="<s:url action="bank" namespace="/customer" />"><span>消费明细</span></a></li>
	<li><a href="<s:url action="logout" namespace="/customer" />" onclick="return confirm('确定要注销吗？')"><span>注销会员</span></a></li>
</ul>