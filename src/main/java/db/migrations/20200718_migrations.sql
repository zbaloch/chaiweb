create table message
(
	id BIGINT auto_increment,
	title VARCHAR(480) null,
	content LONGTEXT null,
	user_id BIGINT null,
	project_id BIGINT null,
	created_at TIMESTAMP null,
	constraint message_pk
		primary key (id),
	constraint message_projects_id_fk
		foreign key (project_id) references projects (id),
	constraint message_users_id_fk
		foreign key (user_id) references users (id)
);

rename table message to messages;

