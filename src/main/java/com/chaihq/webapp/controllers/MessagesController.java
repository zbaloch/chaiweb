package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.*;
import com.chaihq.webapp.repositories.*;
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

    @Autowired
    private CommentRepository commentRepository;

    @GetMapping("/project/{id}/messages")
    public String index(@PathVariable Long id, Model model) {
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
        model.put("project", project);

        Message message = messageRepository.getOne(message_id);
        model.put("message", message);

        // List<Comment> comments = commentRepository.findAllByMessageIdOrderByCreatedAtAsc(message_id);
        List<Comment> comments = message.getComments();
        for(int i=0; i<comments.size(); i++) {
            Comment comment = comments.get(i);
            comment.setTextToDisplay(escapeHtml(comment.getText()));
        }
        // model.put(Constants.COMMENTS, comments);

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

    @PostMapping("/project/{project_id}/message/{message_id}")
    public String addComment(@ModelAttribute("comment") Comment comment, HttpSession httpSession, @PathVariable Long project_id, @PathVariable Long message_id,
                             Map<String, Object> model, RedirectAttributes redirectAttributes) throws Exception {

        Project project = projectRepository.getOne(project_id);


        Message message = messageRepository.getOne(message_id);


        System.out.println("comment.getText(): " + comment.getText());
        // TODO: Make sure the user has the rights to add a comment here.
        comment.setProjectId(project_id);
        User currentUser = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        comment.setUser(currentUser);
        comment.setCreatedAt(Calendar.getInstance());
        comment.setCommentType(Constants.MESSAGE);
        comment.setMessage(message);
        commentRepository.save(comment);

        // Get all the update comments
        List<Comment> comments = commentRepository.findAllByMessageIdOrderByCreatedAtAsc(message_id);
        for(int i=0; i<comments.size(); i++) {
            Comment commentTemp = comments.get(i);
            commentTemp.setTextToDisplay(escapeHtml(commentTemp.getText()));
        }

        redirectAttributes.addFlashAttribute("notice", "Your comment has been added!");
        // model.put("notice", "Your comment has been added!");
        model.put("project", project);
        model.put("message", message);
        // model.put(Constants.COMMENTS, comments);
        return "redirect:/project/" + project_id + "/message/" + message.getId() + "#comment_" + comment.getId();
        // return "messages/show";
    }

    // http://localhost:8080/chaiweb/project/1/message/16/comment/41/delete

    @PostMapping("/project/{project_id}/message/{message_id}/comment/{comment_id}/delete")
    public String deleteComment(HttpSession httpSession, @PathVariable Long project_id, @PathVariable Long message_id,
                                @PathVariable Long comment_id,
                             Map<String, Object> model, RedirectAttributes redirectAttributes) throws Exception {

        // TOOD: Make sure the user the right to delete this.
        commentRepository.deleteById(comment_id);

        Project project = projectRepository.getOne(project_id);
        Message message = messageRepository.getOne(message_id);

        // Get all the update comments
        List<Comment> comments = message.getComments();
        for(int i=0; i<comments.size(); i++) {
            Comment commentTemp = comments.get(i);
            commentTemp.setTextToDisplay(escapeHtml(commentTemp.getText()));
        }

        redirectAttributes.addFlashAttribute("notice", "Your comment has been deleted!");
        // model.put("notice", "Your comment has been added!");
        model.put(Constants.PROJECT, project);
        model.put(Constants.MESSAGE, message);
        // model.put(Constants.COMMENTS, comments);
        return "redirect:/project/" + project_id + "/message/" + message.getId() + "#comment_form";
        // return "messages/show";
    }






    public String html2text(String html) {
        return Jsoup.parse(html).text();
    }

}
