--
-- PostgreSQL database dump
--

-- Dumped from database version 15.3
-- Dumped by pg_dump version 15.3

-- Started on 2025-09-29 11:34:10

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
-- TOC entry 6 (class 2615 OID 254319)
-- Name: blog; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA blog;


ALTER SCHEMA blog OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 217 (class 1259 OID 254364)
-- Name: Post; Type: TABLE; Schema: blog; Owner: postgres
--

CREATE TABLE blog."Post" (
    id text NOT NULL,
    title text NOT NULL,
    content text,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE blog."Post" OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 254425)
-- Name: Products; Type: TABLE; Schema: blog; Owner: postgres
--

CREATE TABLE blog."Products" (
    id text NOT NULL,
    name text NOT NULL,
    description text,
    price numeric,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    product_image text,
    product_stock integer
);


ALTER TABLE blog."Products" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 254433)
-- Name: Transaction; Type: TABLE; Schema: blog; Owner: postgres
--

CREATE TABLE blog."Transaction" (
    id text NOT NULL,
    "transactionNo" text,
    "qtyAll" integer,
    "subTotal" numeric,
    "transactionDate" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "userId" text NOT NULL
);


ALTER TABLE blog."Transaction" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 254441)
-- Name: Transaction_Details; Type: TABLE; Schema: blog; Owner: postgres
--

CREATE TABLE blog."Transaction_Details" (
    id text NOT NULL,
    qty integer,
    total numeric,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL,
    "productId" text NOT NULL,
    "transactionId" text NOT NULL
);


ALTER TABLE blog."Transaction_Details" OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 254333)
-- Name: User; Type: TABLE; Schema: blog; Owner: postgres
--

CREATE TABLE blog."User" (
    id text NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    password text NOT NULL,
    "createdAt" timestamp(3) without time zone DEFAULT CURRENT_TIMESTAMP NOT NULL
);


ALTER TABLE blog."User" OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 254324)
-- Name: _prisma_migrations; Type: TABLE; Schema: blog; Owner: postgres
--

CREATE TABLE blog._prisma_migrations (
    id character varying(36) NOT NULL,
    checksum character varying(64) NOT NULL,
    finished_at timestamp with time zone,
    migration_name character varying(255) NOT NULL,
    logs text,
    rolled_back_at timestamp with time zone,
    started_at timestamp with time zone DEFAULT now() NOT NULL,
    applied_steps_count integer DEFAULT 0 NOT NULL
);


ALTER TABLE blog._prisma_migrations OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 254364)
-- Dependencies: 217
-- Data for Name: Post; Type: TABLE DATA; Schema: blog; Owner: postgres
--



--
-- TOC entry 3362 (class 0 OID 254425)
-- Dependencies: 218
-- Data for Name: Products; Type: TABLE DATA; Schema: blog; Owner: postgres
--

INSERT INTO blog."Products" VALUES ('d6f45bc2-5759-4e2c-beca-aa13a3dabdce', 'Produk 1', 'Produk 1 description', 150000, '2025-09-29 03:06:30.932', NULL, 10);
INSERT INTO blog."Products" VALUES ('4bc87e8f-e29a-42c4-a452-525c9b2a9ca6', 'Produk 2', 'Produk 2 description', 400000, '2025-09-29 03:49:04.936', NULL, 16);
INSERT INTO blog."Products" VALUES ('8c90d2fa-1589-4fb6-99fb-0e551544dbce', 'Produk 3', 'Produk 3 description', 250000, '2025-09-29 03:49:34.197', NULL, 25);


--
-- TOC entry 3363 (class 0 OID 254433)
-- Dependencies: 219
-- Data for Name: Transaction; Type: TABLE DATA; Schema: blog; Owner: postgres
--



--
-- TOC entry 3364 (class 0 OID 254441)
-- Dependencies: 220
-- Data for Name: Transaction_Details; Type: TABLE DATA; Schema: blog; Owner: postgres
--



--
-- TOC entry 3360 (class 0 OID 254333)
-- Dependencies: 216
-- Data for Name: User; Type: TABLE DATA; Schema: blog; Owner: postgres
--

INSERT INTO blog."User" VALUES ('838b87c6-2ec6-45b0-a285-15a08165d7dd', 'test1', 'test1@gmail.com', '$2b$10$mcJYHQ2C4SKx0Va6bPxVuOci0fnYWCcTkux3ad1RhAKswEc5bxJq6', '2025-09-29 03:02:35.5');


--
-- TOC entry 3359 (class 0 OID 254324)
-- Dependencies: 215
-- Data for Name: _prisma_migrations; Type: TABLE DATA; Schema: blog; Owner: postgres
--

