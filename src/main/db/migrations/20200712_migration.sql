create table projects
(
    id           bigint auto_increment
        primary key,
    name         varchar(124) not null,
    description  varchar(512) null,
    created_at   timestamp    not null,
    created_by   bigint       not null,
    project_type varchar(16)  not null
);

create index projects_id_index
    on projects (id);

create table roles
(
    id   int auto_increment
        primary key,
    name varchar(24) not null
);

create table user_roles
(
    user_id bigint not null,
    role_id int    not null
);

create index user_roles_roles_id_fk
    on user_roles (role_id);

create index user_roles_users_id_fk
    on user_roles (user_id);

create table users
(
    id         bigint auto_increment,
    username   varchar(128) not null
        primary key,
    first_name varchar(128) null,
    last_name  varchar(128) null,
    name       varchar(256) null,
    created_at timestamp    null,
    password   varchar(512) not null,
    photo      blob         null,
    status     varchar(16)  null,
    email      varchar(512) null
);

create table active_storage_files
(
    id          bigint auto_increment
        primary key,
    name        varchar(256) null,
    description varchar(512) null,
    project_id  bigint       null,
    user_id     bigint       null,
    created_at  timestamp    null,
    file_data   longblob     null,
    file_name   varchar(512) null,
    file_type   varchar(128) null,
    file_size   bigint       null,
    constraint active_storage_files_users_id_fk
        foreign key (user_id) references users (id)
);

create index active_storage_files_id_index
    on active_storage_files (id desc);

create table chat_messages
(
    id         bigint auto_increment
        primary key,
    user_id    bigint        null,
    project_id bigint        null,
    message    varchar(2048) null,
    created_at timestamp     null,
    constraint chat_messages_projects_id_fk
        foreign key (project_id) references projects (id),
    constraint chat_messages_users_id_fk
        foreign key (user_id) references users (id)
);

create table project_users
(
    project_id bigint not null,
    user_id    bigint not null,
    constraint project_users_projects_id_fk
        foreign key (project_id) references projects (id),
    constraint project_users_users_id_fk
        foreign key (user_id) references users (id)
);

create index users_id_index
    on users (id);

