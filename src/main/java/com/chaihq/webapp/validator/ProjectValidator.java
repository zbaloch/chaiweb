package com.chaihq.webapp.validator;


import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.services.UserService;
import com.chaihq.webapp.utilities.Constants;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.util.regex.Pattern;

@Component
public class ProjectValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Project.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Project project = (Project) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "required.field");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "required.field");

    }

}
