package com.chaihq.webapp.validator;

import com.chaihq.webapp.models.Comment;
import com.chaihq.webapp.models.Message;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

@Component
public class CommentValidator implements Validator {

    @Override
    public boolean supports(Class<?> aClass) {
        return Comment.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        Comment comment = (Comment) o;

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "text", "required.field");


    }
}
