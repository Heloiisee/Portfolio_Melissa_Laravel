--
-- PostgreSQL database dump
--

-- Dumped from database version 17.2
-- Dumped by pg_dump version 17.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: cache; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache (
    key character varying(255) NOT NULL,
    value text NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache OWNER TO postgres;

--
-- Name: cache_locks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cache_locks (
    key character varying(255) NOT NULL,
    owner character varying(255) NOT NULL,
    expiration integer NOT NULL
);


ALTER TABLE public.cache_locks OWNER TO postgres;

--
-- Name: certifications; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.certifications (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    icon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.certifications OWNER TO postgres;

--
-- Name: certifications_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.certifications_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.certifications_id_seq OWNER TO postgres;

--
-- Name: certifications_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.certifications_id_seq OWNED BY public.certifications.id;


--
-- Name: educations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.educations (
    id bigint NOT NULL,
    titre character varying(255) NOT NULL,
    etablissement character varying(255) NOT NULL,
    date_debut date NOT NULL,
    date_fin date,
    description text,
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.educations OWNER TO postgres;

--
-- Name: educations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.educations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.educations_id_seq OWNER TO postgres;

--
-- Name: educations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.educations_id_seq OWNED BY public.educations.id;


--
-- Name: failed_jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.failed_jobs (
    id bigint NOT NULL,
    uuid character varying(255) NOT NULL,
    connection text NOT NULL,
    queue text NOT NULL,
    payload text NOT NULL,
    exception text NOT NULL,
    failed_at timestamp(0) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE public.failed_jobs OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.failed_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.failed_jobs_id_seq OWNER TO postgres;

--
-- Name: failed_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.failed_jobs_id_seq OWNED BY public.failed_jobs.id;


--
-- Name: job_batches; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.job_batches (
    id character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    total_jobs integer NOT NULL,
    pending_jobs integer NOT NULL,
    failed_jobs integer NOT NULL,
    failed_job_ids text NOT NULL,
    options text,
    cancelled_at integer,
    created_at integer NOT NULL,
    finished_at integer
);


ALTER TABLE public.job_batches OWNER TO postgres;

--
-- Name: jobs; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.jobs (
    id bigint NOT NULL,
    queue character varying(255) NOT NULL,
    payload text NOT NULL,
    attempts smallint NOT NULL,
    reserved_at integer,
    available_at integer NOT NULL,
    created_at integer NOT NULL
);


ALTER TABLE public.jobs OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.jobs_id_seq OWNER TO postgres;

--
-- Name: jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.jobs_id_seq OWNED BY public.jobs.id;


--
-- Name: migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.migrations (
    id integer NOT NULL,
    migration character varying(255) NOT NULL,
    batch integer NOT NULL
);


ALTER TABLE public.migrations OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.migrations_id_seq OWNER TO postgres;

--
-- Name: migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.migrations_id_seq OWNED BY public.migrations.id;


--
-- Name: password_reset_tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.password_reset_tokens (
    email character varying(255) NOT NULL,
    token character varying(255) NOT NULL,
    created_at timestamp(0) without time zone
);


ALTER TABLE public.password_reset_tokens OWNER TO postgres;

--
-- Name: projects; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.projects (
    id bigint NOT NULL,
    titre character varying(255) NOT NULL,
    description text NOT NULL,
    image character varying(255),
    technologies character varying(255),
    url character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.projects OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.projects_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.projects_id_seq OWNER TO postgres;

--
-- Name: projects_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.projects_id_seq OWNED BY public.projects.id;


--
-- Name: sessions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sessions (
    id character varying(255) NOT NULL,
    user_id bigint,
    ip_address character varying(45),
    user_agent text,
    payload text NOT NULL,
    last_activity integer NOT NULL
);


ALTER TABLE public.sessions OWNER TO postgres;

--
-- Name: skills; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.skills (
    id bigint NOT NULL,
    nom character varying(255) NOT NULL,
    niveau integer DEFAULT 0 NOT NULL,
    icon character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.skills OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.skills_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.skills_id_seq OWNER TO postgres;

--
-- Name: skills_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.skills_id_seq OWNED BY public.skills.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id bigint NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    email_verified_at timestamp(0) without time zone,
    password character varying(255) NOT NULL,
    remember_token character varying(100),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone,
    is_admin boolean DEFAULT false NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: veilles; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.veilles (
    id bigint NOT NULL,
    titre character varying(255) NOT NULL,
    contenu text,
    source character varying(255),
    type character varying(255) DEFAULT 'lien'::character varying NOT NULL,
    image character varying(255),
    categorie character varying(255),
    created_at timestamp(0) without time zone,
    updated_at timestamp(0) without time zone
);


ALTER TABLE public.veilles OWNER TO postgres;

--
-- Name: veilles_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.veilles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.veilles_id_seq OWNER TO postgres;

--
-- Name: veilles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.veilles_id_seq OWNED BY public.veilles.id;


--
-- Name: certifications id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certifications ALTER COLUMN id SET DEFAULT nextval('public.certifications_id_seq'::regclass);


--
-- Name: educations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educations ALTER COLUMN id SET DEFAULT nextval('public.educations_id_seq'::regclass);


--
-- Name: failed_jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs ALTER COLUMN id SET DEFAULT nextval('public.failed_jobs_id_seq'::regclass);


--
-- Name: jobs id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs ALTER COLUMN id SET DEFAULT nextval('public.jobs_id_seq'::regclass);


--
-- Name: migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations ALTER COLUMN id SET DEFAULT nextval('public.migrations_id_seq'::regclass);


--
-- Name: projects id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects ALTER COLUMN id SET DEFAULT nextval('public.projects_id_seq'::regclass);


--
-- Name: skills id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills ALTER COLUMN id SET DEFAULT nextval('public.skills_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Name: veilles id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veilles ALTER COLUMN id SET DEFAULT nextval('public.veilles_id_seq'::regclass);


--
-- Data for Name: cache; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache (key, value, expiration) FROM stdin;
\.


--
-- Data for Name: cache_locks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cache_locks (key, owner, expiration) FROM stdin;
\.


--
-- Data for Name: certifications; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.certifications (id, nom, icon, created_at, updated_at) FROM stdin;
8	CSS3	fab fa-css3-alt	2025-04-09 18:55:31	2025-04-09 18:55:31
9	Charte graphique	fa-solid fa-palette	2025-04-09 18:55:58	2025-04-09 18:55:58
10	PHP	fab fa-php	2025-04-09 18:56:16	2025-04-09 18:56:16
11	SQL	fas fa-database	2025-04-09 18:56:36	2025-04-09 18:56:36
12	Git/GitHub	fab fa-git-alt	2025-04-09 18:57:02	2025-04-09 18:57:02
7	HTML5	fab fa-html5	2025-04-09 18:54:20	2025-04-09 19:09:51
\.


--
-- Data for Name: educations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.educations (id, titre, etablissement, date_debut, date_fin, description, created_at, updated_at) FROM stdin;
2	Lyc├®e public	LGT Faustin Fleret, Morne-├á-l'eau	2020-09-09	2023-06-16	Dipl├┤me du baccalaur├®at, avec mention	2025-04-09 20:35:24	2025-04-09 20:35:24
1	Coll├¿ge public	Coll├¿ge G├®n├®ral de Gaulle, Le Moule	2016-09-05	2020-06-19	Dipl├┤me national du brevet, avec mention	2025-04-09 20:27:59	2025-04-09 20:35:58
3	Lyc├®e public	LGT Baimbrigde, Les Abymes	2023-09-09	\N	BTS SIO - Services Informatiques aux Organisation, Option SLAM	2025-04-09 20:37:02	2025-04-09 20:37:02
\.


--
-- Data for Name: failed_jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.failed_jobs (id, uuid, connection, queue, payload, exception, failed_at) FROM stdin;
\.


--
-- Data for Name: job_batches; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.job_batches (id, name, total_jobs, pending_jobs, failed_jobs, failed_job_ids, options, cancelled_at, created_at, finished_at) FROM stdin;
\.


--
-- Data for Name: jobs; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.jobs (id, queue, payload, attempts, reserved_at, available_at, created_at) FROM stdin;
\.


--
-- Data for Name: migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.migrations (id, migration, batch) FROM stdin;
1	0001_01_01_000000_create_users_table	1
2	0001_01_01_000001_create_cache_table	1
3	0001_01_01_000002_create_jobs_table	1
4	2025_04_04_021058_create_projects_table	1
5	2025_04_04_235412_add_is_admin_to_users_table	1
6	2025_04_05_155008_create_veilles_table	1
7	2025_04_09_001830_create_certifications_table	2
8	2025_04_09_001928_create_skills_table	2
9	2025_04_09_182200_create_certifications_table	3
10	2025_04_09_191222_create_education_table	4
11	2025_04_09_194515_create_educations_table	5
\.


--
-- Data for Name: password_reset_tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.password_reset_tokens (email, token, created_at) FROM stdin;
\.


--
-- Data for Name: projects; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.projects (id, titre, description, image, technologies, url, created_at, updated_at) FROM stdin;
2	Lavage Auto	Un site qui permet d'avoir des prestations et services pour un lavage auto.	images/CCIhOvFDfQYyI2QFeDS2hWkhutbgwfZYNHkinYAE.png	HTML, CSS, JavaScript, PHP, SQL	https://github.com/Heloiisee/WashAuto	2025-04-09 11:38:29	2025-04-09 11:38:29
3	Biblioth├¿que de jeux	Une application web pour g├®rer une biblioth├¿que de jeux.	images/s6mTKqDqgjuHhhnBHVfkjNfMVtsBYKK2PliybvOC.png	C#, PostgreSQL	storage/pdfs/i4LLarCAuguZhP5p4mzgpuVa366SuqjyfhFy3c5I.pdf	2025-04-09 11:40:44	2025-04-09 11:40:44
5	D├®ploiement de GLPI via Docker avec MySQL	D├®ploiement dÔÇÖun environnement de gestion de parc informatique bas├® sur GLPI, conteneuris├® avec Docker.\r\nLe projet utilise un conteneur pour le serveur web PHP/Apache, un autre pour la base de donn├®es MySQL, et int├¿gre une configuration personnalis├®e de PHP pour r├®pondre aux exigences de GLPI.	images/jawwjLcxwRNKj7DcaIs2rGKoL7aSLvGqz7zWfZSE.png	MySQL, Docker, PHP/Apache, Terminal	https://github.com/Heloiisee/glpi-postgres	2025-04-09 11:43:33	2025-04-09 11:43:33
4	A├»chi	Une application pour la gestion des produits sur A├»chi.	images/OaMKpK47TBPYPZ49AsptUnBveGg2b8caewid36Qk.png	C#, SQL	https://github.com/Heloiisee/Projet_Aichi	2025-04-09 11:41:58	2025-04-11 19:32:48
1	Bookly	Bookly est un petit site web qui permet de g├®rer sa biblioth├¿que personnelle.	images/FtyFAhe7MwFz9ccjObA720hfQe1AEoAzyPgYfWfI.png	HTML, CSS, PostgreSQL, PHP(Laravel)	https://github.com/Heloiisee/ReadMe	2025-04-09 11:21:13	2025-04-25 04:05:05
\.


--
-- Data for Name: sessions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sessions (id, user_id, ip_address, user_agent, payload, last_activity) FROM stdin;
sQnQDVeJ7Me0PtZdoHeXEoyGTMLe2BGWhxU5q8D8	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiT1NjaFBHbTFQZ21HWXNvdmlBRFRqT243N0pWdldiSHNNOGVqcTU3YSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227303
qTNiedHVuccn0HFYlxQyYLXj4rU7kkVvcrFH5Oba	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiSVB6NEVmUkc5OXRXSnBzUjNiYzBzQXRmTU1MVGE2T3g3ZDVJZzYyNCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czozOiJ1cmwiO2E6MDp7fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0L3Byb2pldHMiO319	1745553916
7QLyuxO6E6KYik6Bcfi6e8MLc3a4Y7wGiDeTeqo4	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQkVSNG14NmlKZ3ZpWGdVcWxuTFdBVE9rQWdZQ1preFIxUXMyaG1OSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1745585844
1qBJ4UQn4X57yfQdhAg9GDJPymaWO4m3EPGv3Iok	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUHNlWncyNVE4bTF5UTlmYU9hYXNub083N0NzUzBwd0VsSGZtaThFSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1744736361
MHd0PSy5nnx8l2GHL4uraPxGDHuZYlVq3mvG6gDc	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiNWs2SVRDTlVWU2RPQ1RXYTBiNTdSMDNjYmphd2Y4UmhPSHl2YWFScSI7czozOiJ1cmwiO2E6MTp7czo4OiJpbnRlbmRlZCI7czoyOToiaHR0cHM6Ly9wb3J0Zm9saW9tLnRlc3QvYWRtaW4iO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1744736426
gxnEaFqCNqNyFiFzDtm4MBDrzdzDVu52ClmX9Wtw	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiTmN2WEdjU0dLN3hrTDd6S1BHa05Va29WcUdjbHgzcVVDem81RHkxbCI7czozOiJ1cmwiO2E6MDp7fXM6OToiX3ByZXZpb3VzIjthOjE6e3M6MzoidXJsIjtzOjMxOiJodHRwczovL3BvcnRmb2xpb20udGVzdC9jb250YWN0Ijt9czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9	1744738208
k117zZZnYirrN1Iu2LDvlxXFzSf5lEdEQXmeBoZ3	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoiQjdSWTRUdktXSWhqSlgzdmZKM3k5VTBDVWJDNVJQWHVCVmExdldmRCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1744745664
Iw4lBQw4z5hMXAJd3OqypVFb2Xjgycv6DK8Vm8VW	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZWJ0TnBQS3pVckZSYU5MN2c0ZGxmZkx5SUF0REhWR2hlWlJiN3FWeiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1744758416
j9cmW84Xv0dYIkyXRdm8IY21dKpPFx7oeZBCSJ7r	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ2g3M25ZQ280R1ZiVGcyeGl3TEJLY3Q1YzA2V1BsUVlQSEI1Wk9aRyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1744766663
KogLpXTBxmyoU1BrhtJEUWT5s1pRYzAk6ByIgDO7	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.0 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTN1QkdtN2ZxRzZEbnpvSTdwOWN0Nm5GS1EzMDBRRG1pa3VNRWNPdSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1744894333
J6JJXX3NEL0fQV2nLAfjftofGZCnDTqeGw4HaQaz	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiVUFiM1pXb1BWV0x3Qnl3SGZwUXBjM2xMd0g1UmFwanRKNGpCeGFveSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1744894429
KwjLaWwPQqmAv5bzGXH37KsoMOFFG28xum1yjr4V	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiYkpjajg1TVJOOEJoQUtzWWtIcHRoNkhNT1ZOZlpNakk2RFJRcmVESiI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0L3Byb3BvcyI7fX0=	1744895012
oG5dWISLJLL5sizY7NkvBZ2c0q421P67n6HbO2ud	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0	YTo1OntzOjY6Il90b2tlbiI7czo0MDoiVWg0bVppVm1TVzRjSGp6aW1ENkZyS0RYZzlOTHZDbFBsUWptUldCcyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0L3Byb3BvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=	1745333587
q8jNeW2ZUDh2McKmfAC1NY4mvv1t37CxJ9yKRpav	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:137.0) Gecko/20100101 Firefox/137.0	YTozOntzOjY6Il90b2tlbiI7czo0MDoiRHBwamM0TnQwUmtjM1dRcXNwdUV3VDF1Z1F1STZZWEtWSjQ3NW5nNyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzE6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0L3ZlaWxsZXMiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1745342160
nGsPD8tSaOJcnFpKvaXtAs7TYG7laPEPCgGB9NoA	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoiWnRXclN5dXI1QzlFcHlQUWlUVzlmdTlkWlZscmVISWt3dWFQVjg3dCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1745544230
RicsnlxQt9QKqPTRRZqAEd8nuruxjyBIgj9aqp4F	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ0JCMEJEUHNnbUtrbnBxNFhSWnpMYVVuQnFYcEZwMjNmemQ2TEZsUiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1745553821
tPDvycEibL6f2Gz2RCOlIjthWShYmpLnxIAzm6CB	1	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:138.0) Gecko/20100101 Firefox/138.0	YTo1OntzOjY6Il90b2tlbiI7czo0MDoieGtjdHg5ejIxT3lpNVVwVWdqcjM4OVpoSVAxc3R0U1RRb1E3MXozSSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0L3Byb3BvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6MzoidXJsIjthOjA6e31zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=	1746224463
BzSrSVQOs74OygTjzJrB2okKMPYH7U8b92Mhi281	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQW92TmNrSmJEcGs1WDlTcFRmek9oeGFCQWZLSjZXdVdjN1RYMHZFaiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227371
rjsbu1E1C2zficBWWRW8AXiVhiD87cprt0hgrqoq	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUVpiQkpzTTBqZE81OUlkWEtoNWZCcDRuOUtGNWFSclZpWks5OGVtViI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227372
ALGTpazYK03nIrlYmhLbm8SCUeMxRnpsV9Is9Qpx	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTlg3YkZuemxJZ0ljY0lyb2p4MFRyNDFwVVlUY1pUNmlpWGVUeW5DZSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227374
a9cUtIj2XEhVoXDHBn612XNloQ6EvPjOWS3h2pCH	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoid2lkN1F4RlJHczFjdWF1Y0dTcGtUNjJiTHJ1S1dWWWlhUEZETWZ0QSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227377
6zpzhHxDcLcibpbBk81wZQrqBUbMOXJSyDa5P0kn	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiM3pDeUxnMmhyWEE3OGNpV25XT0JBZlMxZ0V6c0NvTUtTR0RpSmI3YyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227428
iP5AqmOC8rsT3Av5TdykutqGnDc7p8UVyJGhMthv	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoib0puTktNMnV0c29lelJCeDdOMXhZejBsNFZoeklibHpYMXJzNU9KciI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227430
dFicwAq1gc23ns3sxesIDkD8Krouy1kEQUocebuG	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiZ1hXRGFKaUtJVGR5Vk4zbTFKUnVlU25yalJFR3hBMU1ab3hBdVNnQiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227433
kU6uT6BxXelZO2a4SnJyFhjGpx9aRls1Ls9pAHQO	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiekNSV0N0cTdoU2ExUnJSSkFVUWc0MWw0enpJRTRsbDBmTXR4aGtNOCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746227447
VWSyPd4OfjZ5GKa5nBlqeYfdapMcB63wFpwCjKgL	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiQm5nWFNJQUprd01JZkJFRGxIM3Z3UHQ1RTl6WEFWNTQ5NnJ5YnpuZyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MzA6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0L3Byb3BvcyI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fX0=	1746228013
tmhXO4oNCI2IhdUqTxymMUp4xN7Uo5yYsomIUhG7	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoieG1USFJUQk0xeFJrSkJGYmdHeHVCTDl1S1U0UUxpeTFuM1kwS1ZOSyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746229539
DY7VJwpUqSrKGlLbAjD0ZNty8zXnKbc6bqCIpzPf	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiSTJDdUVJVzRVZHpBMFd6aDliU2RwcGRvODBBcktOUldWRTAzeDBGVSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746299391
R5bOdtxHfCnEmOjzisKzubuuf86UfOJDcj31KyjG	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTjMyV1hvbnNIWG16OXFEU1ZPTTRqOVlqU2lpaFRaNU1pNGpORjZOMiI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746299398
GozhJte9syeXyZWajIJsHfrqEsjKSH1qZCSkvxgb	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/135.0.0.0 Safari/537.36	YToyOntzOjY6Il90b2tlbiI7czo0MDoickpwdlU2clY1bU05NEtjTTZwc2Q3dVppNXNlSktDNXI5cmxqT215NCI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==	1746299407
UMfaCJwYsbTNCC4v8hGmJEW9fwSarXakDtjoqFeh	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiclAwMWs3MDJNZ0tlbzhxR0xsakpERTBSZkViREE1cUxpeFd4aE5DbyI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746306373
WYbhuhUIAHkqQhzQSruplqI2gbYfB6X4NwLsxH9G	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoia3I4S3BKYXllVnF1ZXpNYU9kTGR1R0diVG1raFI1WFJMckVYeFI0aSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746307704
mvM4z9SW1XREDvf9e1uO489PBy6s4xWKuWlGbOyv	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiUjRKdVh1aWlMbXcxZDd0MGVsdEZRMmo1VklsWFpFTGVvTldLVGdLMSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746307711
CIzQhAVWjLVi08xEyt000rORY97qxahwmz3XLOO1	\N	127.0.0.1	Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Herd/1.19.1 Chrome/120.0.6099.291 Electron/28.2.5 Safari/537.36	YTozOntzOjY6Il90b2tlbiI7czo0MDoiTUtBMGduMml6OHQ1cUNhZndDSWpRTUJEdHZIOGZCUnZld1k3cVhFeCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mzc6Imh0dHBzOi8vcG9ydGZvbGlvbS50ZXN0Lz9oZXJkPXByZXZpZXciO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX19	1746307713
\.


--
-- Data for Name: skills; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.skills (id, nom, niveau, icon, created_at, updated_at) FROM stdin;
1	HTML5	80	fab fa-html5	2025-04-09 12:01:04	2025-04-09 12:01:04
2	CSS3	80	fab fa-css3-alt	2025-04-09 12:08:06	2025-04-09 12:08:06
5	SQL/PostgreSQL	70	fab fa-database	2025-04-09 12:10:23	2025-04-09 12:10:23
6	Bootstrap	70	fab fa-bootstrap	2025-04-09 12:11:05	2025-04-09 12:11:05
7	Git	65	fab fa-git-alt	2025-04-09 12:12:24	2025-04-09 12:12:24
3	JavaScript	55	fab fa-js	2025-04-09 12:08:44	2025-04-10 19:20:15
8	Sass	65	fab fa-sass	2025-04-10 19:21:50	2025-04-10 19:22:06
4	PHP/Laravel	60	fab fa-php	2025-04-09 12:09:23	2025-04-22 14:52:47
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, name, email, email_verified_at, password, remember_token, created_at, updated_at, is_admin) FROM stdin;
1	Melissa	heloiseguicheron71@gmail.com	\N	$2y$12$cTxuaypm.WwN8CH9w1ZZY.7Cd5DbwKdd6iB0NLZWXOaLdqFlZb5Gu	\N	2025-04-09 11:16:58	2025-04-09 11:16:58	f
\.


--
-- Data for Name: veilles; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.veilles (id, titre, contenu, source, type, image, categorie, created_at, updated_at) FROM stdin;
1	Grafikart	Cha├«ne YouTube sur un concentr├® du web autour du monde du d├®veloppement web et du graphisme...	https://www.youtube.com/@grafikart	lien	\N	chaine youtube	2025-05-02 21:09:27	2025-05-02 21:09:27
2	Edwin Parmentier	\N	https://www.linkedin.com/in/edwin-agence-web-marseille/	lien	\N	r├®seau social	2025-05-02 21:13:20	2025-05-02 21:13:20
3	Dribbble	Dribbble est un site internet qui regroupe des travaux de designer. Il sert de plate-forme de conception de portfolio, l'une des plus grandes plates-formes permettant aux concepteurs de partager leur travail en ligne. La soci├®t├® est enti├¿rement isol├®e, sans si├¿ge social.	https://dribbble.com/	lien	\N	site web	2025-05-02 21:40:56	2025-05-02 21:40:56
4	Css-Tricks	Css-Tricks est un site internet qui propose des astuces, des aides et des techniques pour des sites Web en CSS.	https://css-tricks.com/	lien	\N	site web	2025-05-02 21:42:04	2025-05-02 21:42:04
5	Huemint	Huemint utilise lÔÇÖapprentissage automatique pour cr├®er des sch├®mas de couleurs uniques pour votre marque, site Web ou graphique.	https://huemint.com/	lien	\N	site web	2025-05-02 21:43:20	2025-05-02 21:43:20
\.


--
-- Name: certifications_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.certifications_id_seq', 12, true);


--
-- Name: educations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.educations_id_seq', 3, true);


--
-- Name: failed_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.failed_jobs_id_seq', 1, false);


--
-- Name: jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.jobs_id_seq', 1, false);


--
-- Name: migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.migrations_id_seq', 11, true);


--
-- Name: projects_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.projects_id_seq', 5, true);


--
-- Name: skills_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.skills_id_seq', 8, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 1, true);


--
-- Name: veilles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.veilles_id_seq', 5, true);


--
-- Name: cache_locks cache_locks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache_locks
    ADD CONSTRAINT cache_locks_pkey PRIMARY KEY (key);


--
-- Name: cache cache_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cache
    ADD CONSTRAINT cache_pkey PRIMARY KEY (key);


--
-- Name: certifications certifications_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.certifications
    ADD CONSTRAINT certifications_pkey PRIMARY KEY (id);


--
-- Name: educations educations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.educations
    ADD CONSTRAINT educations_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_pkey PRIMARY KEY (id);


--
-- Name: failed_jobs failed_jobs_uuid_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.failed_jobs
    ADD CONSTRAINT failed_jobs_uuid_unique UNIQUE (uuid);


--
-- Name: job_batches job_batches_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.job_batches
    ADD CONSTRAINT job_batches_pkey PRIMARY KEY (id);


--
-- Name: jobs jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.jobs
    ADD CONSTRAINT jobs_pkey PRIMARY KEY (id);


--
-- Name: migrations migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.migrations
    ADD CONSTRAINT migrations_pkey PRIMARY KEY (id);


--
-- Name: password_reset_tokens password_reset_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.password_reset_tokens
    ADD CONSTRAINT password_reset_tokens_pkey PRIMARY KEY (email);


--
-- Name: projects projects_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.projects
    ADD CONSTRAINT projects_pkey PRIMARY KEY (id);


--
-- Name: sessions sessions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sessions
    ADD CONSTRAINT sessions_pkey PRIMARY KEY (id);


--
-- Name: skills skills_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.skills
    ADD CONSTRAINT skills_pkey PRIMARY KEY (id);


--
-- Name: users users_email_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_unique UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: veilles veilles_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.veilles
    ADD CONSTRAINT veilles_pkey PRIMARY KEY (id);


--
-- Name: jobs_queue_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX jobs_queue_index ON public.jobs USING btree (queue);


--
-- Name: sessions_last_activity_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_last_activity_index ON public.sessions USING btree (last_activity);


--
-- Name: sessions_user_id_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX sessions_user_id_index ON public.sessions USING btree (user_id);


--
-- PostgreSQL database dump complete
--

