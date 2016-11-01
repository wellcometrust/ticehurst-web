--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


--
-- Name: unaccent; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS unaccent WITH SCHEMA public;


--
-- Name: EXTENSION unaccent; Type: COMMENT; Schema: -; Owner: -
--

COMMENT ON EXTENSION unaccent IS 'text search dictionary that removes accents';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: ar_internal_metadata; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE ar_internal_metadata (
    key character varying NOT NULL,
    value character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


--
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id character varying NOT NULL,
    record_id character varying NOT NULL,
    height integer NOT NULL,
    width integer NOT NULL
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE patients (
    id integer NOT NULL,
    name text,
    stays_count integer DEFAULT 0 NOT NULL,
    highlighted boolean DEFAULT false NOT NULL
);


--
-- Name: patients_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE patients_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: patients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE patients_id_seq OWNED BY patients.id;


--
-- Name: records; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE records (
    id character varying(10) NOT NULL
);


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


--
-- Name: stays; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE stays (
    id integer NOT NULL,
    patient_id integer NOT NULL,
    transcribed_name text NOT NULL,
    transcribed_page integer NOT NULL,
    transcribed_line integer NOT NULL,
    transcribed_archives_ref text,
    transcribed_date_of_admission text,
    transcribed_date_of_discharge text,
    transcribed_subsequent_condition text
);


--
-- Name: stays_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE stays_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: stays_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE stays_id_seq OWNED BY stays.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stays ALTER COLUMN id SET DEFAULT nextval('stays_id_seq'::regclass);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: images_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY images
    ADD CONSTRAINT images_pkey PRIMARY KEY (id);


--
-- Name: patients_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY patients
    ADD CONSTRAINT patients_pkey PRIMARY KEY (id);


--
-- Name: records_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY records
    ADD CONSTRAINT records_pkey PRIMARY KEY (id);


--
-- Name: schema_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY schema_migrations
    ADD CONSTRAINT schema_migrations_pkey PRIMARY KEY (version);


--
-- Name: stays_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY stays
    ADD CONSTRAINT stays_pkey PRIMARY KEY (id);


--
-- Name: index_images_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_images_on_id ON images USING btree (id);


--
-- Name: index_records_on_id; Type: INDEX; Schema: public; Owner: -; Tablespace: 
--

CREATE UNIQUE INDEX index_records_on_id ON records USING btree (id);


--
-- Name: fk_rails_a2f79262ff; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY stays
    ADD CONSTRAINT fk_rails_a2f79262ff FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE CASCADE;


--
-- Name: fk_rails_a9e806bb92; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY images
    ADD CONSTRAINT fk_rails_a9e806bb92 FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20161031154615'), ('20161031154850'), ('20161101104705'), ('20161101105837'), ('20161101112155');


