--
-- PostgreSQL database dump
--

\restrict wV6ti9SDzuJnyAiqUgdqpKYfHEl9oLPE4cGq7bxmvQuFLYNgz3iJeAeabw46sPY

-- Dumped from database version 18.4
-- Dumped by pg_dump version 18.4

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

--
-- Name: ulk_core; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA ulk_core;


ALTER SCHEMA ulk_core OWNER TO postgres;

--
-- Name: pg_buffercache; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS pg_buffercache WITH SCHEMA ulk_core;


--
-- Name: EXTENSION pg_buffercache; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION pg_buffercache IS 'examine the shared buffer cache';


--
-- Name: address_type; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.address_type AS (
	street character varying(100),
	city character varying(50),
	country character varying(50)
);


ALTER TYPE public.address_type OWNER TO postgres;

--
-- Name: contact_information; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contact_information AS (
	email character varying(100),
	phone character varying(20)
);


ALTER TYPE public.contact_information OWNER TO postgres;

--
-- Name: addresstype; Type: TYPE; Schema: ulk_core; Owner: postgres
--

CREATE TYPE ulk_core.addresstype AS (
	city character varying(50),
	district character varying(50),
	sector character varying(50),
	cell character varying(50)
);


ALTER TYPE ulk_core.addresstype OWNER TO postgres;

--
-- Name: contactinfotype; Type: TYPE; Schema: ulk_core; Owner: postgres
--

CREATE TYPE ulk_core.contactinfotype AS (
	primary_email character varying(100),
	alt_email character varying(100)
);


ALTER TYPE ulk_core.contactinfotype OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: academicevent; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.academicevent (
    event_id integer NOT NULL,
    event_name character varying(100),
    event_date date,
    location character varying(100)
);


ALTER TABLE public.academicevent OWNER TO postgres;

--
-- Name: academicevent_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.academicevent_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.academicevent_event_id_seq OWNER TO postgres;

--
-- Name: academicevent_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.academicevent_event_id_seq OWNED BY public.academicevent.event_id;


--
-- Name: classroom; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.classroom (
    classroom_id integer NOT NULL,
    room_name character varying(50),
    capacity integer
);


ALTER TABLE public.classroom OWNER TO postgres;

--
-- Name: classroom_classroom_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.classroom_classroom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.classroom_classroom_id_seq OWNER TO postgres;

--
-- Name: classroom_classroom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.classroom_classroom_id_seq OWNED BY public.classroom.classroom_id;


--
-- Name: course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.course (
    course_id integer NOT NULL,
    course_name character varying(100),
    credits integer,
    department_id integer
);


ALTER TABLE public.course OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.course_course_id_seq OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.course_course_id_seq OWNED BY public.course.course_id;


--
-- Name: department; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.department (
    department_id integer NOT NULL,
    department_name character varying(100),
    faculty_id integer
);


ALTER TABLE public.department OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.department_department_id_seq OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.department_department_id_seq OWNED BY public.department.department_id;


--
-- Name: enrollment; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.enrollment (
    enrollment_id integer NOT NULL,
    student_id integer,
    course_id integer,
    semester character varying(20),
    enrollment_date date
);


ALTER TABLE public.enrollment OWNER TO postgres;

--
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.enrollment_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.enrollment_enrollment_id_seq OWNER TO postgres;

--
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.enrollment_enrollment_id_seq OWNED BY public.enrollment.enrollment_id;


--
-- Name: faculty; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.faculty (
    faculty_id integer NOT NULL,
    faculty_name character varying(100)
);


ALTER TABLE public.faculty OWNER TO postgres;

--
-- Name: faculty_faculty_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.faculty_faculty_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.faculty_faculty_id_seq OWNER TO postgres;

--
-- Name: faculty_faculty_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.faculty_faculty_id_seq OWNED BY public.faculty.faculty_id;


--
-- Name: laboratory; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.laboratory (
    lab_id integer NOT NULL,
    lab_name character varying(50),
    capacity integer
);


ALTER TABLE public.laboratory OWNER TO postgres;

--
-- Name: laboratory_lab_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.laboratory_lab_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.laboratory_lab_id_seq OWNER TO postgres;

--
-- Name: laboratory_lab_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.laboratory_lab_id_seq OWNED BY public.laboratory.lab_id;


--
-- Name: person; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.person (
    person_id integer NOT NULL,
    first_name character varying(50),
    last_name character varying(50),
    gender character varying(10),
    address public.address_type,
    contact public.contact_information
);


ALTER TABLE public.person OWNER TO postgres;

--
-- Name: lecturer; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.lecturer (
    academic_rank character varying(50),
    qualification character varying(100),
    phone_numbers text[]
)
INHERITS (public.person);


ALTER TABLE public.lecturer OWNER TO postgres;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.person_person_id_seq OWNER TO postgres;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.person_person_id_seq OWNED BY public.person.person_id;


--
-- Name: researchproject; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.researchproject (
    project_id integer NOT NULL,
    title character varying(100),
    metadata jsonb
);


ALTER TABLE public.researchproject OWNER TO postgres;

--
-- Name: researchproject_project_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.researchproject_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.researchproject_project_id_seq OWNER TO postgres;

--
-- Name: researchproject_project_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.researchproject_project_id_seq OWNED BY public.researchproject.project_id;


--
-- Name: student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.student (
    registration_no character varying(20),
    level character varying(20)
)
INHERITS (public.person);


ALTER TABLE public.student OWNER TO postgres;

--
-- Name: academicevent; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.academicevent (
    event_id integer NOT NULL,
    name character varying(150) NOT NULL,
    event_date timestamp without time zone NOT NULL,
    venue_space_id integer
);


ALTER TABLE ulk_core.academicevent OWNER TO postgres;

--
-- Name: academicevent_event_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.academicevent_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.academicevent_event_id_seq OWNER TO postgres;

--
-- Name: academicevent_event_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.academicevent_event_id_seq OWNED BY ulk_core.academicevent.event_id;


--
-- Name: academicspace; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.academicspace (
    space_id integer NOT NULL,
    room_number character varying(20) NOT NULL,
    building_block character varying(10) NOT NULL,
    capacity integer NOT NULL,
    space_type character varying(15),
    CONSTRAINT chk_capacity CHECK ((capacity > 0)),
    CONSTRAINT chk_space_type CHECK (((space_type)::text = ANY ((ARRAY['Classroom'::character varying, 'Laboratory'::character varying])::text[])))
);


ALTER TABLE ulk_core.academicspace OWNER TO postgres;

--
-- Name: academicspace_space_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.academicspace_space_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.academicspace_space_id_seq OWNER TO postgres;

--
-- Name: academicspace_space_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.academicspace_space_id_seq OWNED BY ulk_core.academicspace.space_id;


--
-- Name: classroom; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.classroom (
    space_id integer NOT NULL,
    has_projector boolean DEFAULT true NOT NULL,
    board_type character varying(20) DEFAULT 'Whiteboard'::character varying
);


ALTER TABLE ulk_core.classroom OWNER TO postgres;

--
-- Name: course; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.course (
    course_id integer NOT NULL,
    title character varying(100) NOT NULL,
    code character varying(15) NOT NULL,
    credits integer NOT NULL,
    department_id integer,
    CONSTRAINT chk_credits CHECK ((credits > 0))
);


ALTER TABLE ulk_core.course OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.course_course_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.course_course_id_seq OWNER TO postgres;

--
-- Name: course_course_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.course_course_id_seq OWNED BY ulk_core.course.course_id;


--
-- Name: coursedelivery; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.coursedelivery (
    delivery_id integer NOT NULL,
    course_id integer NOT NULL,
    lecturer_id integer NOT NULL,
    semester character varying(15) NOT NULL,
    academic_year character varying(10) NOT NULL,
    space_id integer
);


ALTER TABLE ulk_core.coursedelivery OWNER TO postgres;

--
-- Name: coursedelivery_delivery_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.coursedelivery_delivery_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.coursedelivery_delivery_id_seq OWNER TO postgres;

--
-- Name: coursedelivery_delivery_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.coursedelivery_delivery_id_seq OWNED BY ulk_core.coursedelivery.delivery_id;


--
-- Name: department; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.department (
    department_id integer NOT NULL,
    name character varying(100) NOT NULL,
    code character varying(10) NOT NULL,
    budget numeric(12,2) NOT NULL
);


ALTER TABLE ulk_core.department OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.department_department_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.department_department_id_seq OWNER TO postgres;

--
-- Name: department_department_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.department_department_id_seq OWNED BY ulk_core.department.department_id;


--
-- Name: enrollment; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.enrollment (
    enrollment_id integer NOT NULL,
    student_id integer NOT NULL,
    delivery_id integer NOT NULL,
    enrollment_date date DEFAULT CURRENT_DATE,
    final_grade numeric(5,2),
    CONSTRAINT chk_grade CHECK (((final_grade >= 0.00) AND (final_grade <= 100.00)))
);


ALTER TABLE ulk_core.enrollment OWNER TO postgres;

--
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.enrollment_enrollment_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.enrollment_enrollment_id_seq OWNER TO postgres;

--
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.enrollment_enrollment_id_seq OWNED BY ulk_core.enrollment.enrollment_id;


--
-- Name: eventparticipant; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.eventparticipant (
    participation_id integer NOT NULL,
    event_id integer NOT NULL,
    participant_type character varying(10) NOT NULL,
    person_id integer NOT NULL,
    registration_time timestamp without time zone DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT chk_part_type CHECK (((participant_type)::text = ANY ((ARRAY['STUDENT'::character varying, 'LECTURER'::character varying])::text[])))
);


ALTER TABLE ulk_core.eventparticipant OWNER TO postgres;

--
-- Name: eventparticipant_participation_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.eventparticipant_participation_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.eventparticipant_participation_id_seq OWNER TO postgres;

--
-- Name: eventparticipant_participation_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.eventparticipant_participation_id_seq OWNED BY ulk_core.eventparticipant.participation_id;


--
-- Name: laboratory; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.laboratory (
    space_id integer NOT NULL,
    lab_type character varying(30) NOT NULL,
    num_computers integer DEFAULT 0,
    has_safety_gear boolean DEFAULT false NOT NULL
);


ALTER TABLE ulk_core.laboratory OWNER TO postgres;

