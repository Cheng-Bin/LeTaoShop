package com.letao.interceptor;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * ckfinder��struts2���Ϻ󣬳����ϴ�û��Ӧ�����
 * ������ΪStruts�������ϴ�·���������Ĵ���.
 * �Զ���MyStrutsInterceptor��̳���StrutsPrepareAndExecuteFilter,
 * ����д��doFilter�������Ի�ȡ��URI��ַ�����жϣ�
 * 
 * @author ChengBin
 *
 */
public class MyStrutsInterceptor extends StrutsPrepareAndExecuteFilter {
	public void doFilter(ServletRequest req, ServletResponse res,
			FilterChain chain) throws IOException, ServletException {
		HttpServletRequest request = (HttpServletRequest) req;
		String URI = request.getRequestURI();
		String[] ckfarr = URI.split("/ckfinder/core/connector/java/*/");
		int arrayLen = ckfarr.length;
		if (arrayLen >= 2) {
			chain.doFilter(req, res);
		} else {
			super.doFilter(req, res, chain);
		}
	}
}