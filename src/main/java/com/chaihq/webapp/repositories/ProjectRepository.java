package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Project;
import com.chaihq.webapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface ProjectRepository extends JpaRepository<Project, Long> {
    List<Project> findByCreatedBy(long createdBy);
    List<Project> findByProjectTypeIs(String projectType);
    List<Project> findByCreatedByOrProjectTypeIs(long createdBy, String projectType);
    List<Project> findByUsersInAndProjectTypeIs(List<User> users, String projectTpe); // This gets projects/teams that a user is part of
    List<Project> findByCreatedByAndProjectTypeEquals(long createdBy, String projectType); // This gets owned projects that user owns

}
