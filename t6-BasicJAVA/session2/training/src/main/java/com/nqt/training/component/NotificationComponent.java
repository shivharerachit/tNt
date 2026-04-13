package com.nqt.training.component;

import org.springframework.stereotype.Component;

@Component
public class NotificationComponent {

    public String buildMessage(String trigger) {
        return "Notification sent";
    }
}