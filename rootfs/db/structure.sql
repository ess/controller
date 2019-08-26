--
-- PostgreSQL database dump
--

-- Dumped from database version 11.2
-- Dumped by pg_dump version 11.2

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_app; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_app (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    id character varying(63),
    structure text NOT NULL,
    owner_id integer NOT NULL,
    procfile_structure text NOT NULL
);


ALTER TABLE public.api_app OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_appsettings; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_appsettings (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    maintenance boolean,
    routable boolean,
    app_id uuid NOT NULL,
    owner_id integer NOT NULL,
    whitelist character varying(50)[] NOT NULL,
    autoscale text NOT NULL,
    label text NOT NULL
);


ALTER TABLE public.api_appsettings OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_build; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_build (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    image text NOT NULL,
    sha character varying(40) NOT NULL,
    procfile text NOT NULL,
    dockerfile text NOT NULL,
    app_id uuid NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_build OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_certificate; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_certificate (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    certificate text NOT NULL,
    key text NOT NULL,
    common_name text,
    expires timestamp with time zone NOT NULL,
    owner_id integer NOT NULL,
    fingerprint character varying(96) NOT NULL,
    name character varying(253) NOT NULL,
    san character varying(253)[],
    issuer text NOT NULL,
    starts timestamp with time zone NOT NULL,
    subject text NOT NULL
);


ALTER TABLE public.api_certificate OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_certificate_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.api_certificate_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_certificate_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_certificate_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.api_certificate_id_seq OWNED BY public.api_certificate.id;


--
-- Name: api_config; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_config (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    "values" text NOT NULL,
    memory text NOT NULL,
    cpu text NOT NULL,
    tags text NOT NULL,
    app_id uuid NOT NULL,
    owner_id integer NOT NULL,
    registry text NOT NULL,
    healthcheck text NOT NULL,
    lifecycle_post_start text NOT NULL,
    lifecycle_pre_stop text NOT NULL,
    termination_grace_period text NOT NULL
);


ALTER TABLE public.api_config OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_domain; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_domain (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    domain text NOT NULL,
    app_id uuid NOT NULL,
    owner_id integer NOT NULL,
    certificate_id integer
);


ALTER TABLE public.api_domain OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_domain_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.api_domain_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_domain_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_domain_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.api_domain_id_seq OWNED BY public.api_domain.id;


--
-- Name: api_key; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_key (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    id character varying(128) NOT NULL,
    public text NOT NULL,
    fingerprint character varying(128) NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_key OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_release; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_release (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    version integer NOT NULL,
    summary text,
    app_id uuid NOT NULL,
    build_id uuid,
    config_id uuid NOT NULL,
    owner_id integer NOT NULL,
    failed boolean NOT NULL,
    exception text,
    CONSTRAINT api_release_version_check CHECK ((version >= 0))
);


ALTER TABLE public.api_release OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_service; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_service (
    id integer NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    procfile_type text NOT NULL,
    path_pattern text NOT NULL,
    app_id uuid NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_service OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_service_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.api_service_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_service_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: api_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.api_service_id_seq OWNED BY public.api_service.id;


--
-- Name: api_tls; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.api_tls (
    uuid uuid NOT NULL,
    created timestamp with time zone NOT NULL,
    updated timestamp with time zone NOT NULL,
    https_enforced boolean,
    app_id uuid NOT NULL,
    owner_id integer NOT NULL
);


ALTER TABLE public.api_tls OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(80) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.auth_group_permissions (
    id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(30) NOT NULL,
    last_name character varying(30) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.auth_user_groups (
    id integer NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.auth_user_user_permissions (
    id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: authtoken_token; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.authtoken_token (
    key character varying(40) NOT NULL,
    created timestamp with time zone NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.authtoken_token OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.django_migrations (
    id integer NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.django_migrations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: guardian_groupobjectpermission; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.guardian_groupobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.guardian_groupobjectpermission OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.guardian_groupobjectpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_groupobjectpermission_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: guardian_groupobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.guardian_groupobjectpermission_id_seq OWNED BY public.guardian_groupobjectpermission.id;


--
-- Name: guardian_userobjectpermission; Type: TABLE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE TABLE public.guardian_userobjectpermission (
    id integer NOT NULL,
    object_pk character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    permission_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.guardian_userobjectpermission OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE SEQUENCE public.guardian_userobjectpermission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.guardian_userobjectpermission_id_seq OWNER TO "DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D";

--
-- Name: guardian_userobjectpermission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER SEQUENCE public.guardian_userobjectpermission_id_seq OWNED BY public.guardian_userobjectpermission.id;


--
-- Name: api_certificate id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_certificate ALTER COLUMN id SET DEFAULT nextval('public.api_certificate_id_seq'::regclass);


--
-- Name: api_domain id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_domain ALTER COLUMN id SET DEFAULT nextval('public.api_domain_id_seq'::regclass);


--
-- Name: api_service id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_service ALTER COLUMN id SET DEFAULT nextval('public.api_service_id_seq'::regclass);


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: guardian_groupobjectpermission id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_groupobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_groupobjectpermission_id_seq'::regclass);


--
-- Name: guardian_userobjectpermission id; Type: DEFAULT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_userobjectpermission ALTER COLUMN id SET DEFAULT nextval('public.guardian_userobjectpermission_id_seq'::regclass);


--
-- Name: api_app api_app_id_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_app
    ADD CONSTRAINT api_app_id_key UNIQUE (id);


--
-- Name: api_app api_app_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_app
    ADD CONSTRAINT api_app_pkey PRIMARY KEY (uuid);


--
-- Name: api_appsettings api_appsettings_app_id_uuid_270b9c16_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_appsettings
    ADD CONSTRAINT api_appsettings_app_id_uuid_270b9c16_uniq UNIQUE (app_id, uuid);


--
-- Name: api_appsettings api_appsettings_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_appsettings
    ADD CONSTRAINT api_appsettings_pkey PRIMARY KEY (uuid);


--
-- Name: api_build api_build_app_id_uuid_0a142ee9_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_build
    ADD CONSTRAINT api_build_app_id_uuid_0a142ee9_uniq UNIQUE (app_id, uuid);


--
-- Name: api_build api_build_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_build
    ADD CONSTRAINT api_build_pkey PRIMARY KEY (uuid);


--
-- Name: api_certificate api_certificate_name_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_certificate
    ADD CONSTRAINT api_certificate_name_key UNIQUE (name);


--
-- Name: api_certificate api_certificate_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_certificate
    ADD CONSTRAINT api_certificate_pkey PRIMARY KEY (id);


--
-- Name: api_config api_config_app_id_uuid_f49723a8_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_config
    ADD CONSTRAINT api_config_app_id_uuid_f49723a8_uniq UNIQUE (app_id, uuid);


--
-- Name: api_config api_config_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_config
    ADD CONSTRAINT api_config_pkey PRIMARY KEY (uuid);


--
-- Name: api_domain api_domain_domain_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_domain
    ADD CONSTRAINT api_domain_domain_key UNIQUE (domain);


--
-- Name: api_domain api_domain_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_domain
    ADD CONSTRAINT api_domain_pkey PRIMARY KEY (id);


--
-- Name: api_key api_key_id_095e8b3a_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_id_095e8b3a_uniq UNIQUE (id);


--
-- Name: api_key api_key_owner_id_fingerprint_17cba2c3_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_owner_id_fingerprint_17cba2c3_uniq UNIQUE (owner_id, fingerprint);


--
-- Name: api_key api_key_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_pkey PRIMARY KEY (uuid);


--
-- Name: api_key api_key_public_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_public_key UNIQUE (public);


--
-- Name: api_release api_release_app_id_version_e492eaee_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_release
    ADD CONSTRAINT api_release_app_id_version_e492eaee_uniq UNIQUE (app_id, version);


--
-- Name: api_release api_release_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_release
    ADD CONSTRAINT api_release_pkey PRIMARY KEY (uuid);


--
-- Name: api_service api_service_app_id_procfile_type_75ffa225_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_service
    ADD CONSTRAINT api_service_app_id_procfile_type_75ffa225_uniq UNIQUE (app_id, procfile_type);


--
-- Name: api_service api_service_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_service
    ADD CONSTRAINT api_service_pkey PRIMARY KEY (id);


--
-- Name: api_tls api_tls_app_id_uuid_ba010077_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_tls
    ADD CONSTRAINT api_tls_app_id_uuid_ba010077_uniq UNIQUE (app_id, uuid);


--
-- Name: api_tls api_tls_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_tls
    ADD CONSTRAINT api_tls_pkey PRIMARY KEY (uuid);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: authtoken_token authtoken_token_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_pkey PRIMARY KEY (key);


--
-- Name: authtoken_token authtoken_token_user_id_key; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_key UNIQUE (user_id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectperm_group_id_permission_id_o_3f189f7c_uniq UNIQUE (group_id, permission_id, object_pk);


--
-- Name: guardian_groupobjectpermission guardian_groupobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermi_user_id_permission_id_ob_b0b3d2fc_uniq UNIQUE (user_id, permission_id, object_pk);


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_pkey; Type: CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_pkey PRIMARY KEY (id);


--
-- Name: api_app_id_fc451c07_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_app_id_fc451c07_like ON public.api_app USING btree (id varchar_pattern_ops);


--
-- Name: api_app_owner_id_cbebbc18; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_app_owner_id_cbebbc18 ON public.api_app USING btree (owner_id);


--
-- Name: api_appsettings_app_id_7efe8542; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_appsettings_app_id_7efe8542 ON public.api_appsettings USING btree (app_id);


--
-- Name: api_appsettings_owner_id_83ed19f7; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_appsettings_owner_id_83ed19f7 ON public.api_appsettings USING btree (owner_id);


--
-- Name: api_build_app_id_fe641a7d; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_build_app_id_fe641a7d ON public.api_build USING btree (app_id);


--
-- Name: api_build_owner_id_1539e8f2; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_build_owner_id_1539e8f2 ON public.api_build USING btree (owner_id);


--
-- Name: api_certificate_name_e6edbec5_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_certificate_name_e6edbec5_like ON public.api_certificate USING btree (name varchar_pattern_ops);


--
-- Name: api_certificate_owner_id_42adf0cd; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_certificate_owner_id_42adf0cd ON public.api_certificate USING btree (owner_id);


--
-- Name: api_config_app_id_8632bf0d; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_config_app_id_8632bf0d ON public.api_config USING btree (app_id);


--
-- Name: api_config_owner_id_15fcfd4d; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_config_owner_id_15fcfd4d ON public.api_config USING btree (owner_id);


--
-- Name: api_domain_app_id_6acdbe77; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_domain_app_id_6acdbe77 ON public.api_domain USING btree (app_id);


--
-- Name: api_domain_certificate_id_24fc6e9f; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_domain_certificate_id_24fc6e9f ON public.api_domain USING btree (certificate_id);


--
-- Name: api_domain_domain_cf8d9ba9_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_domain_domain_cf8d9ba9_like ON public.api_domain USING btree (domain text_pattern_ops);


--
-- Name: api_domain_owner_id_4c2843c9; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_domain_owner_id_4c2843c9 ON public.api_domain USING btree (owner_id);


--
-- Name: api_key_id_095e8b3a_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_key_id_095e8b3a_like ON public.api_key USING btree (id varchar_pattern_ops);


--
-- Name: api_key_owner_id_e9b7dba6; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_key_owner_id_e9b7dba6 ON public.api_key USING btree (owner_id);


--
-- Name: api_key_public_52103b8a_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_key_public_52103b8a_like ON public.api_key USING btree (public text_pattern_ops);


--
-- Name: api_release_app_id_bd26593f; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_release_app_id_bd26593f ON public.api_release USING btree (app_id);


--
-- Name: api_release_build_id_956f3946; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_release_build_id_956f3946 ON public.api_release USING btree (build_id);


--
-- Name: api_release_config_id_23c173cb; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_release_config_id_23c173cb ON public.api_release USING btree (config_id);


--
-- Name: api_release_owner_id_e8bd2e47; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_release_owner_id_e8bd2e47 ON public.api_release USING btree (owner_id);


--
-- Name: api_service_app_id_04940f79; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_service_app_id_04940f79 ON public.api_service USING btree (app_id);


--
-- Name: api_service_owner_id_ac19479b; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_service_owner_id_ac19479b ON public.api_service USING btree (owner_id);


--
-- Name: api_tls_app_id_a03b23ed; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_tls_app_id_a03b23ed ON public.api_tls USING btree (app_id);


--
-- Name: api_tls_owner_id_278d6863; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX api_tls_owner_id_278d6863 ON public.api_tls USING btree (owner_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: authtoken_token_key_10f0b77e_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX authtoken_token_key_10f0b77e_like ON public.authtoken_token USING btree (key varchar_pattern_ops);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: guardian_groupobjectpermission_content_type_id_7ade36b8; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX guardian_groupobjectpermission_content_type_id_7ade36b8 ON public.guardian_groupobjectpermission USING btree (content_type_id);


--
-- Name: guardian_groupobjectpermission_group_id_4bbbfb62; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX guardian_groupobjectpermission_group_id_4bbbfb62 ON public.guardian_groupobjectpermission USING btree (group_id);


--
-- Name: guardian_groupobjectpermission_permission_id_36572738; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX guardian_groupobjectpermission_permission_id_36572738 ON public.guardian_groupobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_content_type_id_2e892405; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX guardian_userobjectpermission_content_type_id_2e892405 ON public.guardian_userobjectpermission USING btree (content_type_id);


--
-- Name: guardian_userobjectpermission_permission_id_71807bfc; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX guardian_userobjectpermission_permission_id_71807bfc ON public.guardian_userobjectpermission USING btree (permission_id);


--
-- Name: guardian_userobjectpermission_user_id_d5c1e964; Type: INDEX; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

CREATE INDEX guardian_userobjectpermission_user_id_d5c1e964 ON public.guardian_userobjectpermission USING btree (user_id);


--
-- Name: api_app api_app_owner_id_cbebbc18_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_app
    ADD CONSTRAINT api_app_owner_id_cbebbc18_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_appsettings api_appsettings_app_id_7efe8542_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_appsettings
    ADD CONSTRAINT api_appsettings_app_id_7efe8542_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_appsettings api_appsettings_owner_id_83ed19f7_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_appsettings
    ADD CONSTRAINT api_appsettings_owner_id_83ed19f7_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_build api_build_app_id_fe641a7d_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_build
    ADD CONSTRAINT api_build_app_id_fe641a7d_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_build api_build_owner_id_1539e8f2_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_build
    ADD CONSTRAINT api_build_owner_id_1539e8f2_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_certificate api_certificate_owner_id_42adf0cd_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_certificate
    ADD CONSTRAINT api_certificate_owner_id_42adf0cd_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_config api_config_app_id_8632bf0d_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_config
    ADD CONSTRAINT api_config_app_id_8632bf0d_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_config api_config_owner_id_15fcfd4d_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_config
    ADD CONSTRAINT api_config_owner_id_15fcfd4d_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_domain api_domain_app_id_6acdbe77_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_domain
    ADD CONSTRAINT api_domain_app_id_6acdbe77_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_domain api_domain_certificate_id_24fc6e9f_fk_api_certificate_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_domain
    ADD CONSTRAINT api_domain_certificate_id_24fc6e9f_fk_api_certificate_id FOREIGN KEY (certificate_id) REFERENCES public.api_certificate(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_domain api_domain_owner_id_4c2843c9_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_domain
    ADD CONSTRAINT api_domain_owner_id_4c2843c9_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_key api_key_owner_id_e9b7dba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_key
    ADD CONSTRAINT api_key_owner_id_e9b7dba6_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_release api_release_app_id_bd26593f_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_release
    ADD CONSTRAINT api_release_app_id_bd26593f_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_release api_release_build_id_956f3946_fk_api_build_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_release
    ADD CONSTRAINT api_release_build_id_956f3946_fk_api_build_uuid FOREIGN KEY (build_id) REFERENCES public.api_build(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_release api_release_config_id_23c173cb_fk_api_config_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_release
    ADD CONSTRAINT api_release_config_id_23c173cb_fk_api_config_uuid FOREIGN KEY (config_id) REFERENCES public.api_config(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_release api_release_owner_id_e8bd2e47_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_release
    ADD CONSTRAINT api_release_owner_id_e8bd2e47_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_service api_service_app_id_04940f79_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_service
    ADD CONSTRAINT api_service_app_id_04940f79_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_service api_service_owner_id_ac19479b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_service
    ADD CONSTRAINT api_service_owner_id_ac19479b_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_tls api_tls_app_id_a03b23ed_fk_api_app_uuid; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_tls
    ADD CONSTRAINT api_tls_app_id_a03b23ed_fk_api_app_uuid FOREIGN KEY (app_id) REFERENCES public.api_app(uuid) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: api_tls api_tls_owner_id_278d6863_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.api_tls
    ADD CONSTRAINT api_tls_owner_id_278d6863_fk_auth_user_id FOREIGN KEY (owner_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: authtoken_token authtoken_token_user_id_35299eff_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.authtoken_token
    ADD CONSTRAINT authtoken_token_user_id_35299eff_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_content_type_id_7ade36b8_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_content_type_id_7ade36b8_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_group_id_4bbbfb62_fk_auth_grou; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_group_id_4bbbfb62_fk_auth_grou FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_groupobjectpermission guardian_groupobject_permission_id_36572738_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_groupobjectpermission
    ADD CONSTRAINT guardian_groupobject_permission_id_36572738_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_content_type_id_2e892405_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_content_type_id_2e892405_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectp_permission_id_71807bfc_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectp_permission_id_71807bfc_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: guardian_userobjectpermission guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: DfKQL1pP5QFD0JOtrwNf3Q2WA7FkHR3D
--

ALTER TABLE ONLY public.guardian_userobjectpermission
    ADD CONSTRAINT guardian_userobjectpermission_user_id_d5c1e964_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

