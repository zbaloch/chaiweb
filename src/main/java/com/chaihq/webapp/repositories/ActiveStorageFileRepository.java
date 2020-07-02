package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.ActiveStorageFile;
import com.chaihq.webapp.models.Project;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

// Find update delete save etc
public interface ActiveStorageFileRepository extends JpaRepository<ActiveStorageFile, Long> {
    public List<ActiveStorageFile> findByProjectId(long projectId);
}