--
-- Name: person; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.person (
    person_id integer NOT NULL,
    first_name character varying(50) NOT NULL,
    last_name character varying(50) NOT NULL,
    contact_info ulk_core.contactinfotype NOT NULL,
    phone_numbers character varying(15)[] NOT NULL,
    home_address ulk_core.addresstype,
    created_at timestamp without time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE ulk_core.person OWNER TO postgres;

--
-- Name: lecturer; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.lecturer (
    employee_id character varying(20) NOT NULL,
    academic_rank character varying(30),
    salary numeric(10,2) NOT NULL,
    CONSTRAINT chk_rank CHECK (((academic_rank)::text = ANY ((ARRAY['Tutorial Assistant'::character varying, 'Lecturer'::character varying, 'Senior Lecturer'::character varying, 'Associate Professor'::character varying, 'Professor'::character varying])::text[])))
)
INHERITS (ulk_core.person);


ALTER TABLE ulk_core.lecturer OWNER TO postgres;

--
-- Name: person_person_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.person_person_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.person_person_id_seq OWNER TO postgres;

--
-- Name: person_person_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.person_person_id_seq OWNED BY ulk_core.person.person_id;


--
-- Name: researchproject; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.researchproject (
    project_id integer NOT NULL,
    title character varying(255) NOT NULL,
    lead_investigator_id integer NOT NULL,
    start_date date NOT NULL,
    end_date date,
    funding_amount numeric(12,2),
    project_metadata jsonb NOT NULL,
    CONSTRAINT chk_dates CHECK (((end_date IS NULL) OR (end_date >= start_date)))
);


ALTER TABLE ulk_core.researchproject OWNER TO postgres;

--
-- Name: researchproject_project_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.researchproject_project_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.researchproject_project_id_seq OWNER TO postgres;

--
-- Name: researchproject_project_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.researchproject_project_id_seq OWNED BY ulk_core.researchproject.project_id;


--
-- Name: resource; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.resource (
    resource_id integer NOT NULL,
    asset_tag character varying(50) NOT NULL,
    name character varying(100) NOT NULL,
    status character varying(20) DEFAULT 'Available'::character varying,
    department_id integer,
    CONSTRAINT chk_res_status CHECK (((status)::text = ANY ((ARRAY['Available'::character varying, 'In Use'::character varying, 'Maintenance'::character varying, 'Decommissioned'::character varying])::text[])))
);


ALTER TABLE ulk_core.resource OWNER TO postgres;

--
-- Name: resource_resource_id_seq; Type: SEQUENCE; Schema: ulk_core; Owner: postgres
--

CREATE SEQUENCE ulk_core.resource_resource_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE ulk_core.resource_resource_id_seq OWNER TO postgres;

--
-- Name: resource_resource_id_seq; Type: SEQUENCE OWNED BY; Schema: ulk_core; Owner: postgres
--

ALTER SEQUENCE ulk_core.resource_resource_id_seq OWNED BY ulk_core.resource.resource_id;


--
-- Name: student; Type: TABLE; Schema: ulk_core; Owner: postgres
--

CREATE TABLE ulk_core.student (
    registration_number character varying(20) NOT NULL,
    gpa numeric(3,2) DEFAULT 0.00,
    enrollment_year integer NOT NULL,
    department_id integer,
    CONSTRAINT chk_gpa CHECK (((gpa >= 0.00) AND (gpa <= 4.00)))
)
INHERITS (ulk_core.person);


ALTER TABLE ulk_core.student OWNER TO postgres;

--
-- Name: academicevent event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academicevent ALTER COLUMN event_id SET DEFAULT nextval('public.academicevent_event_id_seq'::regclass);


--
-- Name: classroom classroom_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom ALTER COLUMN classroom_id SET DEFAULT nextval('public.classroom_classroom_id_seq'::regclass);


--
-- Name: course course_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course ALTER COLUMN course_id SET DEFAULT nextval('public.course_course_id_seq'::regclass);


--
-- Name: department department_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department ALTER COLUMN department_id SET DEFAULT nextval('public.department_department_id_seq'::regclass);


--
-- Name: enrollment enrollment_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment ALTER COLUMN enrollment_id SET DEFAULT nextval('public.enrollment_enrollment_id_seq'::regclass);


--
-- Name: faculty faculty_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty ALTER COLUMN faculty_id SET DEFAULT nextval('public.faculty_faculty_id_seq'::regclass);


--
-- Name: laboratory lab_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory ALTER COLUMN lab_id SET DEFAULT nextval('public.laboratory_lab_id_seq'::regclass);


--
-- Name: lecturer person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.lecturer ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: person person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: researchproject project_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researchproject ALTER COLUMN project_id SET DEFAULT nextval('public.researchproject_project_id_seq'::regclass);


--
-- Name: student person_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.student ALTER COLUMN person_id SET DEFAULT nextval('public.person_person_id_seq'::regclass);


--
-- Name: academicevent event_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.academicevent ALTER COLUMN event_id SET DEFAULT nextval('ulk_core.academicevent_event_id_seq'::regclass);


--
-- Name: academicspace space_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.academicspace ALTER COLUMN space_id SET DEFAULT nextval('ulk_core.academicspace_space_id_seq'::regclass);


--
-- Name: course course_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.course ALTER COLUMN course_id SET DEFAULT nextval('ulk_core.course_course_id_seq'::regclass);


--
-- Name: coursedelivery delivery_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.coursedelivery ALTER COLUMN delivery_id SET DEFAULT nextval('ulk_core.coursedelivery_delivery_id_seq'::regclass);


--
-- Name: department department_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.department ALTER COLUMN department_id SET DEFAULT nextval('ulk_core.department_department_id_seq'::regclass);


--
-- Name: enrollment enrollment_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.enrollment ALTER COLUMN enrollment_id SET DEFAULT nextval('ulk_core.enrollment_enrollment_id_seq'::regclass);


--
-- Name: eventparticipant participation_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.eventparticipant ALTER COLUMN participation_id SET DEFAULT nextval('ulk_core.eventparticipant_participation_id_seq'::regclass);


--
-- Name: lecturer person_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.lecturer ALTER COLUMN person_id SET DEFAULT nextval('ulk_core.person_person_id_seq'::regclass);


--
-- Name: lecturer created_at; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.lecturer ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;


--
-- Name: person person_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.person ALTER COLUMN person_id SET DEFAULT nextval('ulk_core.person_person_id_seq'::regclass);


--
-- Name: researchproject project_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.researchproject ALTER COLUMN project_id SET DEFAULT nextval('ulk_core.researchproject_project_id_seq'::regclass);


--
-- Name: resource resource_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.resource ALTER COLUMN resource_id SET DEFAULT nextval('ulk_core.resource_resource_id_seq'::regclass);


--
-- Name: student person_id; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.student ALTER COLUMN person_id SET DEFAULT nextval('ulk_core.person_person_id_seq'::regclass);


--
-- Name: student created_at; Type: DEFAULT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.student ALTER COLUMN created_at SET DEFAULT CURRENT_TIMESTAMP;


--
-- Data for Name: academicevent; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.academicevent (event_id, event_name, event_date, location) FROM stdin;
\.


--
-- Data for Name: classroom; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.classroom (classroom_id, room_name, capacity) FROM stdin;
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.course (course_id, course_name, credits, department_id) FROM stdin;
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.department (department_id, department_name, faculty_id) FROM stdin;
\.


--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.enrollment (enrollment_id, student_id, course_id, semester, enrollment_date) FROM stdin;
\.


--
-- Data for Name: faculty; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.faculty (faculty_id, faculty_name) FROM stdin;
\.


--
-- Data for Name: laboratory; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.laboratory (lab_id, lab_name, capacity) FROM stdin;
\.


--
-- Data for Name: lecturer; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.lecturer (person_id, first_name, last_name, gender, address, contact, academic_rank, qualification, phone_numbers) FROM stdin;
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.person (person_id, first_name, last_name, gender, address, contact) FROM stdin;
\.


--
-- Data for Name: researchproject; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.researchproject (project_id, title, metadata) FROM stdin;
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.student (person_id, first_name, last_name, gender, address, contact, registration_no, level) FROM stdin;
\.


--
-- Data for Name: academicevent; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.academicevent (event_id, name, event_date, venue_space_id) FROM stdin;
1	ULK International Research Week	2026-07-20 09:00:00	4
2	Innovation Hackathon 2026	2026-08-15 08:30:00	5
3	East African Legal Frameworks Symposium	2026-09-02 10:00:00	4
\.


--
-- Data for Name: academicspace; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.academicspace (space_id, room_number, building_block, capacity, space_type) FROM stdin;
1	L101	Block A	60	Classroom
2	L102	Block A	60	Classroom
3	L201	Block B	45	Classroom
4	Auditorium 1	Main Hall	250	Classroom
5	CS-Lab 1	Block C	40	Laboratory
6	CS-Lab 2	Block C	40	Laboratory
7	Civil-Lab	Block D	30	Laboratory
\.


--
-- Data for Name: classroom; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.classroom (space_id, has_projector, board_type) FROM stdin;
1	t	Whiteboard
2	t	Whiteboard
3	f	Chalkboard
4	t	Interactive Screen
\.


--
-- Data for Name: course; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.course (course_id, title, code, credits, department_id) FROM stdin;
1	Introduction to Programming	CS-111	5	1
2	Database Systems	CS-221	5	1
3	Advanced Software Engineering	CS-312	6	1
4	Data Structures and Algorithms	CS-211	5	1
5	Computer Networks	CS-224	5	1
6	Artificial Intelligence	CS-411	6	1
7	Operating Systems	CS-321	5	1
8	Web Technologies	CS-215	4	1
9	Cyber Security Principles	CS-425	6	1
10	Distributed Systems	CS-412	5	1
11	Principles of Accounting	BAF-111	4	2
12	Corporate Finance	BAF-221	5	2
13	Microeconomic Theory	BAF-122	4	2
14	Macroeconomic Analysis	BAF-212	4	2
15	Auditing Principles	BAF-311	5	2
16	Investment Portfolio Management	BAF-415	6	2
17	Strategic Management	BAF-421	5	2
18	International Finance	BAF-324	5	2
19	Fluid Mechanics	CEA-211	5	3
20	Structural Analysis I	CEA-222	5	3
21	Reinforced Concrete Design	CEA-312	6	3
22	Geotechnical Engineering	CEA-321	5	3
23	Transportation Engineering	CEA-411	5	3
24	Environmental Engineering	CEA-423	4	3
25	Constitutional Law	LLS-111	5	4
26	Law of Contract	LLS-122	5	4
27	Criminal Law and Procedure	LLS-211	6	4
28	International Humanitarian Law	LLS-321	5	4
29	Commercial Law	LLS-314	5	4
30	Human Rights Jurisprudence	LLS-412	6	4
\.


--
-- Data for Name: coursedelivery; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.coursedelivery (delivery_id, course_id, lecturer_id, semester, academic_year, space_id) FROM stdin;
1	1	8	Semester 1	2025-2026	5
2	2	8	Semester 1	2025-2026	5
3	3	8	Semester 1	2025-2026	5
4	4	8	Semester 1	2025-2026	5
5	5	8	Semester 1	2025-2026	5
6	6	8	Semester 1	2025-2026	5
7	7	8	Semester 1	2025-2026	5
8	8	8	Semester 1	2025-2026	5
9	9	8	Semester 1	2025-2026	5
10	10	8	Semester 1	2025-2026	5
11	11	8	Semester 1	2025-2026	5
12	12	8	Semester 1	2025-2026	5
13	13	8	Semester 1	2025-2026	5
14	14	8	Semester 1	2025-2026	5
15	15	8	Semester 1	2025-2026	5
16	16	8	Semester 1	2025-2026	5
17	17	8	Semester 1	2025-2026	5
18	18	8	Semester 1	2025-2026	5
19	19	8	Semester 1	2025-2026	5
20	20	8	Semester 1	2025-2026	5
21	21	8	Semester 1	2025-2026	5
22	22	8	Semester 1	2025-2026	5
23	23	8	Semester 1	2025-2026	5
24	24	8	Semester 1	2025-2026	5
25	25	8	Semester 1	2025-2026	5
26	26	8	Semester 1	2025-2026	5
27	27	8	Semester 1	2025-2026	5
28	28	8	Semester 1	2025-2026	5
29	29	8	Semester 1	2025-2026	5
30	30	8	Semester 1	2025-2026	5
\.


--
-- Data for Name: department; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.department (department_id, name, code, budget) FROM stdin;
1	Computer Science & Software Engineering	CSSE	15000000.00
2	Business Administration & Finance	BAF	12000000.00
3	Civil Engineering & Architecture	CEA	18000000.00
4	Law & Legal Studies	LLS	9000000.00
\.


--
-- Data for Name: enrollment; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.enrollment (enrollment_id, student_id, delivery_id, enrollment_date, final_grade) FROM stdin;
1	21	27	2026-06-16	59.65
2	21	11	2026-06-16	89.95
3	22	27	2026-06-16	55.04
4	22	11	2026-06-16	74.89
5	23	27	2026-06-16	91.89
6	23	11	2026-06-16	62.88
7	24	27	2026-06-16	73.56
8	24	11	2026-06-16	54.19
9	25	27	2026-06-16	84.30
10	25	11	2026-06-16	74.91
11	26	27	2026-06-16	94.37
12	26	11	2026-06-16	66.50
13	27	27	2026-06-16	61.05
14	27	11	2026-06-16	73.03
15	28	27	2026-06-16	92.68
16	28	11	2026-06-16	81.05
17	29	27	2026-06-16	75.04
18	29	11	2026-06-16	53.03
19	30	27	2026-06-16	73.58
20	30	11	2026-06-16	52.04
21	31	27	2026-06-16	83.19
22	31	11	2026-06-16	71.06
23	32	27	2026-06-16	76.25
24	32	11	2026-06-16	99.45
25	33	27	2026-06-16	52.46
26	33	11	2026-06-16	81.32
27	34	27	2026-06-16	96.23
28	34	11	2026-06-16	87.28
29	35	27	2026-06-16	74.68
30	35	11	2026-06-16	75.00
31	36	27	2026-06-16	96.59
32	36	11	2026-06-16	89.01
33	37	27	2026-06-16	83.54
34	37	11	2026-06-16	95.86
35	38	27	2026-06-16	84.09
36	38	11	2026-06-16	64.34
37	39	27	2026-06-16	99.48
38	39	11	2026-06-16	61.41
39	40	27	2026-06-16	63.85
40	40	11	2026-06-16	94.26
41	41	27	2026-06-16	72.61
42	41	11	2026-06-16	99.55
43	42	27	2026-06-16	98.75
44	42	11	2026-06-16	86.99
45	43	27	2026-06-16	86.13
46	43	11	2026-06-16	86.81
47	44	27	2026-06-16	67.38
48	44	11	2026-06-16	68.79
49	45	27	2026-06-16	83.34
50	45	11	2026-06-16	69.06
51	46	27	2026-06-16	50.05
52	46	11	2026-06-16	76.26
53	47	27	2026-06-16	80.18
54	47	11	2026-06-16	90.44
55	48	27	2026-06-16	88.56
56	48	11	2026-06-16	80.87
57	49	27	2026-06-16	76.38
58	49	11	2026-06-16	62.85
59	50	27	2026-06-16	53.36
60	50	11	2026-06-16	81.56
61	51	27	2026-06-16	65.16
62	51	11	2026-06-16	92.79
63	52	27	2026-06-16	92.97
64	52	11	2026-06-16	85.84
65	53	27	2026-06-16	90.82
66	53	11	2026-06-16	98.39
67	54	27	2026-06-16	77.68
68	54	11	2026-06-16	94.91
69	55	27	2026-06-16	66.35
70	55	11	2026-06-16	87.92
71	56	27	2026-06-16	68.33
72	56	11	2026-06-16	82.44
73	57	27	2026-06-16	81.91
74	57	11	2026-06-16	77.57
75	58	27	2026-06-16	53.17
76	58	11	2026-06-16	99.05
77	59	27	2026-06-16	77.78
78	59	11	2026-06-16	96.97
79	60	27	2026-06-16	69.10
80	60	11	2026-06-16	88.17
81	61	27	2026-06-16	69.43
82	61	11	2026-06-16	96.13
83	62	27	2026-06-16	55.46
84	62	11	2026-06-16	95.04
85	63	27	2026-06-16	56.88
86	63	11	2026-06-16	65.46
87	64	27	2026-06-16	64.35
88	64	11	2026-06-16	97.89
89	65	27	2026-06-16	54.39
90	65	11	2026-06-16	70.25
91	66	27	2026-06-16	78.29
92	66	11	2026-06-16	72.04
93	67	27	2026-06-16	61.00
94	67	11	2026-06-16	54.96
95	68	27	2026-06-16	98.51
96	68	11	2026-06-16	51.91
97	69	27	2026-06-16	98.77
98	69	11	2026-06-16	99.67
99	70	27	2026-06-16	66.15
100	70	11	2026-06-16	77.57
101	71	27	2026-06-16	91.94
102	71	11	2026-06-16	95.03
103	72	27	2026-06-16	81.75
104	72	11	2026-06-16	77.81
105	73	27	2026-06-16	54.21
106	73	11	2026-06-16	98.39
107	74	27	2026-06-16	77.33
108	74	11	2026-06-16	59.23
109	75	27	2026-06-16	74.14
110	75	11	2026-06-16	54.73
111	76	27	2026-06-16	67.31
112	76	11	2026-06-16	70.57
113	77	27	2026-06-16	66.36
114	77	11	2026-06-16	77.01
115	78	27	2026-06-16	58.86
116	78	11	2026-06-16	68.19
117	79	27	2026-06-16	67.18
118	79	11	2026-06-16	86.23
119	80	27	2026-06-16	74.69
120	80	11	2026-06-16	77.49
121	81	27	2026-06-16	84.60
122	81	11	2026-06-16	66.60
123	82	27	2026-06-16	92.16
124	82	11	2026-06-16	81.79
125	83	27	2026-06-16	99.74
126	83	11	2026-06-16	94.23
127	84	27	2026-06-16	80.74
128	84	11	2026-06-16	93.98
129	85	27	2026-06-16	67.17
130	85	11	2026-06-16	61.80
131	86	27	2026-06-16	79.51
132	86	11	2026-06-16	73.58
133	87	27	2026-06-16	74.58
134	87	11	2026-06-16	66.39
135	88	27	2026-06-16	98.23
136	88	11	2026-06-16	76.01
137	89	27	2026-06-16	62.54
138	89	11	2026-06-16	93.24
139	90	27	2026-06-16	70.06
140	90	11	2026-06-16	63.43
141	91	27	2026-06-16	70.78
142	91	11	2026-06-16	63.11
143	92	27	2026-06-16	55.86
144	92	11	2026-06-16	64.93
145	93	27	2026-06-16	67.46
146	93	11	2026-06-16	62.88
147	94	27	2026-06-16	94.33
148	94	11	2026-06-16	83.88
149	95	27	2026-06-16	53.82
150	95	11	2026-06-16	65.74
151	96	27	2026-06-16	85.25
152	96	11	2026-06-16	84.83
153	97	27	2026-06-16	73.29
154	97	11	2026-06-16	89.37
155	98	27	2026-06-16	64.27
156	98	11	2026-06-16	93.10
157	99	27	2026-06-16	87.09
158	99	11	2026-06-16	61.98
159	100	27	2026-06-16	73.18
160	100	11	2026-06-16	61.20
161	101	27	2026-06-16	52.95
162	101	11	2026-06-16	85.08
163	102	27	2026-06-16	53.99
164	102	11	2026-06-16	51.04
165	103	27	2026-06-16	82.88
166	103	11	2026-06-16	90.45
167	104	27	2026-06-16	68.22
168	104	11	2026-06-16	55.88
169	105	27	2026-06-16	76.67
170	105	11	2026-06-16	79.24
171	106	27	2026-06-16	51.26
172	106	11	2026-06-16	73.93
173	107	27	2026-06-16	95.64
174	107	11	2026-06-16	77.07
175	108	27	2026-06-16	59.04
176	108	11	2026-06-16	63.70
177	109	27	2026-06-16	73.16
178	109	11	2026-06-16	56.18
179	110	27	2026-06-16	62.84
180	110	11	2026-06-16	66.92
181	111	27	2026-06-16	52.37
182	111	11	2026-06-16	87.17
183	112	27	2026-06-16	77.96
184	112	11	2026-06-16	98.87
185	113	27	2026-06-16	88.18
186	113	11	2026-06-16	53.59
187	114	27	2026-06-16	95.71
188	114	11	2026-06-16	61.16
189	115	27	2026-06-16	90.37
190	115	11	2026-06-16	59.53
191	116	27	2026-06-16	67.17
192	116	11	2026-06-16	54.26
193	117	27	2026-06-16	72.28
194	117	11	2026-06-16	98.00
195	118	27	2026-06-16	75.07
196	118	11	2026-06-16	83.32
197	119	27	2026-06-16	84.42
198	119	11	2026-06-16	97.99
199	120	27	2026-06-16	99.39
200	120	11	2026-06-16	76.30
\.


--
-- Data for Name: eventparticipant; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.eventparticipant (participation_id, event_id, participant_type, person_id, registration_time) FROM stdin;
1	1	STUDENT	21	2026-06-16 10:59:13.405132
2	1	STUDENT	22	2026-06-16 10:59:13.405132
3	1	STUDENT	23	2026-06-16 10:59:13.405132
4	1	STUDENT	24	2026-06-16 10:59:13.405132
5	1	STUDENT	25	2026-06-16 10:59:13.405132
6	1	STUDENT	26	2026-06-16 10:59:13.405132
7	1	STUDENT	27	2026-06-16 10:59:13.405132
8	1	STUDENT	28	2026-06-16 10:59:13.405132
9	1	STUDENT	29	2026-06-16 10:59:13.405132
10	1	STUDENT	30	2026-06-16 10:59:13.405132
11	1	STUDENT	31	2026-06-16 10:59:13.405132
12	1	STUDENT	32	2026-06-16 10:59:13.405132
13	1	STUDENT	33	2026-06-16 10:59:13.405132
14	1	STUDENT	34	2026-06-16 10:59:13.405132
15	1	STUDENT	35	2026-06-16 10:59:13.405132
16	1	STUDENT	36	2026-06-16 10:59:13.405132
17	1	STUDENT	37	2026-06-16 10:59:13.405132
18	1	STUDENT	38	2026-06-16 10:59:13.405132
19	1	STUDENT	39	2026-06-16 10:59:13.405132
20	1	STUDENT	40	2026-06-16 10:59:13.405132
21	1	STUDENT	41	2026-06-16 10:59:13.405132
22	1	STUDENT	42	2026-06-16 10:59:13.405132
23	1	STUDENT	43	2026-06-16 10:59:13.405132
24	1	STUDENT	44	2026-06-16 10:59:13.405132
25	1	STUDENT	45	2026-06-16 10:59:13.405132
26	1	STUDENT	46	2026-06-16 10:59:13.405132
27	1	STUDENT	47	2026-06-16 10:59:13.405132
28	1	STUDENT	48	2026-06-16 10:59:13.405132
29	1	STUDENT	49	2026-06-16 10:59:13.405132
30	1	STUDENT	50	2026-06-16 10:59:13.405132
31	1	LECTURER	1	2026-06-16 10:59:13.4085
32	1	LECTURER	2	2026-06-16 10:59:13.4085
33	1	LECTURER	3	2026-06-16 10:59:13.4085
34	1	LECTURER	4	2026-06-16 10:59:13.4085
35	1	LECTURER	5	2026-06-16 10:59:13.4085
36	1	LECTURER	6	2026-06-16 10:59:13.4085
37	1	LECTURER	7	2026-06-16 10:59:13.4085
38	1	LECTURER	8	2026-06-16 10:59:13.4085
39	1	LECTURER	9	2026-06-16 10:59:13.4085
40	1	LECTURER	10	2026-06-16 10:59:13.4085
\.


--
-- Data for Name: laboratory; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.laboratory (space_id, lab_type, num_computers, has_safety_gear) FROM stdin;
5	Computer Science	40	f
6	Networking & Security	35	f
7	Structural Testing	5	t
\.


--
-- Data for Name: lecturer; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.lecturer (person_id, first_name, last_name, contact_info, phone_numbers, home_address, created_at, employee_id, academic_rank, salary) FROM stdin;
1	Jean	Mutangana	(lecturer1@ulk.ac.rw,lect.alt1@gmail.com)	{+25078835101,+25073311101}	(Kigali,Gasabo,Gisozi,"Cell 1")	2026-06-16 10:59:13.349291	ULK-LEC-101	Senior Lecturer	2550000.00
2	Bosco	Kagame	(lecturer2@ulk.ac.rw,lect.alt2@gmail.com)	{+25078835102,+25073311102}	(Kigali,Gasabo,Gisozi,"Cell 2")	2026-06-16 10:59:13.349291	ULK-LEC-102	Associate Professor	2600000.00
3	Marie	Nkurunziza	(lecturer3@ulk.ac.rw,lect.alt3@gmail.com)	{+25078835103,+25073311103}	(Kigali,Gasabo,Gisozi,"Cell 3")	2026-06-16 10:59:13.349291	ULK-LEC-103	Professor	2650000.00
4	Emmanuel	Gasana	(lecturer4@ulk.ac.rw,lect.alt4@gmail.com)	{+25078835104,+25073311104}	(Kigali,Gasabo,Gisozi,"Cell 4")	2026-06-16 10:59:13.349291	ULK-LEC-104	Lecturer	2700000.00
5	Eric	Murenzi	(lecturer5@ulk.ac.rw,lect.alt5@gmail.com)	{+25078835105,+25073311105}	(Kigali,Gasabo,Gisozi,"Cell 5")	2026-06-16 10:59:13.349291	ULK-LEC-105	Senior Lecturer	2750000.00
6	Aline	Uwase	(lecturer6@ulk.ac.rw,lect.alt6@gmail.com)	{+25078835106,+25073311106}	(Kigali,Gasabo,Gisozi,"Cell 6")	2026-06-16 10:59:13.349291	ULK-LEC-106	Associate Professor	2800000.00
7	Claudine	Mugisha	(lecturer7@ulk.ac.rw,lect.alt7@gmail.com)	{+25078835107,+25073311107}	(Kigali,Gasabo,Gisozi,"Cell 7")	2026-06-16 10:59:13.349291	ULK-LEC-107	Professor	2850000.00
8	Moses	Niyonisenga	(lecturer8@ulk.ac.rw,lect.alt8@gmail.com)	{+25078835108,+25073311108}	(Kigali,Gasabo,Gisozi,"Cell 8")	2026-06-16 10:59:13.349291	ULK-LEC-108	Lecturer	2900000.00
9	David	Twagiramungu	(lecturer9@ulk.ac.rw,lect.alt9@gmail.com)	{+25078835109,+25073311109}	(Kigali,Gasabo,Gisozi,"Cell 9")	2026-06-16 10:59:13.349291	ULK-LEC-109	Senior Lecturer	2950000.00
10	Pierre	Nshuti	(lecturer10@ulk.ac.rw,lect.alt10@gmail.com)	{+250788351010,+250733111010}	(Kigali,Gasabo,Gisozi,"Cell 10")	2026-06-16 10:59:13.349291	ULK-LEC-110	Associate Professor	3000000.00
11	Angelique	Mukeshimana	(lecturer11@ulk.ac.rw,lect.alt11@gmail.com)	{+250788351011,+250733111011}	(Kigali,Gasabo,Gisozi,"Cell 11")	2026-06-16 10:59:13.349291	ULK-LEC-111	Professor	3050000.00
12	Faustin	Rwigema	(lecturer12@ulk.ac.rw,lect.alt12@gmail.com)	{+250788351012,+250733111012}	(Kigali,Gasabo,Gisozi,"Cell 12")	2026-06-16 10:59:13.349291	ULK-LEC-112	Lecturer	3100000.00
13	Charles	Kayisire	(lecturer13@ulk.ac.rw,lect.alt13@gmail.com)	{+250788351013,+250733111013}	(Kigali,Gasabo,Gisozi,"Cell 13")	2026-06-16 10:59:13.349291	ULK-LEC-113	Senior Lecturer	3150000.00
14	Gilbert	Habimana	(lecturer14@ulk.ac.rw,lect.alt14@gmail.com)	{+250788351014,+250733111014}	(Kigali,Gasabo,Gisozi,"Cell 14")	2026-06-16 10:59:13.349291	ULK-LEC-114	Associate Professor	3200000.00
15	Justin	Ndahimana	(lecturer15@ulk.ac.rw,lect.alt15@gmail.com)	{+250788351015,+250733111015}	(Kigali,Gasabo,Gisozi,"Cell 15")	2026-06-16 10:59:13.349291	ULK-LEC-115	Professor	3250000.00
16	Solange	Umutoni	(lecturer16@ulk.ac.rw,lect.alt16@gmail.com)	{+250788351016,+250733111016}	(Kigali,Gasabo,Gisozi,"Cell 16")	2026-06-16 10:59:13.349291	ULK-LEC-116	Lecturer	3300000.00
17	Chantal	Gakwaya	(lecturer17@ulk.ac.rw,lect.alt17@gmail.com)	{+250788351017,+250733111017}	(Kigali,Gasabo,Gisozi,"Cell 17")	2026-06-16 10:59:13.349291	ULK-LEC-117	Senior Lecturer	3350000.00
18	Patrick	Bizimana	(lecturer18@ulk.ac.rw,lect.alt18@gmail.com)	{+250788351018,+250733111018}	(Kigali,Gasabo,Gisozi,"Cell 18")	2026-06-16 10:59:13.349291	ULK-LEC-118	Associate Professor	3400000.00
19	Olivier	Karemera	(lecturer19@ulk.ac.rw,lect.alt19@gmail.com)	{+250788351019,+250733111019}	(Kigali,Gasabo,Gisozi,"Cell 19")	2026-06-16 10:59:13.349291	ULK-LEC-119	Professor	3450000.00
20	Liliane	Nsengiyumva	(lecturer20@ulk.ac.rw,lect.alt20@gmail.com)	{+250788351020,+250733111020}	(Kigali,Gasabo,Gisozi,"Cell 20")	2026-06-16 10:59:13.349291	ULK-LEC-120	Lecturer	3500000.00
\.


--
-- Data for Name: person; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.person (person_id, first_name, last_name, contact_info, phone_numbers, home_address, created_at) FROM stdin;
\.


--
-- Data for Name: researchproject; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.researchproject (project_id, title, lead_investigator_id, start_date, end_date, funding_amount, project_metadata) FROM stdin;
1	Advanced Research Project Trial - 1	4	2025-01-15	2026-12-20	5250000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
2	Advanced Research Project Trial - 2	4	2025-01-15	2026-12-20	5500000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
3	Advanced Research Project Trial - 3	4	2025-01-15	2026-12-20	5750000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
4	Advanced Research Project Trial - 4	4	2025-01-15	2026-12-20	6000000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
5	Advanced Research Project Trial - 5	4	2025-01-15	2026-12-20	6250000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
6	Advanced Research Project Trial - 6	4	2025-01-15	2026-12-20	6500000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
7	Advanced Research Project Trial - 7	4	2025-01-15	2026-12-20	6750000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
8	Advanced Research Project Trial - 8	4	2025-01-15	2026-12-20	7000000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
9	Advanced Research Project Trial - 9	4	2025-01-15	2026-12-20	7250000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
10	Advanced Research Project Trial - 10	4	2025-01-15	2026-12-20	7500000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
11	Advanced Research Project Trial - 11	4	2025-01-15	2026-12-20	7750000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
12	Advanced Research Project Trial - 12	4	2025-01-15	2026-12-20	8000000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
13	Advanced Research Project Trial - 13	4	2025-01-15	2026-12-20	8250000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
14	Advanced Research Project Trial - 14	4	2025-01-15	2026-12-20	8500000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
15	Advanced Research Project Trial - 15	4	2025-01-15	2026-12-20	8750000.00	{"tags": ["Computing", "Data Science", "Socio-Economic Engine"], "domain": "Academic Innovation Pillar", "milestones": {"phase1": "Approved", "phase2": "In Progress"}, "external_grant_provider": "Rwanda National Council for Science and Technology (NCST)"}
\.


--
-- Data for Name: resource; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.resource (resource_id, asset_tag, name, status, department_id) FROM stdin;
1	ULK-ASSET-001	Epson HD Projector System	Available	1
2	ULK-ASSET-002	Dell Networking Switch 24-Port	In Use	1
3	ULK-ASSET-003	Concrete Compressive Testing Machine	Available	3
4	ULK-ASSET-004	Digital Moot Court Sound System	Available	4
\.


--
-- Data for Name: student; Type: TABLE DATA; Schema: ulk_core; Owner: postgres
--

COPY ulk_core.student (person_id, first_name, last_name, contact_info, phone_numbers, home_address, created_at, registration_number, gpa, enrollment_year, department_id) FROM stdin;
21	StudentFN_1	StudentLN_1	(student1@student.ulk.ac.rw,stud.alt1@gmail.com)	{+2507890001,+2507220001}	(Kigali,Nyarugenge,Nyamirambo,"Village 1")	2026-06-16 10:59:13.367569	ULK-STU-2024-1001	2.04	2025	2
22	StudentFN_2	StudentLN_2	(student2@student.ulk.ac.rw,stud.alt2@gmail.com)	{+2507890002,+2507220002}	(Kigali,Nyarugenge,Nyamirambo,"Village 2")	2026-06-16 10:59:13.367569	ULK-STU-2024-1002	3.77	2026	3
23	StudentFN_3	StudentLN_3	(student3@student.ulk.ac.rw,stud.alt3@gmail.com)	{+2507890003,+2507220003}	(Kigali,Nyarugenge,Nyamirambo,"Village 3")	2026-06-16 10:59:13.367569	ULK-STU-2024-1003	2.54	2024	4
24	StudentFN_4	StudentLN_4	(student4@student.ulk.ac.rw,stud.alt4@gmail.com)	{+2507890004,+2507220004}	(Kigali,Nyarugenge,Nyamirambo,"Village 4")	2026-06-16 10:59:13.367569	ULK-STU-2024-1004	2.05	2025	1
25	StudentFN_5	StudentLN_5	(student5@student.ulk.ac.rw,stud.alt5@gmail.com)	{+2507890005,+2507220005}	(Kigali,Nyarugenge,Nyamirambo,"Village 5")	2026-06-16 10:59:13.367569	ULK-STU-2024-1005	2.15	2026	2
26	StudentFN_6	StudentLN_6	(student6@student.ulk.ac.rw,stud.alt6@gmail.com)	{+2507890006,+2507220006}	(Kigali,Nyarugenge,Nyamirambo,"Village 6")	2026-06-16 10:59:13.367569	ULK-STU-2024-1006	3.56	2024	3
27	StudentFN_7	StudentLN_7	(student7@student.ulk.ac.rw,stud.alt7@gmail.com)	{+2507890007,+2507220007}	(Kigali,Nyarugenge,Nyamirambo,"Village 7")	2026-06-16 10:59:13.367569	ULK-STU-2024-1007	3.91	2025	4
28	StudentFN_8	StudentLN_8	(student8@student.ulk.ac.rw,stud.alt8@gmail.com)	{+2507890008,+2507220008}	(Kigali,Nyarugenge,Nyamirambo,"Village 8")	2026-06-16 10:59:13.367569	ULK-STU-2024-1008	2.27	2026	1
29	StudentFN_9	StudentLN_9	(student9@student.ulk.ac.rw,stud.alt9@gmail.com)	{+2507890009,+2507220009}	(Kigali,Nyarugenge,Nyamirambo,"Village 9")	2026-06-16 10:59:13.367569	ULK-STU-2024-1009	2.98	2024	2
30	StudentFN_10	StudentLN_10	(student10@student.ulk.ac.rw,stud.alt10@gmail.com)	{+25078900010,+25072200010}	(Kigali,Nyarugenge,Nyamirambo,"Village 10")	2026-06-16 10:59:13.367569	ULK-STU-2024-1010	2.64	2025	3
31	StudentFN_11	StudentLN_11	(student11@student.ulk.ac.rw,stud.alt11@gmail.com)	{+25078900011,+25072200011}	(Kigali,Nyarugenge,Nyamirambo,"Village 11")	2026-06-16 10:59:13.367569	ULK-STU-2024-1011	2.37	2026	4
32	StudentFN_12	StudentLN_12	(student12@student.ulk.ac.rw,stud.alt12@gmail.com)	{+25078900012,+25072200012}	(Kigali,Nyarugenge,Nyamirambo,"Village 12")	2026-06-16 10:59:13.367569	ULK-STU-2024-1012	2.26	2024	1
33	StudentFN_13	StudentLN_13	(student13@student.ulk.ac.rw,stud.alt13@gmail.com)	{+25078900013,+25072200013}	(Kigali,Nyarugenge,Nyamirambo,"Village 13")	2026-06-16 10:59:13.367569	ULK-STU-2024-1013	2.29	2025	2
34	StudentFN_14	StudentLN_14	(student14@student.ulk.ac.rw,stud.alt14@gmail.com)	{+25078900014,+25072200014}	(Kigali,Nyarugenge,Nyamirambo,"Village 14")	2026-06-16 10:59:13.367569	ULK-STU-2024-1014	3.85	2026	3
35	StudentFN_15	StudentLN_15	(student15@student.ulk.ac.rw,stud.alt15@gmail.com)	{+25078900015,+25072200015}	(Kigali,Nyarugenge,Nyamirambo,"Village 15")	2026-06-16 10:59:13.367569	ULK-STU-2024-1015	2.22	2024	4
36	StudentFN_16	StudentLN_16	(student16@student.ulk.ac.rw,stud.alt16@gmail.com)	{+25078900016,+25072200016}	(Kigali,Nyarugenge,Nyamirambo,"Village 16")	2026-06-16 10:59:13.367569	ULK-STU-2024-1016	3.84	2025	1
37	StudentFN_17	StudentLN_17	(student17@student.ulk.ac.rw,stud.alt17@gmail.com)	{+25078900017,+25072200017}	(Kigali,Nyarugenge,Nyamirambo,"Village 17")	2026-06-16 10:59:13.367569	ULK-STU-2024-1017	2.47	2026	2
38	StudentFN_18	StudentLN_18	(student18@student.ulk.ac.rw,stud.alt18@gmail.com)	{+25078900018,+25072200018}	(Kigali,Nyarugenge,Nyamirambo,"Village 18")	2026-06-16 10:59:13.367569	ULK-STU-2024-1018	3.11	2024	3
39	StudentFN_19	StudentLN_19	(student19@student.ulk.ac.rw,stud.alt19@gmail.com)	{+25078900019,+25072200019}	(Kigali,Nyarugenge,Nyamirambo,"Village 19")	2026-06-16 10:59:13.367569	ULK-STU-2024-1019	2.56	2025	4
40	StudentFN_20	StudentLN_20	(student20@student.ulk.ac.rw,stud.alt20@gmail.com)	{+25078900020,+25072200020}	(Kigali,Nyarugenge,Nyamirambo,"Village 20")	2026-06-16 10:59:13.367569	ULK-STU-2024-1020	3.50	2026	1
41	StudentFN_21	StudentLN_21	(student21@student.ulk.ac.rw,stud.alt21@gmail.com)	{+25078900021,+25072200021}	(Kigali,Nyarugenge,Nyamirambo,"Village 21")	2026-06-16 10:59:13.367569	ULK-STU-2024-1021	3.73	2024	2
42	StudentFN_22	StudentLN_22	(student22@student.ulk.ac.rw,stud.alt22@gmail.com)	{+25078900022,+25072200022}	(Kigali,Nyarugenge,Nyamirambo,"Village 22")	2026-06-16 10:59:13.367569	ULK-STU-2024-1022	2.22	2025	3
43	StudentFN_23	StudentLN_23	(student23@student.ulk.ac.rw,stud.alt23@gmail.com)	{+25078900023,+25072200023}	(Kigali,Nyarugenge,Nyamirambo,"Village 23")	2026-06-16 10:59:13.367569	ULK-STU-2024-1023	2.02	2026	4
44	StudentFN_24	StudentLN_24	(student24@student.ulk.ac.rw,stud.alt24@gmail.com)	{+25078900024,+25072200024}	(Kigali,Nyarugenge,Nyamirambo,"Village 24")	2026-06-16 10:59:13.367569	ULK-STU-2024-1024	2.54	2024	1
45	StudentFN_25	StudentLN_25	(student25@student.ulk.ac.rw,stud.alt25@gmail.com)	{+25078900025,+25072200025}	(Kigali,Nyarugenge,Nyamirambo,"Village 25")	2026-06-16 10:59:13.367569	ULK-STU-2024-1025	2.97	2025	2
46	StudentFN_26	StudentLN_26	(student26@student.ulk.ac.rw,stud.alt26@gmail.com)	{+25078900026,+25072200026}	(Kigali,Nyarugenge,Nyamirambo,"Village 26")	2026-06-16 10:59:13.367569	ULK-STU-2024-1026	3.64	2026	3
47	StudentFN_27	StudentLN_27	(student27@student.ulk.ac.rw,stud.alt27@gmail.com)	{+25078900027,+25072200027}	(Kigali,Nyarugenge,Nyamirambo,"Village 27")	2026-06-16 10:59:13.367569	ULK-STU-2024-1027	2.23	2024	4
48	StudentFN_28	StudentLN_28	(student28@student.ulk.ac.rw,stud.alt28@gmail.com)	{+25078900028,+25072200028}	(Kigali,Nyarugenge,Nyamirambo,"Village 28")	2026-06-16 10:59:13.367569	ULK-STU-2024-1028	3.82	2025	1
49	StudentFN_29	StudentLN_29	(student29@student.ulk.ac.rw,stud.alt29@gmail.com)	{+25078900029,+25072200029}	(Kigali,Nyarugenge,Nyamirambo,"Village 29")	2026-06-16 10:59:13.367569	ULK-STU-2024-1029	3.71	2026	2
50	StudentFN_30	StudentLN_30	(student30@student.ulk.ac.rw,stud.alt30@gmail.com)	{+25078900030,+25072200030}	(Kigali,Nyarugenge,Nyamirambo,"Village 30")	2026-06-16 10:59:13.367569	ULK-STU-2024-1030	2.27	2024	3
51	StudentFN_31	StudentLN_31	(student31@student.ulk.ac.rw,stud.alt31@gmail.com)	{+25078900031,+25072200031}	(Kigali,Nyarugenge,Nyamirambo,"Village 31")	2026-06-16 10:59:13.367569	ULK-STU-2024-1031	2.16	2025	4
52	StudentFN_32	StudentLN_32	(student32@student.ulk.ac.rw,stud.alt32@gmail.com)	{+25078900032,+25072200032}	(Kigali,Nyarugenge,Nyamirambo,"Village 32")	2026-06-16 10:59:13.367569	ULK-STU-2024-1032	3.85	2026	1
53	StudentFN_33	StudentLN_33	(student33@student.ulk.ac.rw,stud.alt33@gmail.com)	{+25078900033,+25072200033}	(Kigali,Nyarugenge,Nyamirambo,"Village 33")	2026-06-16 10:59:13.367569	ULK-STU-2024-1033	2.81	2024	2
54	StudentFN_34	StudentLN_34	(student34@student.ulk.ac.rw,stud.alt34@gmail.com)	{+25078900034,+25072200034}	(Kigali,Nyarugenge,Nyamirambo,"Village 34")	2026-06-16 10:59:13.367569	ULK-STU-2024-1034	2.17	2025	3
55	StudentFN_35	StudentLN_35	(student35@student.ulk.ac.rw,stud.alt35@gmail.com)	{+25078900035,+25072200035}	(Kigali,Nyarugenge,Nyamirambo,"Village 35")	2026-06-16 10:59:13.367569	ULK-STU-2024-1035	2.61	2026	4
56	StudentFN_36	StudentLN_36	(student36@student.ulk.ac.rw,stud.alt36@gmail.com)	{+25078900036,+25072200036}	(Kigali,Nyarugenge,Nyamirambo,"Village 36")	2026-06-16 10:59:13.367569	ULK-STU-2024-1036	2.54	2024	1
57	StudentFN_37	StudentLN_37	(student37@student.ulk.ac.rw,stud.alt37@gmail.com)	{+25078900037,+25072200037}	(Kigali,Nyarugenge,Nyamirambo,"Village 37")	2026-06-16 10:59:13.367569	ULK-STU-2024-1037	3.04	2025	2
58	StudentFN_38	StudentLN_38	(student38@student.ulk.ac.rw,stud.alt38@gmail.com)	{+25078900038,+25072200038}	(Kigali,Nyarugenge,Nyamirambo,"Village 38")	2026-06-16 10:59:13.367569	ULK-STU-2024-1038	2.03	2026	3
59	StudentFN_39	StudentLN_39	(student39@student.ulk.ac.rw,stud.alt39@gmail.com)	{+25078900039,+25072200039}	(Kigali,Nyarugenge,Nyamirambo,"Village 39")	2026-06-16 10:59:13.367569	ULK-STU-2024-1039	2.79	2024	4
60	StudentFN_40	StudentLN_40	(student40@student.ulk.ac.rw,stud.alt40@gmail.com)	{+25078900040,+25072200040}	(Kigali,Nyarugenge,Nyamirambo,"Village 40")	2026-06-16 10:59:13.367569	ULK-STU-2024-1040	3.13	2025	1
61	StudentFN_41	StudentLN_41	(student41@student.ulk.ac.rw,stud.alt41@gmail.com)	{+25078900041,+25072200041}	(Kigali,Nyarugenge,Nyamirambo,"Village 41")	2026-06-16 10:59:13.367569	ULK-STU-2024-1041	3.66	2026	2
62	StudentFN_42	StudentLN_42	(student42@student.ulk.ac.rw,stud.alt42@gmail.com)	{+25078900042,+25072200042}	(Kigali,Nyarugenge,Nyamirambo,"Village 42")	2026-06-16 10:59:13.367569	ULK-STU-2024-1042	3.91	2024	3
63	StudentFN_43	StudentLN_43	(student43@student.ulk.ac.rw,stud.alt43@gmail.com)	{+25078900043,+25072200043}	(Kigali,Nyarugenge,Nyamirambo,"Village 43")	2026-06-16 10:59:13.367569	ULK-STU-2024-1043	2.64	2025	4
64	StudentFN_44	StudentLN_44	(student44@student.ulk.ac.rw,stud.alt44@gmail.com)	{+25078900044,+25072200044}	(Kigali,Nyarugenge,Nyamirambo,"Village 44")	2026-06-16 10:59:13.367569	ULK-STU-2024-1044	2.52	2026	1
65	StudentFN_45	StudentLN_45	(student45@student.ulk.ac.rw,stud.alt45@gmail.com)	{+25078900045,+25072200045}	(Kigali,Nyarugenge,Nyamirambo,"Village 45")	2026-06-16 10:59:13.367569	ULK-STU-2024-1045	3.17	2024	2
66	StudentFN_46	StudentLN_46	(student46@student.ulk.ac.rw,stud.alt46@gmail.com)	{+25078900046,+25072200046}	(Kigali,Nyarugenge,Nyamirambo,"Village 46")	2026-06-16 10:59:13.367569	ULK-STU-2024-1046	2.89	2025	3
67	StudentFN_47	StudentLN_47	(student47@student.ulk.ac.rw,stud.alt47@gmail.com)	{+25078900047,+25072200047}	(Kigali,Nyarugenge,Nyamirambo,"Village 47")	2026-06-16 10:59:13.367569	ULK-STU-2024-1047	3.29	2026	4
68	StudentFN_48	StudentLN_48	(student48@student.ulk.ac.rw,stud.alt48@gmail.com)	{+25078900048,+25072200048}	(Kigali,Nyarugenge,Nyamirambo,"Village 48")	2026-06-16 10:59:13.367569	ULK-STU-2024-1048	3.74	2024	1
69	StudentFN_49	StudentLN_49	(student49@student.ulk.ac.rw,stud.alt49@gmail.com)	{+25078900049,+25072200049}	(Kigali,Nyarugenge,Nyamirambo,"Village 49")	2026-06-16 10:59:13.367569	ULK-STU-2024-1049	2.67	2025	2
70	StudentFN_50	StudentLN_50	(student50@student.ulk.ac.rw,stud.alt50@gmail.com)	{+25078900050,+25072200050}	(Kigali,Nyarugenge,Nyamirambo,"Village 50")	2026-06-16 10:59:13.367569	ULK-STU-2024-1050	3.00	2026	3
71	StudentFN_51	StudentLN_51	(student51@student.ulk.ac.rw,stud.alt51@gmail.com)	{+25078900051,+25072200051}	(Kigali,Nyarugenge,Nyamirambo,"Village 51")	2026-06-16 10:59:13.367569	ULK-STU-2024-1051	3.18	2024	4
72	StudentFN_52	StudentLN_52	(student52@student.ulk.ac.rw,stud.alt52@gmail.com)	{+25078900052,+25072200052}	(Kigali,Nyarugenge,Nyamirambo,"Village 52")	2026-06-16 10:59:13.367569	ULK-STU-2024-1052	3.05	2025	1
73	StudentFN_53	StudentLN_53	(student53@student.ulk.ac.rw,stud.alt53@gmail.com)	{+25078900053,+25072200053}	(Kigali,Nyarugenge,Nyamirambo,"Village 53")	2026-06-16 10:59:13.367569	ULK-STU-2024-1053	2.41	2026	2
74	StudentFN_54	StudentLN_54	(student54@student.ulk.ac.rw,stud.alt54@gmail.com)	{+25078900054,+25072200054}	(Kigali,Nyarugenge,Nyamirambo,"Village 54")	2026-06-16 10:59:13.367569	ULK-STU-2024-1054	3.79	2024	3
75	StudentFN_55	StudentLN_55	(student55@student.ulk.ac.rw,stud.alt55@gmail.com)	{+25078900055,+25072200055}	(Kigali,Nyarugenge,Nyamirambo,"Village 55")	2026-06-16 10:59:13.367569	ULK-STU-2024-1055	3.89	2025	4
76	StudentFN_56	StudentLN_56	(student56@student.ulk.ac.rw,stud.alt56@gmail.com)	{+25078900056,+25072200056}	(Kigali,Nyarugenge,Nyamirambo,"Village 56")	2026-06-16 10:59:13.367569	ULK-STU-2024-1056	3.17	2026	1
77	StudentFN_57	StudentLN_57	(student57@student.ulk.ac.rw,stud.alt57@gmail.com)	{+25078900057,+25072200057}	(Kigali,Nyarugenge,Nyamirambo,"Village 57")	2026-06-16 10:59:13.367569	ULK-STU-2024-1057	3.58	2024	2
78	StudentFN_58	StudentLN_58	(student58@student.ulk.ac.rw,stud.alt58@gmail.com)	{+25078900058,+25072200058}	(Kigali,Nyarugenge,Nyamirambo,"Village 58")	2026-06-16 10:59:13.367569	ULK-STU-2024-1058	2.55	2025	3
79	StudentFN_59	StudentLN_59	(student59@student.ulk.ac.rw,stud.alt59@gmail.com)	{+25078900059,+25072200059}	(Kigali,Nyarugenge,Nyamirambo,"Village 59")	2026-06-16 10:59:13.367569	ULK-STU-2024-1059	3.44	2026	4
80	StudentFN_60	StudentLN_60	(student60@student.ulk.ac.rw,stud.alt60@gmail.com)	{+25078900060,+25072200060}	(Kigali,Nyarugenge,Nyamirambo,"Village 60")	2026-06-16 10:59:13.367569	ULK-STU-2024-1060	3.30	2024	1
81	StudentFN_61	StudentLN_61	(student61@student.ulk.ac.rw,stud.alt61@gmail.com)	{+25078900061,+25072200061}	(Kigali,Nyarugenge,Nyamirambo,"Village 61")	2026-06-16 10:59:13.367569	ULK-STU-2024-1061	3.61	2025	2
82	StudentFN_62	StudentLN_62	(student62@student.ulk.ac.rw,stud.alt62@gmail.com)	{+25078900062,+25072200062}	(Kigali,Nyarugenge,Nyamirambo,"Village 62")	2026-06-16 10:59:13.367569	ULK-STU-2024-1062	2.52	2026	3
83	StudentFN_63	StudentLN_63	(student63@student.ulk.ac.rw,stud.alt63@gmail.com)	{+25078900063,+25072200063}	(Kigali,Nyarugenge,Nyamirambo,"Village 63")	2026-06-16 10:59:13.367569	ULK-STU-2024-1063	3.64	2024	4
84	StudentFN_64	StudentLN_64	(student64@student.ulk.ac.rw,stud.alt64@gmail.com)	{+25078900064,+25072200064}	(Kigali,Nyarugenge,Nyamirambo,"Village 64")	2026-06-16 10:59:13.367569	ULK-STU-2024-1064	2.79	2025	1
85	StudentFN_65	StudentLN_65	(student65@student.ulk.ac.rw,stud.alt65@gmail.com)	{+25078900065,+25072200065}	(Kigali,Nyarugenge,Nyamirambo,"Village 65")	2026-06-16 10:59:13.367569	ULK-STU-2024-1065	2.21	2026	2
86	StudentFN_66	StudentLN_66	(student66@student.ulk.ac.rw,stud.alt66@gmail.com)	{+25078900066,+25072200066}	(Kigali,Nyarugenge,Nyamirambo,"Village 66")	2026-06-16 10:59:13.367569	ULK-STU-2024-1066	2.04	2024	3
87	StudentFN_67	StudentLN_67	(student67@student.ulk.ac.rw,stud.alt67@gmail.com)	{+25078900067,+25072200067}	(Kigali,Nyarugenge,Nyamirambo,"Village 67")	2026-06-16 10:59:13.367569	ULK-STU-2024-1067	3.32	2025	4
88	StudentFN_68	StudentLN_68	(student68@student.ulk.ac.rw,stud.alt68@gmail.com)	{+25078900068,+25072200068}	(Kigali,Nyarugenge,Nyamirambo,"Village 68")	2026-06-16 10:59:13.367569	ULK-STU-2024-1068	3.16	2026	1
89	StudentFN_69	StudentLN_69	(student69@student.ulk.ac.rw,stud.alt69@gmail.com)	{+25078900069,+25072200069}	(Kigali,Nyarugenge,Nyamirambo,"Village 69")	2026-06-16 10:59:13.367569	ULK-STU-2024-1069	2.34	2024	2
90	StudentFN_70	StudentLN_70	(student70@student.ulk.ac.rw,stud.alt70@gmail.com)	{+25078900070,+25072200070}	(Kigali,Nyarugenge,Nyamirambo,"Village 70")	2026-06-16 10:59:13.367569	ULK-STU-2024-1070	3.39	2025	3
91	StudentFN_71	StudentLN_71	(student71@student.ulk.ac.rw,stud.alt71@gmail.com)	{+25078900071,+25072200071}	(Kigali,Nyarugenge,Nyamirambo,"Village 71")	2026-06-16 10:59:13.367569	ULK-STU-2024-1071	2.93	2026	4
92	StudentFN_72	StudentLN_72	(student72@student.ulk.ac.rw,stud.alt72@gmail.com)	{+25078900072,+25072200072}	(Kigali,Nyarugenge,Nyamirambo,"Village 72")	2026-06-16 10:59:13.367569	ULK-STU-2024-1072	2.87	2024	1
93	StudentFN_73	StudentLN_73	(student73@student.ulk.ac.rw,stud.alt73@gmail.com)	{+25078900073,+25072200073}	(Kigali,Nyarugenge,Nyamirambo,"Village 73")	2026-06-16 10:59:13.367569	ULK-STU-2024-1073	2.55	2025	2
94	StudentFN_74	StudentLN_74	(student74@student.ulk.ac.rw,stud.alt74@gmail.com)	{+25078900074,+25072200074}	(Kigali,Nyarugenge,Nyamirambo,"Village 74")	2026-06-16 10:59:13.367569	ULK-STU-2024-1074	3.42	2026	3
95	StudentFN_75	StudentLN_75	(student75@student.ulk.ac.rw,stud.alt75@gmail.com)	{+25078900075,+25072200075}	(Kigali,Nyarugenge,Nyamirambo,"Village 75")	2026-06-16 10:59:13.367569	ULK-STU-2024-1075	2.34	2024	4
96	StudentFN_76	StudentLN_76	(student76@student.ulk.ac.rw,stud.alt76@gmail.com)	{+25078900076,+25072200076}	(Kigali,Nyarugenge,Nyamirambo,"Village 76")	2026-06-16 10:59:13.367569	ULK-STU-2024-1076	3.97	2025	1
97	StudentFN_77	StudentLN_77	(student77@student.ulk.ac.rw,stud.alt77@gmail.com)	{+25078900077,+25072200077}	(Kigali,Nyarugenge,Nyamirambo,"Village 77")	2026-06-16 10:59:13.367569	ULK-STU-2024-1077	2.55	2026	2
98	StudentFN_78	StudentLN_78	(student78@student.ulk.ac.rw,stud.alt78@gmail.com)	{+25078900078,+25072200078}	(Kigali,Nyarugenge,Nyamirambo,"Village 78")	2026-06-16 10:59:13.367569	ULK-STU-2024-1078	3.48	2024	3
99	StudentFN_79	StudentLN_79	(student79@student.ulk.ac.rw,stud.alt79@gmail.com)	{+25078900079,+25072200079}	(Kigali,Nyarugenge,Nyamirambo,"Village 79")	2026-06-16 10:59:13.367569	ULK-STU-2024-1079	2.25	2025	4
100	StudentFN_80	StudentLN_80	(student80@student.ulk.ac.rw,stud.alt80@gmail.com)	{+25078900080,+25072200080}	(Kigali,Nyarugenge,Nyamirambo,"Village 80")	2026-06-16 10:59:13.367569	ULK-STU-2024-1080	2.42	2026	1
101	StudentFN_81	StudentLN_81	(student81@student.ulk.ac.rw,stud.alt81@gmail.com)	{+25078900081,+25072200081}	(Kigali,Nyarugenge,Nyamirambo,"Village 81")	2026-06-16 10:59:13.367569	ULK-STU-2024-1081	3.60	2024	2
102	StudentFN_82	StudentLN_82	(student82@student.ulk.ac.rw,stud.alt82@gmail.com)	{+25078900082,+25072200082}	(Kigali,Nyarugenge,Nyamirambo,"Village 82")	2026-06-16 10:59:13.367569	ULK-STU-2024-1082	2.20	2025	3
103	StudentFN_83	StudentLN_83	(student83@student.ulk.ac.rw,stud.alt83@gmail.com)	{+25078900083,+25072200083}	(Kigali,Nyarugenge,Nyamirambo,"Village 83")	2026-06-16 10:59:13.367569	ULK-STU-2024-1083	2.99	2026	4
104	StudentFN_84	StudentLN_84	(student84@student.ulk.ac.rw,stud.alt84@gmail.com)	{+25078900084,+25072200084}	(Kigali,Nyarugenge,Nyamirambo,"Village 84")	2026-06-16 10:59:13.367569	ULK-STU-2024-1084	3.88	2024	1
105	StudentFN_85	StudentLN_85	(student85@student.ulk.ac.rw,stud.alt85@gmail.com)	{+25078900085,+25072200085}	(Kigali,Nyarugenge,Nyamirambo,"Village 85")	2026-06-16 10:59:13.367569	ULK-STU-2024-1085	2.14	2025	2
106	StudentFN_86	StudentLN_86	(student86@student.ulk.ac.rw,stud.alt86@gmail.com)	{+25078900086,+25072200086}	(Kigali,Nyarugenge,Nyamirambo,"Village 86")	2026-06-16 10:59:13.367569	ULK-STU-2024-1086	3.47	2026	3
107	StudentFN_87	StudentLN_87	(student87@student.ulk.ac.rw,stud.alt87@gmail.com)	{+25078900087,+25072200087}	(Kigali,Nyarugenge,Nyamirambo,"Village 87")	2026-06-16 10:59:13.367569	ULK-STU-2024-1087	2.36	2024	4
108	StudentFN_88	StudentLN_88	(student88@student.ulk.ac.rw,stud.alt88@gmail.com)	{+25078900088,+25072200088}	(Kigali,Nyarugenge,Nyamirambo,"Village 88")	2026-06-16 10:59:13.367569	ULK-STU-2024-1088	3.84	2025	1
109	StudentFN_89	StudentLN_89	(student89@student.ulk.ac.rw,stud.alt89@gmail.com)	{+25078900089,+25072200089}	(Kigali,Nyarugenge,Nyamirambo,"Village 89")	2026-06-16 10:59:13.367569	ULK-STU-2024-1089	3.44	2026	2
110	StudentFN_90	StudentLN_90	(student90@student.ulk.ac.rw,stud.alt90@gmail.com)	{+25078900090,+25072200090}	(Kigali,Nyarugenge,Nyamirambo,"Village 90")	2026-06-16 10:59:13.367569	ULK-STU-2024-1090	3.16	2024	3
111	StudentFN_91	StudentLN_91	(student91@student.ulk.ac.rw,stud.alt91@gmail.com)	{+25078900091,+25072200091}	(Kigali,Nyarugenge,Nyamirambo,"Village 91")	2026-06-16 10:59:13.367569	ULK-STU-2024-1091	2.82	2025	4
112	StudentFN_92	StudentLN_92	(student92@student.ulk.ac.rw,stud.alt92@gmail.com)	{+25078900092,+25072200092}	(Kigali,Nyarugenge,Nyamirambo,"Village 92")	2026-06-16 10:59:13.367569	ULK-STU-2024-1092	2.47	2026	1
113	StudentFN_93	StudentLN_93	(student93@student.ulk.ac.rw,stud.alt93@gmail.com)	{+25078900093,+25072200093}	(Kigali,Nyarugenge,Nyamirambo,"Village 93")	2026-06-16 10:59:13.367569	ULK-STU-2024-1093	2.29	2024	2
114	StudentFN_94	StudentLN_94	(student94@student.ulk.ac.rw,stud.alt94@gmail.com)	{+25078900094,+25072200094}	(Kigali,Nyarugenge,Nyamirambo,"Village 94")	2026-06-16 10:59:13.367569	ULK-STU-2024-1094	3.04	2025	3
115	StudentFN_95	StudentLN_95	(student95@student.ulk.ac.rw,stud.alt95@gmail.com)	{+25078900095,+25072200095}	(Kigali,Nyarugenge,Nyamirambo,"Village 95")	2026-06-16 10:59:13.367569	ULK-STU-2024-1095	2.13	2026	4
116	StudentFN_96	StudentLN_96	(student96@student.ulk.ac.rw,stud.alt96@gmail.com)	{+25078900096,+25072200096}	(Kigali,Nyarugenge,Nyamirambo,"Village 96")	2026-06-16 10:59:13.367569	ULK-STU-2024-1096	2.37	2024	1
117	StudentFN_97	StudentLN_97	(student97@student.ulk.ac.rw,stud.alt97@gmail.com)	{+25078900097,+25072200097}	(Kigali,Nyarugenge,Nyamirambo,"Village 97")	2026-06-16 10:59:13.367569	ULK-STU-2024-1097	2.08	2025	2
118	StudentFN_98	StudentLN_98	(student98@student.ulk.ac.rw,stud.alt98@gmail.com)	{+25078900098,+25072200098}	(Kigali,Nyarugenge,Nyamirambo,"Village 98")	2026-06-16 10:59:13.367569	ULK-STU-2024-1098	3.30	2026	3
119	StudentFN_99	StudentLN_99	(student99@student.ulk.ac.rw,stud.alt99@gmail.com)	{+25078900099,+25072200099}	(Kigali,Nyarugenge,Nyamirambo,"Village 99")	2026-06-16 10:59:13.367569	ULK-STU-2024-1099	2.19	2024	4
120	StudentFN_100	StudentLN_100	(student100@student.ulk.ac.rw,stud.alt100@gmail.com)	{+250789000100,+250722000100}	(Kigali,Nyarugenge,Nyamirambo,"Village 100")	2026-06-16 10:59:13.367569	ULK-STU-2024-1100	2.57	2025	1
\.


--
-- Name: academicevent_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.academicevent_event_id_seq', 1, false);


--
-- Name: classroom_classroom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.classroom_classroom_id_seq', 1, false);


--
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.course_course_id_seq', 1, false);


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.department_department_id_seq', 1, false);


--
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.enrollment_enrollment_id_seq', 1, false);


--
-- Name: faculty_faculty_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.faculty_faculty_id_seq', 1, false);


--
-- Name: laboratory_lab_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.laboratory_lab_id_seq', 1, false);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.person_person_id_seq', 1, false);


