package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Notification;
import com.chaihq.webapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface NotificationRepository extends JpaRepository<Notification, Long> {
    public List<Notification> findAllByForUserOrderByCreatedAtDesc(User user);
}
