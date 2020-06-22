package com.chaihq.webapp.services;


import com.chaihq.webapp.models.User;

public interface UserService {
    void save(User user);

    User findByUsername(String username);
}
