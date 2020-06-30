package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import com.chaihq.webapp.repositories.ProjectRepository;
import com.chaihq.webapp.repositories.UserRepository;
import com.chaihq.webapp.storage.StorageFileNotFoundException;
import com.chaihq.webapp.storage.StorageService;
import com.chaihq.webapp.utilities.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Controller
public class FilesController {

    private final StorageService storageService;

    @Autowired
    public FilesController(StorageService storageService) {
        this.storageService = storageService;
    }

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private UserRepository userRepository;



    @GetMapping("/project/{id}/files")
    public String show(@PathVariable Long id, Map<String, Object> model) {
        Project project = projectRepository.getOne(id); // TODO make show this belongs to the user
        System.out.println(project.getName());
        model.put("project", project);
        return "files/index";
    }

    @GetMapping("/project/{id}/file/new")
    public String neew(@ModelAttribute("project")Project project, HttpSession httpSession, @PathVariable Long id, Map<String, Object> model) {
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        project = projectRepository.getOne(id); // TODO make show this belongs to the user
        System.out.println(project.getName());
        model.put("project", project);

        System.out.println("neew");
        return "files/new";
    }


    @PostMapping("/project/{id}/file/new")
    public String save(@RequestParam("file") MultipartFile file, @ModelAttribute("project")Project project,
                       HttpSession httpSession, @PathVariable Long id,
                       Map<String, Object> model, RedirectAttributes redirectAttributes) {
        storageService.store(file);
        System.out.println("Post: /project/{id}/file/new");
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        project = projectRepository.getOne(id); // TODO make show this belongs to the user
        System.out.println(project.getName());
        redirectAttributes.addFlashAttribute("notice", "File uploaded!");
        // redirectAttributes.addFlashAttribute("message",
                // "You successfully" + file.getOriginalFilename() + "!");

        model.put("project", project);

        // return "redirect:/projects/" + id + "/files";
        return "redirect:/project/" + id + "/files";
    }

    @ExceptionHandler(StorageFileNotFoundException.class)
    public ResponseEntity<?> handleStorageFileNotFound(StorageFileNotFoundException exc) {
        return ResponseEntity.notFound().build();
    }


}
