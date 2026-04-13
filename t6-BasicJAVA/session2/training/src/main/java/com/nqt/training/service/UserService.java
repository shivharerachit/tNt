package com.nqt.training.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.nqt.training.exception.UserNotFoundException;
import com.nqt.training.model.User;
import com.nqt.training.repository.UserRepository;
import com.nqt.training.request.CreateUserRequest;

@Service
public class UserService {
    
    private final UserRepository userRepository;
    private final NotificationService notificationService;

    public UserService(UserRepository userRepository, NotificationService notificationService) {
        this.userRepository = userRepository;
        this.notificationService = notificationService;
    }

    public List<User> getAllUsers() {
        notificationService.sendNotification("fetch all users");
        return userRepository.findAll();
    }

    public User createUser(CreateUserRequest request) {
        User user = userRepository.save(request);
        notificationService.sendNotification("create user");
        return user;
    }

    public User getUserById(Long id) {
        notificationService.sendNotification("fetch user by id");
        User user = userRepository.findById(id);
        if (user == null) {
            throw new UserNotFoundException("User not found with id: " + id);
        }
        return user;
    }
}