--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

-- Started on 2022-03-18 09:36:13

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
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
-- TOC entry 200 (class 1259 OID 24807)
-- Name: usuarios; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.usuarios (
    "Codigo" integer NOT NULL,
    "Nome" character varying(100) NOT NULL,
    "Cpf" character varying(20) NOT NULL,
    "Endereco" character varying(200) NOT NULL,
    "Telefone" character varying(20) NOT NULL
);


ALTER TABLE public.usuarios OWNER TO postgres;

--
-- TOC entry 201 (class 1259 OID 24826)
-- Name: usuarios_Codigo_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

ALTER TABLE public.usuarios ALTER COLUMN "Codigo" ADD GENERATED ALWAYS AS IDENTITY (
    SEQUENCE NAME public."usuarios_Codigo_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    MAXVALUE 999
    CACHE 1
);


--
-- TOC entry 2851 (class 2606 OID 24811)
-- Name: usuarios usuario_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.usuarios
    ADD CONSTRAINT usuario_pkey PRIMARY KEY ("Codigo");


-- Completed on 2022-03-18 09:36:13

--
-- PostgreSQL database dump complete
--

