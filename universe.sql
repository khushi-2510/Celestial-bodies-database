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
-- Name: celestial_event; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.celestial_event (
    celestial_event_id integer NOT NULL,
    name character varying(50) NOT NULL,
    location text NOT NULL,
    duration numeric,
    no_of_times integer,
    no_of_cities integer,
    visible_from_earth boolean
);


ALTER TABLE public.celestial_event OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.celestial_event_celestial_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.celestial_event_celestial_event_id_seq OWNER TO freecodecamp;

--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.celestial_event_celestial_event_id_seq OWNED BY public.celestial_event.celestial_event_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(50) NOT NULL,
    dist_from_earth integer,
    black_hole boolean NOT NULL,
    description text,
    no_of_planets integer,
    diameter numeric
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
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL,
    diameter numeric NOT NULL,
    is_spherical boolean,
    description text,
    no_of_planets integer,
    surface_temp integer,
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
    planet_id integer NOT NULL,
    name character varying(50) NOT NULL,
    mass integer NOT NULL,
    no_of_moons integer,
    radius numeric,
    description text,
    has_atmosphere boolean,
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(50) NOT NULL,
    age integer NOT NULL,
    temperature numeric,
    neighbour_planets integer,
    spectral_type text,
    has_planet boolean,
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
-- Name: celestial_event celestial_event_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event ALTER COLUMN celestial_event_id SET DEFAULT nextval('public.celestial_event_celestial_event_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: celestial_event; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.celestial_event VALUES (1, 'supernova', 'Delhi', 3456, 5, 2, false);
INSERT INTO public.celestial_event VALUES (2, 'comet', 'Delhi', 3456, 5, 2, false);
INSERT INTO public.celestial_event VALUES (3, 'eclipse', 'Delhi', 3456, 5, 2, false);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 3000, false, 'it is a galaxy', 3, 45322);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 4000, false, 'it is a galaxy', 4, 563546);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 5000, false, 'it is a galaxy', 5, 454322);
INSERT INTO public.galaxy VALUES (4, 'Sombrero', 6000, false, 'it is a galaxy', 6, 44322);
INSERT INTO public.galaxy VALUES (5, 'Whirlpool', 3000, false, 'it is a galaxy', 7, 45321);
INSERT INTO public.galaxy VALUES (6, 'Pinwheel', 3000, false, 'it is a galaxy', 3, 45322);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'moon', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (2, 'luna', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (3, 'phobos', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (4, 'Demos', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (5, 'lo', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (6, 'Europa', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (7, 'callisto', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (8, 'titan', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (9, 'memus', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (10, 'tethys', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (11, 'rhea', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (12, 'lapetus', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (13, 'miranda', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (14, 'aerial', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (15, 'oberon', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (16, 'triton', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (17, 'titania', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (18, 'umberial', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (19, 'enceladus', 3445, true, 'I am a moon', 3, 453, 1);
INSERT INTO public.moon VALUES (20, 'mimas', 3445, true, 'I am a moon', 3, 453, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 3000, 2, 8976, 'I am a planet', true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 3000, 2, 8976, 'I am a planet', true, 1);
INSERT INTO public.planet VALUES (3, 'Earth', 3000, 2, 8976, 'I am a planet', true, 2);
INSERT INTO public.planet VALUES (4, 'Saturn', 3000, 2, 8976, 'I am a planet', true, 2);
INSERT INTO public.planet VALUES (5, 'Mars', 3000, 2, 8976, 'I am a planet', true, 3);
INSERT INTO public.planet VALUES (6, 'Pluto', 3000, 2, 8976, 'I am a planet', true, 3);
INSERT INTO public.planet VALUES (7, 'Venus', 3000, 2, 8976, 'I am a planet', true, 4);
INSERT INTO public.planet VALUES (8, 'Uranus', 3000, 2, 8976, 'I am a planet', true, 4);
INSERT INTO public.planet VALUES (9, 'Neptune', 3000, 2, 8976, 'I am a planet', true, 5);
INSERT INTO public.planet VALUES (10, 'Kepler', 3000, 2, 8976, 'I am a planet', true, 5);
INSERT INTO public.planet VALUES (11, 'HD', 3000, 2, 8976, 'I am a planet', true, 6);
INSERT INTO public.planet VALUES (12, 'Kepler18f', 3000, 2, 8976, 'I am a planet', true, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sirius', 1000, 4534, 4, 'spectral', true, 1);
INSERT INTO public.star VALUES (2, 'Alpha centauri', 1000, 4534, 4, 'spectral', true, 2);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 1000, 4534, 4, 'spectral', true, 3);
INSERT INTO public.star VALUES (4, 'Proxima Centauri', 1000, 4534, 4, 'spectral', true, 4);
INSERT INTO public.star VALUES (5, 'Vega', 1000, 4534, 4, 'spectral', true, 5);
INSERT INTO public.star VALUES (6, 'Polaris', 1000, 4534, 4, 'spectral', true, 6);


--
-- Name: celestial_event_celestial_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.celestial_event_celestial_event_id_seq', 3, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: celestial_event celestial_event_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_name_key UNIQUE (name);


--
-- Name: celestial_event celestial_event_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.celestial_event
    ADD CONSTRAINT celestial_event_pkey PRIMARY KEY (celestial_event_id);


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

