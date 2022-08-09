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
    name character varying(100) NOT NULL,
    num_stars_in_billions integer,
    mass character varying(50),
    "age(Billions)" numeric,
    is_spiral boolean DEFAULT false
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
    planet_id integer NOT NULL,
    name character varying(75) NOT NULL,
    "Volume(km^3)" character varying(50),
    "Mass(kg)" character varying(50)
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
    name character varying(75) NOT NULL,
    num_planet integer NOT NULL,
    "Volume(km^3)" character varying(50),
    "Mass(kg)" character varying(50),
    description text,
    star_id integer NOT NULL,
    is_habitable boolean DEFAULT false,
    is_in_habitable_area boolean DEFAULT false
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
-- Name: poetic_name; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.poetic_name (
    poetic_name_id integer NOT NULL,
    moon_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.poetic_name OWNER TO freecodecamp;

--
-- Name: poetic_name_poetic_name_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.poetic_name_poetic_name_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.poetic_name_poetic_name_id_seq OWNER TO freecodecamp;

--
-- Name: poetic_name_poetic_name_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.poetic_name_poetic_name_id_seq OWNED BY public.poetic_name.poetic_name_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying(75) NOT NULL,
    sun_mass integer,
    "Volume(Earth)" numeric,
    "Age(B)" integer,
    description text
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
-- Name: poetic_name poetic_name_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.poetic_name ALTER COLUMN poetic_name_id SET DEFAULT nextval('public.poetic_name_poetic_name_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (2, 'Andromeda', 1000, '1.5+-0.5 x 10^12M', 10.01, true);
INSERT INTO public.galaxy VALUES (1, 'Milky Way', 400, '1.15 x 10**12M', 13.61, true);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 40, '5x10^10M', 13.61, true);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', NULL, '1.38x10^11M', 13.61, false);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', NULL, 'NULL', 13.61, false);
INSERT INTO public.galaxy VALUES (7, 'sombrero', NULL, NULL, 13.61, false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 1, 'Moon', '2.1958x10^10', '7.342x10^22');
INSERT INTO public.moon VALUES (3, 4, 'Phobos', '5783.61', '1.0659x10^16');
INSERT INTO public.moon VALUES (4, 4, 'Deimos', '999.78', '14762x10^15');
INSERT INTO public.moon VALUES (5, 5, 'IO', '8.9x10^22', NULL);
INSERT INTO public.moon VALUES (6, 5, 'Europa', '4.8x10^22', NULL);
INSERT INTO public.moon VALUES (7, 5, 'Ganymede', '14.8x10^22', NULL);
INSERT INTO public.moon VALUES (9, 5, 'Callisto', 'C10.8x10^22', NULL);
INSERT INTO public.moon VALUES (10, 5, 'Leda', NULL, NULL);
INSERT INTO public.moon VALUES (11, 5, 'Himalia', NULL, NULL);
INSERT INTO public.moon VALUES (12, 5, 'Ersa', NULL, NULL);
INSERT INTO public.moon VALUES (13, 5, 'Pandia', NULL, NULL);
INSERT INTO public.moon VALUES (14, 5, 'Elara', NULL, NULL);
INSERT INTO public.moon VALUES (15, 5, 'Lysithea', NULL, NULL);
INSERT INTO public.moon VALUES (16, 5, 'Dia', NULL, NULL);
INSERT INTO public.moon VALUES (17, 5, 'Ananke', NULL, NULL);
INSERT INTO public.moon VALUES (18, 5, 'Praxidike', NULL, NULL);
INSERT INTO public.moon VALUES (19, 5, 'locaste', NULL, NULL);
INSERT INTO public.moon VALUES (20, 5, 'Thyone', NULL, NULL);
INSERT INTO public.moon VALUES (21, 5, 'Euanthe', NULL, NULL);
INSERT INTO public.moon VALUES (22, 5, 'Eupheme', NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 3, '1.083 21x10^12', '5.972 37x10^24', 'third planet from the Sun', 1, true, true);
INSERT INTO public.planet VALUES (2, 'Mercury', 1, '6.083 x 10^10', '3.3011 x 10^23', 'smallest planet in Sollar System', 1, false, false);
INSERT INTO public.planet VALUES (3, 'Venus', 2, '9.2843 x 10^11', '4.8675 x 10^11', 'Extremely dense atmosphere', 1, false, true);
INSERT INTO public.planet VALUES (4, 'Mars', 4, '1.631 18 18 x 10^11', '6.4171 x 10^23', 'Named for the Roman god of war', 1, false, true);
INSERT INTO public.planet VALUES (5, 'Jupiter', 5, '1.4313 x 10^27', '18982 x 10^27', 'Largest object in Solar System', 1, false, false);
INSERT INTO public.planet VALUES (6, 'Saturn', 6, '8.2713 x 14', '5.684 x 10^26', 'extensive ring system', 1, false, false);
INSERT INTO public.planet VALUES (7, 'Uranus', 7, '6.833 x 10^13', '8.6810 x 10^25', 'Axial tilt > 90°', 1, false, false);
INSERT INTO public.planet VALUES (8, 'Neptune', 8, '6.253 x 10^13', '1.024 13x10^26', 'Geysers of liquid nitrogen', 1, false, false);
INSERT INTO public.planet VALUES (11, 'd', 1, NULL, '0.26 +-0.05M', 'Discovered in Feb 2022', 2, false, false);
INSERT INTO public.planet VALUES (13, 'b', 2, NULL, '1.07+-0.05M', 'Orbital period 11.2 Earth days', 2, false, false);
INSERT INTO public.planet VALUES (14, 'c', 3, NULL, '7+-1Mearth', 'controversial exoplanet', 2, false, false);
INSERT INTO public.planet VALUES (16, 'Wolf 359 b', 1, NULL, '3.8+-2.0M', NULL, 5, false, false);


--
-- Data for Name: poetic_name; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.poetic_name VALUES (1, 1, 'Selene');
INSERT INTO public.poetic_name VALUES (2, 1, 'Cynthia');
INSERT INTO public.poetic_name VALUES (3, 7, 'Jupiter III');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1, 332950, 5, 'The star of our solar system');
INSERT INTO public.star VALUES (2, 1, 'Proxima Centauri', 0, NULL, 5, 'small, low-mass star');
INSERT INTO public.star VALUES (3, 1, 'Rigil Kentaurus', 1, NULL, NULL, NULL);
INSERT INTO public.star VALUES (4, 1, 'Toliman (B)$', 1, NULL, NULL, 'One suspected planet');
INSERT INTO public.star VALUES (5, 1, 'Wolf 359', 0, NULL, NULL, 'flare star 2 known planets');
INSERT INTO public.star VALUES (6, 1, 'Ross 154', 10, NULL, 0, 'flare star');


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 16, true);


--
-- Name: poetic_name_poetic_name_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.poetic_name_poetic_name_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


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
-- Name: poetic_name poetic_name_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.poetic_name
    ADD CONSTRAINT poetic_name_name_key UNIQUE (name);


--
-- Name: poetic_name poetic_name_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.poetic_name
    ADD CONSTRAINT poetic_name_pkey PRIMARY KEY (poetic_name_id);


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
-- Name: moon fkmoon; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fkmoon FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fkplanet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fkplanet FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: poetic_name fkpona; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.poetic_name
    ADD CONSTRAINT fkpona FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: star fkstar; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fkstar FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

