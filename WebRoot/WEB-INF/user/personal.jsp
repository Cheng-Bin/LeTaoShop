<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ taglib uri="/struts-tags" prefix="s"%>
<s:set var="context_path"
	value="#request.get('javax.servlet.forward.context_path')">\
</s:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>个人信息</title>
<link type="text/css" rel="stylesheet" href="../css/index.css" />
<script type="text/javascript" src="../js/jquery-1.1.3.pack.js"></script>
<script type="text/javascript" src="../js/city.js"></script>
<script>
	$(function(){
		var uleft = $(".prod_sorted");
		var uright = $(".prod_scrolled");
		if(uleft.height()<uright.height()){
			uleft.height(uright.height());
		}
		else{
			uright.height(uleft.height());
		}
	});
</script>
<script language="javascript" type="text/javascript">
	var clientWidth=(parseInt(window.screen.width)-960)/2-95;
	suspendcode12="<DIV id=\"ALayer1\" style='right:"+clientWidth+"px;PosITION:absolute;TOP:300px;FILTER: alpha(opacity=85);'><div id=\"goup\"><p id=\"gototop\"><a href=\"javascript:\" onclick=\"window.scroll(0,0);return false;\"><img src=\"images/top.gif\" /></a></p><p class=\"todayview\"><a href=\"#\">今日浏览</a></p><p class=\"gwc\"><a href=\"#\">购物车<br /><strong>(0)</strong></a></p></div></div>"
 </script>
</head>

<body>
	<!--S=header-->
	<div id="header">
		<div id="header">
			<!--header-->
			<%@ include file="../comm/header.jsp"%>
		</div>
		<%@ include file="../comm/nav.jsp"%>
    </div>


    <!--S=main-->
    <div id="main">
    	<div class="bannerbg">
			<div class="banner">
				<img src="../images/banner.jpg" />
			</div>
		</div>
        <div class="location">
       	  <div class="place">
           	  <h1>> <a href="/">首页</a> > <a href="/u/index.html">会员中心</a> > 个人信息</h1>
            	<span>
					<a href="/not.html">那你</a>
				</span>
          </div>
        </div>
        <div class="productnew">
        	<div class="prod_sorted">
            	<div class="menustyle"><h2>我的账户</h2></div>
            	<%@ include file="left.jsp" %>
            </div>
            <div class="prod_scrolled manage">
            	<h2>个人信息</h2>
				<form id="form1" name="form1" method="post" action="/u/user_saveInfo.html">
                <table width="94%" border="0" cellspacing="0" cellpadding="0" class="tblist userinfo">
                  <tr>
                    <td width="19%">姓名：</td>
                    <td width="81%"><s:textfield name="cusRealName" value="%{customer.cusRealName}" style="width:96px;" /></td>
                  </tr>
                  <tr>
                    <td>电子邮件：</td>
                    <td><s:textfield name="cusEmail" value="%{customer.cusEmail}" style="width:96px;"/></td>
                  </tr>
                  <tr>
                    <td>性别：<i>*</i></td>
                    <td>
                    	<s:select list="#{'0':'保密', '1':'男', '2':'女'}" value="%{customer.cusSex}"></s:select>
					</td>
                  </tr>
                  <tr>
                    <td>移动电话：<i>*</i></td>
                    <td><s:textfield name="cusMobile" value="%{customer.cusMobile}" style="width:96px;" /></td>
                  </tr>
                  <tr>
					<td>邮编</td>
					<td>
						<p>
							<!-- <select onchange="cityChanger('userCity',this.value)" name="userProvince" style="width: 80px;" id="userProvince">
								<option value="">--请选择--</option>
							</select>
							<select style="width:80px;" name="userCity" id="userCity" onblur="checkProvince(this.value)">
								<option value="">请选择</option>
							</select> -->
							<s:textfield name="post" id="post" style="width:50px;" value="%{customer.post}" />
						</p>
					</td>
                  </tr>
                  <tr>
                    <td>详细地址：</td>
                    <td><s:textfield name="cusAddress" value="%{customer.cusAddress}" id="userAddress" style="width:450px;" /></td>
                  </tr>
                  <tr>
                    <td>出生年月：</td>
                    <td><s:textfield name="cusBirthday" id="cusBirthday" value="%{customer.cusBirthday}" /></td>
                  </tr>
                  <tr>
                    <td>&nbsp;</td>
                    <td class="h50"><input class="confirm" type="submit" name="button2" id="button2" value="确定修改" /></td>
                  </tr>
                </table>
				</form>
            </div>
        </div>        
    </div>
    <div class="clear"></div>
   
	<%@ include file="../comm/footer.jsp"%>
</body>
</html>
