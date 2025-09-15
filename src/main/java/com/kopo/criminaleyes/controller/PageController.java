package com.kopo.criminaleyes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class PageController {

    // 메인 페이지
    @GetMapping("/")
    public String index() {
        return "index"; // /WEB-INF/views/index.jsp
    }

    // 로그인 페이지
    @GetMapping("/login")
    public String loginPage() {
        return "user/login"; // /WEB-INF/views/user/login.jsp
    }

    // 회원가입 페이지
    @GetMapping("/signup")
    public String signupPage() {
        return "user/userRegForm"; // /WEB-INF/views/user/userRegForm.jsp
    }
}
