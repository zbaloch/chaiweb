package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.ActiveStorageFile;
import com.chaihq.webapp.models.ChatMessage;
import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import com.chaihq.webapp.repositories.ActiveStorageFileRepository;
import com.chaihq.webapp.repositories.ProjectRepository;
import com.chaihq.webapp.repositories.UserRepository;
import com.chaihq.webapp.storage.StorageFileNotFoundException;
import com.chaihq.webapp.storage.StorageService;
import com.chaihq.webapp.utilities.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.Payload;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.method.annotation.MvcUriComponentsBuilder;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
public class ChatController {

    private final StorageService storageService;

    @Autowired
    public ChatController(StorageService storageService) {
        this.storageService = storageService;
    }

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ActiveStorageFileRepository activeStorageFileRepository;

    @GetMapping("/project/{id}/chat")
    public String show(@PathVariable Long id, Model model) {
        Project project = projectRepository.getOne(id); // TODO make show this belongs to the user

        List<ActiveStorageFile> activeStorageFiles = activeStorageFileRepository.findByProjectId(id);

        model.addAttribute("project", project);
        model.addAttribute("activeStorageFiles", activeStorageFiles);

        return "chat/index";
    }



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



}
