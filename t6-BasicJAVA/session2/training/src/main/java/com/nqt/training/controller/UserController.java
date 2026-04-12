package com.nqt.training.controller;

import org.springframework.web.bind.annotation.RestController;
import com.nqt.training.service.UserService;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@RestController
@RequestMapping("/users")
public class UserController {

    private final UserService userService;
    public UserController(UserService userService) {
        this.userService = userService;
    }

    @GetMapping
    public String getUsers() {
        return userService.getUsers();
    }
}

// Controller -> Service -> Repository -> Database