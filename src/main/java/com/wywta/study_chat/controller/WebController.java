package com.wywta.study_chat.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class WebController {
    @GetMapping("/chat")
    public String chat() {
        return "chat";
    }
}
