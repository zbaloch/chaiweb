package com.chaihq.webapp.validator;

import com.chaihq.webapp.models.Message;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class MessageValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Message.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Message message = (Message) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "content", "required.field");
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "title", "required.field");


    }
}
