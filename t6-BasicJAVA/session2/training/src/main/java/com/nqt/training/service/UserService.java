package com.nqt.training.service;

import java.util.List;

import org.springframework.stereotype.Service; 

import com.nqt.training.model.User;
import com.nqt.training.repository.UserRepository;
import com.nqt.training.request.CreateUserRequest;

@Service
public class UserService {
    
    private final UserRepository userRepository;

    public UserService(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public List<User> getAllUsers() {
        return userRepository.findAll();
    }

    public User createUser(CreateUserRequest request) {
        return userRepository.save(request);
    }

    public User getUserById(Long id) {
        return userRepository.findById(id);
    }
}