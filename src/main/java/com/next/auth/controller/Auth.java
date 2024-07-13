package com.next.auth.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class Auth {

    @GetMapping("/health")
    public String checkHealth() {
        return "OK";
    }

    @GetMapping("/hello")
    public String hello() {
        return "hello";
    }

}
