package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.servlet.FlashMap;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.Map;

@Controller
public class ProjectsController {

    @GetMapping("/projects")
    public String index(Map<String, Object> model) {
        System.out.println("index");
        model.put("name", "ProjectsController");
        return "projects/index";
    }

    @GetMapping("/project/new")
    public String neew(@ModelAttribute("project")Project project) {
        
        System.out.println("neew");
        return "projects/new";
    }

    @PostMapping("/project/new")
    public String save(@ModelAttribute("project")Project project, final RedirectAttributes redirectAttributes) {
        System.out.println("save");
        // Add log4j
        // return "redirect:projects/index"; // Could have done return "show" to follow RoR convention
        // return "redirect:projects/new"
        redirectAttributes.addFlashAttribute("notice", "Project saved!");
        return "redirect:/projects";
    }

    private void dummyLoginUser() {
        User user = new User();
        user.setId(1);
        user.setUsername("zaheerbaloch");
        user.setFirstName("Zaheer");
        user.setLastName("Baloch");
        user.setName("Zaheer Baloch");
    }

}
