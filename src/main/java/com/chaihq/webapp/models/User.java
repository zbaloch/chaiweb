package com.chaihq.webapp.models;

import org.hibernate.annotations.Type;

import lombok.Getter;
import lombok.Setter;

import javax.persistence.*;

import java.time.Instant;
import java.util.Calendar;
import java.util.List;
import java.util.Set;

@Entity(name = "users")
@Getter
@Setter
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private long id;

    private String email; // Use this is a handle

    @Column(name = "first_name")
    private String firstName;

    @Column(name = "last_name")
    private String lastName;

    private Instant createdAt;
    private Instant updatedAt;


    @Transient
    private String passwordConfirm;

    @Transient
    private String initialFirstNameLastName;

    @Transient
    private boolean addedAlready;

    private String status;

    private String token;
    private Calendar tokenExpirationDate;
    private Calendar tokenUsedDate;

    @Lob
    @Type(type = "org.hibernate.type.BinaryType")
    private byte[] photo;


    @ManyToMany(mappedBy = "users")
    private List<Project> projects;

    @ManyToMany
    @JoinTable(name = "user_roles", joinColumns = @JoinColumn(name = "user_id"), inverseJoinColumns = @JoinColumn(name = "role_id"))
    private Set<Role> roles;

    @PrePersist
    protected void onCreate() {
        createdAt = Instant.now();
        updatedAt = Instant.now();
    }

    // @PrePersist
    // protected void onUpdate() {
    //     updatedAt = Instant.now();
    // }

}
