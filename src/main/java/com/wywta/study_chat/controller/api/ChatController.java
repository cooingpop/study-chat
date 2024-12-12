package com.wywta.study_chat.controller.api;

import com.wywta.study_chat.model.ChatMessage;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.event.EventListener;
import org.springframework.messaging.handler.annotation.*;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.messaging.simp.user.SimpUserRegistry;
import org.springframework.stereotype.Controller;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import java.time.LocalDateTime;
import java.util.Collections;

@Controller
public class ChatController {

    @Autowired
    private SimpUserRegistry userRegistry;

    @Autowired
    private SimpMessagingTemplate messagingTemplate;

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        String ipAddress = headerAccessor.getSessionAttributes().get("clientIp").toString();
        String maskedIp = maskIpAddress(ipAddress);
        chatMessage.setTimestamp(LocalDateTime.now());
        chatMessage.setIpAddress(maskedIp);

        // 입력 검증 및 이스케이프 처리
        chatMessage.setContent(sanitizeInput(chatMessage.getContent()));

        return chatMessage;
    }

    @MessageMapping("/chat.sendAnnouncement")
    @SendTo("/topic/public")
    public ChatMessage sendAnnouncement(@Payload String announcement) {
        ChatMessage chatMessage = new ChatMessage();
        chatMessage.setSender("Super Admin");
        chatMessage.setContent(announcement);
        chatMessage.setType(ChatMessage.MessageType.ANNOUNCEMENT);
        chatMessage.setTimestamp(LocalDateTime.now());
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage, SimpMessageHeaderAccessor headerAccessor) {
        String ipAddress = headerAccessor.getSessionAttributes().get("clientIp").toString();
        String maskedIp = maskIpAddress(ipAddress);
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        chatMessage.setIpAddress(maskedIp);
        chatMessage.setContent(chatMessage.getSender() + " joined!");
        chatMessage.setTimestamp(LocalDateTime.now());

        // 사용자 추가 후 즉시 카운트 브로드캐스트
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        broadcastUserCount();

        return chatMessage;
    }

    @MessageMapping("/requestUserCount")
    public void requestUserCount() {
        broadcastUserCount();
    }

    @EventListener
    public void handleSessionDisconnect(SessionDisconnectEvent event) {
        StompHeaderAccessor headerAccessor = StompHeaderAccessor.wrap(event.getMessage());
        String username = (String) headerAccessor.getSessionAttributes().get("username");
        String ipAddress = (String) headerAccessor.getSessionAttributes().get("clientIp");
        if (username != null) {
            ChatMessage chatMessage = new ChatMessage();
            chatMessage.setSender(username);
            chatMessage.setType(ChatMessage.MessageType.LEAVE);
            chatMessage.setContent("님이 나갔습니다.");
            chatMessage.setIpAddress(maskIpAddress(ipAddress));
            chatMessage.setTimestamp(LocalDateTime.now());
            messagingTemplate.convertAndSend("/topic/public", chatMessage);
        }
        broadcastUserCount();
    }

    private String sanitizeInput(String input) {
        // HTML 특수 문자 이스케이프 처리
        return input.replace("&", "&amp;")
                .replace("<", "&lt;")
                .replace(">", "&gt;")
                .replace("\"", "&quot;")
                .replace("'", "&#039;");
    }

    private void broadcastUserCount() {
        int userCount = userRegistry.getUserCount();
        messagingTemplate.convertAndSend("/topic/userCount", Collections.singletonMap("count", userCount));
    }

    private String maskIpAddress(String ipAddress) {
        if (ipAddress == null || ipAddress.isEmpty()) {
            return "Unknown";
        }
        String[] parts = ipAddress.split("\\.");
        if (parts.length != 4) {
            return ipAddress; // 유효하지 않은 IP 주소는 그대로 반환
        }
        return parts[0] + "." + parts[1] + "." + parts[2] + ".xxx";
    }
}

