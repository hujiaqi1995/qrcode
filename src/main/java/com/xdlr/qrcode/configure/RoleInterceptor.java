package com.xdlr.qrcode.configure;

import com.xdlr.qrcode.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@Component
public class RoleInterceptor implements HandlerInterceptor {
    @Autowired
    private UserService userService;

    public RoleInterceptor(UserService userService) {
        this.userService = userService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        HttpSession session = request.getSession();
        if ((boolean) session.getAttribute("isLogin")) {
            return true;
        }
        response.sendRedirect("/");
        return false;
    }
}
