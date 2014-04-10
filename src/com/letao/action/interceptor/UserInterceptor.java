package com.letao.action.interceptor;

import java.util.Map;
import com.letao.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * 
 * @description 
 * @author ChengBin
 * @date   2013-12-4上午4:32:17
 * @version 1.0
 */
public class UserInterceptor extends MethodFilterInterceptor {
	private static final long serialVersionUID = 9133514517843236184L;

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		// 获取ActionContext
		ActionContext context = invocation.getInvocationContext();
		// 获取Map类型的session
		Map<String, Object> session = context.getSession();
		// 判断用户是否登录
		if (session.get("user") != null) {
			// 调用执行方法
			System.out.println("yes");
			return invocation.invoke();
		
		}
		System.out.println("over");
		
		// 返回登录
		return BaseAction.USER_LOGIN;
	}

	@Override
	public void setExcludeMethods(String excludeMethods) {
		// TODO Auto-generated method stub
		super.setExcludeMethods(excludeMethods);
	}

	@Override
	public void setIncludeMethods(String includeMethods) {
		// TODO Auto-generated method stub
		super.setIncludeMethods(includeMethods);
	}

}