--
-- Name: researchproject_project_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.researchproject_project_id_seq', 1, false);


--
-- Name: academicevent_event_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.academicevent_event_id_seq', 3, true);


--
-- Name: academicspace_space_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.academicspace_space_id_seq', 7, true);


--
-- Name: course_course_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.course_course_id_seq', 30, true);


--
-- Name: coursedelivery_delivery_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.coursedelivery_delivery_id_seq', 30, true);


--
-- Name: department_department_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.department_department_id_seq', 4, true);


--
-- Name: enrollment_enrollment_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.enrollment_enrollment_id_seq', 200, true);


--
-- Name: eventparticipant_participation_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.eventparticipant_participation_id_seq', 40, true);


--
-- Name: person_person_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.person_person_id_seq', 120, true);


--
-- Name: researchproject_project_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.researchproject_project_id_seq', 15, true);


--
-- Name: resource_resource_id_seq; Type: SEQUENCE SET; Schema: ulk_core; Owner: postgres
--

SELECT pg_catalog.setval('ulk_core.resource_resource_id_seq', 4, true);


--
-- Name: academicevent academicevent_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.academicevent
    ADD CONSTRAINT academicevent_pkey PRIMARY KEY (event_id);


--
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (classroom_id);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (enrollment_id);


--
-- Name: faculty faculty_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.faculty
    ADD CONSTRAINT faculty_pkey PRIMARY KEY (faculty_id);


