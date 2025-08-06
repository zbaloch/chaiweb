package com.chaihq.webapp.repositories;

import com.chaihq.webapp.models.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Long> {
    public User findByEmail(String email);
    public User findByEmailAndToken(String email, String token);
}
