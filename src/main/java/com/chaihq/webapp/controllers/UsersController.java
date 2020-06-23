package com.chaihq.webapp.controllers;


import com.chaihq.webapp.models.User;
import com.chaihq.webapp.services.SecurityService;
import com.chaihq.webapp.services.UserService;
import com.chaihq.webapp.utilities.Constants;
import com.chaihq.webapp.validator.UserValidator;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

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
        logger.debug("bindingResult.hasErrors(): " + bindingResult.hasErrors());
        System.out.println("bindingResult.hasErrors(): " + bindingResult.hasErrors());
        if (bindingResult.hasErrors()) {
            return "registration";
        }

        userForm.setName( userForm.getFirstName() + " " + userForm.getLastName());
        userForm.setStatus(Constants.USER_STATUS_ACTIVE);
        userService.save(userForm);

        securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());

        return "redirect:/projects";
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String login(Model model, String error, String logout) {
        System.out.println("login method...");
        if (error != null)
            model.addAttribute("error", "Your username and password is invalid.");

        if (logout != null)
            model.addAttribute("message", "You have been logged out successfully.");

        return "login";
    }

    /* @RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
    public String welcome(Model model) {
        return "welcome";
    } */
}