--
-- Name: laboratory laboratory_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.laboratory
    ADD CONSTRAINT laboratory_pkey PRIMARY KEY (lab_id);


--
-- Name: person person_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.person
    ADD CONSTRAINT person_pkey PRIMARY KEY (person_id);


--
-- Name: researchproject researchproject_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.researchproject
    ADD CONSTRAINT researchproject_pkey PRIMARY KEY (project_id);


--
-- Name: academicevent academicevent_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.academicevent
    ADD CONSTRAINT academicevent_pkey PRIMARY KEY (event_id);


--
-- Name: academicspace academicspace_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.academicspace
    ADD CONSTRAINT academicspace_pkey PRIMARY KEY (space_id);


--
-- Name: academicspace academicspace_room_number_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.academicspace
    ADD CONSTRAINT academicspace_room_number_key UNIQUE (room_number);


--
-- Name: classroom classroom_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.classroom
    ADD CONSTRAINT classroom_pkey PRIMARY KEY (space_id);


--
-- Name: course course_code_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.course
    ADD CONSTRAINT course_code_key UNIQUE (code);


--
-- Name: course course_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.course
    ADD CONSTRAINT course_pkey PRIMARY KEY (course_id);


--
-- Name: coursedelivery coursedelivery_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.coursedelivery
    ADD CONSTRAINT coursedelivery_pkey PRIMARY KEY (delivery_id);


