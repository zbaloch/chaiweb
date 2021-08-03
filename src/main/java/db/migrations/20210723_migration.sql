create table time_log
(
    id bigint auto_increment,
    user_id bigint not null,
    project_id bigint null,
    created_at timestamp null,
    updated_at timestamp null,
    time_log_date datetime null,
    task varchar(256) null,
    notes mediumtext null,
    constraint time_log_pk
        primary key (id)
);

alter table time_log
    add man_hours int null;

alter table time_log
    add constraint time_log_projects_id_fk
        foreign key (project_id) references projects (id);

alter table time_log
    add constraint time_log_users_id_fk
        foreign key (user_id) references users (id);

rename table time_log to timesheets;



