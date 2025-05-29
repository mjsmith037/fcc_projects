--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: matches; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.matches (
    user_id integer NOT NULL,
    guesses integer NOT NULL
);


ALTER TABLE public.matches OWNER TO freecodecamp;

--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    name character varying(22)
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: matches; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.matches VALUES (3, 11);
INSERT INTO public.matches VALUES (3, 8);
INSERT INTO public.matches VALUES (4, 587);
INSERT INTO public.matches VALUES (4, 729);
INSERT INTO public.matches VALUES (5, 206);
INSERT INTO public.matches VALUES (5, 787);
INSERT INTO public.matches VALUES (4, 840);
INSERT INTO public.matches VALUES (4, 972);
INSERT INTO public.matches VALUES (4, 346);
INSERT INTO public.matches VALUES (6, 971);
INSERT INTO public.matches VALUES (6, 506);
INSERT INTO public.matches VALUES (7, 275);
INSERT INTO public.matches VALUES (7, 173);
INSERT INTO public.matches VALUES (6, 712);
INSERT INTO public.matches VALUES (6, 801);
INSERT INTO public.matches VALUES (6, 721);
INSERT INTO public.matches VALUES (8, 523);
INSERT INTO public.matches VALUES (8, 393);
INSERT INTO public.matches VALUES (9, 563);
INSERT INTO public.matches VALUES (9, 87);
INSERT INTO public.matches VALUES (8, 854);
INSERT INTO public.matches VALUES (8, 572);
INSERT INTO public.matches VALUES (8, 647);
INSERT INTO public.matches VALUES (10, 734);
INSERT INTO public.matches VALUES (10, 735);
INSERT INTO public.matches VALUES (11, 821);
INSERT INTO public.matches VALUES (11, 812);
INSERT INTO public.matches VALUES (10, 672);
INSERT INTO public.matches VALUES (10, 123);
INSERT INTO public.matches VALUES (10, 769);
INSERT INTO public.matches VALUES (13, 273);
INSERT INTO public.matches VALUES (13, 983);
INSERT INTO public.matches VALUES (14, 348);
INSERT INTO public.matches VALUES (14, 577);
INSERT INTO public.matches VALUES (13, 814);
INSERT INTO public.matches VALUES (13, 429);
INSERT INTO public.matches VALUES (13, 49);
INSERT INTO public.matches VALUES (15, 383);
INSERT INTO public.matches VALUES (15, 8);
INSERT INTO public.matches VALUES (16, 603);
INSERT INTO public.matches VALUES (16, 885);
INSERT INTO public.matches VALUES (15, 683);
INSERT INTO public.matches VALUES (15, 24);
INSERT INTO public.matches VALUES (15, 829);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (3, 'Matt');
INSERT INTO public.users VALUES (4, 'user_1748548091799');
INSERT INTO public.users VALUES (5, 'user_1748548091798');
INSERT INTO public.users VALUES (6, 'user_1748548239717');
INSERT INTO public.users VALUES (7, 'user_1748548239716');
INSERT INTO public.users VALUES (8, 'user_1748548256951');
INSERT INTO public.users VALUES (9, 'user_1748548256950');
INSERT INTO public.users VALUES (10, 'user_1748548265925');
INSERT INTO public.users VALUES (11, 'user_1748548265924');
INSERT INTO public.users VALUES (12, 'Marta');
INSERT INTO public.users VALUES (13, 'user_1748548617308');
INSERT INTO public.users VALUES (14, 'user_1748548617307');
INSERT INTO public.users VALUES (15, 'user_1748548637037');
INSERT INTO public.users VALUES (16, 'user_1748548637036');


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 16, true);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: matches matches_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.matches
    ADD CONSTRAINT matches_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

