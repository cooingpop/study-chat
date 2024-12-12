package com.wywta.study_chat.model;

import lombok.*;

import java.time.*;
import java.time.format.DateTimeFormatter;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ChatMessage {

    private String sender;
    private String content;
    private MessageType type;
    private String ipAddress;
    private String timestamp;


    public enum MessageType {
        CHAT,
        JOIN,
        LEAVE,
        ANNOUNCEMENT
    }

    public void setTimestamp(LocalDateTime timestamp) {
        ZoneId zoneId = ZoneId.of("Asia/Seoul");
        ZonedDateTime zonedDateTime = timestamp.atZone(zoneId);
        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss");
        this.timestamp = zonedDateTime.format(formatter);
    }

}