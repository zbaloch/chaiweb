package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface ProjectRepository extends JpaRepository<Project, Long> {
    List<Project> findByCreatedBy(long createdBy);
    List<Project> findByProjectTypeIs(String projectType);
    List<Project> findByCreatedByOrProjectTypeIs(long createdBy, String projectType);
}
