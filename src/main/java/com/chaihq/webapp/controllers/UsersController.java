package com.chaihq.webapp.controllers;


import com.chaihq.webapp.models.User;
import com.chaihq.webapp.services.SecurityService;
import com.chaihq.webapp.services.UserService;
import com.chaihq.webapp.utilities.Constants;
import com.chaihq.webapp.validator.UserValidator;
import org.apache.tomcat.util.bcel.Const;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;

@Controller
public class UsersController {
    private static final Logger logger = LoggerFactory.getLogger(com.chaihq.webapp.controllers.UsersController.class);

    @Autowired
    private UserService userService;

    @Autowired
    private SecurityService securityService;

    @Autowired
    private UserValidator userValidator;

    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String registration(Model model) {
        model.addAttribute("userForm", new User());

        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String registration(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
        userValidator.validate(userForm, bindingResult);

        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/projects";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }


    @RequestMapping(value = "/profile", method = RequestMethod.GET)
    public String profile(Model model, HttpSession httpSession) {
        User user = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        User userForm = new User();
        userForm.setFirstName(user.getFirstName());
        userForm.setLastName(user.getLastName());
        userForm.setUsername(user.getUsername());
        model.addAttribute("userForm", userForm);
        return "user/profile";
    }


    @RequestMapping(value = "/profile", method = RequestMethod.POST)
    public String update(@ModelAttribute("userForm") User userForm,
                         BindingResult bindingResult, Model model,
                         final RedirectAttributes redirectAttributes,
                         HttpSession httpSession) {

        User currentUser = (User) httpSession.getAttribute(Constants.CURRENT_USER);
        userForm.setUsername(currentUser.getUsername());

        System.out.println("userForm.getUsername: " + userForm.getUsername());
        System.out.println("userForm.getFirstName: " + userForm.getFirstName());
        System.out.println("userForm.getLastName: " + userForm.getLastName());
        System.out.println("userForm.getPassword: " + userForm.getPassword());

        userValidator.validateUpdate(userForm, bindingResult);

        System.out.println("bindingResult: " + bindingResult.hasErrors());


        if (bindingResult.hasErrors()) {
            return "user/profile";
        }


        userService.update(userForm);

        // securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        redirectAttributes.addFlashAttribute("notice", "Your profile saved!");

        return "redirect:/projects";
    }


    @GetMapping("/reset")
    public String reset(Model model) {
        model.addAttribute("userForm", new User());
        return "reset";
    }

    @PostMapping("/reset")
    public String resetPasword(@ModelAttribute("userForm") User userForm, Model model) {
        System.out.println("userForm.getUsername(): " + userForm.getUsername());
        model.addAttribute("message", "Check your inbox for a link to reset your password");
        // TODO: Change this later - For now this just prints the password for the admin who has access to the logs.
        // Admin picks up the password and sends to user. The user is then advised to change their password after
        // the login.
        User user = userService.findByUsername(userForm.getUsername());
        System.out.println("user.getPassword(): " + user.getPassword());

        // userToUpdate.setPassword(bCryptPasswordEncoder.encode(user.getPassword()));
        return "reset";
    }

}
