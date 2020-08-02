create table todos
(
	id bigint auto_increment,
	description varchar(256) null,
	assigned_to bigint null,
	due_date timestamp null,
	done boolean null,
	created_by bigint null,
	created_at timestamp null,
	constraint todos_pk
		primary key (id),
	constraint todos_users_id_fk
		foreign key (assigned_to) references users (id),
	constraint todos_users_id_fk_2
		foreign key (created_by) references users (id)
);


alter table todos
	add project_id bigint null;

alter table todos
	add constraint todos_projects_id_fk
		foreign key (project_id) references projects (id);


alter table comments
	add comment_id bigint null;

alter table comments
	add constraint comments_comments_id_fk
		foreign key (comment_id) references comments (id);


alter table comments change comment_id todo_id bigint null;

alter table comments drop foreign key comments_comments_id_fk;

alter table comments
	add constraint comments_todos_id_fk
		foreign key (todo_id) references todos (id);


alter table todos
	add notes text null;







