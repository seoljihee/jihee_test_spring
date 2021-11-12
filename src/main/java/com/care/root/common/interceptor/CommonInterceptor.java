package com.care.root.common.interceptor;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.care.root.common.session.MemberSessionName;

public class CommonInterceptor extends HandlerInterceptorAdapter
								implements MemberSessionName{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute(LOGIN) == null) {
			//response.sendRedirect("/root/member/login");
			response.setContentType("text/html; charset=utf-8");
			PrintWriter out = response.getWriter();
			out.print("<script>alert('로그인 먼저 진행하세요.');"
					+ "location.href='"+request.getContextPath()+"/member/login'</script>");
			return false;  //사용자가 요청한 경로로 안간다.
		}
		
		return true;      //사용자가 요청한 경로로 간다.
	}
	
	
	
	
}
