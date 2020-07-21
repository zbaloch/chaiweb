package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Comment;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface CommentRepository extends JpaRepository<Comment, Long> {
    public List<Comment> findAllByMessageIdOrderByCreatedAtAsc(long messageId);
}
