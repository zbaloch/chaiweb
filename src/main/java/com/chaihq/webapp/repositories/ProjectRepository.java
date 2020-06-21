package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Project;
import org.springframework.data.jpa.repository.JpaRepository;

// Find update delete save etc
public interface ProjectRepository extends JpaRepository<Project, Long> {
}
