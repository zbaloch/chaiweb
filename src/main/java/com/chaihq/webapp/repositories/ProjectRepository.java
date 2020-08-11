package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface ProjectRepository extends JpaRepository<Project, Long> {
    List<Project> findByUser(User user);
    List<Project> findByProjectTypeIs(String projectType);
    List<Project> findByUserOrProjectTypeIs(User user, String projectType);
    List<Project> findByUsersInAndProjectTypeIs(List<User> users, String projectTpe); // This gets projects/teams that a user is part of
    List<Project> findByUserAndProjectTypeEquals(User user, String projectType); // This gets owned projects that user owns

}