INSERT INTO blog._prisma_migrations VALUES ('cc41aa2a-6bc3-4176-91f2-c3131d2df327', '8ca7ff7c6528b01e8216f4cbf54d89c9ce76305d84693e3db46e8bfd13a8539a', '2025-09-28 20:11:45.550632+07', '20250928131145_init', NULL, NULL, '2025-09-28 20:11:45.518589+07', 1);
INSERT INTO blog._prisma_migrations VALUES ('b7e2d14b-1e36-4f18-aa8d-b7a69f826654', '9bc945c5a8e1156280449f9c1c52c0955bf07cc697e40ba5e93bc7650d78431b', '2025-09-28 20:34:06.283021+07', '20250928133406_add_post_model', NULL, NULL, '2025-09-28 20:34:06.182283+07', 1);
INSERT INTO blog._prisma_migrations VALUES ('0403b7c3-bfa2-49a8-8da1-bf6cdfd4cc34', '3abba986da35f9c9a233ce770dcc99f8f1fefd217824f8712a9ac64b74720939', '2025-09-29 08:55:55.580049+07', '20250929015555_add_transaction_model', NULL, NULL, '2025-09-29 08:55:55.494839+07', 1);
INSERT INTO blog._prisma_migrations VALUES ('bd4f0778-da8b-444f-b7c4-0acdcf61a989', '5ab6d80c9595c1c132bb19ffb48dd3f239114f68d1b8f34de7f37366c0b52f44', '2025-09-29 08:58:58.204108+07', '20250929015858_add_product_image', NULL, NULL, '2025-09-29 08:58:58.17629+07', 1);
INSERT INTO blog._prisma_migrations VALUES ('985f0235-9b7e-4b34-b2ce-5a66033f3e61', '8967b4b8830c2854ee6280c3eece6eac4820f91b955cfd055e668946ad387bc6', '2025-09-29 09:00:07.226679+07', '20250929020007_add_product_stock', NULL, NULL, '2025-09-29 09:00:07.214739+07', 1);


--
-- TOC entry 3206 (class 2606 OID 254371)
-- Name: Post Post_pkey; Type: CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Post"
    ADD CONSTRAINT "Post_pkey" PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 254432)
-- Name: Products Products_pkey; Type: CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Products"
    ADD CONSTRAINT "Products_pkey" PRIMARY KEY (id);


--
-- TOC entry 3212 (class 2606 OID 254448)
-- Name: Transaction_Details Transaction_Details_pkey; Type: CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Transaction_Details"
    ADD CONSTRAINT "Transaction_Details_pkey" PRIMARY KEY (id);


--
-- TOC entry 3210 (class 2606 OID 254440)
-- Name: Transaction Transaction_pkey; Type: CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Transaction"
    ADD CONSTRAINT "Transaction_pkey" PRIMARY KEY (id);


--
-- TOC entry 3204 (class 2606 OID 254340)
-- Name: User User_pkey; Type: CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- TOC entry 3201 (class 2606 OID 254332)
-- Name: _prisma_migrations _prisma_migrations_pkey; Type: CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog._prisma_migrations
    ADD CONSTRAINT _prisma_migrations_pkey PRIMARY KEY (id);


--
-- TOC entry 3202 (class 1259 OID 254341)
-- Name: User_email_key; Type: INDEX; Schema: blog; Owner: postgres
--

CREATE UNIQUE INDEX "User_email_key" ON blog."User" USING btree (email);


--
-- TOC entry 3213 (class 2606 OID 254372)
-- Name: Post Post_userId_fkey; Type: FK CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Post"
    ADD CONSTRAINT "Post_userId_fkey" FOREIGN KEY ("userId") REFERENCES blog."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3215 (class 2606 OID 254459)
-- Name: Transaction_Details Transaction_Details_productId_fkey; Type: FK CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Transaction_Details"
    ADD CONSTRAINT "Transaction_Details_productId_fkey" FOREIGN KEY ("productId") REFERENCES blog."Products"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3216 (class 2606 OID 254454)
-- Name: Transaction_Details Transaction_Details_transactionId_fkey; Type: FK CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Transaction_Details"
    ADD CONSTRAINT "Transaction_Details_transactionId_fkey" FOREIGN KEY ("transactionId") REFERENCES blog."Transaction"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


--
-- TOC entry 3214 (class 2606 OID 254449)
-- Name: Transaction Transaction_userId_fkey; Type: FK CONSTRAINT; Schema: blog; Owner: postgres
--

ALTER TABLE ONLY blog."Transaction"
    ADD CONSTRAINT "Transaction_userId_fkey" FOREIGN KEY ("userId") REFERENCES blog."User"(id) ON UPDATE CASCADE ON DELETE RESTRICT;


-- Completed on 2025-09-29 11:34:10

--
-- PostgreSQL database dump complete
--

