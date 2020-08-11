package com.chaihq.webapp.validator;

import com.chaihq.webapp.models.Todo;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class TodoValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Todo.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Todo todo = (Todo) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "description", "required.field");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "dueDateVariable", "required.field");

    }
}
