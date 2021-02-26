--
-- PostgreSQL database dump
--

-- Dumped from database version 12.4
-- Dumped by pg_dump version 12.4

-- Started on 2020-09-07 00:25:51

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

--
-- TOC entry 2889 (class 0 OID 17209)
-- Dependencies: 213
-- Data for Name: family; Type: TABLE DATA; Schema: public; Owner: postgres
--

INSERT INTO family ("id", "name", "created_at", "updated_at") VALUES
(1, 'Londubat', '2020-08-27 00:05:14.225918', NULL),
(2, 'Potter', '2020-08-27 00:05:14.225918', NULL),
(3, 'Evans', '2020-08-27 00:05:14.225918', NULL),
(4, 'Weasley', '2020-08-27 00:05:14.225918', NULL),
(5, 'Malefoy', '2020-08-27 00:05:14.225918', NULL),
(6, 'Dumbledore', '2020-08-27 00:05:14.225918', NULL),
(7, 'Black', '2020-08-27 00:05:14.225918', NULL),
(8, 'Inconnu', '2020-08-27 17:26:15.401159', NULL);


--
-- TOC entry 2895 (class 0 OID 0)
-- Dependencies: 212
-- Name: family_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.family_id_seq', 1, false);


-- Completed on 2020-09-07 00:25:52

--
-- PostgreSQL database dump complete
--

