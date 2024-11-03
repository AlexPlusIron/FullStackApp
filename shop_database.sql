--
-- PostgreSQL database dump
--

-- Dumped from database version 15.2
-- Dumped by pg_dump version 15.2

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
-- Name: basket_products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.basket_products (
    quantity integer DEFAULT 1,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    basket_id integer NOT NULL,
    product_id integer NOT NULL
);


ALTER TABLE public.basket_products OWNER TO postgres;

--
-- Name: baskets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.baskets (
    id integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.baskets OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.baskets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.baskets_id_seq OWNER TO postgres;

--
-- Name: baskets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.baskets_id_seq OWNED BY public.baskets.id;


--
-- Name: brands; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.brands (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.brands OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.brands_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.brands_id_seq OWNER TO postgres;

--
-- Name: brands_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.brands_id_seq OWNED BY public.brands.id;


--
-- Name: categories; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.categories (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.categories OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.categories_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.categories_id_seq OWNER TO postgres;

--
-- Name: categories_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.categories_id_seq OWNED BY public.categories.id;


--
-- Name: order_items; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.order_items (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    quantity integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    order_id integer
);


ALTER TABLE public.order_items OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.order_items_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.order_items_id_seq OWNER TO postgres;

--
-- Name: order_items_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.order_items_id_seq OWNED BY public.order_items.id;


--
-- Name: orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.orders (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    phone character varying(255) NOT NULL,
    address character varying(255) NOT NULL,
    amount integer NOT NULL,
    status integer DEFAULT 0 NOT NULL,
    comment character varying(255),
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    user_id integer
);


ALTER TABLE public.orders OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.orders_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.orders_id_seq OWNER TO postgres;

--
-- Name: orders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.orders_id_seq OWNED BY public.orders.id;


--
-- Name: product_props; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.product_props (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    value character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer
);


ALTER TABLE public.product_props OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.product_props_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.product_props_id_seq OWNER TO postgres;

--
-- Name: product_props_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.product_props_id_seq OWNED BY public.product_props.id;


--
-- Name: products; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.products (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    price integer NOT NULL,
    rating integer DEFAULT 0,
    image character varying(255) NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    category_id integer,
    brand_id integer
);


ALTER TABLE public.products OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.products_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.products_id_seq OWNER TO postgres;

--
-- Name: products_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.products_id_seq OWNED BY public.products.id;


--
-- Name: ratings; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ratings (
    rate integer NOT NULL,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL,
    product_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ratings OWNER TO postgres;

--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying(255),
    password character varying(255),
    role character varying(255) DEFAULT 'USER'::character varying,
    created_at timestamp with time zone NOT NULL,
    updated_at timestamp with time zone NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: baskets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets ALTER COLUMN id SET DEFAULT nextval('public.baskets_id_seq'::regclass);


--
-- Name: brands id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands ALTER COLUMN id SET DEFAULT nextval('public.brands_id_seq'::regclass);


--
-- Name: categories id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories ALTER COLUMN id SET DEFAULT nextval('public.categories_id_seq'::regclass);


--
-- Name: order_items id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items ALTER COLUMN id SET DEFAULT nextval('public.order_items_id_seq'::regclass);


--
-- Name: orders id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders ALTER COLUMN id SET DEFAULT nextval('public.orders_id_seq'::regclass);


--
-- Name: product_props id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props ALTER COLUMN id SET DEFAULT nextval('public.product_props_id_seq'::regclass);


--
-- Name: products id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products ALTER COLUMN id SET DEFAULT nextval('public.products_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: basket_products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.basket_products (quantity, created_at, updated_at, basket_id, product_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, password, role, created_at, updated_at) FROM stdin;
1	al_plus@mail.ru	$2b$05$hxOsgBGXv6..gcnKRvltlOAHrTeKgvF4wEdtUcgA2QA/VtsR.G/MS	USER	2024-10-19 17:20:54.347+03	2024-10-19 17:20:54.347+03
4	admin@mail.ru	$2b$05$3i6B3E6ns0zqXgZsSNDHc.K0W3mnss6lJ0C46P2uaZXb3q2iwhsX6	ADMIN	2024-08-01 13:10:01.557+03	2024-08-01 13:10:01.557+03
5	admin2@mail.ru	$2b$05$o9l/.S2YTcox/yo1/9zlNebDbTkUnz.F83N4rA24HZSLQVYREUtFu	ADMIN	2024-08-01 13:11:01.522+03	2024-08-01 13:11:01.522+03
3	simpleuser@mail.ru	$2b$05$33KYYLYkDqkqlwru0eHev.Wp9t47/176gW0OCdwIndgagn7QU6Lde	USER	2024-08-01 13:56:40.236+03	2024-08-01 13:56:40.236+03
6	simpleuser2@mail.ru	$2b$05$yWp3WEcYdJB7/DjmycrbBeeQ0hsG6klGQx5BRHDw80eE9KCEZijxq	USER	2024-08-01 13:22:52.966+03	2024-08-01 13:22:52.966+03
\.


--
-- Data for Name: baskets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.baskets (id, created_at, updated_at) FROM stdin;
1	2024-10-19 17:18:46.884+03	2024-10-19 17:18:46.884+03
3	2024-08-06 16:15:36.763+03	2024-08-06 16:15:36.763+03
4	2024-08-06 16:16:19.377+03	2024-08-06 16:16:19.377+03
5	2024-08-06 16:17:50.942+03	2024-08-06 16:17:50.942+03
6	2024-08-06 16:19:17.509+03	2024-08-06 16:19:17.509+03
7	2024-08-06 16:21:17.856+03	2024-08-06 16:21:17.856+03
8	2024-08-06 16:39:34.386+03	2024-08-06 16:39:34.386+03
9	2024-08-06 16:40:23.737+03	2024-08-06 16:40:23.737+03
10	2024-08-06 16:41:47.306+03	2024-08-06 16:41:47.306+03
11	2024-08-06 16:43:01.965+03	2024-08-06 16:43:01.965+03
12	2024-08-06 16:47:43.839+03	2024-08-06 16:47:43.839+03
13	2024-08-06 16:52:17.305+03	2024-08-06 16:52:17.305+03
14	2024-08-06 16:55:47.192+03	2024-08-06 16:55:47.192+03
15	2024-08-09 14:52:26.859+03	2024-08-09 14:52:26.859+03
16	2024-08-09 14:54:31.701+03	2024-08-09 14:54:31.701+03
17	2024-08-09 14:54:39.164+03	2024-08-09 14:54:39.164+03
18	2024-08-09 14:55:34.705+03	2024-08-09 14:55:34.705+03
19	2024-08-09 14:55:41.728+03	2024-08-09 14:55:41.728+03
20	2024-08-09 14:55:52.828+03	2024-08-09 14:55:52.828+03
21	2024-08-09 14:56:15.76+03	2024-08-09 14:56:15.76+03
22	2024-08-09 15:01:25.607+03	2024-08-09 15:01:25.607+03
23	2024-08-09 15:05:02.88+03	2024-08-09 15:05:02.88+03
24	2024-08-09 15:05:23.058+03	2024-08-09 15:05:23.058+03
25	2024-08-09 15:07:59.899+03	2024-08-09 15:07:59.899+03
26	2024-08-09 15:08:02.705+03	2024-08-09 15:08:02.705+03
27	2024-08-09 15:08:11.787+03	2024-08-09 15:08:11.787+03
28	2024-08-09 15:08:16.727+03	2024-08-09 15:08:16.727+03
29	2024-08-09 15:08:19.7+03	2024-08-09 15:08:19.7+03
30	2024-08-11 09:52:09.273+03	2024-08-11 09:52:09.273+03
31	2024-08-11 12:04:17.392+03	2024-08-11 12:04:17.392+03
32	2024-08-11 12:04:23.891+03	2024-08-11 12:04:23.891+03
33	2024-08-11 12:06:45.405+03	2024-08-11 12:06:45.405+03
34	2024-08-11 12:06:55.065+03	2024-08-11 12:06:55.065+03
35	2024-08-11 12:07:28.213+03	2024-08-11 12:07:28.213+03
36	2024-08-11 12:08:05.64+03	2024-08-11 12:08:05.64+03
37	2024-08-11 12:25:15.763+03	2024-08-11 12:25:15.763+03
38	2024-08-11 12:22:00.939+03	2024-08-11 12:22:00.939+03
39	2024-08-11 16:49:50.526+03	2024-08-11 16:49:50.526+03
40	2024-08-11 16:50:21.6+03	2024-08-11 16:50:21.6+03
41	2024-08-11 16:56:55.263+03	2024-08-11 16:56:55.263+03
42	2024-08-11 16:59:35.304+03	2024-08-11 16:59:35.304+03
43	2024-08-11 17:02:56.956+03	2024-08-11 17:02:56.956+03
44	2024-08-11 17:09:55.318+03	2024-08-11 17:09:55.318+03
45	2024-08-11 17:10:06.146+03	2024-08-11 17:10:06.146+03
46	2024-08-11 17:13:24.91+03	2024-08-11 17:13:24.91+03
47	2024-08-11 17:14:28.474+03	2024-08-11 17:14:28.474+03
\.


--
-- Data for Name: brands; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.brands (id, name, created_at, updated_at) FROM stdin;
1	Samsung	2024-08-01 11:50:47.963+03	2024-08-05 11:21:22.579+03
2	Hitachi	2024-08-01 11:51:04.816+03	2024-08-05 10:57:00.226+03
3	Siemens	2024-08-01 11:51:17.575+03	2024-08-05 11:51:17.575+03
4	Xiaomi	2024-08-01 11:53:03.331+03	2024-08-05 11:53:03.331+03
18	Toshiba	2024-08-02 11:29:06.427+03	2024-08-05 11:29:06.427+03
19	OBI	2024-10-24 09:43:02.753+03	2024-10-24 09:43:02.753+03
21	Дарвин	2024-10-24 09:43:31.051+03	2024-10-24 09:43:31.051+03
22	Apple	2024-10-24 20:28:59.624+03	2024-10-24 20:28:59.624+03
23	Nikon	2024-10-24 20:46:08.306+03	2024-10-24 20:46:08.306+03
24	Sony	2024-10-24 20:46:18.967+03	2024-10-24 20:46:18.967+03
25	Canon	2024-10-24 20:46:25.806+03	2024-10-24 20:46:25.806+03
20	LemanaPro	2024-10-24 09:43:17.868+03	2024-10-24 20:46:57.831+03
\.


--
-- Data for Name: categories; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.categories (id, name, created_at, updated_at) FROM stdin;
2	Телевизоры 45-65"	2024-08-01 11:48:04.716+03	2024-08-05 13:28:09.126+03
3	Смартфоны iOS/Android	2024-08-01 11:48:46.955+03	2024-08-11 09:36:07.926+03
18	Фотоаппараты беззеркальные	2024-10-24 20:45:48.448+03	2024-10-24 20:45:48.448+03
17	Украшения садовые	2024-10-24 09:42:12.594+03	2024-10-24 09:42:37.695+03
4	Планшеты 7-12"	2024-08-01 11:48:56.816+03	2024-08-07 11:52:50.458+03
16	Стиральные машины 60 cm	2024-08-03 11:06:14.264+03	2024-08-08 11:06:14.264+03
1	Холодильники 60 cm	2024-08-01 11:47:48.122+03	2024-08-07 11:57:47.561+03
\.


--
-- Data for Name: order_items; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.order_items (id, name, price, quantity, created_at, updated_at, order_id) FROM stdin;
10	40HB6T62/8	45645	1	2024-10-19 18:09:05.192+03	2024-10-19 18:09:05.192+03	5
9	RB37A5290SA	112290	1	2024-10-19 18:09:05.19+03	2024-10-19 18:09:05.19+03	5
11	Iphone 11 white	55999	2	2024-10-24 20:32:52.299+03	2024-10-24 20:32:52.299+03	6
12	Iphone 11 black	55999	2	2024-10-24 20:32:52.301+03	2024-10-24 20:32:52.301+03	6
13	Iphone 14 yellow	73999	2	2024-10-29 12:17:04.062+03	2024-10-29 12:17:04.062+03	7
14	Iphone 15 black	85999	1	2024-10-29 12:37:05.557+03	2024-10-29 12:37:05.557+03	8
\.


--
-- Data for Name: orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.orders (id, name, email, phone, address, amount, status, comment, created_at, updated_at, user_id) FROM stdin;
5	Иванов Иван	al_plus@mail.ru	+7 (903) 630-18-98	asddsddsf	157935	0	2123232	2024-10-19 18:09:05.183+03	2024-10-19 18:09:05.183+03	4
6	Алекс Алексеев	alex@mail.ru	+7 (846) 852-14-56	Москва, Московская ул., 1	223996	0	Быстрее, пожалуйста	2024-10-24 20:32:52.29+03	2024-10-24 20:32:52.29+03	4
7	Маша Петрова	nana@mail.ru	+7 (903) 630-18-98	Москва, Маше Петровой	147998	0	Быстро!	2024-10-29 12:17:04.055+03	2024-10-29 12:17:04.055+03	4
8	Асус Асусович	asusua@mail.cum	+7 (846) 852-14-56	в МОСКВУ, Асусу	85999	0	ЫАЫАЫАЫА БЫСТРАААААА!!!	2024-10-29 12:37:05.555+03	2024-10-29 12:37:05.555+03	4
\.





--
-- Data for Name: products; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.products (id, name, price, rating, image, created_at, updated_at, category_id, brand_id) FROM stdin;
106	X 11 Lite 5G NE 8	29999	0	cb28f13e-1b88-4963-afe5-80d3632c55f7.jpeg	2024-08-01 14:10:10+03	2024-08-08 15:53:11+03	3	4
108	Redmi Note 8 (2021)	17999	0	c861e152-f8a5-41f6-aca1-a8ab307eff7a.jpeg	2024-08-01 14:11:39+03	2024-08-08 11:14:06+03	3	4
116	Galaxy Tab A7 Lite	16499	0	d012a222-d7b0-43e2-b00d-2eb79ed6348d.jpeg	2024-08-01 12:55:54+03	2024-08-08 14:30:01+03	4	1
122	Желуди садовые	355	0	402ddcd2-ebad-406f-81e3-9e157a94b989.jpeg	2024-10-24 09:44:57.755+03	2024-10-24 09:49:49.098+03	17	20
126	Поднос 02	650	0	7601b0b8-307e-43b8-ae63-3930efb1939c.jpeg	2024-10-24 09:52:48.274+03	2024-10-24 09:52:48.274+03	17	19
128	Горшок плетеный	958	0	efbf4ebf-d867-41b7-8a68-a113feae1e6e.jpeg	2024-10-24 09:55:58.078+03	2024-10-24 09:55:58.078+03	17	20
130	Скворечник белый	555	0	1d9ed7b1-9818-4d7c-aced-31f7fe4a4f9b.jpeg	2024-10-24 10:16:53.841+03	2024-10-24 10:16:53.841+03	17	20
114	Galaxy Z Fold3	169999	0	19c1e397-0ea0-4b9f-9c0c-a86f0a43e12d.jpeg	2024-08-01 11:40:45+03	2024-08-08 11:06:48+03	3	1
115	Galaxy Tab A8	22999	0	06c4881f-3d2e-4bab-953c-fe1ab374b13f.jpeg	2024-08-01 11:30:53+03	2024-08-08 11:32:07+03	4	1
82	QE55QN	239190	0	e1f2d58c-2469-4385-b030-ad8b7762e1c7.jpeg	2024-08-01 15:15:19+03	2024-08-08 14:11:13+03	2	1
89	UE55AU	75990	0	141979a3-fb17-42b8-9f51-a46a07674c08.jpeg	2024-08-01 13:51:43+03	2024-08-08 13:20:06+03	2	1
102	TWBJ90	38990	0	b74fff2a-08ca-4f30-a146-b6926df9c863.jpeg	2024-08-01 15:38:12+03	2024-08-08 10:44:38+03	16	18
103	50U	47999	0	a7a45b60-b057-405f-bf05-59c901ff2192.jpeg	2024-08-01 12:36:11+03	2024-08-08 14:49:28+03	2	18
132	Iphone 11 white	55999	0	32f060b0-3199-4cf2-a945-6fd061045f9e.jpeg	2024-10-24 20:30:55.896+03	2024-10-24 20:30:55.896+03	3	22
133	Iphone 13 blue	69999	0	aee93b8e-1d2e-4569-a66f-60c9893fd06b.jpeg	2024-10-29 12:13:22.249+03	2024-10-29 12:13:41.465+03	3	22
135	Iphone 13 red	67999	0	06c29e7a-ec97-43ef-a996-8efd755a4bb5.jpeg	2024-10-29 12:15:00.625+03	2024-10-29 12:15:00.625+03	3	22
139	Sony photo-camera	33999	0	470a7f8a-6653-4f8f-b7ab-00fe4d74a1f6.jpeg	2024-10-29 12:23:12.339+03	2024-10-29 12:23:12.339+03	18	24
137	Canon 250 photo-camera	75000	0	0df729b8-62d9-4c91-a639-7d636f537c32.jpeg	2024-10-29 12:18:58.645+03	2024-10-29 12:23:24.727+03	18	25
141	Iphone 15 black	85999	0	481bd957-7f67-4e33-9544-a77d159cee00.jpeg	2024-10-29 12:26:47.417+03	2024-10-29 12:27:37.215+03	3	22
143	Sony photocamera	42999	0	8f2a7082-cbad-414b-a2b4-bdf83615e89e.jpeg	2024-10-29 12:30:47.908+03	2024-10-29 12:30:47.908+03	18	24
107	X 11T	44999	0	0627f706-fffc-49b0-b3c0-7ef23a7282fd.jpeg	2024-08-01 11:05:57+03	2024-08-08 12:19:32+03	3	4
109	Redmi Note 9	16999	0	6c78a5a4-8377-4750-88c4-a615f3cb27a2.jpeg	2024-08-01 14:56:04+03	2024-08-08 15:56:33+03	3	4
110	Mi 11 Cloud	85990	0	8e97c69d-6355-4180-a479-78f0d6832b23.jpeg	2024-08-01 10:30:24+03	2024-08-08 11:12:52+03	3	4
111	Galaxy A52	33999	0	a2a442d1-365a-4642-b941-116613e3adee.jpeg	2024-08-01 14:22:42+03	2024-08-08 13:29:48+03	3	1
112	Galaxy A12	15999	0	47010c8f-3b8f-456f-9d2e-53d3cfc9b600.jpeg	2024-08-01 11:38:04+03	2024-08-08 12:59:28+03	3	1
113	Galaxy S21	74999	0	e26a9a4a-b0b3-4756-a1eb-04c21cc33a26.jpeg	2024-08-01 15:56:13+03	2024-08-08 12:06:17+03	3	1
104	65X	199999	0	d8fe3a9b-ef0c-4b91-bbe0-cbcceed926f7.jpeg	2024-08-01 15:04:09+03	2024-08-08 14:50:05+03	2	18
105	50C	49999	0	d6546248-a7df-40fc-898b-d6b3595c3638.jpeg	2024-08-01 12:54:39+03	2024-08-08 13:54:46+03	2	18
138	Nikon photo-camera	26999	0	b060b55d-7d4e-4781-a547-5adca20a415d.jpeg	2024-10-29 12:21:04.536+03	2024-10-29 12:23:47.401+03	18	23
140	Iphone 13 pink	56999	0	fb7c8674-d48d-4fa8-81d9-5f5ecc420bf3.jpeg	2024-10-29 12:25:19.491+03	2024-10-29 12:25:19.491+03	3	22
142	Nikon photocamera	35999	0	e294c591-4899-4837-9201-03d9a0333126.jpeg	2024-10-29 12:29:28.131+03	2024-10-29 12:29:28.131+03	18	23
118	Pad 5	39999	0	0f1bc77b-971b-4404-b232-7379e7444d72.jpeg	2024-08-01 13:41:55+03	2024-08-08 10:22:01+03	4	4
121	Mi Pad 2	15000	0	f0ad8bfc-63df-4678-a54b-818c080b12e7.jpeg	2024-08-01 11:46:45+03	2024-08-08 15:10:22+03	4	4
76	RB37A	100990	0	2880f5a0-192c-4d4b-807d-0d6861ad3773.jpeg	2024-08-01 11:49:36+03	2024-08-08 13:50:43+03	1	1
77	RB38T	129090	0	eeb81cef-192e-4362-bfb5-de6a3d96e409.jpeg	2024-08-01 11:49:53+03	2024-08-08 15:16:17+03	1	1
78	RB34T	78590	0	a64c638c-b1e3-4382-a92a-4eba808dbe4b.jpeg	2024-08-01 10:59:39+03	2024-08-08 12:21:38+03	1	1
79	RB37AV	112290	0	ba114b09-f5a6-4928-b818-47a45a2e3a38.jpeg	2024-08-01 14:20:08+03	2024-08-08 14:36:23+03	1	1
80	RS54N	123490	0	2cd51ccf-18c8-4d3e-9e7e-6d40b4df7d4d.jpeg	2024-08-01 10:12:43+03	2024-08-08 10:31:09+03	1	1
81	RS63R	205890	0	ce7a27a1-245f-4682-b0c1-7aae88104e16.jpeg	2024-08-01 15:36:03+03	2024-08-08 10:24:43+03	1	1
90	QE75Q	239990	0	40ff04e7-6c4a-4ddf-ae75-efd843b9ae86.jpeg	2024-08-01 12:01:30+03	2024-08-08 15:54:16+03	2	1
91	L32M6	26990	0	557ec262-c9d0-4925-8252-a54d4b819f2e.jpeg	2024-08-01 12:51:53+03	2024-08-08 12:02:57+03	2	4
92	L43M5	33990	0	b850ebef-adc6-4fa1-bda1-5ebd2a943e5c.jpeg	2024-08-01 14:38:18+03	2024-08-08 10:20:11+03	2	4
93	L55M5	49990	0	44fcf22b-4b6c-4de7-9567-db2b72e59858.jpeg	2024-08-01 12:01:52+03	2024-08-08 14:06:35+03	2	4
94	RG690GU	840590	0	629801e8-3af5-4aab-b66d-99f400fc0c41.jpeg	2024-08-01 12:07:29+03	2024-08-08 14:27:22+03	1	2
95	RWX630KU	399950	0	172599fa-f7c4-4ea3-9a17-acb584e3589d.jpeg	2024-08-01 14:23:35+03	2024-08-08 11:26:14+03	1	2
96	WW70A	65490	0	6b107de1-b18f-4078-87d9-23ab77617f37.jpeg	2024-08-01 12:49:04+03	2024-08-08 13:39:19+03	16	1
97	WW65A	50590	0	7b4b2f8d-d069-4218-87f4-8f1005a1138f.jpeg	2024-08-01 12:16:53+03	2024-08-08 11:29:23+03	16	1
117	Galaxy Kids Tab	15899	0	385f527a-4636-4b7d-9d9e-17cb541139b7.jpeg	2024-08-01 13:44:14+03	2024-08-08 14:16:59+03	4	1
98	WW80AF	71	0	dbee3ee2-dc05-4cf5-a016-2fccbce2a88e.jpeg	2024-08-01 14:51:39+03	2024-08-08 14:22:39+03	16	1
125	Поднос 01	555	0	24e6653c-5f1c-4ab9-9f3d-8f2fb8779f65.jpeg	2024-10-24 09:52:16.532+03	2024-10-24 09:52:16.532+03	17	19
127	Тыква желтая	8500	0	0ae55d7a-85e3-4382-a1b4-2daae93c1382.jpeg	2024-10-24 09:53:20.321+03	2024-10-24 09:53:20.321+03	17	21
129	Горшок белый	655	0	01324af0-30ce-4a0c-ac01-7cdbf057d045.jpeg	2024-10-24 09:56:33.302+03	2024-10-24 09:56:33.302+03	17	20
123	Грибы (набор)	658	0	dbbdb29f-d70b-4eec-8ee9-73cc5aab1c65.jpeg	2024-10-24 09:45:33.922+03	2024-10-24 09:50:11.587+03	17	19
131	Iphone 11 black	55999	0	9411694f-8338-463c-ba48-bade0b38fe52.jpeg	2024-10-24 20:30:09.815+03	2024-10-24 20:31:04.042+03	3	22
134	Iphone 13 green	66999	0	3b4997ec-9739-456f-b9da-ec2852bf3c8d.jpeg	2024-10-29 12:14:14.996+03	2024-10-29 12:14:14.996+03	3	22
136	Iphone 14 yellow	73999	0	49e6dbd5-7601-43bc-a6d6-b614bfcd3a85.jpeg	2024-10-29 12:15:28.6+03	2024-10-29 12:15:28.6+03	3	22
99	WS12WL	129090	0	5d5b485a-4cfa-4c2e-9b0e-8aa4119f548a.jpeg	2024-08-01 15:52:19+03	2024-08-08 12:38:47+03	16	3
100	WM16XDH	129990	0	fc3c6f65-2b6d-4885-ac3f-992de326ad26.jpeg	2024-08-01 10:32:21+03	2024-08-08 10:48:50+03	16	3
101	TWBJ80	61690	0	55bbecb5-5412-4870-8be8-7c37cecd2546.jpeg	2024-08-01 14:15:00+03	2024-08-08 13:43:22+03	16	18
119	65HZ	49990	0	b25fa313-6f10-40d4-9066-f73e9c59ca07.jpeg	2024-08-01 11:50:00+03	2024-08-08 12:11:31+03	2	2
120	40HB	45645	0	9069bfdf-1ab7-43a6-b372-e24e201c4336.jpeg	2024-08-01 13:48:13+03	2024-08-08 11:54:37+03	2	2
\.


--
-- Data for Name: product_props; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.product_props (id, name, value, created_at, updated_at, product_id) FROM stdin;
82	Тип компрессора	инверторный	2022-03-06 10:54:02.511+03	2022-03-06 10:54:02.511+03	76
83	Количество компрессоров	1	2022-03-06 10:54:02.515+03	2022-03-06 10:54:02.515+03	76
84	Количество камер	2	2022-03-06 10:54:02.516+03	2022-03-06 10:54:02.516+03	76
85	Общий полезный объем	367 л	2022-03-06 10:54:02.518+03	2022-03-06 10:54:02.518+03	76
86	Тип компрессора	инверторный	2022-03-06 11:12:18.026+03	2022-03-06 11:12:18.026+03	77
87	Количество компрессоров	1	2022-03-06 11:12:18.029+03	2022-03-06 11:12:18.029+03	77
88	Количество камер	2	2022-03-06 11:12:18.03+03	2022-03-06 11:12:18.03+03	77
89	Общий полезный объем	385 л	2022-03-06 11:12:18.032+03	2022-03-06 11:12:18.032+03	77
90	Объем холодильной камеры	273 л	2022-03-06 11:12:18.034+03	2022-03-06 11:12:18.034+03	77
91	Объем морозильной камеры	112 л	2022-03-06 11:12:18.035+03	2022-03-06 11:12:18.035+03	77
92	Тип компрессора	инверторный	2022-03-06 11:17:03.93+03	2022-03-06 11:17:03.93+03	78
93	Количество компрессоров	1	2022-03-06 11:17:03.934+03	2022-03-06 11:17:03.934+03	78
94	Количество камер	2	2022-03-06 11:17:03.936+03	2022-03-06 11:17:03.936+03	78
95	Общий полезный объем	340 л	2022-03-06 11:17:03.937+03	2022-03-06 11:17:03.937+03	78
96	Объем холодильной камеры	228 л	2022-03-06 11:17:03.939+03	2022-03-06 11:17:03.939+03	78
97	Объем морозильной камеры	112 л	2022-03-06 11:17:03.94+03	2022-03-06 11:17:03.94+03	78
98	Тип компрессора	инверторный	2022-03-06 11:21:38.324+03	2022-03-06 11:21:38.324+03	79
99	Количество компрессоров	1	2022-03-06 11:21:38.326+03	2022-03-06 11:21:38.326+03	79
100	Количество камер	2	2022-03-06 11:21:38.328+03	2022-03-06 11:21:38.328+03	79
101	Общий полезный объем	367 л	2022-03-06 11:21:38.33+03	2022-03-06 11:21:38.33+03	79
102	Объем холодильной камеры	269 л	2022-03-06 11:21:38.333+03	2022-03-06 11:21:38.333+03	79
103	Объем морозильной камеры	98 л	2022-03-06 11:21:38.335+03	2022-03-06 11:21:38.335+03	79
104	Тип компрессора	инверторный	2022-03-06 11:27:47.344+03	2022-03-06 11:27:47.344+03	80
105	Количество компрессоров	1	2022-03-06 11:27:47.346+03	2022-03-06 11:27:47.346+03	80
106	Количество камер	2	2022-03-06 11:27:47.348+03	2022-03-06 11:27:47.348+03	80
107	Общий полезный объем	535 л	2022-03-06 11:27:47.349+03	2022-03-06 11:27:47.349+03	80
108	Объем холодильной камеры	356 л	2022-03-06 11:27:47.351+03	2022-03-06 11:27:47.351+03	80
109	Объем морозильной камеры	179 л	2022-03-06 11:27:47.353+03	2022-03-06 11:27:47.353+03	80
110	Тип компрессора	инверторный	2022-03-06 11:34:29.532+03	2022-03-06 11:34:29.532+03	81
111	Количество компрессоров	1	2022-03-06 11:34:29.535+03	2022-03-06 11:34:29.535+03	81
112	Количество камер	3	2022-03-06 11:34:29.537+03	2022-03-06 11:34:29.537+03	81
113	Общий полезный объем	634 л	2022-03-06 11:34:29.539+03	2022-03-06 11:34:29.539+03	81
114	Объем холодильной камеры	405 л	2022-03-06 11:34:29.541+03	2022-03-06 11:34:29.541+03	81
115	Объем морозильной камеры	229 л	2022-03-06 11:34:29.543+03	2022-03-06 11:34:29.543+03	81
116	Тип	Neo QLED	2022-03-06 11:40:14.976+03	2022-03-06 11:40:14.976+03	82
117	Диагональ	55" (140 см)	2022-03-06 11:40:14.979+03	2022-03-06 11:40:14.979+03	82
118	Разрешение	8K UHD	2022-03-06 11:40:14.98+03	2022-03-06 11:40:14.98+03	82
119	Разрешение, пикс	7680x4320	2022-03-06 11:40:14.983+03	2022-03-06 11:40:14.983+03	82
120	Формат экрана	21:9, 32:9	2022-03-06 11:40:14.985+03	2022-03-06 11:40:14.985+03	82
121	Поверхность экрана	антибликовая	2022-03-06 11:40:14.987+03	2022-03-06 11:40:14.987+03	82
122	Технология затемнения	Ultimate 8K Dimming Pro	2022-03-06 11:40:14.988+03	2022-03-06 11:40:14.988+03	82
123	Частота обновления экрана	120 Гц	2022-03-06 11:40:14.99+03	2022-03-06 11:40:14.99+03	82
124	Тип	LED	2022-03-07 13:47:42.005+03	2022-03-07 13:47:42.005+03	89
125	Диагональ	 55" (140 см)	2022-03-07 13:47:42.01+03	2022-03-07 13:47:42.01+03	89
126	Тип матрицы	LED	2022-03-07 13:47:42.014+03	2022-03-07 13:47:42.014+03	89
127	Разрешение	4K UHD	2022-03-07 13:47:42.016+03	2022-03-07 13:47:42.016+03	89
128	Разрешение, пикс	3840x2160	2022-03-07 13:47:42.018+03	2022-03-07 13:47:42.018+03	89
129	Формат экрана	 16:9	2022-03-07 13:47:42.02+03	2022-03-07 13:47:42.02+03	89
130	Технология затемнения	UHD Dimming	2022-03-07 13:47:42.022+03	2022-03-07 13:47:42.022+03	89
131	Тип	QLED	2022-03-07 13:52:17.736+03	2022-03-07 13:52:17.736+03	90
132	Диагональ	75" (191 см)	2022-03-07 13:53:15.304+03	2022-03-07 13:53:15.304+03	90
133	Тип матрицы	QLED	2022-03-07 13:53:35.355+03	2022-03-07 13:54:06.842+03	90
156	Установка	отдельностоящая	2022-03-08 11:13:51.368+03	2022-03-08 11:13:51.368+03	96
134	Разрешение	4K UHD	2022-03-07 13:55:17.065+03	2022-03-07 13:55:17.065+03	90
135	Формат экрана	16:9	2022-03-07 13:56:01.206+03	2022-03-07 13:56:01.206+03	90
136	Тип LED-подсветки	DUAL LED	2022-03-07 13:57:00.877+03	2022-03-07 13:57:00.877+03	90
144	Тип	LED	2022-03-08 10:47:19.14+03	2022-03-08 10:47:19.14+03	91
145	Диагональ	32" (81 см)	2022-03-08 10:47:19.145+03	2022-03-08 10:47:19.145+03	91
146	Тип матрицы	LED	2022-03-08 10:47:19.147+03	2022-03-08 10:47:19.147+03	91
147	Разрешение	HD	2022-03-08 10:47:19.149+03	2022-03-08 10:47:19.149+03	91
148	Разрешение, пикс	1366x768	2022-03-08 10:47:19.152+03	2022-03-08 10:47:19.152+03	91
149	Частота обновления экрана	60 Гц	2022-03-08 10:47:19.154+03	2022-03-08 10:47:19.154+03	91
150	Тип	Side by Side	2022-03-08 11:01:38.345+03	2022-03-08 11:01:38.345+03	94
151	Тип установки	отдельностоящий	2022-03-08 11:01:38.348+03	2022-03-08 11:01:38.348+03	94
152	Тип компрессора	стандартный	2022-03-08 11:01:38.35+03	2022-03-08 11:01:38.35+03	94
153	Количество компрессоров	1	2022-03-08 11:01:38.352+03	2022-03-08 11:01:38.352+03	94
154	Количество камер	5	2022-03-08 11:01:38.354+03	2022-03-08 11:01:38.354+03	94
155	Общий полезный объем	525 л	2022-03-08 11:01:38.356+03	2022-03-08 11:01:38.356+03	94
157	Конструкция стиральной машины	узкая	2022-03-08 11:13:51.371+03	2022-03-08 11:13:51.371+03	96
158	Количество барабанов	1	2022-03-08 11:13:51.374+03	2022-03-08 11:13:51.374+03	96
159	Тип двигателя	инверторный	2022-03-08 11:13:51.376+03	2022-03-08 11:13:51.376+03	96
160	Тип загрузки	фронтальная	2022-03-08 11:13:51.377+03	2022-03-08 11:13:51.377+03	96
161	Максимальная загрузка белья	7 кг	2022-03-08 11:13:51.379+03	2022-03-08 11:13:51.379+03	96
162	Максимальная скорость отжима	до 1200 об/мин	2022-03-08 11:13:51.381+03	2022-03-08 11:13:51.381+03	96
163	Установка	отдельностоящая	2022-03-08 11:17:40.216+03	2022-03-08 11:17:40.216+03	97
164	Конструкция стиральной машины	узкая	2022-03-08 11:17:40.218+03	2022-03-08 11:17:40.218+03	97
165	Количество барабанов	1	2022-03-08 11:17:40.22+03	2022-03-08 11:17:40.22+03	97
166	Тип двигателя	инверторный	2022-03-08 11:17:40.222+03	2022-03-08 11:17:40.222+03	97
167	Тип загрузки	фронтальная	2022-03-08 11:17:40.224+03	2022-03-08 11:17:40.224+03	97
168	Максимальная загрузка белья	6.5 кг	2022-03-08 11:17:40.226+03	2022-03-08 11:17:40.226+03	97
169	Максимальная скорость отжима	до 1000 об/мин	2022-03-08 11:17:40.228+03	2022-03-08 11:17:40.228+03	97
170	Установка	отдельностоящая	2022-03-08 11:22:13.453+03	2022-03-08 11:22:13.453+03	98
171	Конструкция стиральной машины	узкая	2022-03-08 11:22:13.455+03	2022-03-08 11:22:13.455+03	98
172	Количество барабанов	1	2022-03-08 11:22:13.457+03	2022-03-08 11:22:13.457+03	98
173	Тип двигателя	инверторный	2022-03-08 11:22:13.459+03	2022-03-08 11:22:13.459+03	98
174	Тип загрузки	фронтальная	2022-03-08 11:22:13.46+03	2022-03-08 11:22:13.46+03	98
175	Максимальная загрузка белья	7 кг	2022-03-08 11:22:13.463+03	2022-03-08 11:22:13.463+03	98
176	Максимальная скорость отжима	до 1200 об/мин	2022-03-08 11:22:13.464+03	2022-03-08 11:22:13.464+03	98
177	Экран	1768x2208 пикс	2022-03-08 13:03:18.036+03	2022-03-08 13:03:18.036+03	114
178	Процессор	Qualcomm	2022-03-08 13:03:18.053+03	2022-03-08 13:03:18.053+03	114
179	Оперативная память	12 ГБ	2022-03-08 13:03:18.063+03	2022-03-08 13:03:18.063+03	114
180	Встроенная память	512 ГБ	2022-03-08 13:03:18.071+03	2022-03-08 13:03:18.071+03	114
181	Технология NFC	Да	2022-03-08 13:03:18.082+03	2022-03-08 13:03:18.082+03	114
182	Поддержка стандартов	2G/3G/4G LTE	2022-03-08 13:03:18.09+03	2022-03-08 13:03:18.09+03	114
\.





--
-- Data for Name: ratings; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ratings (rate, created_at, updated_at, product_id, user_id) FROM stdin;
\.





--
-- Name: baskets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.baskets_id_seq', 47, true);


--
-- Name: brands_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.brands_id_seq', 25, true);


--
-- Name: categories_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.categories_id_seq', 18, true);


--
-- Name: order_items_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.order_items_id_seq', 14, true);


--
-- Name: orders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.orders_id_seq', 8, true);


--
-- Name: product_props_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.product_props_id_seq', 182, true);


--
-- Name: products_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.products_id_seq', 143, true);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 6, true);


--
-- Name: basket_products basket_products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_pkey PRIMARY KEY (basket_id, product_id);


--
-- Name: baskets baskets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.baskets
    ADD CONSTRAINT baskets_pkey PRIMARY KEY (id);


--
-- Name: brands brands_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_name_key UNIQUE (name);


--
-- Name: brands brands_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.brands
    ADD CONSTRAINT brands_pkey PRIMARY KEY (id);


--
-- Name: categories categories_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_name_key UNIQUE (name);


--
-- Name: categories categories_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.categories
    ADD CONSTRAINT categories_pkey PRIMARY KEY (id);


--
-- Name: order_items order_items_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_pkey PRIMARY KEY (id);


--
-- Name: orders orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_pkey PRIMARY KEY (id);


--
-- Name: product_props product_props_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_pkey PRIMARY KEY (id);


--
-- Name: products products_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_name_key UNIQUE (name);


--
-- Name: products products_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_pkey PRIMARY KEY (id);


--
-- Name: ratings ratings_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_pkey PRIMARY KEY (product_id, user_id);


--
-- Name: users users_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: basket_products basket_products_basket_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_basket_id_fkey FOREIGN KEY (basket_id) REFERENCES public.baskets(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: basket_products basket_products_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.basket_products
    ADD CONSTRAINT basket_products_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: order_items order_items_order_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.order_items
    ADD CONSTRAINT order_items_order_id_fkey FOREIGN KEY (order_id) REFERENCES public.orders(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: orders orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.orders
    ADD CONSTRAINT orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: product_props product_props_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.product_props
    ADD CONSTRAINT product_props_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: products products_brand_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_brand_id_fkey FOREIGN KEY (brand_id) REFERENCES public.brands(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: products products_category_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.products
    ADD CONSTRAINT products_category_id_fkey FOREIGN KEY (category_id) REFERENCES public.categories(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- Name: ratings ratings_product_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_product_id_fkey FOREIGN KEY (product_id) REFERENCES public.products(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: ratings ratings_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ratings
    ADD CONSTRAINT ratings_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

