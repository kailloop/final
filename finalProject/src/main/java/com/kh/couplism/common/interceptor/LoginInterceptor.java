package com.kh.couplism.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);
		logger.debug("로그인 체크");
		//로인체크로직
		return super.preHandle(request, response, handler);
	}
	
	
}
