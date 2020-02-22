--
-- Name: tb_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_category (
    id bigint NOT NULL,
    name character varying(255)
);


--
-- Name: tb_category_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tb_category ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tb_category_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tb_order; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_order (
    id bigint NOT NULL,
    moment timestamp without time zone,
    order_status integer,
    client_id bigint
);


--
-- Name: tb_order_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tb_order ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tb_order_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tb_order_item; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_order_item (
    price double precision,
    quantity integer,
    product_id bigint NOT NULL,
    order_id bigint NOT NULL
);


--
-- Name: tb_payment; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_payment (
    moment timestamp without time zone,
    order_id bigint NOT NULL
);


--
-- Name: tb_product; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_product (
    id bigint NOT NULL,
    description character varying(255),
    img_url character varying(255),
    name character varying(255),
    price double precision
);


--
-- Name: tb_product_category; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_product_category (
    product_id bigint NOT NULL,
    category_id bigint NOT NULL
);


--
-- Name: tb_product_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tb_product ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tb_product_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Name: tb_user; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.tb_user (
    id bigint NOT NULL,
    email character varying(255),
    name character varying(255),
    password character varying(255),
    phone character varying(255)
);


--
-- Name: tb_user_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

ALTER TABLE public.tb_user ALTER COLUMN id ADD GENERATED BY DEFAULT AS IDENTITY (
    SEQUENCE NAME public.tb_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1
);


--
-- Data for Name: tb_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_category (id, name) FROM stdin;
\.


--
-- Data for Name: tb_order; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_order (id, moment, order_status, client_id) FROM stdin;
\.


--
-- Data for Name: tb_order_item; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_order_item (price, quantity, product_id, order_id) FROM stdin;
\.


--
-- Data for Name: tb_payment; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_payment (moment, order_id) FROM stdin;
\.


--
-- Data for Name: tb_product; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_product (id, description, img_url, name, price) FROM stdin;
\.


--
-- Data for Name: tb_product_category; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_product_category (product_id, category_id) FROM stdin;
\.


--
-- Data for Name: tb_user; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.tb_user (id, email, name, password, phone) FROM stdin;
\.


--
-- Name: tb_category_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tb_category_id_seq', 1, false);


--
-- Name: tb_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tb_order_id_seq', 1, false);


--
-- Name: tb_product_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tb_product_id_seq', 1, false);


--
-- Name: tb_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.tb_user_id_seq', 1, false);


--
-- Name: tb_category tb_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_category
    ADD CONSTRAINT tb_category_pkey PRIMARY KEY (id);


--
-- Name: tb_order_item tb_order_item_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT tb_order_item_pkey PRIMARY KEY (order_id, product_id);


--
-- Name: tb_order tb_order_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order
    ADD CONSTRAINT tb_order_pkey PRIMARY KEY (id);


--
-- Name: tb_payment tb_payment_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT tb_payment_pkey PRIMARY KEY (order_id);


--
-- Name: tb_product_category tb_product_category_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT tb_product_category_pkey PRIMARY KEY (product_id, category_id);


--
-- Name: tb_product tb_product_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product
    ADD CONSTRAINT tb_product_pkey PRIMARY KEY (id);


--
-- Name: tb_user tb_user_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_user
    ADD CONSTRAINT tb_user_pkey PRIMARY KEY (id);


--
-- Name: tb_order_item fk4h5xid5qehset7qwe5l9c997x; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fk4h5xid5qehset7qwe5l9c997x FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- Name: tb_product_category fk5r4sbavb4nkd9xpl0f095qs2a; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT fk5r4sbavb4nkd9xpl0f095qs2a FOREIGN KEY (category_id) REFERENCES public.tb_category(id);


--
-- Name: tb_product_category fkgbof0jclmaf8wn2alsoexxq3u; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_product_category
    ADD CONSTRAINT fkgbof0jclmaf8wn2alsoexxq3u FOREIGN KEY (product_id) REFERENCES public.tb_product(id);


--
-- Name: tb_order_item fkgeobgl2xu916he8vhljktwxnx; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order_item
    ADD CONSTRAINT fkgeobgl2xu916he8vhljktwxnx FOREIGN KEY (order_id) REFERENCES public.tb_order(id);


--
-- Name: tb_order fki0x0rv7d65vsceuy33km9567n; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_order
    ADD CONSTRAINT fki0x0rv7d65vsceuy33km9567n FOREIGN KEY (client_id) REFERENCES public.tb_user(id);


--
-- Name: tb_payment fkokaf4il2cwit4h780c25dv04r; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.tb_payment
    ADD CONSTRAINT fkokaf4il2cwit4h780c25dv04r FOREIGN KEY (order_id) REFERENCES public.tb_order(id);


--
-- PostgreSQL database dump complete
--

