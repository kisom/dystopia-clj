Alright, below is what I came up with today.  Feel free to look it
over and mock my work.  I tried to comment things so you could see
what I was doing, but if I wasn't helpful and you want more background
let me know.



##DISCLAIMER: I did all of this in a text editor, I have not tested
any of this in Postgre as I do not have an easily accessible copy
running right now, it SHOULD be correct.  If you run into any issues
you can't handle let me know and I'll work it out.  This is also a
fairly simple setup, I am sure your own project will grow more complex
as you work on it.


##SQL BELOW


create table books
(
id integer unique,
title varchar(150) not null,
author_id integer, -- foreign key for the authors table
publish_date, -- leaving nullable in case the data is unavailable
summary text, --text is just a infinite length character object, you
didn't mention needing a summary, but I figured this field could be
handy
constraint books_id_pk primary key(id) --you need to name your primary
key constraint, you will likely never need to access it by name
);

--unique int based primary keys are pretty much always the best choice
for speed, I also like to keep my pk separate from any meaninful value
in case that value has to change
--you could add a lot more values to this table depending on the
amount of metadata wanted.  if you wanted a ton of possible values
there are more complex, but less rigid schemes, we can talk about it
later if you like

create table authors
(
id integer unique,
name varchar(150) not null,
constraint authors_id_pk primary key(id)
);

create table tags
(
id integer unique,
name varchar(30) not null,
constraint tags_id_pk primary key(id)
);

create table formats
(
id integer unique,
name varchar(30) not null,
ext varchar(10), --leaving this nullable in case some formats don't
have a enforcable file extention, not sure if this column is even
valuable, I just see some possible uses
constraint tags_id_pk primary key(id)
);

--i didn't create it, but if you found it useful we could also make a
devices table and then a device_formats table that could associate
formats and devices.  That way you could programatically filter all
incompatible formats for a user.  Just an idea for mater.


create table book_tags  --this is a table to associate the tags and books tables
(
id integer unique,
book_id integer not null,
tag_id integer not null,
constraint book_tags_id_pk primary key(id)
);

create table author_tags --this is a table to associate the tags and
authors tables
(
id integer unique,
author_id integer not null,
tag_id integer not null,
constraint author_tags_id_pk primary key(id)
);

create table book_formats  --this is a table to associate the formats
and books tables
(
id integer unique,
book_id integer not null,
format_id integer not null,
constraint book_formats_id_pk primary key(id)
);

create table users
(
id integer unique,
name varchar(100) not null,
email varchar(200) not null,
pwd_hash char(100) not null, --i just chose 100 byte as a placeholder
that could hold something like a SHA-512 hash in base64, this is
totally up to you.
constraint users_id_pk primary key(id)
);

--There are a lot more values that can be added to the users table, I
am not sure what you plan to do with it
--I am intentionally leaving off the auth table(s) for now as that is
a different discussion

--FOREIGN KEYS , yes they are repetitive

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
ADD CONSTRAINT book_tags_book_fk
FOREIGN KEY (tag_id) REFERENCES tags (id);

ALTER TABLE author_tags
ADD CONSTRAINT author_tags_author_fk
FOREIGN KEY (author_id) REFERENCES authors (id);

ALTER TABLE author_tags
ADD CONSTRAINT author_tags_author_fk
FOREIGN KEY (tag_id) REFERENCES tags (id);

ALTER TABLE book_formats
ADD CONSTRAINT book_formats_book_fk
FOREIGN KEY (book_id) REFERENCES books (id);

ALTER TABLE book_formats
ADD CONSTRAINT book_formats_format_fk
FOREIGN KEY (format_id) REFERENCES formats (id);


--SAMPLE DATA INSERTS

insert into authors (id,name) values (1,'Zod');

insert into authors (id,name) values (2,'Kisom');

insert into books (id,title,) values (1,'Zodography: Life and Times of
General Zod',1,now,'awesome book of Zod');

insert into books (id,title,) values (2,'Cooking with
Zod',1,now,'awesome cookbook by Zod');

insert into books (id,title,) values (3,'Africa sucks: a Guide by
Kisom',2,now,'awesome tour guide book by Kisom');

insert into tags (id,name) values (1,'Biography');

insert into tags (id,name) values (2,'Culinary');

insert into tags (id,name) values (3,'1337');

insert into tags (id,name) values (4,'not so 1337');

insert into formats (id,name,ext) values (1,'Text','TXT');

insert into formats (id,name,ext) values (2,'EPub','epub');

insert into formats (id,name,ext) values (3,'Mobi','mobi');

insert into formats (id,name,ext) values (4,'PDF','PDF');

insert into book_tags (id,book_id,tag_id) values (1,1,1);

insert into book_tags (id,book_id,tag_id) values (2,1,3);

insert into book_tags (id,book_id,tag_id) values (3,2,2);

insert into book_tags (id,book_id,tag_id) values (4,2,4);

insert into author_tags (id,author_id,tag_id) values (1,1,3);

insert into author_tags (id,author_id,tag_id) values (2,2,4);

insert into book_formats (id,book_id,format_id) values (1,1,2);

insert into book_formats (id,book_id,format_id) values (2,2,4);

insert into book_formats (id,book_id,format_id) values (3,3,3);

insert into users (id,name,email,pw_hash) values
(1,'Zod','zod@ohmyzod.net','sQnzu7wkTrgkQZF+0G1hi5AI3Qmzvv0bXgc5THBqi7mAsdd4Xll27ASbRt9fEyavWi6m0QP9B8lThf+rDKy8hg==');

insert into users (id,name,email,pw_hash) values
(1,'Kisom','kyle@beyerdynamicsanonymous.com','8/ODQE/sJ/Zsi3HIB5ujCsmKAkW7Jds1jXE85q33qRa1zvgMrqvaUgwViK4ouaOJiDeljUTs82HZ7Nf0s3gkUw==');



--SAMPLE QUERIES

select
*
from
books a
inner join authors b on a.author_id = b.id
where
lower(b.name) = 'zod'

--search by author name

select
*
from
books a
inner join authors b on a.author_id = b.id
inner join author_tags c on b.id = c.author_id
inner join tags d on c.tag_id = d.id
where
lower(d.name) = '1337'

--search by author tag

select
*
from
books a
inner join authors b on a.author_id = b.id
inner join book_tags c on b.id = c.book_id
inner join tags d on c.tag_id = d.id
where
lower(d.name) = 'biography'

--search by book tag

select
*
from
books a
inner join authors b on a.author_id = b.id
inner join book_formats c on b.id = c.book_id
inner join formats d on c.format_id = d.id
where
lower(d.ext) = 'pdf'

--search by format ext

