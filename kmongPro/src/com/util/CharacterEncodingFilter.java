package com.util;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;

/**
 * Servlet Filter implementation class CharacterEncodingFilter
 */
@WebFilter("/CharacterEncodingFilter")
public class CharacterEncodingFilter implements Filter {

	private String encoding;

	/**
	 * Default constructor.
	 */
	public CharacterEncodingFilter() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see Filter#destroy()
	 */
	public void destroy() {
		// TODO Auto-generated method stub
	}

	/**
	 * @see Filter#doFilter(ServletRequest, ServletResponse, FilterChain)
	 */
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		// place your code here
		// System.out.println(" > CharacterEncodingFilter.doFilter()~");
		request.setCharacterEncoding(encoding);

		// httpservlet 객체가 아니기 때문에 getContextPath()가 없음
		// httpServletRequest 하나 추가해 주고 값을 지정해주면 사용 가능.
		HttpServletRequest httpRequest = (HttpServletRequest) request;
		String contextPath = httpRequest.getContextPath();
		request.setAttribute("contextPath", contextPath);

		// pass the request along the filter chain
		chain.doFilter(request, response);
	}

	/**
	 * @see Filter#init(FilterConfig)
	 */
	public void init(FilterConfig fConfig) throws ServletException {
		// TODO Auto-generated method stub

		encoding = fConfig.getInitParameter("encoding");
		if (encoding == null) {
			encoding = "utf-8";
		}
	}

}
