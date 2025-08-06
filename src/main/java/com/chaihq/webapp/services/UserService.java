package com.chaihq.webapp.services;


import com.chaihq.webapp.models.User;
import com.chaihq.webapp.repositories.RoleRepository;
import com.chaihq.webapp.repositories.UserRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.HashSet;

@Service
public class UserService {
    @Autowired
    private UserRepository userRepository;
    @Autowired
    private RoleRepository roleRepository;
    @Autowired
    private BCryptPasswordEncoder bCryptPasswordEncoder;

    public void save(User user) {
        user.setRoles(new HashSet<>(roleRepository.findAll()));
        userRepository.save(user);
    }

    public void update(User user) {
        User userToUpdate = userRepository.findByEmail(user.getEmail());
        userToUpdate.setFirstName(user.getFirstName());
        userToUpdate.setLastName(user.getLastName());
        userToUpdate.setUpdatedAt(Instant.now());
        userRepository.save(userToUpdate);
    }

    public User findByEmail(String email) {
        return userRepository.findByEmail(email);
    }

}
