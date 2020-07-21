create table comments
(
	id bigint auto_increment,
	text TEXT null,
	comment_type varchar(16) null,
	user_id BIGINT null,
	project_id bigint null,
	created_at timestamp null,
	constraint comment_pk
		primary key (id),
	constraint comment_projects_id_fk
		foreign key (project_id) references projects (id),
	constraint comment_users_id_fk
		foreign key (user_id) references users (id)
);


alter table comments
	add message_id bigint null;

alter table comments
	add constraint comments_messages_id_fk
		foreign key (message_id) references messages (id);

