package com.chaihq.webapp.validator;


import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.Timesheet;
import org.jsoup.helper.Validate;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import java.sql.Time;

@Component
public class TimesheetValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Project.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Timesheet timesheet = (Timesheet) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "task", "required.field");
        // ValidationUtils.rejectIfEmptyOrWhitespace(errors, "notes", "required.field");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "manHours", "required.field");

    }

}
