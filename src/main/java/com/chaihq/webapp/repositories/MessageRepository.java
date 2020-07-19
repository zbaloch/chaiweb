package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Message;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface MessageRepository extends JpaRepository<Message, Long> {
    public List<Message> findAllByProjectIdOrderByCreatedAtDesc(Long projectId);
}
