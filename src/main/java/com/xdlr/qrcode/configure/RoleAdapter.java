package com.xdlr.qrcode.configure;

import com.xdlr.qrcode.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Component
public class RoleAdapter implements WebMvcConfigurer {
    @Autowired
    private UserService userService;
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(
                new RoleInterceptor(userService))
                .addPathPatterns("/device/**");
    }
}
