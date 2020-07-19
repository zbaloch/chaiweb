package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.ActiveStorageFile;
import com.chaihq.webapp.models.Message;
import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import com.chaihq.webapp.repositories.ActiveStorageFileRepository;
import com.chaihq.webapp.repositories.MessageRepository;
import com.chaihq.webapp.repositories.ProjectRepository;
import com.chaihq.webapp.repositories.UserRepository;
import com.chaihq.webapp.storage.StorageFileNotFoundException;
import com.chaihq.webapp.storage.StorageService;
import com.chaihq.webapp.utilities.Constants;
import org.jsoup.Jsoup;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ByteArrayResource;
import org.springframework.core.io.Resource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.List;
import java.util.Map;
import static org.apache.commons.lang.StringEscapeUtils.escapeHtml;


@Controller
public class MessagesController {

    private final StorageService storageService;

    @Autowired
    public MessagesController(StorageService storageService) {
        this.storageService = storageService;
    }

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private ActiveStorageFileRepository activeStorageFileRepository;

    @Autowired
    private MessageRepository messageRepository;

    @GetMapping("/project/{id}/messages")
    public String show(@PathVariable Long id, Model model) {
        Project project = projectRepository.getOne(id); // TODO make show this belongs to the user

        List<Message> messages = messageRepository.findAllByProjectIdOrderByCreatedAtDesc(id);

        for (Message message: messages) {
            message.setContentToDisplay(html2text(message.getContent()));
        }
        model.addAttribute("project", project);
        model.addAttribute("messages", messages);

        return "messages/index";
    }


    @GetMapping("/project/{project_id}/message/new")
    public String neew(@ModelAttribute("message") Message message,
                       @ModelAttribute("project") Project project,
                       HttpSession httpSession,
                       @PathVariable Long project_id, Map<String, Object> model) {

        System.out.println("project_id: " + + project_id);

        message = new Message();

        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        project = projectRepository.getOne(project_id); // TODO make show this belongs to the user
        System.out.println(project.getName());
        model.put("project", project);
        System.out.println("neew");
        return "messages/new";

    }

    @PostMapping("/project/{project_id}/message/new")
    public String save(@ModelAttribute("message") Message message,
                       @ModelAttribute("project") Project project,
                       HttpSession httpSession, @PathVariable Long project_id,
                       Map<String, Object> model, RedirectAttributes redirectAttributes) throws Exception {

        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        message.setUser(user);
        message.setProjectId(project_id);
        message.setCreatedAt(Calendar.getInstance());
        messageRepository.save(message);

        redirectAttributes.addFlashAttribute("notice", "Your message created!");

        System.out.println("project: " + project_id);
        System.out.println("message.getContent(): " + message.getContent());
        return "redirect:/project/" + project_id + "/message/" + message.getId();

    }

    @GetMapping("/project/{project_id}/message/{message_id}")
    public String show( HttpSession httpSession, @PathVariable Long project_id, @PathVariable Long message_id,
                       Map<String, Object> model, RedirectAttributes redirectAttributes) throws Exception {

        Project project = projectRepository.getOne(project_id);
        Message message = messageRepository.getOne(message_id);
        model.put("message", message);
        model.put("project", project);
        System.out.println("project: " + project_id);
        System.out.println("message.getContent(): " + message.getContent());
        return "messages/show";
    }

    @GetMapping("/project/{project_id}/message/{message_id}/edit")
    public String edit(
                    HttpSession httpSession, @PathVariable Long project_id,
                    @PathVariable Long message_id, Map<String, Object> model,
                    RedirectAttributes redirectAttributes) throws Exception {

        Project project = projectRepository.getOne(project_id);
        Message message = messageRepository.getOne(message_id);
        message.setContentToDisplay(escapeHtml(message.getContent()));
        model.put("message", message);
        model.put("project", project);
        System.out.println("edit: " + message_id);
        return "messages/edit";
    }

    @PostMapping("/project/{project_id}/message/{message_id}/edit")
    public String update(@ModelAttribute("message") Message message,
                       @ModelAttribute("project") Project project,
                       HttpSession httpSession, @PathVariable Long project_id, @PathVariable Long message_id,
                       Map<String, Object> model, RedirectAttributes redirectAttributes) throws Exception {

        // TODO: Check if this belongs to this user.

        System.out.println("update...");

        Message messageToUpdate = messageRepository.getOne(message_id);
        messageToUpdate.setTitle(message.getTitle());
        messageToUpdate.setContent(message.getContent()); // TODO:Probably need last updated?

        messageRepository.save(messageToUpdate);

        redirectAttributes.addFlashAttribute("notice", "Your message was updated!");
        project = projectRepository.getOne(project_id);
        model.put("project", project);
        model.put("message", message);

        return "redirect:/project/" + project_id + "/message/" + messageToUpdate.getId();

    }

    @GetMapping("/project/{project_id}/message/{message_id}/delete")
    public String delete(
            @ModelAttribute("message") Message message, @ModelAttribute("project") Project project,
            HttpSession httpSession, @PathVariable Long project_id,
            @PathVariable Long message_id, Map<String, Object> model,
            RedirectAttributes redirectAttributes) throws Exception {

        project = projectRepository.getOne(project_id);
        message = messageRepository.getOne(message_id);
        messageRepository.delete(message);
        model.put("project", project);
        redirectAttributes.addFlashAttribute("notice", "Your message was deleted!");
        return "redirect:/project/" + project_id + "/messages";
    }



    public String html2text(String html) {
        return Jsoup.parse(html).text();
    }

}
