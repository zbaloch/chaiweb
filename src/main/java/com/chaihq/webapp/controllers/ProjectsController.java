package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import com.chaihq.webapp.repositories.ProjectRepository;
import com.chaihq.webapp.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import java.util.Calendar;
import java.util.List;
import java.util.Map;

@Controller
public class ProjectsController {

    @Autowired
    private ProjectRepository projectRepository;

    @Autowired
    private UserRepository userRepository;


    // @GetMapping("/projects")
    @RequestMapping(value = {"/", "/projects"}, method = RequestMethod.GET)
    public String index(Map<String, Object> model) {
        // List<Project> projects = projectRepository.findAll();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println( authentication.getDetails() );
        String currentPrincipalName = authentication.getName();
        System.out.println(currentPrincipalName);

        User user = userRepository.findByUsername(currentPrincipalName);
        System.out.println(user.getId());
        System.out.println(user.getFirstName());



        // List<Project> projects = projectRepository.findAll();
        List<Project> projects = projectRepository.findByCreatedBy(user.getId());
        System.out.println("Projects size: " + projects.size());
        model.put("projects", projects);
        return "projects/index";
    }

    @GetMapping("/project/new")
    public String neew(@ModelAttribute("project")Project project, HttpSession httpSession) {
        // httpSession.setAttribute("current_user", dummyLoginUser());
        System.out.println("neew");
        return "projects/new";
    }

    @PostMapping("/project/new")
    public String save(@ModelAttribute("project")Project project, final RedirectAttributes redirectAttributes, HttpSession httpSession) {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        System.out.println( authentication.getDetails() );
        String currentPrincipalName = authentication.getName();
        System.out.println(currentPrincipalName);

        User user = userRepository.findByUsername(currentPrincipalName);
        System.out.println(user.getId());
        System.out.println(user.getFirstName());

        // User current_user = (User) httpSession.getAttribute("current_user");
        // System.out.println("save" + current_user.getFirstName());
        // Add log4j
        // return "redirect:projects/index"; // Could have done return "show" to follow RoR convention
        // return "redirect:projects/new"
        project.setCreatedBy(user.getId());
        project.setCreatedAt(Calendar.getInstance());

        projectRepository.save(project);


        redirectAttributes.addFlashAttribute("notice", "Project saved!");
        return "redirect:/projects";
    }

    @GetMapping("/project/{id}")
    public String show(@PathVariable Long id, Map<String, Object> model) {
        Project project = projectRepository.getOne(id);
        System.out.println(project.getName());
        model.put("project", project);
        return "projects/show";
    }



}
