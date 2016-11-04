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
-- Name: admission_certificates; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE admission_certificates (
    id integer NOT NULL,
    stay_id integer NOT NULL,
    record_id character varying NOT NULL,
    sequence_start integer NOT NULL,
    sequence_end integer NOT NULL
);


--
-- Name: admission_certificates_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE admission_certificates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: admission_certificates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE admission_certificates_id_seq OWNED BY admission_certificates.id;


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
-- Name: bill_notes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE bill_notes (
    id integer NOT NULL,
    stay_id integer NOT NULL,
    record_id character varying NOT NULL,
    sequence_start integer NOT NULL,
    sequence_end integer NOT NULL
);


--
-- Name: bill_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE bill_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: bill_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE bill_notes_id_seq OWNED BY bill_notes.id;


--
-- Name: case_notes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE case_notes (
    id integer NOT NULL,
    stay_id integer,
    record_id character varying NOT NULL,
    sequence_start integer,
    sequence_end integer,
    index_image_id text,
    index_side text,
    patient_id integer,
    transcribed_index_page_ref text
);


--
-- Name: case_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE case_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: case_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE case_notes_id_seq OWNED BY case_notes.id;


--
-- Name: discharge_notes; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE discharge_notes (
    id integer NOT NULL,
    stay_id integer NOT NULL,
    record_id character varying NOT NULL,
    sequence_start integer NOT NULL,
    sequence_end integer NOT NULL
);


--
-- Name: discharge_notes_id_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE discharge_notes_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: discharge_notes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE discharge_notes_id_seq OWNED BY discharge_notes.id;


--
-- Name: images; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE images (
    id character varying NOT NULL,
    sequence integer NOT NULL,
    record_id character varying NOT NULL,
    height integer NOT NULL,
    width integer NOT NULL,
    left_page text,
    right_page text,
    page_type text,
    transcribed boolean DEFAULT false NOT NULL
);


--
-- Name: patients; Type: TABLE; Schema: public; Owner: -; Tablespace: 
--

CREATE TABLE patients (
    id integer NOT NULL,
    name text,
    stays_count integer DEFAULT 0 NOT NULL,
    highlighted boolean DEFAULT false NOT NULL,
    introduction text,
    first_admitted date,
    last_discharged date
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
    id character varying(10) NOT NULL,
    volume text,
    volume_number integer,
    pages_with_type integer DEFAULT 0 NOT NULL
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
    transcribed_subsequent_condition text,
    admission date,
    discharge date
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

ALTER TABLE ONLY admission_certificates ALTER COLUMN id SET DEFAULT nextval('admission_certificates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY bill_notes ALTER COLUMN id SET DEFAULT nextval('bill_notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY case_notes ALTER COLUMN id SET DEFAULT nextval('case_notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY discharge_notes ALTER COLUMN id SET DEFAULT nextval('discharge_notes_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY patients ALTER COLUMN id SET DEFAULT nextval('patients_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY stays ALTER COLUMN id SET DEFAULT nextval('stays_id_seq'::regclass);


--
-- Name: admission_certificates_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY admission_certificates
    ADD CONSTRAINT admission_certificates_pkey PRIMARY KEY (id);


--
-- Name: ar_internal_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY ar_internal_metadata
    ADD CONSTRAINT ar_internal_metadata_pkey PRIMARY KEY (key);


--
-- Name: bill_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY bill_notes
    ADD CONSTRAINT bill_notes_pkey PRIMARY KEY (id);


--
-- Name: case_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY case_notes
    ADD CONSTRAINT case_notes_pkey PRIMARY KEY (id);


--
-- Name: discharge_notes_pkey; Type: CONSTRAINT; Schema: public; Owner: -; Tablespace: 
--

ALTER TABLE ONLY discharge_notes
    ADD CONSTRAINT discharge_notes_pkey PRIMARY KEY (id);


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
-- Name: fk_rails_0bfbb82c43; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bill_notes
    ADD CONSTRAINT fk_rails_0bfbb82c43 FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE;


--
-- Name: fk_rails_23e1e1b595; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY bill_notes
    ADD CONSTRAINT fk_rails_23e1e1b595 FOREIGN KEY (stay_id) REFERENCES stays(id) ON DELETE CASCADE;


--
-- Name: fk_rails_33b44c779c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY case_notes
    ADD CONSTRAINT fk_rails_33b44c779c FOREIGN KEY (index_image_id) REFERENCES images(id) ON DELETE RESTRICT;


--
-- Name: fk_rails_3abaeda4e7; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY case_notes
    ADD CONSTRAINT fk_rails_3abaeda4e7 FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE;


--
-- Name: fk_rails_4adba77211; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admission_certificates
    ADD CONSTRAINT fk_rails_4adba77211 FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE;


--
-- Name: fk_rails_66fce65c3c; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY case_notes
    ADD CONSTRAINT fk_rails_66fce65c3c FOREIGN KEY (stay_id) REFERENCES stays(id) ON DELETE CASCADE;


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
-- Name: fk_rails_b6d16f20e3; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY case_notes
    ADD CONSTRAINT fk_rails_b6d16f20e3 FOREIGN KEY (patient_id) REFERENCES patients(id) ON DELETE RESTRICT;


--
-- Name: fk_rails_bbef2204d0; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY discharge_notes
    ADD CONSTRAINT fk_rails_bbef2204d0 FOREIGN KEY (record_id) REFERENCES records(id) ON DELETE CASCADE;


--
-- Name: fk_rails_e292f3e919; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY admission_certificates
    ADD CONSTRAINT fk_rails_e292f3e919 FOREIGN KEY (stay_id) REFERENCES stays(id) ON DELETE CASCADE;


--
-- Name: fk_rails_f835f186ad; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY discharge_notes
    ADD CONSTRAINT fk_rails_f835f186ad FOREIGN KEY (stay_id) REFERENCES stays(id) ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

SET search_path TO "$user",public;

INSERT INTO schema_migrations (version) VALUES ('20161031154615'), ('20161031154850'), ('20161101104705'), ('20161101105837'), ('20161101112155'), ('20161101114718'), ('20161101132937'), ('20161101135812'), ('20161101140633'), ('20161102091114'), ('20161102114241'), ('20161102140601'), ('20161102140716'), ('20161102140856'), ('20161103100625'), ('20161103142044'), ('20161103145706'), ('20161103162935'), ('20161104100810'), ('20161104112528');


