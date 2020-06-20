package com.chaihq.webapp.controllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import java.util.Map;

@Controller
public class UsersController {

    @GetMapping("signin")
    public String login(Map<String, Object> model) {
        return "login";
    }

    @PostMapping("processLogin")
    public String processLogin(Map<String, Object> model) {
        return "projects/index"; // redirect to projects/index path
    }

    @GetMapping("signup")
    public String signup(Map<String, Object> model) {
        return "signup"; // redirect to projects/index path
    }

    @PostMapping("processSignup")
    public String processSignup(Map<String, Object> model) {
        return "processSignup"; // redirect to projects/index path
    }

    @GetMapping("resetPassword")
    public String resetPassword(Map<String, Object> model) {
        return "resetPassword"; // redirect to projects/index path
    }

    @PostMapping("processResetPassword") // Let user set a new password
    public String processResetPassword(Map<String, Object> model) {
        return "processResetPassword"; // redirect to projects/index path
    }
}
