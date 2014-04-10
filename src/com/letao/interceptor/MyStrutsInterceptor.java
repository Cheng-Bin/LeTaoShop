package com.letao.interceptor;

import java.io.IOException;
import javax.servlet.FilterChain;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;
import org.apache.struts2.dispatcher.ng.filter.StrutsPrepareAndExecuteFilter;

/**
 * ckfinder与struts2整合后，出现上传没反应的情况
 * 那是因为Struts拦截了上传路径而产生的错误.
 * 自定义MyStrutsInterceptor类继承自StrutsPrepareAndExecuteFilter,
 * 并重写了doFilter方法，对获取的URI地址进行判断，
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