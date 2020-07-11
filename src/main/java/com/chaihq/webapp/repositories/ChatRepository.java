package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Chat;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface ChatRepository extends JpaRepository<Chat, Long> {
    public List<Chat> findByProjectId(Long projectId);
}
