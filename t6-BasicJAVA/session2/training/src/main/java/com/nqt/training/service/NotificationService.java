package com.nqt.training.service;

import org.springframework.stereotype.Service;

import com.nqt.training.component.NotificationComponent;

@Service
public class NotificationService {

    private final NotificationComponent notificationComponent;

    public NotificationService(NotificationComponent notificationComponent) {
        this.notificationComponent = notificationComponent;
    }

    public String sendNotification(String trigger) {
        return notificationComponent.buildMessage(trigger);
    }
}