package com.letao.action.interceptor;

import java.util.Map;

import com.letao.action.BaseAction;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.MethodFilterInterceptor;

/**
 * @Description ������������
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
		//���customer�Ѿ����ڣ�˵���û��Ѿ���¼
		if (session.get(BaseAction.SESSION_CUSTOMER) != null) {
			return invocation.invoke();
		}
		return BaseAction.CUSTOMER_LOGIN;
	}

}
