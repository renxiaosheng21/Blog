package com.biyeseng.filter;


import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

/**
 * 字符集过滤器
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class CharsetFilter implements Filter {

	public void init(FilterConfig arg0) throws ServletException {
		// TODO Auto-generated method usersb
		
	}

	public void doFilter(ServletRequest request, ServletResponse response, FilterChain arg2) throws IOException, ServletException {
		request.setCharacterEncoding("UTF-8");
		response.setContentType("text/html;charset=UTF-8");
		arg2.doFilter(request, response);
	}

	public void destroy() {
		// TODO Auto-generated method usersb
		
	}

	

}
