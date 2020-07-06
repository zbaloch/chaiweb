package com.chaihq.webapp.controllers;

import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.ProjectUserForm;
import com.chaihq.webapp.models.User;
import com.chaihq.webapp.repositories.ProjectRepository;
import com.chaihq.webapp.repositories.UserRepository;
import com.chaihq.webapp.utilities.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
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
    public String index(Map<String, Object> model, HttpSession httpSession) {
        // List<Project> projects = projectRepository.findAll();
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        String currentPrincipalName = authentication.getName();
        // TODO: Maybe put this user in the session so that its not required to inqure from database again and again.
        User user = userRepository.findByUsername(currentPrincipalName);
        String intialFirstNameLastName = "" + user.getFirstName().charAt(0) + "" + user.getLastName().charAt(0);
        user.setInitialFirstNameLastName(intialFirstNameLastName);
        httpSession.setAttribute(Constants.CURRENT_USER, user); // current_user is a term used within ruby on rails framework.

        List<Project> hqs = projectRepository.findByProjectTypeIs(Constants.PROJECT_TYPE_HQ);
        model.put("hqs", hqs);

        List<Project> projects = projectRepository.findByProjectTypeIs(Constants.PROJECT_TYPE_PROJECT);
        model.put("projects", projects);

        List<Project> teams = projectRepository.findByProjectTypeIs(Constants.PROJECT_TYPE_TEAM);
        model.put("teams", teams);

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
        System.out.println("@PostMapping(\"/project/new\") gulp file xxxxx");
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

    @GetMapping("/project/{id}/delete")
    public String delete(@PathVariable Long id, final RedirectAttributes redirectAttributes ) {
        // TODO: Make sure this belongs to the current loggedin user
        projectRepository.deleteById(id);
        redirectAttributes.addFlashAttribute("destruction_notice", "Project deleted!");
        return "redirect:/projects";
    }


    @GetMapping("/project/{id}/users")
    public String users(@PathVariable Long id, Model model, HttpSession httpSession
                        ) {
        Project project = projectRepository.getOne(id);
        model.addAttribute("project", project);
        // Get all the users
        List<User> users = userRepository.findAll();

        for(int i=0; i<users.size(); i++) {
            User user = users.get(i);
            for(int j=0; j<project.getUsers().size(); j++) {
                User projectUser = project.getUsers().get(j);
                if(user.getId() == projectUser.getId()) {
                    user.setAddedAlready(true);
                }
            }
        }

        model.addAttribute("users", users);
        model.addAttribute("puf", new ProjectUserForm());
        return "projects/users";
    }

    @PostMapping("/project/{id}/users")
    public String addRemoveUser(Map<String, Object> model,
                        @ModelAttribute ProjectUserForm puf,
                        @PathVariable Long id,
                        HttpSession httpSession) {
        System.out.println("Adding users..." + puf.getProjectId() + ", " + puf.getUserId() + ", " + puf.getAction());
        // TODO: Make sure the project belongs to this user
        Project project = projectRepository.getOne(puf.getProjectId());
        System.out.println(project.getUsers().size());
        User userToAdd = (User) userRepository.getOne(puf.getUserId());
        List<User> users = userRepository.findAll();

        if("add".equals(puf.getAction())) {
            project.getUsers().add(userToAdd);
            model.put("notice", "User added!");
            projectRepository.save(project);
        } else if("remove".equals(puf.getAction())) {

            for(int i=0; i<project.getUsers().size(); i++) {
                User user = project.getUsers().get(i);
                System.out.println(user.getId() + " == " + puf.getUserId());
                System.out.println(user.getId() == puf.getUserId());
                if(user.getId() == puf.getUserId()) {
                    project.getUsers().remove(i);
                    projectRepository.save(project);
                    break;
                }
            }

            model.put("notice", "User removed!");
        } else {
            // model.put("notice", "User added!");
        }

        for(int i=0; i<users.size(); i++) {
            User user = users.get(i);
            for(int j=0; j<project.getUsers().size(); j++) {
                User projectUser = project.getUsers().get(j);
                if(user.getId() == projectUser.getId()) {
                    user.setAddedAlready(true);
                }
            }
        }
        model.put("project", project);
        model.put("users", users);
        model.put("puf", puf);



        return "projects/users";
    }





    @GetMapping("/project/{id}/edit")
    public String edit(@PathVariable Long id, Map<String, Object> model) {
        Project project = projectRepository.getOne(id);
        System.out.println(project.getName());
        model.put("project", project);
        return "projects/edit";
    }


    @PostMapping("/project/{id}/edit")
    public String update(@PathVariable Long id, @ModelAttribute("project")Project project,
                         Map<String, Object> model, HttpSession httpSession) {
        Project projectToUpdate = projectRepository.getOne(id);
        System.out.println(project.getName());
        projectToUpdate.setName(project.getName());
        projectToUpdate.setDescription(project.getDescription());
        projectRepository.save(projectToUpdate);
        model.put("project", project);
        model.put("notice", "Project updated!");
        return "projects/show";
    }

}
