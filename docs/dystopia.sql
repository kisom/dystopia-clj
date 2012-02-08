-- SQL for dystopia
-- meant to be loaded into postgres by the postgres superuser

-- add user
-- node is not allowed to manage the database
-- dystadm is used to manage the database, but should be restricted to local
-- 	access only in pg_hba.conf
create user node password '';	-- get passwords from apg, fill in before running
create role dystadm login password '';


-- setup permissions
revoke all from node;      --start with a clean slate
grant select from node;
grant insert from node;
grant update from node;
grant delete from node;
grant connect from node;
grant all from dystadm;    -- the god user

-- tables
create table books
(
    id integer unique,
    title varchar(150) not null,
	entrydate timestamp without timezone default now(),
    author_id integer,
    tag_id integer,
	format_id integer,
    publish_date date,
    summary text,
    constraint books_id_pk primary key (id)
);

create table authors
(
    id integer unique,
    name varchar(150) not null,
    constraint authors_id_pk primary key (id)
);

create table tags
(
    id integer unique,
    name varchar(64) not null,
    constraint tags_id_pk primary key (id)
);

create table formats
(
    id integer unique,
    name varchar(30) not null,
    ext varchar(10),
    constraint formats_id_pk primary key (id)
);

create table book_tags
(
    id integer unique,
    book_id integer not null,
    tag_id integer not null,
    constraint book_tags_id_pk primary key (id)
);

create table author_tags
(
    id integer unique,
    author_id integer not null,
    tag_id integer not null,
    constraint author_tags_id_pk primary key (id)
);

create table book_formats
(
    id integer unique,
    book_id integer not null,
    format_id integer not null,
    filehash varchar(64) not null,
    constraint book_formats_id_pk primary key (id)
);


-- this will probably need to be altered to support OpenID
create table users
(
    id integer unique,
    name varchar(100) not null,
    email varchar(200) not null,
    pwd_hash char(64) not null,
    constraint users_id_pk primary key (id)
);


-- sequences
create sequence books_id_seq start 1;
create sequence authors_id_seq start 1;
create sequence tags_id_seq start 1;
create sequence formats_id_seq start 1;
create sequence book_tags_id_seq start 1;
create sequence author_tags_id_seq start 1;
create sequence book_formats_id_seq start 1;
create sequence users_id_seq start 1;


-- foreign keys
ALTER TABLE books
    ADD CONSTRAINT book_author_fk
    FOREIGN KEY (author_id) REFERENCES authors (id);

ALTER TABLE book_tags
    ADD CONSTRAINT book_tags_book_fk
    FOREIGN KEY (book_id) REFERENCES books (id);

ALTER TABLE book_tags
    ADD CONSTRAINT book_tags_tag_fk
    FOREIGN KEY (book_id) REFERENCES books (id);

ALTER TABLE book_tags
    ADD CONSTRAINT book_tags_tag_fk
    FOREIGN KEY (tag_id) REFERENCES tags (id);

ALTER TABLE author_tags
    ADD CONSTRAINT author_tags_author_fk
    FOREIGN KEY (author_id) REFERENCES authors (id);

ALTER TABLE author_tags
    ADD CONSTRAINT author_tags_tag_fk
    FOREIGN KEY (tag_id) REFERENCES tags (id);

ALTER TABLE book_formats
    ADD CONSTRAINT book_formats_book_fk
    FOREIGN KEY (book_id) REFERENCES books (id);

ALTER TABLE book_formats
    ADD CONSTRAINT book_formats_format_fk
    FOREIGN KEY (format_id) REFERENCES formats (id);

