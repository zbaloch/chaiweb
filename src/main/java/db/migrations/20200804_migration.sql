create table notifications
(
	id bigint auto_increment,
	for_user bigint null,
	type varchar(64) null,
	object_id bigint null,
	created_at timestamp null,
	`read` boolean null,
	read_at timestamp null,
	constraint notifications_pk
		primary key (id)
);

alter table notifications
	add message varchar(512) null;

alter table notifications
	add from_user bigint null;

alter table notifications
	add constraint notifications_users_id_fk
		foreign key (for_user) references users (id);

alter table notifications
	add constraint notifications_users_id_fk_2
		foreign key (from_user) references users (id);

alter table notifications change `read` is_read tinyint(1) null;


alter table projects
	add status VARCHAR(16) null;

alter table todos
	add status VARCHAR(16) null;

alter table messages
	add status varchar(16) null;

alter table comments
	add status varchar(16) null;




