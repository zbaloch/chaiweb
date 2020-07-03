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
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
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



}
