package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.Timesheet;
import com.chaihq.webapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface TimesheetRepository extends JpaRepository<Timesheet, Long> {
    public List<Timesheet> findAllByUserOrderByTimeLogDateDesc(User user);
}
