package com.letao.action.interceptor;

import java.util.Map;

import com.letao.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * @Description 消费者拦截器
 * @version 1.0
 * @author ChengBin
 *
 */
@SuppressWarnings("serial")
public class CustomerInterceptor extends MethodFilterInterceptor {

	@Override
	protected String doIntercept(ActionInvocation invocation) throws Exception {
		ActionContext context = invocation.getInvocationContext();
		Map<String, Object> session = context.getSession();
		//如果customer已经存在，说明用户已经登录
		if (session.get(BaseAction.SESSION_CUSTOMER) != null) {
			return invocation.invoke();
		}
		return BaseAction.CUSTOMER_LOGIN;
	}

}
