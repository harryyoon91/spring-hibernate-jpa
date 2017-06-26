package me.yonghak.controller.interceptor;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import me.yonghak.vo.UserVO;

public class LoginCheckInterceptor extends HandlerInterceptorAdapter {
	
	List<String> paths;
	public void setPaths(List<String> paths) {
		this.paths = paths;
	}
	
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// request.getRequestURI() --> /hr/add
		// request.getContextPath() --> /hr
		String url = request.getRequestURI().replaceFirst("/hr", "");

		if (paths.contains(url)) {
			HttpSession session = request.getSession(true);
			UserVO user = (UserVO) session.getAttribute("LOGINED_USER");
			if (user != null) {
				return true;
			} else {
				response.sendRedirect("/hr/login?process=noauth");
				return false;
			}
		} else {
			return true;
		}
	}
}
