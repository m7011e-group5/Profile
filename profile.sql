--
-- PostgreSQL database dump
--

\restrict lSg2x6TzadkHZStCoNE6IyQiVsKwUmEDdPRod3EjbDHdqdVbhakhrfmQA0i6nno

-- Dumped from database version 18.7
-- Dumped by pg_dump version 18.7

-- Started on 2026-11-26 19:44:36

SET  statement_timeout = 0;
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
-- TOC entry 221 (class 1259 OID 16426)
-- Name: Course; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."Course" (
    course_id integer NOT NULL,
    course_name character varying(150) NOT NULL
);


ALTER TABLE public."Course" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16425)
-- Name: Course_course_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public."Course" ALTER COLUMN course_id ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."Course_course_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- TOC entry 222 (class 1259 OID 16433)
-- Name: StudentCourse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StudentCourse" (
    user_id uuid NOT NULL,
    course_id integer NOT NULL
);


ALTER TABLE public."StudentCourse" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 16393)
-- Name: StudentProfile; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."StudentProfile" (
    user_id uuid DEFAULT gen_random_uuid() NOT NULL,
    display_name character varying(100) NOT NULL
);


ALTER TABLE public."StudentProfile" OWNER TO postgres;

--
-- TOC entry 4868 (class 2606 OID 16432)
-- Name: Course Course_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."Course"
    ADD CONSTRAINT "Course_pkey" PRIMARY KEY (course_id);


--
-- TOC entry 4870 (class 2606 OID 16439)
-- Name: StudentCourse StudentCourse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentCourse"
    ADD CONSTRAINT "StudentCourse_pkey" PRIMARY KEY (user_id, course_id);


--
-- TOC entry 4866 (class 2606 OID 16399)
-- Name: StudentProfile StudentProfile_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentProfile"
    ADD CONSTRAINT "StudentProfile_pkey" PRIMARY KEY (user_id);


--
-- TOC entry 4871 (class 2606 OID 16445)
-- Name: StudentCourse StudentCourse_course_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentCourse"
    ADD CONSTRAINT "StudentCourse_course_id_fkey" FOREIGN KEY (course_id) REFERENCES public."Course"(course_id) ON DELETE CASCADE;


--
-- TOC entry 4872 (class 2606 OID 16440)
-- Name: StudentCourse StudentCourse_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."StudentCourse"
    ADD CONSTRAINT "StudentCourse_user_id_fkey" FOREIGN KEY (user_id) REFERENCES public."StudentProfile"(user_id) ON DELETE CASCADE;


-- Completed on 2026-11-26 19:44:36

--
-- PostgreSQL database dump complete
--

\unrestrict lSg2x6TzadkHZStCoNE6IyQiVsKwUmEDdPRod3EjbDHdqdVbhakhrfmQA0i6nno