--
-- Name: department department_code_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.department
    ADD CONSTRAINT department_code_key UNIQUE (code);


--
-- Name: department department_name_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.department
    ADD CONSTRAINT department_name_key UNIQUE (name);


--
-- Name: department department_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.department
    ADD CONSTRAINT department_pkey PRIMARY KEY (department_id);


--
-- Name: enrollment enrollment_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.enrollment
    ADD CONSTRAINT enrollment_pkey PRIMARY KEY (enrollment_id);


--
-- Name: eventparticipant eventparticipant_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.eventparticipant
    ADD CONSTRAINT eventparticipant_pkey PRIMARY KEY (participation_id);


--
-- Name: laboratory laboratory_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.laboratory
    ADD CONSTRAINT laboratory_pkey PRIMARY KEY (space_id);


--
-- Name: lecturer lecturer_employee_id_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.lecturer
    ADD CONSTRAINT lecturer_employee_id_key UNIQUE (employee_id);


--
-- Name: person pk_person; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.person
    ADD CONSTRAINT pk_person PRIMARY KEY (person_id);


--
-- Name: researchproject researchproject_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.researchproject
    ADD CONSTRAINT researchproject_pkey PRIMARY KEY (project_id);


--
-- Name: resource resource_asset_tag_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.resource
    ADD CONSTRAINT resource_asset_tag_key UNIQUE (asset_tag);


