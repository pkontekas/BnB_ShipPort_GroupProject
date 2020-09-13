package spring.bnb.boats.controllers;

import java.security.Principal;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import spring.bnb.boats.models.Account;
import spring.bnb.boats.models.ChatMessage;
import spring.bnb.boats.services.AccountService;

@Controller
public class ChatController {

    @Autowired
    AccountService accountService;

    @MessageMapping("/chat.sendMessage")
    @SendTo("/topic/public")
    public ChatMessage sendMessage(@Payload ChatMessage chatMessage) {
        return chatMessage;
    }

    @MessageMapping("/chat.addUser")
    @SendTo("/topic/public")
    public ChatMessage addUser(@Payload ChatMessage chatMessage,
            SimpMessageHeaderAccessor headerAccessor) {
        // Add username in web socket session
        headerAccessor.getSessionAttributes().put("username", chatMessage.getSender());
        return chatMessage;
    }

    @RequestMapping("/chatpage")
    public String showChat(ModelMap mm, Principal principal) {
        String accountEmail = principal.getName();
        Account account = accountService.getAccountByEmail(accountEmail);
        mm.addAttribute("username", account.getSurname());
        return "chat";
    }
    
}
