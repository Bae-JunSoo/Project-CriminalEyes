package com.kopo.criminaleyes.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class SafetyController {

    @GetMapping("/safety/info")
    public String info() {
        return "safety/info";  // -> WEB-INF/views/safety/info.jsp
    }
}