--
-- Name: resource resource_pkey; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.resource
    ADD CONSTRAINT resource_pkey PRIMARY KEY (resource_id);


--
-- Name: student student_registration_number_key; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.student
    ADD CONSTRAINT student_registration_number_key UNIQUE (registration_number);


--
-- Name: coursedelivery uniq_delivery; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.coursedelivery
    ADD CONSTRAINT uniq_delivery UNIQUE (course_id, lecturer_id, semester, academic_year);


--
-- Name: eventparticipant uniq_event_participation; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.eventparticipant
    ADD CONSTRAINT uniq_event_participation UNIQUE (event_id, participant_type, person_id);


--
-- Name: enrollment uniq_student_enrollment; Type: CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.enrollment
    ADD CONSTRAINT uniq_student_enrollment UNIQUE (student_id, delivery_id);


--
-- Name: idx_lecturer_person_id; Type: INDEX; Schema: ulk_core; Owner: postgres
--

CREATE UNIQUE INDEX idx_lecturer_person_id ON ulk_core.lecturer USING btree (person_id);


--
-- Name: idx_research_metadata_gin; Type: INDEX; Schema: ulk_core; Owner: postgres
--

CREATE INDEX idx_research_metadata_gin ON ulk_core.researchproject USING gin (project_metadata);


