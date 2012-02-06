--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

--
-- Name: dystopia_db; Type: DATABASE; Schema: -; Owner: dystadm
--

CREATE DATABASE dystopia_db WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'en_US.UTF-8' LC_CTYPE = 'en_US.UTF-8';
CREATE ROLE dystadm LOGIN PASSWORD 'test_admin';
CREATE ROLE dystusr LOGIN PASSWORD 'test_user';


ALTER DATABASE dystopia_db OWNER TO dystadm;

\connect dystopia_db

SET statement_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = off;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET escape_string_warning = off;

SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: author_tags; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE author_tags (
    id integer NOT NULL,
    author_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.author_tags OWNER TO dystadm;

--
-- Name: author_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE author_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.author_tags_id_seq OWNER TO dystadm;

--
-- Name: author_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('author_tags_id_seq', 1, false);


--
-- Name: authors; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE authors (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.authors OWNER TO dystadm;

--
-- Name: authors_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE authors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.authors_id_seq OWNER TO dystadm;

--
-- Name: authors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('authors_id_seq', 1, false);


--
-- Name: book_formats; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE book_formats (
    id integer NOT NULL,
    book_id integer NOT NULL,
    format_id integer NOT NULL,
    filehash character varying(64) NOT NULL
);


ALTER TABLE public.book_formats OWNER TO dystadm;

--
-- Name: book_formats_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE book_formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.book_formats_id_seq OWNER TO dystadm;

--
-- Name: book_formats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('book_formats_id_seq', 1, false);


--
-- Name: book_tags; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE book_tags (
    id integer NOT NULL,
    book_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.book_tags OWNER TO dystadm;

--
-- Name: book_tags_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE book_tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.book_tags_id_seq OWNER TO dystadm;

--
-- Name: book_tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('book_tags_id_seq', 1, false);


--
-- Name: books; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(150) NOT NULL,
    author_id integer,
    publish_date date,
    summary text
);


ALTER TABLE public.books OWNER TO dystadm;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO dystadm;

--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('books_id_seq', 1, false);


--
-- Name: formats; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE formats (
    id integer NOT NULL,
    name character varying(30) NOT NULL,
    ext character varying(10)
);


ALTER TABLE public.formats OWNER TO dystadm;

--
-- Name: formats_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE formats_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.formats_id_seq OWNER TO dystadm;

--
-- Name: formats_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('formats_id_seq', 1, false);


--
-- Name: tags; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE tags (
    id integer NOT NULL,
    name character varying(64) NOT NULL
);


ALTER TABLE public.tags OWNER TO dystadm;

--
-- Name: tags_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE tags_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.tags_id_seq OWNER TO dystadm;

--
-- Name: tags_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('tags_id_seq', 1, false);


--
-- Name: users; Type: TABLE; Schema: public; Owner: dystadm; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    name character varying(100) NOT NULL,
    email character varying(200) NOT NULL,
    pwd_hash character(64) NOT NULL,
    admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO dystadm;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dystadm
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MAXVALUE
    NO MINVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO dystadm;

--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dystadm
--

SELECT pg_catalog.setval('users_id_seq', 1, false);


--
-- Data for Name: author_tags; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY author_tags (id, author_id, tag_id) FROM stdin;
\.


--
-- Data for Name: authors; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY authors (id, name) FROM stdin;
\.


--
-- Data for Name: book_formats; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY book_formats (id, book_id, format_id, filehash) FROM stdin;
\.


--
-- Data for Name: book_tags; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY book_tags (id, book_id, tag_id) FROM stdin;
\.


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY books (id, title, author_id, publish_date, summary) FROM stdin;
\.


--
-- Data for Name: formats; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY formats (id, name, ext) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY tags (id, name) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dystadm
--

COPY users (id, name, email, pwd_hash, admin) FROM stdin;
\.


--
-- Name: author_tags_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY author_tags
    ADD CONSTRAINT author_tags_id_pk PRIMARY KEY (id);


--
-- Name: authors_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY authors
    ADD CONSTRAINT authors_id_pk PRIMARY KEY (id);


--
-- Name: book_formats_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY book_formats
    ADD CONSTRAINT book_formats_id_pk PRIMARY KEY (id);


--
-- Name: book_tags_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY book_tags
    ADD CONSTRAINT book_tags_id_pk PRIMARY KEY (id);


--
-- Name: books_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_id_pk PRIMARY KEY (id);


--
-- Name: formats_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY formats
    ADD CONSTRAINT formats_id_pk PRIMARY KEY (id);


--
-- Name: tags_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY tags
    ADD CONSTRAINT tags_id_pk PRIMARY KEY (id);


--
-- Name: users_id_pk; Type: CONSTRAINT; Schema: public; Owner: dystadm; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_id_pk PRIMARY KEY (id);


--
-- Name: author_tags_author_fk; Type: FK CONSTRAINT; Schema: public; Owner: dystadm
--

ALTER TABLE ONLY author_tags
    ADD CONSTRAINT author_tags_author_fk FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- Name: book_author_fk; Type: FK CONSTRAINT; Schema: public; Owner: dystadm
--

ALTER TABLE ONLY books
    ADD CONSTRAINT book_author_fk FOREIGN KEY (author_id) REFERENCES authors(id);


--
-- Name: book_formats_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: dystadm
--

ALTER TABLE ONLY book_formats
    ADD CONSTRAINT book_formats_book_fk FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: book_formats_format_fk; Type: FK CONSTRAINT; Schema: public; Owner: dystadm
--

ALTER TABLE ONLY book_formats
    ADD CONSTRAINT book_formats_format_fk FOREIGN KEY (format_id) REFERENCES formats(id);


--
-- Name: book_tags_book_fk; Type: FK CONSTRAINT; Schema: public; Owner: dystadm
--

ALTER TABLE ONLY book_tags
    ADD CONSTRAINT book_tags_book_fk FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: book_tags_tag_fk; Type: FK CONSTRAINT; Schema: public; Owner: dystadm
--

ALTER TABLE ONLY book_tags
    ADD CONSTRAINT book_tags_tag_fk FOREIGN KEY (book_id) REFERENCES books(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- Name: author_tags; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE author_tags FROM PUBLIC;
REVOKE ALL ON TABLE author_tags FROM dystadm;
GRANT ALL ON TABLE author_tags TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE author_tags TO dystusr;


--
-- Name: authors; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE authors FROM PUBLIC;
REVOKE ALL ON TABLE authors FROM dystadm;
GRANT ALL ON TABLE authors TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE authors TO dystusr;


--
-- Name: book_formats; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE book_formats FROM PUBLIC;
REVOKE ALL ON TABLE book_formats FROM dystadm;
GRANT ALL ON TABLE book_formats TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE book_formats TO dystusr;


--
-- Name: book_tags; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE book_tags FROM PUBLIC;
REVOKE ALL ON TABLE book_tags FROM dystadm;
GRANT ALL ON TABLE book_tags TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE book_tags TO dystusr;


--
-- Name: books; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE books FROM PUBLIC;
REVOKE ALL ON TABLE books FROM dystadm;
GRANT ALL ON TABLE books TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE books TO dystusr;


--
-- Name: formats; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE formats FROM PUBLIC;
REVOKE ALL ON TABLE formats FROM dystadm;
GRANT ALL ON TABLE formats TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE formats TO dystusr;


--
-- Name: tags; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE tags FROM PUBLIC;
REVOKE ALL ON TABLE tags FROM dystadm;
GRANT ALL ON TABLE tags TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE tags TO dystusr;


--
-- Name: users; Type: ACL; Schema: public; Owner: dystadm
--

REVOKE ALL ON TABLE users FROM PUBLIC;
REVOKE ALL ON TABLE users FROM dystadm;
GRANT ALL ON TABLE users TO dystadm;
GRANT SELECT,INSERT,DELETE,UPDATE ON TABLE users TO dystusr;


--
-- PostgreSQL database dump complete
--

