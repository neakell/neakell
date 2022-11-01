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
-- Name: constellation; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.constellation (
    star_id integer,
    iau_abbreviation character varying(5),
    origin character varying(50),
    constellation_id integer NOT NULL,
    name character varying(35) NOT NULL
);


ALTER TABLE public.constellation OWNER TO freecodecamp;

--
-- Name: constellation_constellatiom_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.constellation_constellatiom_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.constellation_constellatiom_id_seq OWNER TO freecodecamp;

--
-- Name: constellation_constellatiom_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.constellation_constellatiom_id_seq OWNED BY public.constellation.constellation_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    type character varying(20),
    absolute_magnitude numeric(4,2),
    notes text,
    visible_with_naked_eye boolean
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
    name character varying(15) NOT NULL,
    planet_id integer,
    year_of_discovery integer,
    discoverer text,
    distance_from_planet_km integer,
    apparent_magnitude numeric(4,2)
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
    star_id integer,
    name character varying(31) NOT NULL,
    mean_temperature_c integer,
    year_of_discovery integer,
    has_moon boolean,
    constellation_id integer
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
    dist_from_earth_ly numeric(7,2) NOT NULL,
    name character varying(30),
    apparent_magnitude numeric(4,2),
    solar_mass numeric(4,3),
    constellation_id integer,
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
-- Name: constellation constellation_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation ALTER COLUMN constellation_id SET DEFAULT nextval('public.constellation_constellatiom_id_seq'::regclass);


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
-- Data for Name: constellation; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.constellation VALUES (4, 'Aql', 'ancient, Ptolemy', 2, 'Aquila');
INSERT INTO public.constellation VALUES (2, 'Cen', 'ancient, Ptolemy', 4, 'Centaurus');
INSERT INTO public.constellation VALUES (10, 'Lib', 'ancient, Ptolemy', 5, 'Libra');
INSERT INTO public.constellation VALUES (9, 'And', 'ancient, Ptolemy', 1, 'Andromeda');
INSERT INTO public.constellation VALUES (8, 'Ari', 'ancient, Ptolemy', 3, 'Aries');
INSERT INTO public.constellation VALUES (11, 'Psc', 'ancient, Ptolemy', 6, 'Pisces');
INSERT INTO public.constellation VALUES (12, 'Vir', 'ancient, Ptolemy', 7, 'Virgo');
INSERT INTO public.constellation VALUES (3, 'Tau', 'ancient, Ptolemy', 8, 'Taurus');
INSERT INTO public.constellation VALUES (14, 'Cap', 'ancient, Ptolemy', 9, 'Capricornus');
INSERT INTO public.constellation VALUES (15, 'Aqr', 'ancient, Ptolemy', 10, 'Aquarius');
INSERT INTO public.constellation VALUES (16, 'Sgr', '1763, Lacaille', 11, 'Sagittarius');
INSERT INTO public.constellation VALUES (17, 'Boo', 'ancient, Ptolemy', 12, 'Boötes');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Spiral', -21.00, 'Home galaxy of Earth.', true);
INSERT INTO public.galaxy VALUES (2, 'Andromeda Galaxy', 'Spiral', 3.44, 'Andromeda is the closest big galaxy to the Milky Wy.', true);
INSERT INTO public.galaxy VALUES (3, 'Canis Major Dwarf', 'Irregular', -0.10, 'Was discovered in 2003 by a team of French austronomers.', false);
INSERT INTO public.galaxy VALUES (4, 'Virgo Stellar Stream', 'Spheroidal', NULL, 'The largest galaxy visible from the Earth', false);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 'Spiral', 0.90, 'Largest satellite galaxy of the Milky Way', true);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 'Irregular', 2.70, 'A dwarf galaxy with hundred million stars', false);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Ganymede', 3, 1610, 'Galileo', 628300000, 4.61);
INSERT INTO public.moon VALUES (5, 'Io', 3, 1610, 'Galileo', 350000, 5.02);
INSERT INTO public.moon VALUES (4, 'Callisto', 3, 1610, 'Galileo', 623300000, 5.65);
INSERT INTO public.moon VALUES (3, 'Europa', 3, 1610, 'Galileo', 628300000, 5.29);
INSERT INTO public.moon VALUES (8, 'Amalthea', 3, 1892, 'Barnard', 181400, 14.10);
INSERT INTO public.moon VALUES (9, 'Himalia', 3, 1904, 'Perrine', 11400000, 14.60);
INSERT INTO public.moon VALUES (10, 'Elara', 3, 1905, 'Perrine', 11700000, 16.60);
INSERT INTO public.moon VALUES (11, 'Pasiphae', 3, 1908, 'Melotte', 23600000, 16.90);
INSERT INTO public.moon VALUES (12, 'Mimas', 6, 1789, 'Herschel', 186000, 12.90);
INSERT INTO public.moon VALUES (13, 'Tethys', 6, 1684, 'Cassini', 295000, 10.20);
INSERT INTO public.moon VALUES (14, 'Ariel', 7, 1851, 'Lassell', 118620, 14.80);
INSERT INTO public.moon VALUES (6, 'Phobos', 5, 1877, 'Hall', 6000, 11.80);
INSERT INTO public.moon VALUES (7, 'Deimos', 5, 1877, 'Hall', 23460, 12.40);
INSERT INTO public.moon VALUES (15, 'Titania', 7, 1787, 'Lassell', 435840, 13.90);
INSERT INTO public.moon VALUES (16, 'Miranda', 7, 1948, 'Kuiper', 129800, 15.80);
INSERT INTO public.moon VALUES (17, 'Triton', 8, 1846, 'Lassell', 354800, 13.47);
INSERT INTO public.moon VALUES (1, 'Luna', 1, NULL, 'Galileo', 384400, -12.74);
INSERT INTO public.moon VALUES (18, 'Namaka', 14, 2005, 'Ragozzine, Brown', 39300, 21.90);
INSERT INTO public.moon VALUES (19, 'Hiiaka', 14, 2005, 'Ragozzine, Brown', 49500, 3.30);
INSERT INTO public.moon VALUES (20, 'Enceladus', 6, 1789, 'Herschel', 238000, 11.70);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 16, 'Earth', 14, NULL, true, 11);
INSERT INTO public.planet VALUES (10, 16, 'Pluto', -232, 1930, true, 11);
INSERT INTO public.planet VALUES (9, 8, 'Teegarden b', 28, 2019, false, 3);
INSERT INTO public.planet VALUES (8, 15, 'Neptune', -200, 1864, true, 10);
INSERT INTO public.planet VALUES (2, 10, 'Venus', 464, 1610, false, 5);
INSERT INTO public.planet VALUES (3, 11, 'Jupiter', -110, 1610, true, 6);
INSERT INTO public.planet VALUES (4, 12, 'Mercury', 167, 1631, false, 7);
INSERT INTO public.planet VALUES (5, 13, 'Mars', -60, 1610, true, 8);
INSERT INTO public.planet VALUES (6, 14, 'Saturn', -140, 1610, true, 9);
INSERT INTO public.planet VALUES (7, 8, 'Uranus', -195, 1781, true, 3);
INSERT INTO public.planet VALUES (11, 2, 'Proxima Centauri b', -39, 2016, false, 4);
INSERT INTO public.planet VALUES (12, 15, 'Gliese 876 d', 341, 2005, false, 10);
INSERT INTO public.planet VALUES (14, 17, 'Haumea', -223, 2004, true, 12);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (5, 0.00, 'The Sun', -26.74, 1.000, NULL, 1);
INSERT INTO public.star VALUES (16, 143.20, 'Kaus Australis', 1.85, 3.500, 11, 1);
INSERT INTO public.star VALUES (2, 4.24, 'Proxima Centauri', 11.05, 0.150, 4, 1);
INSERT INTO public.star VALUES (3, 4.36, 'Toliman', -0.27, 0.907, 4, 1);
INSERT INTO public.star VALUES (4, 16.73, 'Altair', 0.77, 1.860, 2, 1);
INSERT INTO public.star VALUES (9, 96.87, 'Alpheratz', 2.97, 3.080, 1, 2);
INSERT INTO public.star VALUES (10, 99.30, 'Zubeneschamali', 2.61, 3.500, 3, 1);
INSERT INTO public.star VALUES (8, 65.88, 'Hamal', 2.00, 1.500, 3, 1);
INSERT INTO public.star VALUES (11, 349.00, 'Alpherg', 3.62, 3.780, 6, 1);
INSERT INTO public.star VALUES (14, 65.23, 'Deneb Algedi', 2.06, 2.000, 9, 1);
INSERT INTO public.star VALUES (15, 538.20, 'Sadalsuud', 2.87, 4.970, 10, 1);
INSERT INTO public.star VALUES (17, 36.66, 'Arcturus', -0.04, 1.100, 12, 1);
INSERT INTO public.star VALUES (12, 260.90, 'Spica', 0.97, 7.200, 7, 1);
INSERT INTO public.star VALUES (13, 65.23, 'Aldebaran', 0.98, 1.700, 8, 1);


--
-- Name: constellation_constellatiom_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.constellation_constellatiom_id_seq', 12, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 17, true);


--
-- Name: constellation constellation_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_name_key UNIQUE (name);


--
-- Name: constellation constellation_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_pkey PRIMARY KEY (constellation_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: galaxy unique_galaxy_galaxy_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT unique_galaxy_galaxy_id UNIQUE (galaxy_id);


--
-- Name: moon unique_moon_name; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT unique_moon_name UNIQUE (name);


--
-- Name: planet unique_planet_planet_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT unique_planet_planet_id UNIQUE (planet_id);


--
-- Name: star unique_star_id; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT unique_star_id UNIQUE (star_id);


--
-- Name: constellation constellation_brightest_star_name_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.constellation
    ADD CONSTRAINT constellation_brightest_star_name_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_constellation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_constellation_id_fkey FOREIGN KEY (constellation_id) REFERENCES public.constellation(constellation_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