--
-- Name: idx_student_person_id; Type: INDEX; Schema: ulk_core; Owner: postgres
--

CREATE UNIQUE INDEX idx_student_person_id ON ulk_core.student USING btree (person_id);


--
-- Name: course course_department_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.course
    ADD CONSTRAINT course_department_id_fkey FOREIGN KEY (department_id) REFERENCES public.department(department_id);


--
-- Name: department department_faculty_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.department
    ADD CONSTRAINT department_faculty_id_fkey FOREIGN KEY (faculty_id) REFERENCES public.faculty(faculty_id);


--
-- Name: academicevent academicevent_venue_space_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.academicevent
    ADD CONSTRAINT academicevent_venue_space_id_fkey FOREIGN KEY (venue_space_id) REFERENCES ulk_core.academicspace(space_id) ON DELETE SET NULL;


--
-- Name: classroom classroom_space_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.classroom
    ADD CONSTRAINT classroom_space_id_fkey FOREIGN KEY (space_id) REFERENCES ulk_core.academicspace(space_id) ON DELETE CASCADE;


--
-- Name: course course_department_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.course
    ADD CONSTRAINT course_department_id_fkey FOREIGN KEY (department_id) REFERENCES ulk_core.department(department_id) ON DELETE RESTRICT;


--
-- Name: coursedelivery coursedelivery_course_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.coursedelivery
    ADD CONSTRAINT coursedelivery_course_id_fkey FOREIGN KEY (course_id) REFERENCES ulk_core.course(course_id) ON DELETE CASCADE;


