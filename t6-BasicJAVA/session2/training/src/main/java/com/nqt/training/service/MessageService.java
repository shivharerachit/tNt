package com.nqt.training.service;

import org.springframework.stereotype.Service;

import com.nqt.training.component.LongMessageFormatter;
import com.nqt.training.component.ShortMessageFormatter;

@Service
public class MessageService {

    private final ShortMessageFormatter shortMessageFormatter;
    private final LongMessageFormatter longMessageFormatter;

    public MessageService(ShortMessageFormatter shortMessageFormatter, LongMessageFormatter longMessageFormatter) {
        this.shortMessageFormatter = shortMessageFormatter;
        this.longMessageFormatter = longMessageFormatter;
    }

    public String getMessage(String type) {
        String messageType = type == null ? "" : type.trim().toUpperCase();

        return switch (messageType) {
            case "SHORT" -> shortMessageFormatter.format();
            case "LONG" -> longMessageFormatter.format();
            default -> "Invalid type";
        };
    }
}