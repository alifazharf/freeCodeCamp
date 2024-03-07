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
    description text,
    name character varying(30) NOT NULL,
    has_life boolean,
    is_spherical boolean,
    age_in_million_of_years integer NOT NULL,
    galaxy_types character varying(30),
    distance_from_earth numeric
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    name character varying(30) NOT NULL,
    moon_id integer NOT NULL,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    age_in_million_of_years integer NOT NULL,
    planet_id integer
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
    name character varying(30) NOT NULL,
    planet_id integer NOT NULL,
    age_in_million_of_years integer NOT NULL,
    distance_from_earth numeric,
    is_spherical boolean,
    has_life boolean,
    description text,
    planet_types character varying(30),
    star_id integer
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
-- Name: rocket; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.rocket (
    name character varying(30) NOT NULL,
    rocket_id integer NOT NULL,
    has_life boolean NOT NULL,
    description text,
    is_spherical boolean,
    moon_id integer
);


ALTER TABLE public.rocket OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.rocket_rocket_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rocket_rocket_id_seq OWNER TO freecodecamp;

--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.rocket_rocket_id_seq OWNED BY public.rocket.rocket_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    name character varying(30) NOT NULL,
    star_id integer NOT NULL,
    description text,
    has_life boolean,
    is_spherical boolean,
    distance_from_earth numeric,
    age_in_million_of_years integer NOT NULL,
    galaxy_id integer
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: rocket rocket_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket ALTER COLUMN rocket_id SET DEFAULT nextval('public.rocket_rocket_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'best', 'andromeda', false, false, 40000, 'red', 399.11);
INSERT INTO public.galaxy VALUES (2, 'best', 'milky way', false, false, 110000, 'red', 1992.11);
INSERT INTO public.galaxy VALUES (3, 'best', 'cigar galaxy', false, false, 423000, 'black', 3992.11);
INSERT INTO public.galaxy VALUES (4, 'best', 'black eye galaxy', false, false, 423000, 'black', 3992.11);
INSERT INTO public.galaxy VALUES (5, 'best', 'firework galaxy', false, false, 423000, 'black', 3992.11);
INSERT INTO public.galaxy VALUES (6, 'best', 'cartwhell galaxy', false, false, 423000, 'black', 3992.11);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES ('wolf moon', 1, false, false, 500.10, 100, 1);
INSERT INTO public.moon VALUES ('beaver moon', 2, false, false, 500.10, 100, 1);
INSERT INTO public.moon VALUES ('flower moon', 3, false, false, 500.10, 100, 2);
INSERT INTO public.moon VALUES ('buck moon', 4, false, false, 500.10, 100, 2);
INSERT INTO public.moon VALUES ('worm moon', 5, false, false, 500.10, 100, 3);
INSERT INTO public.moon VALUES ('artemis', 6, false, false, 500.10, 100, 4);
INSERT INTO public.moon VALUES ('blood moon', 7, false, false, 500.10, 100, 5);
INSERT INTO public.moon VALUES ('esmeray', 8, false, false, 500.10, 100, 5);
INSERT INTO public.moon VALUES ('Aegaoen', 9, false, false, 500.10, 100, 5);
INSERT INTO public.moon VALUES ('hare moon', 10, false, false, 500.10, 100, 6);
INSERT INTO public.moon VALUES ('pink moon', 11, false, false, 500.10, 100, 7);
INSERT INTO public.moon VALUES ('harvest moon', 12, false, false, 500.10, 100, 8);
INSERT INTO public.moon VALUES ('corn moon', 13, false, false, 500.10, 100, 9);
INSERT INTO public.moon VALUES ('atlas', 14, false, false, 500.10, 100, 10);
INSERT INTO public.moon VALUES ('aibek', 15, false, false, 500.10, 100, 11);
INSERT INTO public.moon VALUES ('cold moon', 16, false, false, 500.10, 100, 12);
INSERT INTO public.moon VALUES ('apollo', 17, false, false, 500.10, 100, 12);
INSERT INTO public.moon VALUES ('belinay', 18, false, false, 500.10, 100, 11);
INSERT INTO public.moon VALUES ('elara', 19, false, false, 500.10, 100, 10);
INSERT INTO public.moon VALUES ('aadhira', 20, false, false, 500.10, 100, 11);
INSERT INTO public.moon VALUES ('aidana', 21, false, false, 500.10, 100, 1);
INSERT INTO public.moon VALUES ('helene', 22, false, false, 500.10, 100, 2);
INSERT INTO public.moon VALUES ('sturgeon moon', 23, false, false, 500.10, 100, 2);
INSERT INTO public.moon VALUES ('strawberry moon', 24, false, false, 500.10, 100, 4);
INSERT INTO public.moon VALUES ('luneth', 25, false, false, 500.10, 100, 4);
INSERT INTO public.moon VALUES ('bayneth', 26, false, false, 500.10, 100, 11);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES ('mercury', 1, 100, 500.10, false, false, 'big', 'first', 1);
INSERT INTO public.planet VALUES ('venus', 2, 100, 500.10, false, false, 'big', 'first', 1);
INSERT INTO public.planet VALUES ('earth', 3, 100, 500.10, false, false, 'big', 'first', 2);
INSERT INTO public.planet VALUES ('mars', 4, 100, 500.10, false, false, 'big', 'first', 2);
INSERT INTO public.planet VALUES ('jupyter', 5, 100, 500.10, false, false, 'big', 'first', 3);
INSERT INTO public.planet VALUES ('saturn', 6, 100, 500.10, false, false, 'big', 'first', 3);
INSERT INTO public.planet VALUES ('uranus', 7, 100, 500.10, false, false, 'big', 'first', 4);
INSERT INTO public.planet VALUES ('neptune', 8, 100, 500.10, false, false, 'big', 'first', 4);
INSERT INTO public.planet VALUES ('pluto', 9, 100, 500.10, false, false, 'big', 'first', 5);
INSERT INTO public.planet VALUES ('ceres', 10, 100, 500.10, false, false, 'big', 'first', 5);
INSERT INTO public.planet VALUES ('eris', 11, 100, 500.10, false, false, 'big', 'first', 6);
INSERT INTO public.planet VALUES ('haumea', 12, 100, 500.10, false, false, 'big', 'first', 6);


--
-- Data for Name: rocket; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.rocket VALUES ('mark', 1, false, 'safe', false, NULL);
INSERT INTO public.rocket VALUES ('travis', 2, false, 'safe', false, NULL);
INSERT INTO public.rocket VALUES ('kowalski', 3, false, 'intermediate', false, NULL);
INSERT INTO public.rocket VALUES ('johnson', 4, false, 'danger', false, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES ('perseus', 1, 'big', false, false, 500.10, 100, 1);
INSERT INTO public.star VALUES ('taurus', 2, 'big', false, false, 500.10, 100, 2);
INSERT INTO public.star VALUES ('serpens', 3, 'big', false, false, 500.10, 100, 3);
INSERT INTO public.star VALUES ('capricornus', 4, 'big', false, false, 500.10, 100, 4);
INSERT INTO public.star VALUES ('lyra', 5, 'big', false, false, 500.10, 100, 5);
INSERT INTO public.star VALUES ('orion', 6, 'big', false, false, 500.10, 100, 6);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 26, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: rocket_rocket_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.rocket_rocket_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy galaxy_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unique UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unique UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unique UNIQUE (name);


--
-- Name: rocket rocket_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_pkey PRIMARY KEY (rocket_id);


--
-- Name: rocket rocket_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT rocket_unique UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unique; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unique UNIQUE (name);


--
-- Name: star fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: rocket fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.rocket
    ADD CONSTRAINT fk FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- PostgreSQL database dump complete
--

