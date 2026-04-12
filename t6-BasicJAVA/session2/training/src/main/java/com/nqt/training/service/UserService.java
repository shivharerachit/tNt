package com.nqt.training.service;

import org.springframework.stereotype.Service; 

@Service
public class UserService {
    public String getUsers() {
        return "Hello, Users!";
    }
}