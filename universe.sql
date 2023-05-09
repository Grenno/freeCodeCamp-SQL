--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_type text,
    galactic_radius_ly integer,
    galactic_age_bny double precision,
    active_nucleus boolean
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: master; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.master (
    moon_id integer,
    planet_id integer,
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    master_id integer NOT NULL
);


ALTER TABLE public.master OWNER TO freecodecamp;

--
-- Name: master_master_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.master_master_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.master_master_id_seq OWNER TO freecodecamp;

--
-- Name: master_master_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.master_master_id_seq OWNED BY public.master.master_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(255) NOT NULL,
    planet_id integer,
    orbital_radius numeric,
    circumference integer,
    habitable boolean,
    atmosphere boolean
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(255) NOT NULL,
    star_id integer,
    orbital_radius numeric,
    habitable boolean,
    avg_temp_in_c double precision,
    circumference integer,
    atmosphere text
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(255) NOT NULL,
    galaxy_id integer,
    star_type character varying(30),
    solar_mass text,
    has_planets boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: master master_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master ALTER COLUMN master_id SET DEFAULT nextval('public.master_master_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Spiral', 76000, 10, true);
INSERT INTO public.galaxy VALUES (3, 'Whirlpool', 'Spiral', 33450, 0.4, true);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', 52850, 13.8, false);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 'Spiral', 47450, 13.3, true);
INSERT INTO public.galaxy VALUES (5, 'Pinwheel', 'Spiral', 85000, 0.3, false);
INSERT INTO public.galaxy VALUES (6, 'Triangulum', 'Spiral', 30000, 8, false);


--
-- Data for Name: master; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.master VALUES (1, 3, 1, 1, 'Seehorn Base', 1);
INSERT INTO public.master VALUES (2, 4, 1, 1, 'Phobos Base Alpha', 2);
INSERT INTO public.master VALUES (6, 5, 1, 1, 'Ganymede Sunset Saloon', 3);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 3, 238900, 6783, false, false);
INSERT INTO public.moon VALUES (2, 'Phobos', 4, 5828, 17, false, false);
INSERT INTO public.moon VALUES (3, 'Deimos', 4, 14572, 9, false, false);
INSERT INTO public.moon VALUES (4, 'Io', 5, 262000, 17180, false, false);
INSERT INTO public.moon VALUES (5, 'Europa', 5, 417000, 9398, true, true);
INSERT INTO public.moon VALUES (6, 'Ganymede', 5, 664000, 25745, true, true);
INSERT INTO public.moon VALUES (7, 'Callisto', 5, 1170000, 23593, true, true);
INSERT INTO public.moon VALUES (8, 'Strange Moon', 10, 7800, 2400, true, true);
INSERT INTO public.moon VALUES (9, 'Rogue Moon IX', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Rogue Moon X', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Rogue Moon XI', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Rogue Moon XII', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Rogue Moon XIII', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Rogue Moon XIV', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Rogue Moon XV', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Rogue Moon XVI', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Rogue Moon XVII', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Rogue Moon XVIII', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Rogue Moon XIX', NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Rogue Moon XX', NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 1, 35.98, false, 167, 9525, 'None');
INSERT INTO public.planet VALUES (2, 'Venus', 1, 67.24, false, 464, 23627, 'Carbon dioxide');
INSERT INTO public.planet VALUES (4, 'Mars', 1, 141.6, true, -63, 13589, 'Carbon dioxide');
INSERT INTO public.planet VALUES (3, 'Earth', 1, 92.96, true, 14, 24901, 'Nitrogen and oxygen');
INSERT INTO public.planet VALUES (5, 'Jupiter', 1, 483.8, false, -108, 272945, 'Hydrogen and helium');
INSERT INTO public.planet VALUES (6, 'Saturn', 1, 886.7, false, -139, 237115, 'Hydrogen and helium');
INSERT INTO public.planet VALUES (7, 'Uranus', 1, 1784.1, false, -195, 99032, 'Hydrogen and helium');
INSERT INTO public.planet VALUES (8, 'Neptune', 1, 2795.2, false, -201, 96985, 'Hydrogen and helium');
INSERT INTO public.planet VALUES (9, 'Proxima Centauri b', 2, 4.6, true, -39, 0, 'Carbon dioxide and oxygen');
INSERT INTO public.planet VALUES (10, 'Teegarden''s Star b', 7, 92.96, true, 28, 26100, 'Unknown, possible Earthlike comp');
INSERT INTO public.planet VALUES (11, 'OGLE-2016-BLG-1928', NULL, NULL, false, 0, 0, 'Unknown');
INSERT INTO public.planet VALUES (12, 'PSO J318.5-22', NULL, NULL, false, 0, 0, 'Unknown');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sol', 1, 'G', '1.989 x 10^30 kg', true);
INSERT INTO public.star VALUES (3, 'Alpha Centauri B', 2, 'K', '1.661 x 10^30 kg', true);
INSERT INTO public.star VALUES (4, 'Sirius', 1, 'A', '2.022 x 10^30 kg', true);
INSERT INTO public.star VALUES (5, 'Vega', 1, 'A', '2.360 x 10^30 kg', true);
INSERT INTO public.star VALUES (6, 'Betelgeuse', 2, 'M', '23.07 x 10^30 kg', true);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 2, 'G', '2.180 x 10^30 kg', true);
INSERT INTO public.star VALUES (7, 'Teegarden''s Star', 1, 'M', '0.185 x 10^30 kg', true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 1, false);


--
-- Name: master_master_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.master_master_id_seq', 3, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 1, false);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 1, false);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 1, false);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: master master_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT master_pkey PRIMARY KEY (master_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: master unique_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT unique_name UNIQUE (name);


--
-- Name: master master_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT master_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: master master_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT master_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: master master_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT master_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: master master_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.master
    ADD CONSTRAINT master_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