--
-- Name: coursedelivery coursedelivery_space_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.coursedelivery
    ADD CONSTRAINT coursedelivery_space_id_fkey FOREIGN KEY (space_id) REFERENCES ulk_core.academicspace(space_id) ON DELETE SET NULL;


--
-- Name: enrollment enrollment_delivery_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.enrollment
    ADD CONSTRAINT enrollment_delivery_id_fkey FOREIGN KEY (delivery_id) REFERENCES ulk_core.coursedelivery(delivery_id) ON DELETE CASCADE;


--
-- Name: eventparticipant eventparticipant_event_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.eventparticipant
    ADD CONSTRAINT eventparticipant_event_id_fkey FOREIGN KEY (event_id) REFERENCES ulk_core.academicevent(event_id) ON DELETE CASCADE;


--
-- Name: laboratory laboratory_space_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.laboratory
    ADD CONSTRAINT laboratory_space_id_fkey FOREIGN KEY (space_id) REFERENCES ulk_core.academicspace(space_id) ON DELETE CASCADE;


--
-- Name: resource resource_department_id_fkey; Type: FK CONSTRAINT; Schema: ulk_core; Owner: postgres
--

ALTER TABLE ONLY ulk_core.resource
    ADD CONSTRAINT resource_department_id_fkey FOREIGN KEY (department_id) REFERENCES ulk_core.department(department_id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

\unrestrict wV6ti9SDzuJnyAiqUgdqpKYfHEl9oLPE4cGq7bxmvQuFLYNgz3iJeAeabw46sPY

