--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET client_encoding = 'SQL_ASCII';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: api_keys; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE api_keys (
    id integer NOT NULL,
    create_time timestamp without time zone,
    user_id integer,
    key character varying(32)
);


ALTER TABLE public.api_keys OWNER TO "__GALAXY_DB_USER__";

--
-- Name: api_keys_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE api_keys_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.api_keys_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: api_keys_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE api_keys_id_seq OWNED BY api_keys.id;


--
-- Name: cleanup_event; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event (
    id integer NOT NULL,
    create_time timestamp without time zone,
    message character varying(1024)
);


ALTER TABLE public.cleanup_event OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_dataset_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    dataset_id integer
);


ALTER TABLE public.cleanup_event_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_dataset_association_id_seq OWNED BY cleanup_event_dataset_association.id;


--
-- Name: cleanup_event_hda_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_hda_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    hda_id integer
);


ALTER TABLE public.cleanup_event_hda_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_hda_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_hda_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_hda_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_hda_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_hda_association_id_seq OWNED BY cleanup_event_hda_association.id;


--
-- Name: cleanup_event_history_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_history_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    history_id integer
);


ALTER TABLE public.cleanup_event_history_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_history_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_history_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_history_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_history_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_history_association_id_seq OWNED BY cleanup_event_history_association.id;


--
-- Name: cleanup_event_icda_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_icda_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    icda_id integer
);


ALTER TABLE public.cleanup_event_icda_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_icda_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_icda_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_icda_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_icda_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_icda_association_id_seq OWNED BY cleanup_event_icda_association.id;


--
-- Name: cleanup_event_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_id_seq OWNED BY cleanup_event.id;


--
-- Name: cleanup_event_ldda_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_ldda_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    ldda_id integer
);


ALTER TABLE public.cleanup_event_ldda_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_ldda_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_ldda_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_ldda_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_ldda_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_ldda_association_id_seq OWNED BY cleanup_event_ldda_association.id;


--
-- Name: cleanup_event_library_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_library_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    library_id integer
);


ALTER TABLE public.cleanup_event_library_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_library_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_library_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_library_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_library_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_library_association_id_seq OWNED BY cleanup_event_library_association.id;


--
-- Name: cleanup_event_library_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_library_dataset_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    library_dataset_id integer
);


ALTER TABLE public.cleanup_event_library_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_library_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_library_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_library_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_library_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_library_dataset_association_id_seq OWNED BY cleanup_event_library_dataset_association.id;


--
-- Name: cleanup_event_library_folder_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_library_folder_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    library_folder_id integer
);


ALTER TABLE public.cleanup_event_library_folder_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_library_folder_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_library_folder_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_library_folder_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_library_folder_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_library_folder_association_id_seq OWNED BY cleanup_event_library_folder_association.id;


--
-- Name: cleanup_event_metadata_file_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_metadata_file_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    metadata_file_id integer
);


ALTER TABLE public.cleanup_event_metadata_file_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_metadata_file_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_metadata_file_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_metadata_file_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_metadata_file_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_metadata_file_association_id_seq OWNED BY cleanup_event_metadata_file_association.id;


--
-- Name: cleanup_event_user_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cleanup_event_user_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    cleanup_event_id integer,
    user_id integer
);


ALTER TABLE public.cleanup_event_user_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_user_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cleanup_event_user_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cleanup_event_user_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cleanup_event_user_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cleanup_event_user_association_id_seq OWNED BY cleanup_event_user_association.id;


--
-- Name: cloudauthz; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE cloudauthz (
    id integer NOT NULL,
    user_id integer,
    provider character varying(255),
    config bytea,
    authn_id integer,
    tokens bytea,
    last_update timestamp without time zone,
    last_activity timestamp without time zone,
    description text,
    create_time timestamp without time zone
);


ALTER TABLE public.cloudauthz OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cloudauthz_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE cloudauthz_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cloudauthz_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: cloudauthz_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE cloudauthz_id_seq OWNED BY cloudauthz.id;


--
-- Name: custos_authnz_token; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE custos_authnz_token (
    id integer NOT NULL,
    user_id integer,
    external_user_id character varying(64),
    provider character varying(255),
    access_token text,
    id_token text,
    refresh_token text,
    expiration_time timestamp without time zone,
    refresh_expiration_time timestamp without time zone
);


ALTER TABLE public.custos_authnz_token OWNER TO "__GALAXY_DB_USER__";

--
-- Name: custos_authnz_token_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE custos_authnz_token_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.custos_authnz_token_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: custos_authnz_token_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE custos_authnz_token_id_seq OWNED BY custos_authnz_token.id;


--
-- Name: data_manager_history_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE data_manager_history_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    history_id integer,
    user_id integer
);


ALTER TABLE public.data_manager_history_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: data_manager_history_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE data_manager_history_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_manager_history_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: data_manager_history_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE data_manager_history_association_id_seq OWNED BY data_manager_history_association.id;


--
-- Name: data_manager_job_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE data_manager_job_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    job_id integer,
    data_manager_id text
);


ALTER TABLE public.data_manager_job_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: data_manager_job_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE data_manager_job_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.data_manager_job_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: data_manager_job_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE data_manager_job_association_id_seq OWNED BY data_manager_job_association.id;


--
-- Name: dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    state character varying(64),
    deleted boolean,
    purged boolean,
    purgable boolean,
    external_filename text,
    _extra_files_path text,
    file_size numeric(15,0),
    total_size numeric(15,0),
    object_store_id character varying(255),
    uuid character(32)
);


ALTER TABLE public.dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_collection; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_collection (
    id integer NOT NULL,
    collection_type character varying(255) NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    populated_state character varying(64) DEFAULT 'ok'::character varying NOT NULL,
    populated_state_message text,
    element_count integer
);


ALTER TABLE public.dataset_collection OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_collection_element; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_collection_element (
    id integer NOT NULL,
    dataset_collection_id integer NOT NULL,
    hda_id integer,
    ldda_id integer,
    child_collection_id integer,
    element_index integer NOT NULL,
    element_identifier character varying(255) NOT NULL
);


ALTER TABLE public.dataset_collection_element OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_collection_element_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_collection_element_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_collection_element_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_collection_element_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_collection_element_id_seq OWNED BY dataset_collection_element.id;


--
-- Name: dataset_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_collection_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_collection_id_seq OWNED BY dataset_collection.id;


--
-- Name: dataset_hash; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_hash (
    id integer NOT NULL,
    dataset_id integer,
    hash_function text,
    hash_value text,
    extra_files_path text
);


ALTER TABLE public.dataset_hash OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_hash_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_hash_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_hash_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_hash_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_hash_id_seq OWNED BY dataset_hash.id;


--
-- Name: dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_id_seq OWNED BY dataset.id;


--
-- Name: dataset_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_permissions (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    action text,
    dataset_id integer,
    role_id integer
);


ALTER TABLE public.dataset_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_permissions_id_seq OWNED BY dataset_permissions.id;


--
-- Name: dataset_source; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_source (
    id integer NOT NULL,
    dataset_id integer,
    source_uri text,
    extra_files_path text,
    transform bytea
);


ALTER TABLE public.dataset_source OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_source_hash; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_source_hash (
    id integer NOT NULL,
    dataset_source_id integer,
    hash_function text,
    hash_value text
);


ALTER TABLE public.dataset_source_hash OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_source_hash_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_source_hash_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_source_hash_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_source_hash_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_source_hash_id_seq OWNED BY dataset_source_hash.id;


--
-- Name: dataset_source_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_source_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_source_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_source_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_source_id_seq OWNED BY dataset_source.id;


--
-- Name: dataset_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dataset_tag_association (
    id integer NOT NULL,
    dataset_id integer,
    tag_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.dataset_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dataset_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dataset_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dataset_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dataset_tag_association_id_seq OWNED BY dataset_tag_association.id;


--
-- Name: default_history_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE default_history_permissions (
    id integer NOT NULL,
    history_id integer,
    action text,
    role_id integer
);


ALTER TABLE public.default_history_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: default_history_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE default_history_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.default_history_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: default_history_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE default_history_permissions_id_seq OWNED BY default_history_permissions.id;


--
-- Name: default_quota_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE default_quota_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    type character varying(32),
    quota_id integer
);


ALTER TABLE public.default_quota_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: default_quota_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE default_quota_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.default_quota_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: default_quota_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE default_quota_association_id_seq OWNED BY default_quota_association.id;


--
-- Name: default_user_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE default_user_permissions (
    id integer NOT NULL,
    user_id integer,
    action text,
    role_id integer
);


ALTER TABLE public.default_user_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: default_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE default_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.default_user_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: default_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE default_user_permissions_id_seq OWNED BY default_user_permissions.id;


--
-- Name: deferred_job; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE deferred_job (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    state character varying(64),
    plugin character varying(128),
    params bytea
);


ALTER TABLE public.deferred_job OWNER TO "__GALAXY_DB_USER__";

--
-- Name: deferred_job_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE deferred_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.deferred_job_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: deferred_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE deferred_job_id_seq OWNED BY deferred_job.id;


--
-- Name: dynamic_tool; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE dynamic_tool (
    id integer NOT NULL,
    uuid character(32),
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    tool_id character varying(255),
    tool_version character varying(255),
    tool_format character varying(255),
    tool_path character varying(255),
    tool_directory character varying(255),
    hidden boolean,
    active boolean,
    value bytea
);


ALTER TABLE public.dynamic_tool OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dynamic_tool_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE dynamic_tool_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.dynamic_tool_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: dynamic_tool_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE dynamic_tool_id_seq OWNED BY dynamic_tool.id;


--
-- Name: event; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE event (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    history_id integer,
    user_id integer,
    message character varying(1024),
    session_id integer,
    tool_id character varying(255)
);


ALTER TABLE public.event OWNER TO "__GALAXY_DB_USER__";

--
-- Name: event_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE event_id_seq OWNED BY event.id;


--
-- Name: extended_metadata; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE extended_metadata (
    id integer NOT NULL,
    data bytea
);


ALTER TABLE public.extended_metadata OWNER TO "__GALAXY_DB_USER__";

--
-- Name: extended_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE extended_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extended_metadata_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: extended_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE extended_metadata_id_seq OWNED BY extended_metadata.id;


--
-- Name: extended_metadata_index; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE extended_metadata_index (
    id integer NOT NULL,
    extended_metadata_id integer,
    path character varying(255),
    value text
);


ALTER TABLE public.extended_metadata_index OWNER TO "__GALAXY_DB_USER__";

--
-- Name: extended_metadata_index_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE extended_metadata_index_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.extended_metadata_index_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: extended_metadata_index_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE extended_metadata_index_id_seq OWNED BY extended_metadata_index.id;


--
-- Name: external_service; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE external_service (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255) NOT NULL,
    description text,
    version character varying(255),
    form_definition_id integer,
    form_values_id integer,
    deleted boolean,
    external_service_type_id character varying(255)
);


ALTER TABLE public.external_service OWNER TO "__GALAXY_DB_USER__";

--
-- Name: external_service_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE external_service_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.external_service_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: external_service_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE external_service_id_seq OWNED BY external_service.id;


--
-- Name: form_definition; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE form_definition (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255) NOT NULL,
    "desc" text,
    form_definition_current_id integer NOT NULL,
    fields bytea,
    type character varying(255),
    layout bytea
);


ALTER TABLE public.form_definition OWNER TO "__GALAXY_DB_USER__";

--
-- Name: form_definition_current; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE form_definition_current (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    latest_form_id integer,
    deleted boolean
);


ALTER TABLE public.form_definition_current OWNER TO "__GALAXY_DB_USER__";

--
-- Name: form_definition_current_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE form_definition_current_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_definition_current_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: form_definition_current_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE form_definition_current_id_seq OWNED BY form_definition_current.id;


--
-- Name: form_definition_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE form_definition_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_definition_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: form_definition_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE form_definition_id_seq OWNED BY form_definition.id;


--
-- Name: form_values; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE form_values (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    form_definition_id integer,
    content bytea
);


ALTER TABLE public.form_values OWNER TO "__GALAXY_DB_USER__";

--
-- Name: form_values_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE form_values_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.form_values_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: form_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE form_values_id_seq OWNED BY form_values.id;


--
-- Name: galaxy_group; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE galaxy_group (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255),
    deleted boolean
);


ALTER TABLE public.galaxy_group OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_group_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE galaxy_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_group_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE galaxy_group_id_seq OWNED BY galaxy_group.id;


--
-- Name: galaxy_session; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE galaxy_session (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    user_id integer,
    remote_host character varying(255),
    remote_addr character varying(255),
    referer text,
    current_history_id integer,
    session_key character varying(255),
    is_valid boolean,
    prev_session_id integer,
    disk_usage numeric(15,0),
    last_action timestamp without time zone
);


ALTER TABLE public.galaxy_session OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_session_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE galaxy_session_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_session_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_session_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE galaxy_session_id_seq OWNED BY galaxy_session.id;


--
-- Name: galaxy_session_to_history; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE galaxy_session_to_history (
    id integer NOT NULL,
    create_time timestamp without time zone,
    session_id integer,
    history_id integer
);


ALTER TABLE public.galaxy_session_to_history OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_session_to_history_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE galaxy_session_to_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_session_to_history_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_session_to_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE galaxy_session_to_history_id_seq OWNED BY galaxy_session_to_history.id;


--
-- Name: galaxy_user; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE galaxy_user (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    external boolean,
    deleted boolean,
    purged boolean,
    username character varying(255),
    form_values_id integer,
    disk_usage numeric(15,0),
    activation_token character varying(64),
    active boolean,
    last_password_change timestamp without time zone
);


ALTER TABLE public.galaxy_user OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_user_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE galaxy_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_user_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE galaxy_user_id_seq OWNED BY galaxy_user.id;


--
-- Name: galaxy_user_openid; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE galaxy_user_openid (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    session_id integer,
    user_id integer,
    openid text,
    provider character varying(255)
);


ALTER TABLE public.galaxy_user_openid OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_user_openid_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE galaxy_user_openid_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_user_openid_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: galaxy_user_openid_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE galaxy_user_openid_id_seq OWNED BY galaxy_user_openid.id;


--
-- Name: genome_index_tool_data; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE genome_index_tool_data (
    id integer NOT NULL,
    job_id integer,
    dataset_id integer,
    deferred_job_id integer,
    transfer_job_id integer,
    fasta_path character varying(255),
    created_time timestamp without time zone,
    modified_time timestamp without time zone,
    indexer character varying(64),
    user_id integer
);


ALTER TABLE public.genome_index_tool_data OWNER TO "__GALAXY_DB_USER__";

--
-- Name: genome_index_tool_data_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE genome_index_tool_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.genome_index_tool_data_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: genome_index_tool_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE genome_index_tool_data_id_seq OWNED BY genome_index_tool_data.id;


--
-- Name: group_quota_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE group_quota_association (
    id integer NOT NULL,
    group_id integer,
    quota_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.group_quota_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: group_quota_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE group_quota_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_quota_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: group_quota_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE group_quota_association_id_seq OWNED BY group_quota_association.id;


--
-- Name: group_role_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE group_role_association (
    id integer NOT NULL,
    group_id integer,
    role_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.group_role_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: group_role_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE group_role_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.group_role_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: group_role_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE group_role_association_id_seq OWNED BY group_role_association.id;


--
-- Name: history; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    user_id integer,
    name character varying(255),
    hid_counter integer,
    deleted boolean,
    purged boolean,
    genome_build character varying(40),
    importable boolean,
    slug text,
    published boolean,
    importing boolean
);


ALTER TABLE public.history OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_annotation_association (
    id integer NOT NULL,
    history_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.history_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_annotation_association_id_seq OWNED BY history_annotation_association.id;


--
-- Name: history_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association (
    id integer NOT NULL,
    history_id integer,
    dataset_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    copied_from_history_dataset_association_id integer,
    hid integer,
    name character varying(255),
    info character varying(255),
    blurb character varying(255),
    peek text,
    extension character varying(64),
    metadata bytea,
    parent_id integer,
    designation character varying(255),
    deleted boolean,
    visible boolean,
    copied_from_library_dataset_dataset_association_id integer,
    state character varying(64),
    purged boolean,
    tool_version text,
    extended_metadata_id integer,
    hidden_beneath_collection_instance_id integer,
    version integer
);


ALTER TABLE public.history_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association_annotation_association (
    id integer NOT NULL,
    history_dataset_association_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.history_dataset_association_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_annotation_association_id_seq OWNED BY history_dataset_association_annotation_association.id;


--
-- Name: history_dataset_association_display_at_authorization; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association_display_at_authorization (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    history_dataset_association_id integer,
    user_id integer,
    site character varying(255)
);


ALTER TABLE public.history_dataset_association_display_at_authorization OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_display_at_authorization_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_display_at_authorization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_display_at_authorization_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_display_at_authorization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_display_at_authorization_id_seq OWNED BY history_dataset_association_display_at_authorization.id;


--
-- Name: history_dataset_association_history; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association_history (
    id integer NOT NULL,
    history_dataset_association_id integer,
    update_time timestamp without time zone,
    version integer,
    name character varying(255),
    extension character varying(64),
    metadata bytea,
    extended_metadata_id integer
);


ALTER TABLE public.history_dataset_association_history OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_history_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_history_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_history_id_seq OWNED BY history_dataset_association_history.id;


--
-- Name: history_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_id_seq OWNED BY history_dataset_association.id;


--
-- Name: history_dataset_association_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association_rating_association (
    id integer NOT NULL,
    history_dataset_association_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.history_dataset_association_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_rating_association_id_seq OWNED BY history_dataset_association_rating_association.id;


--
-- Name: history_dataset_association_subset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association_subset (
    id integer NOT NULL,
    history_dataset_association_id integer,
    history_dataset_association_subset_id integer,
    location character varying(255)
);


ALTER TABLE public.history_dataset_association_subset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_subset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_subset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_subset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_subset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_subset_id_seq OWNED BY history_dataset_association_subset.id;


--
-- Name: history_dataset_association_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_association_tag_association (
    id integer NOT NULL,
    history_dataset_association_id integer,
    tag_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255),
    user_id integer
);


ALTER TABLE public.history_dataset_association_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_association_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_association_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_association_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_association_tag_association_id_seq OWNED BY history_dataset_association_tag_association.id;


--
-- Name: history_dataset_collection_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_collection_annotation_association (
    id integer NOT NULL,
    history_dataset_collection_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.history_dataset_collection_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_collection_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_collection_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_collection_annotation_association_id_seq OWNED BY history_dataset_collection_annotation_association.id;


--
-- Name: history_dataset_collection_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_collection_association (
    id integer NOT NULL,
    collection_id integer,
    history_id integer,
    hid integer,
    name character varying(255),
    deleted boolean,
    visible boolean,
    copied_from_history_dataset_collection_association_id integer,
    implicit_output_name character varying(255),
    implicit_collection_jobs_id integer,
    job_id integer
);


ALTER TABLE public.history_dataset_collection_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_collection_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_collection_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_collection_association_id_seq OWNED BY history_dataset_collection_association.id;


--
-- Name: history_dataset_collection_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_collection_rating_association (
    id integer NOT NULL,
    history_dataset_collection_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.history_dataset_collection_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_collection_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_collection_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_collection_rating_association_id_seq OWNED BY history_dataset_collection_rating_association.id;


--
-- Name: history_dataset_collection_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_dataset_collection_tag_association (
    id integer NOT NULL,
    history_dataset_collection_id integer,
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.history_dataset_collection_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_dataset_collection_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_dataset_collection_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_dataset_collection_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_dataset_collection_tag_association_id_seq OWNED BY history_dataset_collection_tag_association.id;


--
-- Name: history_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_id_seq OWNED BY history.id;


--
-- Name: history_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_rating_association (
    id integer NOT NULL,
    history_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.history_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_rating_association_id_seq OWNED BY history_rating_association.id;


--
-- Name: history_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_tag_association (
    id integer NOT NULL,
    history_id integer,
    tag_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255),
    user_id integer
);


ALTER TABLE public.history_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_tag_association_id_seq OWNED BY history_tag_association.id;


--
-- Name: history_user_share_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE history_user_share_association (
    id integer NOT NULL,
    history_id integer,
    user_id integer
);


ALTER TABLE public.history_user_share_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_user_share_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE history_user_share_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.history_user_share_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: history_user_share_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE history_user_share_association_id_seq OWNED BY history_user_share_association.id;


--
-- Name: implicit_collection_jobs; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE implicit_collection_jobs (
    id integer NOT NULL,
    populated_state character varying(64) NOT NULL
);


ALTER TABLE public.implicit_collection_jobs OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicit_collection_jobs_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE implicit_collection_jobs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implicit_collection_jobs_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicit_collection_jobs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE implicit_collection_jobs_id_seq OWNED BY implicit_collection_jobs.id;


--
-- Name: implicit_collection_jobs_job_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE implicit_collection_jobs_job_association (
    implicit_collection_jobs_id integer,
    id integer NOT NULL,
    job_id integer,
    order_index integer NOT NULL
);


ALTER TABLE public.implicit_collection_jobs_job_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicit_collection_jobs_job_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE implicit_collection_jobs_job_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implicit_collection_jobs_job_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicit_collection_jobs_job_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE implicit_collection_jobs_job_association_id_seq OWNED BY implicit_collection_jobs_job_association.id;


--
-- Name: implicitly_converted_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE implicitly_converted_dataset_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    hda_id integer,
    hda_parent_id integer,
    deleted boolean,
    metadata_safe boolean,
    type character varying(255),
    ldda_parent_id integer,
    ldda_id integer
);


ALTER TABLE public.implicitly_converted_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicitly_converted_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE implicitly_converted_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implicitly_converted_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicitly_converted_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE implicitly_converted_dataset_association_id_seq OWNED BY implicitly_converted_dataset_association.id;


--
-- Name: implicitly_created_dataset_collection_inputs; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE implicitly_created_dataset_collection_inputs (
    id integer NOT NULL,
    dataset_collection_id integer,
    input_dataset_collection_id integer,
    name character varying(255)
);


ALTER TABLE public.implicitly_created_dataset_collection_inputs OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicitly_created_dataset_collection_inputs_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE implicitly_created_dataset_collection_inputs_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.implicitly_created_dataset_collection_inputs_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: implicitly_created_dataset_collection_inputs_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE implicitly_created_dataset_collection_inputs_id_seq OWNED BY implicitly_created_dataset_collection_inputs.id;


--
-- Name: job; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    history_id integer,
    tool_id character varying(255),
    tool_version text,
    state character varying(64),
    info character varying(255),
    command_line text,
    param_filename character varying(1024),
    runner_name character varying(255),
    tool_stdout text,
    tool_stderr text,
    traceback text,
    session_id integer,
    job_runner_name character varying(255),
    job_runner_external_id character varying(255),
    library_folder_id integer,
    user_id integer,
    imported boolean,
    object_store_id character varying(255),
    params character varying(255),
    handler character varying(255),
    exit_code integer,
    destination_id character varying(255),
    destination_params bytea,
    dependencies bytea,
    copied_from_job_id integer,
    job_messages bytea,
    job_stdout text,
    job_stderr text,
    dynamic_tool_id integer
);


ALTER TABLE public.job OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_export_history_archive; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_export_history_archive (
    id integer NOT NULL,
    job_id integer,
    history_id integer,
    dataset_id integer,
    compressed boolean,
    history_attrs_filename text,
    datasets_attrs_filename text,
    jobs_attrs_filename text
);


ALTER TABLE public.job_export_history_archive OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_export_history_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_export_history_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_export_history_archive_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_export_history_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_export_history_archive_id_seq OWNED BY job_export_history_archive.id;


--
-- Name: job_external_output_metadata; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_external_output_metadata (
    id integer NOT NULL,
    job_id integer,
    history_dataset_association_id integer,
    library_dataset_dataset_association_id integer,
    filename_in character varying(255),
    filename_out character varying(255),
    filename_results_code character varying(255),
    filename_kwds character varying(255),
    job_runner_external_pid character varying(255),
    filename_override_metadata character varying(255),
    is_valid boolean
);


ALTER TABLE public.job_external_output_metadata OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_external_output_metadata_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_external_output_metadata_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_external_output_metadata_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_external_output_metadata_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_external_output_metadata_id_seq OWNED BY job_external_output_metadata.id;


--
-- Name: job_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_id_seq OWNED BY job.id;


--
-- Name: job_import_history_archive; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_import_history_archive (
    id integer NOT NULL,
    job_id integer,
    history_id integer,
    archive_dir text
);


ALTER TABLE public.job_import_history_archive OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_import_history_archive_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_import_history_archive_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_import_history_archive_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_import_history_archive_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_import_history_archive_id_seq OWNED BY job_import_history_archive.id;


--
-- Name: job_metric_numeric; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_metric_numeric (
    id integer NOT NULL,
    job_id integer,
    plugin character varying(255),
    metric_name character varying(255),
    metric_value numeric(26,7)
);


ALTER TABLE public.job_metric_numeric OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_metric_numeric_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_metric_numeric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_metric_numeric_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_metric_numeric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_metric_numeric_id_seq OWNED BY job_metric_numeric.id;


--
-- Name: job_metric_text; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_metric_text (
    id integer NOT NULL,
    job_id integer,
    plugin character varying(255),
    metric_name character varying(255),
    metric_value character varying(1023)
);


ALTER TABLE public.job_metric_text OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_metric_text_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_metric_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_metric_text_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_metric_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_metric_text_id_seq OWNED BY job_metric_text.id;


--
-- Name: job_parameter; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_parameter (
    id integer NOT NULL,
    job_id integer,
    name character varying(255),
    value text
);


ALTER TABLE public.job_parameter OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_parameter_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_parameter_id_seq OWNED BY job_parameter.id;


--
-- Name: job_state_history; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_state_history (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    job_id integer,
    state character varying(64),
    info character varying(255)
);


ALTER TABLE public.job_state_history OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_state_history_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_state_history_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_state_history_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_state_history_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_state_history_id_seq OWNED BY job_state_history.id;


--
-- Name: job_to_implicit_output_dataset_collection; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_implicit_output_dataset_collection (
    id integer NOT NULL,
    job_id integer,
    dataset_collection_id integer,
    name character varying(255)
);


ALTER TABLE public.job_to_implicit_output_dataset_collection OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_implicit_output_dataset_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_implicit_output_dataset_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_implicit_output_dataset_collection_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_implicit_output_dataset_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_implicit_output_dataset_collection_id_seq OWNED BY job_to_implicit_output_dataset_collection.id;


--
-- Name: job_to_input_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_input_dataset (
    id integer NOT NULL,
    job_id integer,
    dataset_id integer,
    name character varying(255),
    dataset_version integer
);


ALTER TABLE public.job_to_input_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_input_dataset_collection; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_input_dataset_collection (
    id integer NOT NULL,
    job_id integer,
    dataset_collection_id integer,
    name character varying(255)
);


ALTER TABLE public.job_to_input_dataset_collection OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_input_dataset_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_input_dataset_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_input_dataset_collection_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_input_dataset_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_input_dataset_collection_id_seq OWNED BY job_to_input_dataset_collection.id;


--
-- Name: job_to_input_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_input_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_input_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_input_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_input_dataset_id_seq OWNED BY job_to_input_dataset.id;


--
-- Name: job_to_input_library_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_input_library_dataset (
    id integer NOT NULL,
    job_id integer,
    ldda_id integer,
    name character varying(255)
);


ALTER TABLE public.job_to_input_library_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_input_library_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_input_library_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_input_library_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_input_library_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_input_library_dataset_id_seq OWNED BY job_to_input_library_dataset.id;


--
-- Name: job_to_output_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_output_dataset (
    id integer NOT NULL,
    job_id integer,
    dataset_id integer,
    name character varying(255)
);


ALTER TABLE public.job_to_output_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_output_dataset_collection; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_output_dataset_collection (
    id integer NOT NULL,
    job_id integer,
    dataset_collection_id integer,
    name character varying(255)
);


ALTER TABLE public.job_to_output_dataset_collection OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_output_dataset_collection_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_output_dataset_collection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_output_dataset_collection_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_output_dataset_collection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_output_dataset_collection_id_seq OWNED BY job_to_output_dataset_collection.id;


--
-- Name: job_to_output_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_output_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_output_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_output_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_output_dataset_id_seq OWNED BY job_to_output_dataset.id;


--
-- Name: job_to_output_library_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE job_to_output_library_dataset (
    id integer NOT NULL,
    job_id integer,
    ldda_id integer,
    name character varying(255)
);


ALTER TABLE public.job_to_output_library_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_output_library_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE job_to_output_library_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.job_to_output_library_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: job_to_output_library_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE job_to_output_library_dataset_id_seq OWNED BY job_to_output_library_dataset.id;


--
-- Name: library; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library (
    id integer NOT NULL,
    root_folder_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255),
    deleted boolean,
    purged boolean,
    description text,
    synopsis text
);


ALTER TABLE public.library OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset (
    id integer NOT NULL,
    library_dataset_dataset_association_id integer,
    folder_id integer,
    order_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255),
    info character varying(255),
    deleted boolean,
    purged boolean
);


ALTER TABLE public.library_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_collection_annotation_association (
    id integer NOT NULL,
    library_dataset_collection_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.library_dataset_collection_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_collection_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_collection_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_collection_annotation_association_id_seq OWNED BY library_dataset_collection_annotation_association.id;


--
-- Name: library_dataset_collection_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_collection_association (
    id integer NOT NULL,
    collection_id integer,
    name character varying(255),
    deleted boolean,
    folder_id integer
);


ALTER TABLE public.library_dataset_collection_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_collection_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_collection_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_collection_association_id_seq OWNED BY library_dataset_collection_association.id;


--
-- Name: library_dataset_collection_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_collection_rating_association (
    id integer NOT NULL,
    library_dataset_collection_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.library_dataset_collection_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_collection_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_collection_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_collection_rating_association_id_seq OWNED BY library_dataset_collection_rating_association.id;


--
-- Name: library_dataset_collection_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_collection_tag_association (
    id integer NOT NULL,
    library_dataset_collection_id integer,
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.library_dataset_collection_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_collection_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_collection_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_collection_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_collection_tag_association_id_seq OWNED BY library_dataset_collection_tag_association.id;


--
-- Name: library_dataset_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_dataset_association (
    id integer NOT NULL,
    library_dataset_id integer,
    dataset_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    copied_from_history_dataset_association_id integer,
    copied_from_library_dataset_dataset_association_id integer,
    name character varying(255),
    info character varying(255),
    blurb character varying(255),
    peek text,
    extension character varying(64),
    metadata bytea,
    parent_id integer,
    designation character varying(255),
    deleted boolean,
    visible boolean,
    user_id integer,
    message character varying(255),
    state character varying(64),
    tool_version text,
    extended_metadata_id integer
);


ALTER TABLE public.library_dataset_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_dataset_association_id_seq OWNED BY library_dataset_dataset_association.id;


--
-- Name: library_dataset_dataset_association_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_dataset_association_permissions (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    action text,
    library_dataset_dataset_association_id integer,
    role_id integer
);


ALTER TABLE public.library_dataset_dataset_association_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_association_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_dataset_association_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_dataset_association_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_association_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_dataset_association_permissions_id_seq OWNED BY library_dataset_dataset_association_permissions.id;


--
-- Name: library_dataset_dataset_association_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_dataset_association_tag_association (
    id integer NOT NULL,
    library_dataset_dataset_association_id integer,
    tag_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255),
    user_id integer
);


ALTER TABLE public.library_dataset_dataset_association_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_association_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_dataset_association_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_dataset_association_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_association_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_dataset_association_tag_association_id_seq OWNED BY library_dataset_dataset_association_tag_association.id;


--
-- Name: library_dataset_dataset_info_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_dataset_info_association (
    id integer NOT NULL,
    library_dataset_dataset_association_id integer,
    form_definition_id integer,
    form_values_id integer,
    deleted boolean
);


ALTER TABLE public.library_dataset_dataset_info_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_info_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_dataset_info_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_dataset_info_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_dataset_info_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_dataset_info_association_id_seq OWNED BY library_dataset_dataset_info_association.id;


--
-- Name: library_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_id_seq OWNED BY library_dataset.id;


--
-- Name: library_dataset_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_dataset_permissions (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    action text,
    library_dataset_id integer,
    role_id integer
);


ALTER TABLE public.library_dataset_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_dataset_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_dataset_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_dataset_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_dataset_permissions_id_seq OWNED BY library_dataset_permissions.id;


--
-- Name: library_folder; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_folder (
    id integer NOT NULL,
    parent_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name text,
    description text,
    order_id integer,
    item_count integer,
    deleted boolean,
    purged boolean,
    genome_build character varying(40)
);


ALTER TABLE public.library_folder OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_folder_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_folder_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_folder_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_folder_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_folder_id_seq OWNED BY library_folder.id;


--
-- Name: library_folder_info_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_folder_info_association (
    id integer NOT NULL,
    library_folder_id integer,
    form_definition_id integer,
    form_values_id integer,
    deleted boolean,
    inheritable boolean
);


ALTER TABLE public.library_folder_info_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_folder_info_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_folder_info_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_folder_info_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_folder_info_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_folder_info_association_id_seq OWNED BY library_folder_info_association.id;


--
-- Name: library_folder_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_folder_permissions (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    action text,
    library_folder_id integer,
    role_id integer
);


ALTER TABLE public.library_folder_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_folder_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_folder_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_folder_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_folder_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_folder_permissions_id_seq OWNED BY library_folder_permissions.id;


--
-- Name: library_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_id_seq OWNED BY library.id;


--
-- Name: library_info_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_info_association (
    id integer NOT NULL,
    library_id integer,
    form_definition_id integer,
    form_values_id integer,
    deleted boolean,
    inheritable boolean
);


ALTER TABLE public.library_info_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_info_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_info_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_info_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_info_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_info_association_id_seq OWNED BY library_info_association.id;


--
-- Name: library_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE library_permissions (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    action text,
    library_id integer,
    role_id integer
);


ALTER TABLE public.library_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE library_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.library_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: library_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE library_permissions_id_seq OWNED BY library_permissions.id;


--
-- Name: metadata_file; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE metadata_file (
    id integer NOT NULL,
    name text,
    hda_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    deleted boolean,
    purged boolean,
    lda_id integer,
    object_store_id character varying(255),
    uuid character(32)
);


ALTER TABLE public.metadata_file OWNER TO "__GALAXY_DB_USER__";

--
-- Name: metadata_file_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE metadata_file_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.metadata_file_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: metadata_file_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE metadata_file_id_seq OWNED BY metadata_file.id;


--
-- Name: migrate_tools; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE migrate_tools (
    repository_id character varying(255),
    repository_path text,
    version integer
);


ALTER TABLE public.migrate_tools OWNER TO "__GALAXY_DB_USER__";

--
-- Name: migrate_version; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE migrate_version (
    repository_id character varying(250) NOT NULL,
    repository_path text,
    version integer
);


ALTER TABLE public.migrate_version OWNER TO "__GALAXY_DB_USER__";

--
-- Name: oidc_user_authnz_tokens; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE oidc_user_authnz_tokens (
    id integer NOT NULL,
    user_id integer,
    uid character varying(255),
    provider character varying(32),
    extra_data bytea,
    lifetime integer,
    assoc_type character varying(64)
);


ALTER TABLE public.oidc_user_authnz_tokens OWNER TO "__GALAXY_DB_USER__";

--
-- Name: oidc_user_authnz_tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE oidc_user_authnz_tokens_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.oidc_user_authnz_tokens_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: oidc_user_authnz_tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE oidc_user_authnz_tokens_id_seq OWNED BY oidc_user_authnz_tokens.id;


--
-- Name: page; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE page (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    user_id integer NOT NULL,
    latest_revision_id integer,
    title text,
    slug text,
    published boolean,
    deleted boolean,
    importable boolean
);


ALTER TABLE public.page OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE page_annotation_association (
    id integer NOT NULL,
    page_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.page_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE page_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE page_annotation_association_id_seq OWNED BY page_annotation_association.id;


--
-- Name: page_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE page_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE page_id_seq OWNED BY page.id;


--
-- Name: page_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE page_rating_association (
    id integer NOT NULL,
    page_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.page_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE page_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE page_rating_association_id_seq OWNED BY page_rating_association.id;


--
-- Name: page_revision; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE page_revision (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    page_id integer NOT NULL,
    title text,
    content text
);


ALTER TABLE public.page_revision OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE page_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_revision_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE page_revision_id_seq OWNED BY page_revision.id;


--
-- Name: page_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE page_tag_association (
    id integer NOT NULL,
    page_id integer,
    tag_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255),
    user_id integer
);


ALTER TABLE public.page_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE page_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE page_tag_association_id_seq OWNED BY page_tag_association.id;


--
-- Name: page_user_share_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE page_user_share_association (
    id integer NOT NULL,
    page_id integer,
    user_id integer
);


ALTER TABLE public.page_user_share_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_user_share_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE page_user_share_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.page_user_share_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: page_user_share_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE page_user_share_association_id_seq OWNED BY page_user_share_association.id;


--
-- Name: password_reset_token; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE password_reset_token (
    token character varying(32) NOT NULL,
    expiration_time timestamp without time zone,
    user_id integer
);


ALTER TABLE public.password_reset_token OWNER TO "__GALAXY_DB_USER__";

--
-- Name: post_job_action; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE post_job_action (
    id integer NOT NULL,
    workflow_step_id integer NOT NULL,
    action_type character varying(255) NOT NULL,
    output_name character varying(255),
    action_arguments bytea
);


ALTER TABLE public.post_job_action OWNER TO "__GALAXY_DB_USER__";

--
-- Name: post_job_action_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE post_job_action_association (
    id integer NOT NULL,
    post_job_action_id integer NOT NULL,
    job_id integer NOT NULL
);


ALTER TABLE public.post_job_action_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: post_job_action_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE post_job_action_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_job_action_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: post_job_action_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE post_job_action_association_id_seq OWNED BY post_job_action_association.id;


--
-- Name: post_job_action_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE post_job_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.post_job_action_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: post_job_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE post_job_action_id_seq OWNED BY post_job_action.id;


--
-- Name: psa_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE psa_association (
    id integer NOT NULL,
    server_url character varying(255),
    handle character varying(255),
    secret character varying(255),
    issued integer,
    lifetime integer,
    assoc_type character varying(64)
);


ALTER TABLE public.psa_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE psa_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.psa_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE psa_association_id_seq OWNED BY psa_association.id;


--
-- Name: psa_code; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE psa_code (
    id integer NOT NULL,
    email character varying(200),
    code character varying(32)
);


ALTER TABLE public.psa_code OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_code_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE psa_code_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.psa_code_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_code_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE psa_code_id_seq OWNED BY psa_code.id;


--
-- Name: psa_nonce; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE psa_nonce (
    id integer NOT NULL,
    server_url character varying(255),
    "timestamp" integer,
    salt character varying(40)
);


ALTER TABLE public.psa_nonce OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_nonce_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE psa_nonce_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.psa_nonce_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_nonce_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE psa_nonce_id_seq OWNED BY psa_nonce.id;


--
-- Name: psa_partial; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE psa_partial (
    id integer NOT NULL,
    token character varying(32),
    data text,
    next_step integer,
    backend character varying(32)
);


ALTER TABLE public.psa_partial OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_partial_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE psa_partial_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.psa_partial_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: psa_partial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE psa_partial_id_seq OWNED BY psa_partial.id;


--
-- Name: quota; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE quota (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255),
    description text,
    bytes bigint,
    operation character varying(8),
    deleted boolean
);


ALTER TABLE public.quota OWNER TO "__GALAXY_DB_USER__";

--
-- Name: quota_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE quota_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.quota_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: quota_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE quota_id_seq OWNED BY quota.id;


--
-- Name: repository_dependency; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE repository_dependency (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    tool_shed_repository_id integer NOT NULL
);


ALTER TABLE public.repository_dependency OWNER TO "__GALAXY_DB_USER__";

--
-- Name: repository_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE repository_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_dependency_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: repository_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE repository_dependency_id_seq OWNED BY repository_dependency.id;


--
-- Name: repository_repository_dependency_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE repository_repository_dependency_association (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    tool_shed_repository_id integer,
    repository_dependency_id integer
);


ALTER TABLE public.repository_repository_dependency_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: repository_repository_dependency_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE repository_repository_dependency_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.repository_repository_dependency_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: repository_repository_dependency_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE repository_repository_dependency_association_id_seq OWNED BY repository_repository_dependency_association.id;


--
-- Name: request; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE request (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255) NOT NULL,
    "desc" text,
    form_values_id integer,
    request_type_id integer,
    user_id integer,
    deleted boolean,
    notification bytea
);


ALTER TABLE public.request OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_event; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE request_event (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    request_id integer,
    state character varying(255),
    comment text
);


ALTER TABLE public.request_event OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_event_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE request_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_event_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE request_event_id_seq OWNED BY request_event.id;


--
-- Name: request_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE request_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE request_id_seq OWNED BY request.id;


--
-- Name: request_type; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE request_type (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255) NOT NULL,
    "desc" text,
    request_form_id integer,
    sample_form_id integer,
    deleted boolean
);


ALTER TABLE public.request_type OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_external_service_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE request_type_external_service_association (
    id integer NOT NULL,
    request_type_id integer,
    external_service_id integer
);


ALTER TABLE public.request_type_external_service_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_external_service_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE request_type_external_service_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_type_external_service_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_external_service_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE request_type_external_service_association_id_seq OWNED BY request_type_external_service_association.id;


--
-- Name: request_type_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE request_type_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_type_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE request_type_id_seq OWNED BY request_type.id;


--
-- Name: request_type_permissions; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE request_type_permissions (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    action text,
    request_type_id integer,
    role_id integer
);


ALTER TABLE public.request_type_permissions OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE request_type_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_type_permissions_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE request_type_permissions_id_seq OWNED BY request_type_permissions.id;


--
-- Name: request_type_run_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE request_type_run_association (
    id integer NOT NULL,
    request_type_id integer NOT NULL,
    run_id integer NOT NULL
);


ALTER TABLE public.request_type_run_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_run_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE request_type_run_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.request_type_run_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: request_type_run_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE request_type_run_association_id_seq OWNED BY request_type_run_association.id;


--
-- Name: role; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE role (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255),
    description text,
    type character varying(40),
    deleted boolean
);


ALTER TABLE public.role OWNER TO "__GALAXY_DB_USER__";

--
-- Name: role_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.role_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE role_id_seq OWNED BY role.id;


--
-- Name: run; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE run (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    form_definition_id integer,
    form_values_id integer,
    deleted boolean,
    subindex character varying(255)
);


ALTER TABLE public.run OWNER TO "__GALAXY_DB_USER__";

--
-- Name: run_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE run_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.run_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: run_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE run_id_seq OWNED BY run.id;


--
-- Name: sample; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE sample (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255) NOT NULL,
    "desc" text,
    form_values_id integer,
    request_id integer,
    deleted boolean,
    bar_code character varying(255),
    library_id integer,
    folder_id integer,
    workflow bytea,
    history_id integer
);


ALTER TABLE public.sample OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE sample_dataset (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    sample_id integer,
    name character varying(255) NOT NULL,
    status character varying(255) NOT NULL,
    error_msg text,
    size character varying(255),
    file_path text,
    external_service_id integer
);


ALTER TABLE public.sample_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE sample_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE sample_dataset_id_seq OWNED BY sample_dataset.id;


--
-- Name: sample_event; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE sample_event (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    sample_id integer,
    sample_state_id integer,
    comment text
);


ALTER TABLE public.sample_event OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_event_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE sample_event_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_event_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE sample_event_id_seq OWNED BY sample_event.id;


--
-- Name: sample_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE sample_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE sample_id_seq OWNED BY sample.id;


--
-- Name: sample_run_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE sample_run_association (
    id integer NOT NULL,
    sample_id integer NOT NULL,
    run_id integer NOT NULL
);


ALTER TABLE public.sample_run_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_run_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE sample_run_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_run_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_run_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE sample_run_association_id_seq OWNED BY sample_run_association.id;


--
-- Name: sample_state; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE sample_state (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    name character varying(255) NOT NULL,
    "desc" text,
    request_type_id integer
);


ALTER TABLE public.sample_state OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_state_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE sample_state_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sample_state_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: sample_state_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE sample_state_id_seq OWNED BY sample_state.id;


--
-- Name: stored_workflow; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE stored_workflow (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    user_id integer NOT NULL,
    latest_workflow_id integer,
    name text,
    deleted boolean,
    importable boolean,
    slug text,
    published boolean,
    from_path text
);


ALTER TABLE public.stored_workflow OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE stored_workflow_annotation_association (
    id integer NOT NULL,
    stored_workflow_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.stored_workflow_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE stored_workflow_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_workflow_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE stored_workflow_annotation_association_id_seq OWNED BY stored_workflow_annotation_association.id;


--
-- Name: stored_workflow_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE stored_workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_workflow_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE stored_workflow_id_seq OWNED BY stored_workflow.id;


--
-- Name: stored_workflow_menu_entry; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE stored_workflow_menu_entry (
    id integer NOT NULL,
    stored_workflow_id integer,
    user_id integer,
    order_index integer
);


ALTER TABLE public.stored_workflow_menu_entry OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_menu_entry_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE stored_workflow_menu_entry_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_workflow_menu_entry_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_menu_entry_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE stored_workflow_menu_entry_id_seq OWNED BY stored_workflow_menu_entry.id;


--
-- Name: stored_workflow_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE stored_workflow_rating_association (
    id integer NOT NULL,
    stored_workflow_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.stored_workflow_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE stored_workflow_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_workflow_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE stored_workflow_rating_association_id_seq OWNED BY stored_workflow_rating_association.id;


--
-- Name: stored_workflow_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE stored_workflow_tag_association (
    id integer NOT NULL,
    stored_workflow_id integer,
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.stored_workflow_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE stored_workflow_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_workflow_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE stored_workflow_tag_association_id_seq OWNED BY stored_workflow_tag_association.id;


--
-- Name: stored_workflow_user_share_connection; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE stored_workflow_user_share_connection (
    id integer NOT NULL,
    stored_workflow_id integer,
    user_id integer
);


ALTER TABLE public.stored_workflow_user_share_connection OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_user_share_connection_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE stored_workflow_user_share_connection_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.stored_workflow_user_share_connection_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: stored_workflow_user_share_connection_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE stored_workflow_user_share_connection_id_seq OWNED BY stored_workflow_user_share_connection.id;


--
-- Name: tag; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE tag (
    id integer NOT NULL,
    type integer,
    parent_id integer,
    name character varying(255)
);


ALTER TABLE public.tag OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tag_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE tag_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tag_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE tag_id_seq OWNED BY tag.id;


--
-- Name: task; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE task (
    id integer NOT NULL,
    create_time timestamp without time zone,
    execution_time timestamp without time zone,
    update_time timestamp without time zone,
    state character varying(64),
    command_line text,
    param_filename character varying(1024),
    runner_name character varying(255),
    tool_stdout text,
    tool_stderr text,
    traceback text,
    job_id integer NOT NULL,
    task_runner_name character varying(255),
    task_runner_external_id character varying(255),
    prepare_input_files_cmd text,
    working_directory character varying(1024),
    info character varying(255),
    exit_code integer,
    job_messages bytea,
    job_stdout text,
    job_stderr text
);


ALTER TABLE public.task OWNER TO "__GALAXY_DB_USER__";

--
-- Name: task_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE task_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: task_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE task_id_seq OWNED BY task.id;


--
-- Name: task_metric_numeric; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE task_metric_numeric (
    id integer NOT NULL,
    task_id integer,
    plugin character varying(255),
    metric_name character varying(255),
    metric_value numeric(26,7)
);


ALTER TABLE public.task_metric_numeric OWNER TO "__GALAXY_DB_USER__";

--
-- Name: task_metric_numeric_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE task_metric_numeric_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_metric_numeric_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: task_metric_numeric_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE task_metric_numeric_id_seq OWNED BY task_metric_numeric.id;


--
-- Name: task_metric_text; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE task_metric_text (
    id integer NOT NULL,
    task_id integer,
    plugin character varying(255),
    metric_name character varying(255),
    metric_value character varying(1023)
);


ALTER TABLE public.task_metric_text OWNER TO "__GALAXY_DB_USER__";

--
-- Name: task_metric_text_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE task_metric_text_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.task_metric_text_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: task_metric_text_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE task_metric_text_id_seq OWNED BY task_metric_text.id;


--
-- Name: tool_dependency; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE tool_dependency (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    tool_shed_repository_id integer NOT NULL,
    name character varying(255),
    version text,
    type character varying(40),
    status character varying(255) NOT NULL,
    error_message text
);


ALTER TABLE public.tool_dependency OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_dependency_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE tool_dependency_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_dependency_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_dependency_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE tool_dependency_id_seq OWNED BY tool_dependency.id;


--
-- Name: tool_shed_repository; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE tool_shed_repository (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    tool_shed character varying(255),
    name character varying(255),
    description text,
    owner character varying(255),
    changeset_revision character varying(255),
    deleted boolean,
    metadata bytea,
    includes_datatypes boolean,
    installed_changeset_revision character varying(255),
    uninstalled boolean,
    dist_to_shed boolean,
    ctx_rev character varying(10),
    status character varying(255),
    error_message text,
    tool_shed_status bytea
);


ALTER TABLE public.tool_shed_repository OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_shed_repository_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE tool_shed_repository_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_shed_repository_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_shed_repository_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE tool_shed_repository_id_seq OWNED BY tool_shed_repository.id;


--
-- Name: tool_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE tool_tag_association (
    id integer NOT NULL,
    tool_id character varying(255),
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.tool_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE tool_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE tool_tag_association_id_seq OWNED BY tool_tag_association.id;


--
-- Name: tool_version; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE tool_version (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    tool_id character varying(255),
    tool_shed_repository_id integer
);


ALTER TABLE public.tool_version OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_version_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE tool_version_association (
    id integer NOT NULL,
    tool_id integer NOT NULL,
    parent_id integer NOT NULL
);


ALTER TABLE public.tool_version_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_version_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE tool_version_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_version_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_version_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE tool_version_association_id_seq OWNED BY tool_version_association.id;


--
-- Name: tool_version_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE tool_version_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tool_version_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: tool_version_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE tool_version_id_seq OWNED BY tool_version.id;


--
-- Name: transfer_job; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE transfer_job (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    state character varying(64),
    path character varying(1024),
    params bytea,
    info text,
    pid integer,
    socket integer
);


ALTER TABLE public.transfer_job OWNER TO "__GALAXY_DB_USER__";

--
-- Name: transfer_job_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE transfer_job_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.transfer_job_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: transfer_job_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE transfer_job_id_seq OWNED BY transfer_job.id;


--
-- Name: user_action; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE user_action (
    id integer NOT NULL,
    create_time timestamp without time zone,
    user_id integer,
    session_id integer,
    action character varying(255),
    context character varying(512),
    params character varying(1024)
);


ALTER TABLE public.user_action OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_action_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE user_action_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_action_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_action_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE user_action_id_seq OWNED BY user_action.id;


--
-- Name: user_address; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE user_address (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    user_id integer,
    "desc" text,
    name character varying(255) NOT NULL,
    institution character varying(255),
    address character varying(255) NOT NULL,
    city character varying(255) NOT NULL,
    state character varying(255) NOT NULL,
    postal_code character varying(255) NOT NULL,
    country character varying(255) NOT NULL,
    phone character varying(255),
    deleted boolean,
    purged boolean
);


ALTER TABLE public.user_address OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_address_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE user_address_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_address_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_address_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE user_address_id_seq OWNED BY user_address.id;


--
-- Name: user_group_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE user_group_association (
    id integer NOT NULL,
    user_id integer,
    group_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.user_group_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_group_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE user_group_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_group_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_group_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE user_group_association_id_seq OWNED BY user_group_association.id;


--
-- Name: user_preference; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE user_preference (
    id integer NOT NULL,
    user_id integer,
    name character varying(255),
    value text
);


ALTER TABLE public.user_preference OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_preference_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE user_preference_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_preference_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_preference_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE user_preference_id_seq OWNED BY user_preference.id;


--
-- Name: user_quota_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE user_quota_association (
    id integer NOT NULL,
    user_id integer,
    quota_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.user_quota_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_quota_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE user_quota_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_quota_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_quota_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE user_quota_association_id_seq OWNED BY user_quota_association.id;


--
-- Name: user_role_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE user_role_association (
    id integer NOT NULL,
    user_id integer,
    role_id integer,
    create_time timestamp without time zone,
    update_time timestamp without time zone
);


ALTER TABLE public.user_role_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_role_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE user_role_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_role_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: user_role_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE user_role_association_id_seq OWNED BY user_role_association.id;


--
-- Name: validation_error; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE validation_error (
    id integer NOT NULL,
    dataset_id integer,
    message character varying(255),
    err_type character varying(64),
    attributes text
);


ALTER TABLE public.validation_error OWNER TO "__GALAXY_DB_USER__";

--
-- Name: validation_error_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE validation_error_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.validation_error_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: validation_error_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE validation_error_id_seq OWNED BY validation_error.id;


--
-- Name: visualization; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE visualization (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    user_id integer NOT NULL,
    latest_revision_id integer,
    title text,
    type text,
    deleted boolean,
    importable boolean,
    slug text,
    published boolean,
    dbkey text
);


ALTER TABLE public.visualization OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE visualization_annotation_association (
    id integer NOT NULL,
    visualization_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.visualization_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE visualization_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visualization_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE visualization_annotation_association_id_seq OWNED BY visualization_annotation_association.id;


--
-- Name: visualization_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE visualization_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visualization_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE visualization_id_seq OWNED BY visualization.id;


--
-- Name: visualization_rating_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE visualization_rating_association (
    id integer NOT NULL,
    visualization_id integer,
    user_id integer,
    rating integer
);


ALTER TABLE public.visualization_rating_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_rating_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE visualization_rating_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visualization_rating_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_rating_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE visualization_rating_association_id_seq OWNED BY visualization_rating_association.id;


--
-- Name: visualization_revision; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE visualization_revision (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    visualization_id integer NOT NULL,
    title text,
    config text,
    dbkey text
);


ALTER TABLE public.visualization_revision OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_revision_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE visualization_revision_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visualization_revision_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_revision_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE visualization_revision_id_seq OWNED BY visualization_revision.id;


--
-- Name: visualization_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE visualization_tag_association (
    id integer NOT NULL,
    visualization_id integer,
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.visualization_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE visualization_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visualization_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE visualization_tag_association_id_seq OWNED BY visualization_tag_association.id;


--
-- Name: visualization_user_share_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE visualization_user_share_association (
    id integer NOT NULL,
    visualization_id integer,
    user_id integer
);


ALTER TABLE public.visualization_user_share_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_user_share_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE visualization_user_share_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.visualization_user_share_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: visualization_user_share_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE visualization_user_share_association_id_seq OWNED BY visualization_user_share_association.id;


--
-- Name: worker_process; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE worker_process (
    id integer NOT NULL,
    server_name character varying(255),
    hostname character varying(255),
    update_time timestamp without time zone
);


ALTER TABLE public.worker_process OWNER TO "__GALAXY_DB_USER__";

--
-- Name: worker_process_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE worker_process_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.worker_process_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: worker_process_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE worker_process_id_seq OWNED BY worker_process.id;


--
-- Name: workflow; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    stored_workflow_id integer,
    name text,
    has_cycles boolean,
    has_errors boolean,
    uuid character(32),
    parent_workflow_id integer
);


ALTER TABLE public.workflow OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_id_seq OWNED BY workflow.id;


--
-- Name: workflow_invocation; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    workflow_id integer NOT NULL,
    history_id integer,
    state character varying(64),
    scheduler character varying(255),
    handler character varying(255),
    uuid character(32)
);


ALTER TABLE public.workflow_invocation OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_id_seq OWNED BY workflow_invocation.id;


--
-- Name: workflow_invocation_output_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation_output_dataset_association (
    id integer NOT NULL,
    workflow_invocation_id integer,
    workflow_step_id integer,
    dataset_id integer,
    workflow_output_id integer
);


ALTER TABLE public.workflow_invocation_output_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_output_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_output_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_output_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_output_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_output_dataset_association_id_seq OWNED BY workflow_invocation_output_dataset_association.id;


--
-- Name: workflow_invocation_output_dataset_collection_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation_output_dataset_collection_association (
    id integer NOT NULL,
    workflow_invocation_id integer,
    workflow_step_id integer,
    dataset_collection_id integer,
    workflow_output_id integer
);


ALTER TABLE public.workflow_invocation_output_dataset_collection_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_output_dataset_collection_associatio_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_output_dataset_collection_associatio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_output_dataset_collection_associatio_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_output_dataset_collection_associatio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_output_dataset_collection_associatio_id_seq OWNED BY workflow_invocation_output_dataset_collection_association.id;


--
-- Name: workflow_invocation_step; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation_step (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    workflow_invocation_id integer NOT NULL,
    workflow_step_id integer NOT NULL,
    job_id integer,
    action bytea,
    implicit_collection_jobs_id integer,
    state character varying(64)
);


ALTER TABLE public.workflow_invocation_step OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_step_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_step_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_step_id_seq OWNED BY workflow_invocation_step.id;


--
-- Name: workflow_invocation_step_output_dataset_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation_step_output_dataset_association (
    id integer NOT NULL,
    workflow_invocation_step_id integer,
    dataset_id integer,
    output_name character varying(255)
);


ALTER TABLE public.workflow_invocation_step_output_dataset_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_step_output_dataset_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_step_output_dataset_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_step_output_dataset_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_step_output_dataset_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_step_output_dataset_association_id_seq OWNED BY workflow_invocation_step_output_dataset_association.id;


--
-- Name: workflow_invocation_step_output_dataset_collection_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation_step_output_dataset_collection_association (
    id integer NOT NULL,
    workflow_invocation_step_id integer,
    workflow_step_id integer,
    dataset_collection_id integer,
    output_name character varying(255)
);


ALTER TABLE public.workflow_invocation_step_output_dataset_collection_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_step_output_dataset_collection_assoc_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_step_output_dataset_collection_assoc_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_step_output_dataset_collection_assoc_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_step_output_dataset_collection_assoc_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_step_output_dataset_collection_assoc_id_seq OWNED BY workflow_invocation_step_output_dataset_collection_association.id;


--
-- Name: workflow_invocation_to_subworkflow_invocation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_invocation_to_subworkflow_invocation_association (
    id integer NOT NULL,
    workflow_invocation_id integer,
    subworkflow_invocation_id integer,
    workflow_step_id integer
);


ALTER TABLE public.workflow_invocation_to_subworkflow_invocation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_to_subworkflow_invocation_associatio_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_invocation_to_subworkflow_invocation_associatio_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_invocation_to_subworkflow_invocation_associatio_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_invocation_to_subworkflow_invocation_associatio_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_invocation_to_subworkflow_invocation_associatio_id_seq OWNED BY workflow_invocation_to_subworkflow_invocation_association.id;


--
-- Name: workflow_output; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_output (
    id integer NOT NULL,
    workflow_step_id integer NOT NULL,
    output_name character varying(255),
    label character varying(255),
    uuid character(32)
);


ALTER TABLE public.workflow_output OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_output_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_output_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_output_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_output_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_output_id_seq OWNED BY workflow_output.id;


--
-- Name: workflow_request_input_parameters; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_request_input_parameters (
    id integer NOT NULL,
    workflow_invocation_id integer,
    name character varying(255),
    type character varying(255),
    value text
);


ALTER TABLE public.workflow_request_input_parameters OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_input_parameters_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_request_input_parameters_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_request_input_parameters_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_input_parameters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_request_input_parameters_id_seq OWNED BY workflow_request_input_parameters.id;


--
-- Name: workflow_request_input_step_parameter; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_request_input_step_parameter (
    id integer NOT NULL,
    workflow_invocation_id integer,
    workflow_step_id integer,
    parameter_value bytea
);


ALTER TABLE public.workflow_request_input_step_parameter OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_input_step_parameter_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_request_input_step_parameter_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_request_input_step_parameter_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_input_step_parameter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_request_input_step_parameter_id_seq OWNED BY workflow_request_input_step_parameter.id;


--
-- Name: workflow_request_step_states; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_request_step_states (
    id integer NOT NULL,
    workflow_invocation_id integer,
    workflow_step_id integer,
    value bytea
);


ALTER TABLE public.workflow_request_step_states OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_step_states_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_request_step_states_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_request_step_states_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_step_states_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_request_step_states_id_seq OWNED BY workflow_request_step_states.id;


--
-- Name: workflow_request_to_input_collection_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_request_to_input_collection_dataset (
    id integer NOT NULL,
    name character varying(255),
    workflow_invocation_id integer,
    workflow_step_id integer,
    dataset_collection_id integer
);


ALTER TABLE public.workflow_request_to_input_collection_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_to_input_collection_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_request_to_input_collection_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_request_to_input_collection_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_to_input_collection_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_request_to_input_collection_dataset_id_seq OWNED BY workflow_request_to_input_collection_dataset.id;


--
-- Name: workflow_request_to_input_dataset; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_request_to_input_dataset (
    id integer NOT NULL,
    name character varying(255),
    workflow_invocation_id integer,
    workflow_step_id integer,
    dataset_id integer
);


ALTER TABLE public.workflow_request_to_input_dataset OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_to_input_dataset_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_request_to_input_dataset_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_request_to_input_dataset_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_request_to_input_dataset_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_request_to_input_dataset_id_seq OWNED BY workflow_request_to_input_dataset.id;


--
-- Name: workflow_step; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_step (
    id integer NOT NULL,
    create_time timestamp without time zone,
    update_time timestamp without time zone,
    workflow_id integer NOT NULL,
    type character varying(64),
    tool_id text,
    tool_version text,
    tool_inputs bytea,
    tool_errors bytea,
    "position" bytea,
    config bytea,
    order_index integer,
    label character varying(255),
    uuid character(32),
    subworkflow_id integer,
    dynamic_tool_id integer
);


ALTER TABLE public.workflow_step OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_annotation_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_step_annotation_association (
    id integer NOT NULL,
    workflow_step_id integer,
    user_id integer,
    annotation text
);


ALTER TABLE public.workflow_step_annotation_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_annotation_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_step_annotation_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_step_annotation_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_annotation_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_step_annotation_association_id_seq OWNED BY workflow_step_annotation_association.id;


--
-- Name: workflow_step_connection; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_step_connection (
    id integer NOT NULL,
    output_step_id integer,
    input_step_input_id integer,
    output_name text,
    input_subworkflow_step_id integer
);


ALTER TABLE public.workflow_step_connection OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_connection_id_seq1; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_step_connection_id_seq1
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_step_connection_id_seq1 OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_connection_id_seq1; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_step_connection_id_seq1 OWNED BY workflow_step_connection.id;


--
-- Name: workflow_step_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_step_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_step_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_step_id_seq OWNED BY workflow_step.id;


--
-- Name: workflow_step_input; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_step_input (
    id integer NOT NULL,
    workflow_step_id integer,
    name text,
    merge_type text,
    scatter_type text,
    value_from bytea,
    value_from_type text,
    default_value bytea,
    default_value_set boolean,
    runtime_value boolean
);


ALTER TABLE public.workflow_step_input OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_input_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_step_input_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_step_input_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_input_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_step_input_id_seq OWNED BY workflow_step_input.id;


--
-- Name: workflow_step_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_step_tag_association (
    id integer NOT NULL,
    workflow_step_id integer,
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.workflow_step_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_step_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_step_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_step_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_step_tag_association_id_seq OWNED BY workflow_step_tag_association.id;


--
-- Name: workflow_tag_association; Type: TABLE; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE TABLE workflow_tag_association (
    id integer NOT NULL,
    workflow_id integer,
    tag_id integer,
    user_id integer,
    user_tname character varying(255),
    value character varying(255),
    user_value character varying(255)
);


ALTER TABLE public.workflow_tag_association OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_tag_association_id_seq; Type: SEQUENCE; Schema: public; Owner: __GALAXY_DB_USER__
--

CREATE SEQUENCE workflow_tag_association_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.workflow_tag_association_id_seq OWNER TO "__GALAXY_DB_USER__";

--
-- Name: workflow_tag_association_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER SEQUENCE workflow_tag_association_id_seq OWNED BY workflow_tag_association.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY api_keys ALTER COLUMN id SET DEFAULT nextval('api_keys_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event ALTER COLUMN id SET DEFAULT nextval('cleanup_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_dataset_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_hda_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_hda_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_history_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_history_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_icda_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_icda_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_ldda_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_ldda_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_library_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_dataset_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_library_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_folder_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_library_folder_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_metadata_file_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_metadata_file_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_user_association ALTER COLUMN id SET DEFAULT nextval('cleanup_event_user_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cloudauthz ALTER COLUMN id SET DEFAULT nextval('cloudauthz_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY custos_authnz_token ALTER COLUMN id SET DEFAULT nextval('custos_authnz_token_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY data_manager_history_association ALTER COLUMN id SET DEFAULT nextval('data_manager_history_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY data_manager_job_association ALTER COLUMN id SET DEFAULT nextval('data_manager_job_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset ALTER COLUMN id SET DEFAULT nextval('dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_collection ALTER COLUMN id SET DEFAULT nextval('dataset_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_collection_element ALTER COLUMN id SET DEFAULT nextval('dataset_collection_element_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_hash ALTER COLUMN id SET DEFAULT nextval('dataset_hash_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_permissions ALTER COLUMN id SET DEFAULT nextval('dataset_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_source ALTER COLUMN id SET DEFAULT nextval('dataset_source_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_source_hash ALTER COLUMN id SET DEFAULT nextval('dataset_source_hash_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_tag_association ALTER COLUMN id SET DEFAULT nextval('dataset_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_history_permissions ALTER COLUMN id SET DEFAULT nextval('default_history_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_quota_association ALTER COLUMN id SET DEFAULT nextval('default_quota_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_user_permissions ALTER COLUMN id SET DEFAULT nextval('default_user_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY deferred_job ALTER COLUMN id SET DEFAULT nextval('deferred_job_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dynamic_tool ALTER COLUMN id SET DEFAULT nextval('dynamic_tool_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY event ALTER COLUMN id SET DEFAULT nextval('event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY extended_metadata ALTER COLUMN id SET DEFAULT nextval('extended_metadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY extended_metadata_index ALTER COLUMN id SET DEFAULT nextval('extended_metadata_index_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY external_service ALTER COLUMN id SET DEFAULT nextval('external_service_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY form_definition ALTER COLUMN id SET DEFAULT nextval('form_definition_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY form_definition_current ALTER COLUMN id SET DEFAULT nextval('form_definition_current_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY form_values ALTER COLUMN id SET DEFAULT nextval('form_values_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_group ALTER COLUMN id SET DEFAULT nextval('galaxy_group_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_session ALTER COLUMN id SET DEFAULT nextval('galaxy_session_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_session_to_history ALTER COLUMN id SET DEFAULT nextval('galaxy_session_to_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_user ALTER COLUMN id SET DEFAULT nextval('galaxy_user_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_user_openid ALTER COLUMN id SET DEFAULT nextval('galaxy_user_openid_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY genome_index_tool_data ALTER COLUMN id SET DEFAULT nextval('genome_index_tool_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY group_quota_association ALTER COLUMN id SET DEFAULT nextval('group_quota_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY group_role_association ALTER COLUMN id SET DEFAULT nextval('group_role_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history ALTER COLUMN id SET DEFAULT nextval('history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_annotation_association ALTER COLUMN id SET DEFAULT nextval('history_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_annotation_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_display_at_authorization ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_display_at_authorization_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_history ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_rating_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_subset ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_subset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_tag_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_association_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_annotation_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_collection_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_collection_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_rating_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_collection_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_tag_association ALTER COLUMN id SET DEFAULT nextval('history_dataset_collection_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_rating_association ALTER COLUMN id SET DEFAULT nextval('history_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_tag_association ALTER COLUMN id SET DEFAULT nextval('history_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_user_share_association ALTER COLUMN id SET DEFAULT nextval('history_user_share_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicit_collection_jobs ALTER COLUMN id SET DEFAULT nextval('implicit_collection_jobs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicit_collection_jobs_job_association ALTER COLUMN id SET DEFAULT nextval('implicit_collection_jobs_job_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_converted_dataset_association ALTER COLUMN id SET DEFAULT nextval('implicitly_converted_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_created_dataset_collection_inputs ALTER COLUMN id SET DEFAULT nextval('implicitly_created_dataset_collection_inputs_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job ALTER COLUMN id SET DEFAULT nextval('job_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_export_history_archive ALTER COLUMN id SET DEFAULT nextval('job_export_history_archive_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_external_output_metadata ALTER COLUMN id SET DEFAULT nextval('job_external_output_metadata_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_import_history_archive ALTER COLUMN id SET DEFAULT nextval('job_import_history_archive_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_metric_numeric ALTER COLUMN id SET DEFAULT nextval('job_metric_numeric_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_metric_text ALTER COLUMN id SET DEFAULT nextval('job_metric_text_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_parameter ALTER COLUMN id SET DEFAULT nextval('job_parameter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_state_history ALTER COLUMN id SET DEFAULT nextval('job_state_history_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_implicit_output_dataset_collection ALTER COLUMN id SET DEFAULT nextval('job_to_implicit_output_dataset_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_dataset ALTER COLUMN id SET DEFAULT nextval('job_to_input_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_dataset_collection ALTER COLUMN id SET DEFAULT nextval('job_to_input_dataset_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_library_dataset ALTER COLUMN id SET DEFAULT nextval('job_to_input_library_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_dataset ALTER COLUMN id SET DEFAULT nextval('job_to_output_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_dataset_collection ALTER COLUMN id SET DEFAULT nextval('job_to_output_dataset_collection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_library_dataset ALTER COLUMN id SET DEFAULT nextval('job_to_output_library_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library ALTER COLUMN id SET DEFAULT nextval('library_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset ALTER COLUMN id SET DEFAULT nextval('library_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_annotation_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_collection_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_collection_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_rating_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_collection_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_tag_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_collection_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_permissions ALTER COLUMN id SET DEFAULT nextval('library_dataset_dataset_association_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_tag_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_dataset_association_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_info_association ALTER COLUMN id SET DEFAULT nextval('library_dataset_dataset_info_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_permissions ALTER COLUMN id SET DEFAULT nextval('library_dataset_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder ALTER COLUMN id SET DEFAULT nextval('library_folder_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_info_association ALTER COLUMN id SET DEFAULT nextval('library_folder_info_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_permissions ALTER COLUMN id SET DEFAULT nextval('library_folder_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_info_association ALTER COLUMN id SET DEFAULT nextval('library_info_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_permissions ALTER COLUMN id SET DEFAULT nextval('library_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY metadata_file ALTER COLUMN id SET DEFAULT nextval('metadata_file_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY oidc_user_authnz_tokens ALTER COLUMN id SET DEFAULT nextval('oidc_user_authnz_tokens_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page ALTER COLUMN id SET DEFAULT nextval('page_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_annotation_association ALTER COLUMN id SET DEFAULT nextval('page_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_rating_association ALTER COLUMN id SET DEFAULT nextval('page_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_revision ALTER COLUMN id SET DEFAULT nextval('page_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_tag_association ALTER COLUMN id SET DEFAULT nextval('page_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_user_share_association ALTER COLUMN id SET DEFAULT nextval('page_user_share_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY post_job_action ALTER COLUMN id SET DEFAULT nextval('post_job_action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY post_job_action_association ALTER COLUMN id SET DEFAULT nextval('post_job_action_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY psa_association ALTER COLUMN id SET DEFAULT nextval('psa_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY psa_code ALTER COLUMN id SET DEFAULT nextval('psa_code_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY psa_nonce ALTER COLUMN id SET DEFAULT nextval('psa_nonce_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY psa_partial ALTER COLUMN id SET DEFAULT nextval('psa_partial_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY quota ALTER COLUMN id SET DEFAULT nextval('quota_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY repository_dependency ALTER COLUMN id SET DEFAULT nextval('repository_dependency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY repository_repository_dependency_association ALTER COLUMN id SET DEFAULT nextval('repository_repository_dependency_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request ALTER COLUMN id SET DEFAULT nextval('request_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_event ALTER COLUMN id SET DEFAULT nextval('request_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type ALTER COLUMN id SET DEFAULT nextval('request_type_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_external_service_association ALTER COLUMN id SET DEFAULT nextval('request_type_external_service_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_permissions ALTER COLUMN id SET DEFAULT nextval('request_type_permissions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_run_association ALTER COLUMN id SET DEFAULT nextval('request_type_run_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY role ALTER COLUMN id SET DEFAULT nextval('role_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY run ALTER COLUMN id SET DEFAULT nextval('run_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample ALTER COLUMN id SET DEFAULT nextval('sample_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_dataset ALTER COLUMN id SET DEFAULT nextval('sample_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_event ALTER COLUMN id SET DEFAULT nextval('sample_event_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_run_association ALTER COLUMN id SET DEFAULT nextval('sample_run_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_state ALTER COLUMN id SET DEFAULT nextval('sample_state_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow ALTER COLUMN id SET DEFAULT nextval('stored_workflow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_annotation_association ALTER COLUMN id SET DEFAULT nextval('stored_workflow_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_menu_entry ALTER COLUMN id SET DEFAULT nextval('stored_workflow_menu_entry_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_rating_association ALTER COLUMN id SET DEFAULT nextval('stored_workflow_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_tag_association ALTER COLUMN id SET DEFAULT nextval('stored_workflow_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_user_share_connection ALTER COLUMN id SET DEFAULT nextval('stored_workflow_user_share_connection_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tag ALTER COLUMN id SET DEFAULT nextval('tag_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY task ALTER COLUMN id SET DEFAULT nextval('task_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY task_metric_numeric ALTER COLUMN id SET DEFAULT nextval('task_metric_numeric_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY task_metric_text ALTER COLUMN id SET DEFAULT nextval('task_metric_text_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_dependency ALTER COLUMN id SET DEFAULT nextval('tool_dependency_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_shed_repository ALTER COLUMN id SET DEFAULT nextval('tool_shed_repository_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_tag_association ALTER COLUMN id SET DEFAULT nextval('tool_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_version ALTER COLUMN id SET DEFAULT nextval('tool_version_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_version_association ALTER COLUMN id SET DEFAULT nextval('tool_version_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY transfer_job ALTER COLUMN id SET DEFAULT nextval('transfer_job_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_action ALTER COLUMN id SET DEFAULT nextval('user_action_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_address ALTER COLUMN id SET DEFAULT nextval('user_address_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_group_association ALTER COLUMN id SET DEFAULT nextval('user_group_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_preference ALTER COLUMN id SET DEFAULT nextval('user_preference_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_quota_association ALTER COLUMN id SET DEFAULT nextval('user_quota_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_role_association ALTER COLUMN id SET DEFAULT nextval('user_role_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY validation_error ALTER COLUMN id SET DEFAULT nextval('validation_error_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization ALTER COLUMN id SET DEFAULT nextval('visualization_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_annotation_association ALTER COLUMN id SET DEFAULT nextval('visualization_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_rating_association ALTER COLUMN id SET DEFAULT nextval('visualization_rating_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_revision ALTER COLUMN id SET DEFAULT nextval('visualization_revision_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_tag_association ALTER COLUMN id SET DEFAULT nextval('visualization_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_user_share_association ALTER COLUMN id SET DEFAULT nextval('visualization_user_share_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY worker_process ALTER COLUMN id SET DEFAULT nextval('worker_process_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow ALTER COLUMN id SET DEFAULT nextval('workflow_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_association ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_output_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_collection_association ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_output_dataset_collection_associatio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_step_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_association ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_step_output_dataset_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_collection_association ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_step_output_dataset_collection_assoc_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_to_subworkflow_invocation_association ALTER COLUMN id SET DEFAULT nextval('workflow_invocation_to_subworkflow_invocation_associatio_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_output ALTER COLUMN id SET DEFAULT nextval('workflow_output_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_input_parameters ALTER COLUMN id SET DEFAULT nextval('workflow_request_input_parameters_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_input_step_parameter ALTER COLUMN id SET DEFAULT nextval('workflow_request_input_step_parameter_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_step_states ALTER COLUMN id SET DEFAULT nextval('workflow_request_step_states_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_collection_dataset ALTER COLUMN id SET DEFAULT nextval('workflow_request_to_input_collection_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_dataset ALTER COLUMN id SET DEFAULT nextval('workflow_request_to_input_dataset_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step ALTER COLUMN id SET DEFAULT nextval('workflow_step_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_annotation_association ALTER COLUMN id SET DEFAULT nextval('workflow_step_annotation_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_connection ALTER COLUMN id SET DEFAULT nextval('workflow_step_connection_id_seq1'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_input ALTER COLUMN id SET DEFAULT nextval('workflow_step_input_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_tag_association ALTER COLUMN id SET DEFAULT nextval('workflow_step_tag_association_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_tag_association ALTER COLUMN id SET DEFAULT nextval('workflow_tag_association_id_seq'::regclass);


--
-- Data for Name: api_keys; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY api_keys (id, create_time, user_id, key) FROM stdin;
\.


--
-- Name: api_keys_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('api_keys_id_seq', 1, false);


--
-- Data for Name: cleanup_event; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event (id, create_time, message) FROM stdin;
\.


--
-- Data for Name: cleanup_event_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_dataset_association (id, create_time, cleanup_event_id, dataset_id) FROM stdin;
\.


--
-- Name: cleanup_event_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_dataset_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_hda_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_hda_association (id, create_time, cleanup_event_id, hda_id) FROM stdin;
\.


--
-- Name: cleanup_event_hda_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_hda_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_history_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_history_association (id, create_time, cleanup_event_id, history_id) FROM stdin;
\.


--
-- Name: cleanup_event_history_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_history_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_icda_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_icda_association (id, create_time, cleanup_event_id, icda_id) FROM stdin;
\.


--
-- Name: cleanup_event_icda_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_icda_association_id_seq', 1, false);


--
-- Name: cleanup_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_id_seq', 1, false);


--
-- Data for Name: cleanup_event_ldda_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_ldda_association (id, create_time, cleanup_event_id, ldda_id) FROM stdin;
\.


--
-- Name: cleanup_event_ldda_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_ldda_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_library_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_library_association (id, create_time, cleanup_event_id, library_id) FROM stdin;
\.


--
-- Name: cleanup_event_library_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_library_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_library_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_library_dataset_association (id, create_time, cleanup_event_id, library_dataset_id) FROM stdin;
\.


--
-- Name: cleanup_event_library_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_library_dataset_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_library_folder_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_library_folder_association (id, create_time, cleanup_event_id, library_folder_id) FROM stdin;
\.


--
-- Name: cleanup_event_library_folder_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_library_folder_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_metadata_file_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_metadata_file_association (id, create_time, cleanup_event_id, metadata_file_id) FROM stdin;
\.


--
-- Name: cleanup_event_metadata_file_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_metadata_file_association_id_seq', 1, false);


--
-- Data for Name: cleanup_event_user_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cleanup_event_user_association (id, create_time, cleanup_event_id, user_id) FROM stdin;
\.


--
-- Name: cleanup_event_user_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cleanup_event_user_association_id_seq', 1, false);


--
-- Data for Name: cloudauthz; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY cloudauthz (id, user_id, provider, config, authn_id, tokens, last_update, last_activity, description, create_time) FROM stdin;
\.


--
-- Name: cloudauthz_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('cloudauthz_id_seq', 1, false);


--
-- Data for Name: custos_authnz_token; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY custos_authnz_token (id, user_id, external_user_id, provider, access_token, id_token, refresh_token, expiration_time, refresh_expiration_time) FROM stdin;
\.


--
-- Name: custos_authnz_token_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('custos_authnz_token_id_seq', 1, false);


--
-- Data for Name: data_manager_history_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY data_manager_history_association (id, create_time, update_time, history_id, user_id) FROM stdin;
\.


--
-- Name: data_manager_history_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('data_manager_history_association_id_seq', 1, false);


--
-- Data for Name: data_manager_job_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY data_manager_job_association (id, create_time, update_time, job_id, data_manager_id) FROM stdin;
\.


--
-- Name: data_manager_job_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('data_manager_job_association_id_seq', 1, false);


--
-- Data for Name: dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset (id, create_time, update_time, state, deleted, purged, purgable, external_filename, _extra_files_path, file_size, total_size, object_store_id, uuid) FROM stdin;
\.


--
-- Data for Name: dataset_collection; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_collection (id, collection_type, create_time, update_time, populated_state, populated_state_message, element_count) FROM stdin;
\.


--
-- Data for Name: dataset_collection_element; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_collection_element (id, dataset_collection_id, hda_id, ldda_id, child_collection_id, element_index, element_identifier) FROM stdin;
\.


--
-- Name: dataset_collection_element_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_collection_element_id_seq', 1, false);


--
-- Name: dataset_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_collection_id_seq', 1, false);


--
-- Data for Name: dataset_hash; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_hash (id, dataset_id, hash_function, hash_value, extra_files_path) FROM stdin;
\.


--
-- Name: dataset_hash_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_hash_id_seq', 1, false);


--
-- Name: dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_id_seq', 1, false);


--
-- Data for Name: dataset_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_permissions (id, create_time, update_time, action, dataset_id, role_id) FROM stdin;
\.


--
-- Name: dataset_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_permissions_id_seq', 1, false);


--
-- Data for Name: dataset_source; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_source (id, dataset_id, source_uri, extra_files_path, transform) FROM stdin;
\.


--
-- Data for Name: dataset_source_hash; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_source_hash (id, dataset_source_id, hash_function, hash_value) FROM stdin;
\.


--
-- Name: dataset_source_hash_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_source_hash_id_seq', 1, false);


--
-- Name: dataset_source_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_source_id_seq', 1, false);


--
-- Data for Name: dataset_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dataset_tag_association (id, dataset_id, tag_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: dataset_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dataset_tag_association_id_seq', 1, false);


--
-- Data for Name: default_history_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY default_history_permissions (id, history_id, action, role_id) FROM stdin;
\.


--
-- Name: default_history_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('default_history_permissions_id_seq', 1, false);


--
-- Data for Name: default_quota_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY default_quota_association (id, create_time, update_time, type, quota_id) FROM stdin;
\.


--
-- Name: default_quota_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('default_quota_association_id_seq', 1, false);


--
-- Data for Name: default_user_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY default_user_permissions (id, user_id, action, role_id) FROM stdin;
\.


--
-- Name: default_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('default_user_permissions_id_seq', 1, false);


--
-- Data for Name: deferred_job; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY deferred_job (id, create_time, update_time, state, plugin, params) FROM stdin;
\.


--
-- Name: deferred_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('deferred_job_id_seq', 1, false);


--
-- Data for Name: dynamic_tool; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY dynamic_tool (id, uuid, create_time, update_time, tool_id, tool_version, tool_format, tool_path, tool_directory, hidden, active, value) FROM stdin;
\.


--
-- Name: dynamic_tool_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('dynamic_tool_id_seq', 1, false);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY event (id, create_time, update_time, history_id, user_id, message, session_id, tool_id) FROM stdin;
\.


--
-- Name: event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('event_id_seq', 1, false);


--
-- Data for Name: extended_metadata; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY extended_metadata (id, data) FROM stdin;
\.


--
-- Name: extended_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('extended_metadata_id_seq', 1, false);


--
-- Data for Name: extended_metadata_index; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY extended_metadata_index (id, extended_metadata_id, path, value) FROM stdin;
\.


--
-- Name: extended_metadata_index_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('extended_metadata_index_id_seq', 1, false);


--
-- Data for Name: external_service; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY external_service (id, create_time, update_time, name, description, version, form_definition_id, form_values_id, deleted, external_service_type_id) FROM stdin;
\.


--
-- Name: external_service_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('external_service_id_seq', 1, false);


--
-- Data for Name: form_definition; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY form_definition (id, create_time, update_time, name, "desc", form_definition_current_id, fields, type, layout) FROM stdin;
\.


--
-- Data for Name: form_definition_current; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY form_definition_current (id, create_time, update_time, latest_form_id, deleted) FROM stdin;
\.


--
-- Name: form_definition_current_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('form_definition_current_id_seq', 1, false);


--
-- Name: form_definition_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('form_definition_id_seq', 1, false);


--
-- Data for Name: form_values; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY form_values (id, create_time, update_time, form_definition_id, content) FROM stdin;
\.


--
-- Name: form_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('form_values_id_seq', 1, false);


--
-- Data for Name: galaxy_group; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY galaxy_group (id, create_time, update_time, name, deleted) FROM stdin;
\.


--
-- Name: galaxy_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('galaxy_group_id_seq', 1, false);


--
-- Data for Name: galaxy_session; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY galaxy_session (id, create_time, update_time, user_id, remote_host, remote_addr, referer, current_history_id, session_key, is_valid, prev_session_id, disk_usage, last_action) FROM stdin;
\.


--
-- Name: galaxy_session_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('galaxy_session_id_seq', 1, false);


--
-- Data for Name: galaxy_session_to_history; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY galaxy_session_to_history (id, create_time, session_id, history_id) FROM stdin;
\.


--
-- Name: galaxy_session_to_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('galaxy_session_to_history_id_seq', 1, false);


--
-- Data for Name: galaxy_user; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY galaxy_user (id, create_time, update_time, email, password, external, deleted, purged, username, form_values_id, disk_usage, activation_token, active, last_password_change) FROM stdin;
\.


--
-- Name: galaxy_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('galaxy_user_id_seq', 1, false);


--
-- Data for Name: galaxy_user_openid; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY galaxy_user_openid (id, create_time, update_time, session_id, user_id, openid, provider) FROM stdin;
\.


--
-- Name: galaxy_user_openid_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('galaxy_user_openid_id_seq', 1, false);


--
-- Data for Name: genome_index_tool_data; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY genome_index_tool_data (id, job_id, dataset_id, deferred_job_id, transfer_job_id, fasta_path, created_time, modified_time, indexer, user_id) FROM stdin;
\.


--
-- Name: genome_index_tool_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('genome_index_tool_data_id_seq', 1, false);


--
-- Data for Name: group_quota_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY group_quota_association (id, group_id, quota_id, create_time, update_time) FROM stdin;
\.


--
-- Name: group_quota_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('group_quota_association_id_seq', 1, false);


--
-- Data for Name: group_role_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY group_role_association (id, group_id, role_id, create_time, update_time) FROM stdin;
\.


--
-- Name: group_role_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('group_role_association_id_seq', 1, false);


--
-- Data for Name: history; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history (id, create_time, update_time, user_id, name, hid_counter, deleted, purged, genome_build, importable, slug, published, importing) FROM stdin;
\.


--
-- Data for Name: history_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_annotation_association (id, history_id, user_id, annotation) FROM stdin;
\.


--
-- Name: history_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_annotation_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association (id, history_id, dataset_id, create_time, update_time, copied_from_history_dataset_association_id, hid, name, info, blurb, peek, extension, metadata, parent_id, designation, deleted, visible, copied_from_library_dataset_dataset_association_id, state, purged, tool_version, extended_metadata_id, hidden_beneath_collection_instance_id, version) FROM stdin;
\.


--
-- Data for Name: history_dataset_association_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association_annotation_association (id, history_dataset_association_id, user_id, annotation) FROM stdin;
\.


--
-- Name: history_dataset_association_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_annotation_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_association_display_at_authorization; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association_display_at_authorization (id, create_time, update_time, history_dataset_association_id, user_id, site) FROM stdin;
\.


--
-- Name: history_dataset_association_display_at_authorization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_display_at_authorization_id_seq', 1, false);


--
-- Data for Name: history_dataset_association_history; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association_history (id, history_dataset_association_id, update_time, version, name, extension, metadata, extended_metadata_id) FROM stdin;
\.


--
-- Name: history_dataset_association_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_history_id_seq', 1, false);


--
-- Name: history_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_association_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association_rating_association (id, history_dataset_association_id, user_id, rating) FROM stdin;
\.


--
-- Name: history_dataset_association_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_rating_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_association_subset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association_subset (id, history_dataset_association_id, history_dataset_association_subset_id, location) FROM stdin;
\.


--
-- Name: history_dataset_association_subset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_subset_id_seq', 1, false);


--
-- Data for Name: history_dataset_association_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_association_tag_association (id, history_dataset_association_id, tag_id, user_tname, value, user_value, user_id) FROM stdin;
\.


--
-- Name: history_dataset_association_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_association_tag_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_collection_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_collection_annotation_association (id, history_dataset_collection_id, user_id, annotation) FROM stdin;
\.


--
-- Name: history_dataset_collection_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_collection_annotation_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_collection_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_collection_association (id, collection_id, history_id, hid, name, deleted, visible, copied_from_history_dataset_collection_association_id, implicit_output_name, implicit_collection_jobs_id, job_id) FROM stdin;
\.


--
-- Name: history_dataset_collection_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_collection_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_collection_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_collection_rating_association (id, history_dataset_collection_id, user_id, rating) FROM stdin;
\.


--
-- Name: history_dataset_collection_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_collection_rating_association_id_seq', 1, false);


--
-- Data for Name: history_dataset_collection_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_dataset_collection_tag_association (id, history_dataset_collection_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: history_dataset_collection_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_dataset_collection_tag_association_id_seq', 1, false);


--
-- Name: history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_id_seq', 1, false);


--
-- Data for Name: history_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_rating_association (id, history_id, user_id, rating) FROM stdin;
\.


--
-- Name: history_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_rating_association_id_seq', 1, false);


--
-- Data for Name: history_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_tag_association (id, history_id, tag_id, user_tname, value, user_value, user_id) FROM stdin;
\.


--
-- Name: history_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_tag_association_id_seq', 1, false);


--
-- Data for Name: history_user_share_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY history_user_share_association (id, history_id, user_id) FROM stdin;
\.


--
-- Name: history_user_share_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('history_user_share_association_id_seq', 1, false);


--
-- Data for Name: implicit_collection_jobs; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY implicit_collection_jobs (id, populated_state) FROM stdin;
\.


--
-- Name: implicit_collection_jobs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('implicit_collection_jobs_id_seq', 1, false);


--
-- Data for Name: implicit_collection_jobs_job_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY implicit_collection_jobs_job_association (implicit_collection_jobs_id, id, job_id, order_index) FROM stdin;
\.


--
-- Name: implicit_collection_jobs_job_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('implicit_collection_jobs_job_association_id_seq', 1, false);


--
-- Data for Name: implicitly_converted_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY implicitly_converted_dataset_association (id, create_time, update_time, hda_id, hda_parent_id, deleted, metadata_safe, type, ldda_parent_id, ldda_id) FROM stdin;
\.


--
-- Name: implicitly_converted_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('implicitly_converted_dataset_association_id_seq', 1, false);


--
-- Data for Name: implicitly_created_dataset_collection_inputs; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY implicitly_created_dataset_collection_inputs (id, dataset_collection_id, input_dataset_collection_id, name) FROM stdin;
\.


--
-- Name: implicitly_created_dataset_collection_inputs_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('implicitly_created_dataset_collection_inputs_id_seq', 1, false);


--
-- Data for Name: job; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job (id, create_time, update_time, history_id, tool_id, tool_version, state, info, command_line, param_filename, runner_name, tool_stdout, tool_stderr, traceback, session_id, job_runner_name, job_runner_external_id, library_folder_id, user_id, imported, object_store_id, params, handler, exit_code, destination_id, destination_params, dependencies, copied_from_job_id, job_messages, job_stdout, job_stderr, dynamic_tool_id) FROM stdin;
\.


--
-- Data for Name: job_export_history_archive; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_export_history_archive (id, job_id, history_id, dataset_id, compressed, history_attrs_filename, datasets_attrs_filename, jobs_attrs_filename) FROM stdin;
\.


--
-- Name: job_export_history_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_export_history_archive_id_seq', 1, false);


--
-- Data for Name: job_external_output_metadata; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_external_output_metadata (id, job_id, history_dataset_association_id, library_dataset_dataset_association_id, filename_in, filename_out, filename_results_code, filename_kwds, job_runner_external_pid, filename_override_metadata, is_valid) FROM stdin;
\.


--
-- Name: job_external_output_metadata_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_external_output_metadata_id_seq', 1, false);


--
-- Name: job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_id_seq', 1, false);


--
-- Data for Name: job_import_history_archive; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_import_history_archive (id, job_id, history_id, archive_dir) FROM stdin;
\.


--
-- Name: job_import_history_archive_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_import_history_archive_id_seq', 1, false);


--
-- Data for Name: job_metric_numeric; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_metric_numeric (id, job_id, plugin, metric_name, metric_value) FROM stdin;
\.


--
-- Name: job_metric_numeric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_metric_numeric_id_seq', 1, false);


--
-- Data for Name: job_metric_text; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_metric_text (id, job_id, plugin, metric_name, metric_value) FROM stdin;
\.


--
-- Name: job_metric_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_metric_text_id_seq', 1, false);


--
-- Data for Name: job_parameter; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_parameter (id, job_id, name, value) FROM stdin;
\.


--
-- Name: job_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_parameter_id_seq', 1, false);


--
-- Data for Name: job_state_history; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_state_history (id, create_time, update_time, job_id, state, info) FROM stdin;
\.


--
-- Name: job_state_history_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_state_history_id_seq', 1, false);


--
-- Data for Name: job_to_implicit_output_dataset_collection; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_implicit_output_dataset_collection (id, job_id, dataset_collection_id, name) FROM stdin;
\.


--
-- Name: job_to_implicit_output_dataset_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_implicit_output_dataset_collection_id_seq', 1, false);


--
-- Data for Name: job_to_input_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_input_dataset (id, job_id, dataset_id, name, dataset_version) FROM stdin;
\.


--
-- Data for Name: job_to_input_dataset_collection; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_input_dataset_collection (id, job_id, dataset_collection_id, name) FROM stdin;
\.


--
-- Name: job_to_input_dataset_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_input_dataset_collection_id_seq', 1, false);


--
-- Name: job_to_input_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_input_dataset_id_seq', 1, false);


--
-- Data for Name: job_to_input_library_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_input_library_dataset (id, job_id, ldda_id, name) FROM stdin;
\.


--
-- Name: job_to_input_library_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_input_library_dataset_id_seq', 1, false);


--
-- Data for Name: job_to_output_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_output_dataset (id, job_id, dataset_id, name) FROM stdin;
\.


--
-- Data for Name: job_to_output_dataset_collection; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_output_dataset_collection (id, job_id, dataset_collection_id, name) FROM stdin;
\.


--
-- Name: job_to_output_dataset_collection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_output_dataset_collection_id_seq', 1, false);


--
-- Name: job_to_output_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_output_dataset_id_seq', 1, false);


--
-- Data for Name: job_to_output_library_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY job_to_output_library_dataset (id, job_id, ldda_id, name) FROM stdin;
\.


--
-- Name: job_to_output_library_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('job_to_output_library_dataset_id_seq', 1, false);


--
-- Data for Name: library; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library (id, root_folder_id, create_time, update_time, name, deleted, purged, description, synopsis) FROM stdin;
\.


--
-- Data for Name: library_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset (id, library_dataset_dataset_association_id, folder_id, order_id, create_time, update_time, name, info, deleted, purged) FROM stdin;
\.


--
-- Data for Name: library_dataset_collection_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_collection_annotation_association (id, library_dataset_collection_id, user_id, annotation) FROM stdin;
\.


--
-- Name: library_dataset_collection_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_collection_annotation_association_id_seq', 1, false);


--
-- Data for Name: library_dataset_collection_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_collection_association (id, collection_id, name, deleted, folder_id) FROM stdin;
\.


--
-- Name: library_dataset_collection_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_collection_association_id_seq', 1, false);


--
-- Data for Name: library_dataset_collection_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_collection_rating_association (id, library_dataset_collection_id, user_id, rating) FROM stdin;
\.


--
-- Name: library_dataset_collection_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_collection_rating_association_id_seq', 1, false);


--
-- Data for Name: library_dataset_collection_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_collection_tag_association (id, library_dataset_collection_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: library_dataset_collection_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_collection_tag_association_id_seq', 1, false);


--
-- Data for Name: library_dataset_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_dataset_association (id, library_dataset_id, dataset_id, create_time, update_time, copied_from_history_dataset_association_id, copied_from_library_dataset_dataset_association_id, name, info, blurb, peek, extension, metadata, parent_id, designation, deleted, visible, user_id, message, state, tool_version, extended_metadata_id) FROM stdin;
\.


--
-- Name: library_dataset_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_dataset_association_id_seq', 1, false);


--
-- Data for Name: library_dataset_dataset_association_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_dataset_association_permissions (id, create_time, update_time, action, library_dataset_dataset_association_id, role_id) FROM stdin;
\.


--
-- Name: library_dataset_dataset_association_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_dataset_association_permissions_id_seq', 1, false);


--
-- Data for Name: library_dataset_dataset_association_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_dataset_association_tag_association (id, library_dataset_dataset_association_id, tag_id, user_tname, value, user_value, user_id) FROM stdin;
\.


--
-- Name: library_dataset_dataset_association_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_dataset_association_tag_association_id_seq', 1, false);


--
-- Data for Name: library_dataset_dataset_info_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_dataset_info_association (id, library_dataset_dataset_association_id, form_definition_id, form_values_id, deleted) FROM stdin;
\.


--
-- Name: library_dataset_dataset_info_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_dataset_info_association_id_seq', 1, false);


--
-- Name: library_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_id_seq', 1, false);


--
-- Data for Name: library_dataset_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_dataset_permissions (id, create_time, update_time, action, library_dataset_id, role_id) FROM stdin;
\.


--
-- Name: library_dataset_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_dataset_permissions_id_seq', 1, false);


--
-- Data for Name: library_folder; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_folder (id, parent_id, create_time, update_time, name, description, order_id, item_count, deleted, purged, genome_build) FROM stdin;
\.


--
-- Name: library_folder_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_folder_id_seq', 1, false);


--
-- Data for Name: library_folder_info_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_folder_info_association (id, library_folder_id, form_definition_id, form_values_id, deleted, inheritable) FROM stdin;
\.


--
-- Name: library_folder_info_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_folder_info_association_id_seq', 1, false);


--
-- Data for Name: library_folder_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_folder_permissions (id, create_time, update_time, action, library_folder_id, role_id) FROM stdin;
\.


--
-- Name: library_folder_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_folder_permissions_id_seq', 1, false);


--
-- Name: library_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_id_seq', 1, false);


--
-- Data for Name: library_info_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_info_association (id, library_id, form_definition_id, form_values_id, deleted, inheritable) FROM stdin;
\.


--
-- Name: library_info_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_info_association_id_seq', 1, false);


--
-- Data for Name: library_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY library_permissions (id, create_time, update_time, action, library_id, role_id) FROM stdin;
\.


--
-- Name: library_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('library_permissions_id_seq', 1, false);


--
-- Data for Name: metadata_file; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY metadata_file (id, name, hda_id, create_time, update_time, deleted, purged, lda_id, object_store_id, uuid) FROM stdin;
\.


--
-- Name: metadata_file_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('metadata_file_id_seq', 1, false);


--
-- Data for Name: migrate_tools; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY migrate_tools (repository_id, repository_path, version) FROM stdin;
GalaxyTools	lib/tool_shed/galaxy_install/migrate	1
\.


--
-- Data for Name: migrate_version; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY migrate_version (repository_id, repository_path, version) FROM stdin;
Galaxy	lib/galaxy/model/migrate	153
\.


--
-- Data for Name: oidc_user_authnz_tokens; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY oidc_user_authnz_tokens (id, user_id, uid, provider, extra_data, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: oidc_user_authnz_tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('oidc_user_authnz_tokens_id_seq', 1, false);


--
-- Data for Name: page; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY page (id, create_time, update_time, user_id, latest_revision_id, title, slug, published, deleted, importable) FROM stdin;
\.


--
-- Data for Name: page_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY page_annotation_association (id, page_id, user_id, annotation) FROM stdin;
\.


--
-- Name: page_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('page_annotation_association_id_seq', 1, false);


--
-- Name: page_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('page_id_seq', 1, false);


--
-- Data for Name: page_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY page_rating_association (id, page_id, user_id, rating) FROM stdin;
\.


--
-- Name: page_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('page_rating_association_id_seq', 1, false);


--
-- Data for Name: page_revision; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY page_revision (id, create_time, update_time, page_id, title, content) FROM stdin;
\.


--
-- Name: page_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('page_revision_id_seq', 1, false);


--
-- Data for Name: page_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY page_tag_association (id, page_id, tag_id, user_tname, value, user_value, user_id) FROM stdin;
\.


--
-- Name: page_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('page_tag_association_id_seq', 1, false);


--
-- Data for Name: page_user_share_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY page_user_share_association (id, page_id, user_id) FROM stdin;
\.


--
-- Name: page_user_share_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('page_user_share_association_id_seq', 1, false);


--
-- Data for Name: password_reset_token; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY password_reset_token (token, expiration_time, user_id) FROM stdin;
\.


--
-- Data for Name: post_job_action; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY post_job_action (id, workflow_step_id, action_type, output_name, action_arguments) FROM stdin;
\.


--
-- Data for Name: post_job_action_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY post_job_action_association (id, post_job_action_id, job_id) FROM stdin;
\.


--
-- Name: post_job_action_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('post_job_action_association_id_seq', 1, false);


--
-- Name: post_job_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('post_job_action_id_seq', 1, false);


--
-- Data for Name: psa_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY psa_association (id, server_url, handle, secret, issued, lifetime, assoc_type) FROM stdin;
\.


--
-- Name: psa_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('psa_association_id_seq', 1, false);


--
-- Data for Name: psa_code; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY psa_code (id, email, code) FROM stdin;
\.


--
-- Name: psa_code_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('psa_code_id_seq', 1, false);


--
-- Data for Name: psa_nonce; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY psa_nonce (id, server_url, "timestamp", salt) FROM stdin;
\.


--
-- Name: psa_nonce_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('psa_nonce_id_seq', 1, false);


--
-- Data for Name: psa_partial; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY psa_partial (id, token, data, next_step, backend) FROM stdin;
\.


--
-- Name: psa_partial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('psa_partial_id_seq', 1, false);


--
-- Data for Name: quota; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY quota (id, create_time, update_time, name, description, bytes, operation, deleted) FROM stdin;
\.


--
-- Name: quota_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('quota_id_seq', 1, false);


--
-- Data for Name: repository_dependency; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY repository_dependency (id, create_time, update_time, tool_shed_repository_id) FROM stdin;
\.


--
-- Name: repository_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('repository_dependency_id_seq', 1, false);


--
-- Data for Name: repository_repository_dependency_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY repository_repository_dependency_association (id, create_time, update_time, tool_shed_repository_id, repository_dependency_id) FROM stdin;
\.


--
-- Name: repository_repository_dependency_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('repository_repository_dependency_association_id_seq', 1, false);


--
-- Data for Name: request; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY request (id, create_time, update_time, name, "desc", form_values_id, request_type_id, user_id, deleted, notification) FROM stdin;
\.


--
-- Data for Name: request_event; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY request_event (id, create_time, update_time, request_id, state, comment) FROM stdin;
\.


--
-- Name: request_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('request_event_id_seq', 1, false);


--
-- Name: request_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('request_id_seq', 1, false);


--
-- Data for Name: request_type; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY request_type (id, create_time, update_time, name, "desc", request_form_id, sample_form_id, deleted) FROM stdin;
\.


--
-- Data for Name: request_type_external_service_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY request_type_external_service_association (id, request_type_id, external_service_id) FROM stdin;
\.


--
-- Name: request_type_external_service_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('request_type_external_service_association_id_seq', 1, false);


--
-- Name: request_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('request_type_id_seq', 1, false);


--
-- Data for Name: request_type_permissions; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY request_type_permissions (id, create_time, update_time, action, request_type_id, role_id) FROM stdin;
\.


--
-- Name: request_type_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('request_type_permissions_id_seq', 1, false);


--
-- Data for Name: request_type_run_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY request_type_run_association (id, request_type_id, run_id) FROM stdin;
\.


--
-- Name: request_type_run_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('request_type_run_association_id_seq', 1, false);


--
-- Data for Name: role; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY role (id, create_time, update_time, name, description, type, deleted) FROM stdin;
\.


--
-- Name: role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('role_id_seq', 1, false);


--
-- Data for Name: run; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY run (id, create_time, update_time, form_definition_id, form_values_id, deleted, subindex) FROM stdin;
\.


--
-- Name: run_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('run_id_seq', 1, false);


--
-- Data for Name: sample; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY sample (id, create_time, update_time, name, "desc", form_values_id, request_id, deleted, bar_code, library_id, folder_id, workflow, history_id) FROM stdin;
\.


--
-- Data for Name: sample_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY sample_dataset (id, create_time, update_time, sample_id, name, status, error_msg, size, file_path, external_service_id) FROM stdin;
\.


--
-- Name: sample_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('sample_dataset_id_seq', 1, false);


--
-- Data for Name: sample_event; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY sample_event (id, create_time, update_time, sample_id, sample_state_id, comment) FROM stdin;
\.


--
-- Name: sample_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('sample_event_id_seq', 1, false);


--
-- Name: sample_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('sample_id_seq', 1, false);


--
-- Data for Name: sample_run_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY sample_run_association (id, sample_id, run_id) FROM stdin;
\.


--
-- Name: sample_run_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('sample_run_association_id_seq', 1, false);


--
-- Data for Name: sample_state; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY sample_state (id, create_time, update_time, name, "desc", request_type_id) FROM stdin;
\.


--
-- Name: sample_state_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('sample_state_id_seq', 1, false);


--
-- Data for Name: stored_workflow; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY stored_workflow (id, create_time, update_time, user_id, latest_workflow_id, name, deleted, importable, slug, published, from_path) FROM stdin;
\.


--
-- Data for Name: stored_workflow_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY stored_workflow_annotation_association (id, stored_workflow_id, user_id, annotation) FROM stdin;
\.


--
-- Name: stored_workflow_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('stored_workflow_annotation_association_id_seq', 1, false);


--
-- Name: stored_workflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('stored_workflow_id_seq', 1, false);


--
-- Data for Name: stored_workflow_menu_entry; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY stored_workflow_menu_entry (id, stored_workflow_id, user_id, order_index) FROM stdin;
\.


--
-- Name: stored_workflow_menu_entry_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('stored_workflow_menu_entry_id_seq', 1, false);


--
-- Data for Name: stored_workflow_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY stored_workflow_rating_association (id, stored_workflow_id, user_id, rating) FROM stdin;
\.


--
-- Name: stored_workflow_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('stored_workflow_rating_association_id_seq', 1, false);


--
-- Data for Name: stored_workflow_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY stored_workflow_tag_association (id, stored_workflow_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: stored_workflow_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('stored_workflow_tag_association_id_seq', 1, false);


--
-- Data for Name: stored_workflow_user_share_connection; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY stored_workflow_user_share_connection (id, stored_workflow_id, user_id) FROM stdin;
\.


--
-- Name: stored_workflow_user_share_connection_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('stored_workflow_user_share_connection_id_seq', 1, false);


--
-- Data for Name: tag; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY tag (id, type, parent_id, name) FROM stdin;
\.


--
-- Name: tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('tag_id_seq', 1, false);


--
-- Data for Name: task; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY task (id, create_time, execution_time, update_time, state, command_line, param_filename, runner_name, tool_stdout, tool_stderr, traceback, job_id, task_runner_name, task_runner_external_id, prepare_input_files_cmd, working_directory, info, exit_code, job_messages, job_stdout, job_stderr) FROM stdin;
\.


--
-- Name: task_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('task_id_seq', 1, false);


--
-- Data for Name: task_metric_numeric; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY task_metric_numeric (id, task_id, plugin, metric_name, metric_value) FROM stdin;
\.


--
-- Name: task_metric_numeric_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('task_metric_numeric_id_seq', 1, false);


--
-- Data for Name: task_metric_text; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY task_metric_text (id, task_id, plugin, metric_name, metric_value) FROM stdin;
\.


--
-- Name: task_metric_text_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('task_metric_text_id_seq', 1, false);


--
-- Data for Name: tool_dependency; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY tool_dependency (id, create_time, update_time, tool_shed_repository_id, name, version, type, status, error_message) FROM stdin;
\.


--
-- Name: tool_dependency_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('tool_dependency_id_seq', 1, false);


--
-- Data for Name: tool_shed_repository; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY tool_shed_repository (id, create_time, update_time, tool_shed, name, description, owner, changeset_revision, deleted, metadata, includes_datatypes, installed_changeset_revision, uninstalled, dist_to_shed, ctx_rev, status, error_message, tool_shed_status) FROM stdin;
\.


--
-- Name: tool_shed_repository_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('tool_shed_repository_id_seq', 1, false);


--
-- Data for Name: tool_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY tool_tag_association (id, tool_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: tool_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('tool_tag_association_id_seq', 1, false);


--
-- Data for Name: tool_version; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY tool_version (id, create_time, update_time, tool_id, tool_shed_repository_id) FROM stdin;
\.


--
-- Data for Name: tool_version_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY tool_version_association (id, tool_id, parent_id) FROM stdin;
\.


--
-- Name: tool_version_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('tool_version_association_id_seq', 1, false);


--
-- Name: tool_version_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('tool_version_id_seq', 1, false);


--
-- Data for Name: transfer_job; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY transfer_job (id, create_time, update_time, state, path, params, info, pid, socket) FROM stdin;
\.


--
-- Name: transfer_job_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('transfer_job_id_seq', 1, false);


--
-- Data for Name: user_action; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY user_action (id, create_time, user_id, session_id, action, context, params) FROM stdin;
\.


--
-- Name: user_action_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('user_action_id_seq', 1, false);


--
-- Data for Name: user_address; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY user_address (id, create_time, update_time, user_id, "desc", name, institution, address, city, state, postal_code, country, phone, deleted, purged) FROM stdin;
\.


--
-- Name: user_address_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('user_address_id_seq', 1, false);


--
-- Data for Name: user_group_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY user_group_association (id, user_id, group_id, create_time, update_time) FROM stdin;
\.


--
-- Name: user_group_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('user_group_association_id_seq', 1, false);


--
-- Data for Name: user_preference; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY user_preference (id, user_id, name, value) FROM stdin;
\.


--
-- Name: user_preference_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('user_preference_id_seq', 1, false);


--
-- Data for Name: user_quota_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY user_quota_association (id, user_id, quota_id, create_time, update_time) FROM stdin;
\.


--
-- Name: user_quota_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('user_quota_association_id_seq', 1, false);


--
-- Data for Name: user_role_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY user_role_association (id, user_id, role_id, create_time, update_time) FROM stdin;
\.


--
-- Name: user_role_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('user_role_association_id_seq', 1, false);


--
-- Data for Name: validation_error; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY validation_error (id, dataset_id, message, err_type, attributes) FROM stdin;
\.


--
-- Name: validation_error_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('validation_error_id_seq', 1, false);


--
-- Data for Name: visualization; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY visualization (id, create_time, update_time, user_id, latest_revision_id, title, type, deleted, importable, slug, published, dbkey) FROM stdin;
\.


--
-- Data for Name: visualization_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY visualization_annotation_association (id, visualization_id, user_id, annotation) FROM stdin;
\.


--
-- Name: visualization_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('visualization_annotation_association_id_seq', 1, false);


--
-- Name: visualization_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('visualization_id_seq', 1, false);


--
-- Data for Name: visualization_rating_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY visualization_rating_association (id, visualization_id, user_id, rating) FROM stdin;
\.


--
-- Name: visualization_rating_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('visualization_rating_association_id_seq', 1, false);


--
-- Data for Name: visualization_revision; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY visualization_revision (id, create_time, update_time, visualization_id, title, config, dbkey) FROM stdin;
\.


--
-- Name: visualization_revision_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('visualization_revision_id_seq', 1, false);


--
-- Data for Name: visualization_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY visualization_tag_association (id, visualization_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: visualization_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('visualization_tag_association_id_seq', 1, false);


--
-- Data for Name: visualization_user_share_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY visualization_user_share_association (id, visualization_id, user_id) FROM stdin;
\.


--
-- Name: visualization_user_share_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('visualization_user_share_association_id_seq', 1, false);


--
-- Data for Name: worker_process; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY worker_process (id, server_name, hostname, update_time) FROM stdin;
\.


--
-- Name: worker_process_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('worker_process_id_seq', 1, false);


--
-- Data for Name: workflow; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow (id, create_time, update_time, stored_workflow_id, name, has_cycles, has_errors, uuid, parent_workflow_id) FROM stdin;
\.


--
-- Name: workflow_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_id_seq', 1, false);


--
-- Data for Name: workflow_invocation; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation (id, create_time, update_time, workflow_id, history_id, state, scheduler, handler, uuid) FROM stdin;
\.


--
-- Name: workflow_invocation_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_id_seq', 1, false);


--
-- Data for Name: workflow_invocation_output_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation_output_dataset_association (id, workflow_invocation_id, workflow_step_id, dataset_id, workflow_output_id) FROM stdin;
\.


--
-- Name: workflow_invocation_output_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_output_dataset_association_id_seq', 1, false);


--
-- Name: workflow_invocation_output_dataset_collection_associatio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_output_dataset_collection_associatio_id_seq', 1, false);


--
-- Data for Name: workflow_invocation_output_dataset_collection_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation_output_dataset_collection_association (id, workflow_invocation_id, workflow_step_id, dataset_collection_id, workflow_output_id) FROM stdin;
\.


--
-- Data for Name: workflow_invocation_step; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation_step (id, create_time, update_time, workflow_invocation_id, workflow_step_id, job_id, action, implicit_collection_jobs_id, state) FROM stdin;
\.


--
-- Name: workflow_invocation_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_step_id_seq', 1, false);


--
-- Data for Name: workflow_invocation_step_output_dataset_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation_step_output_dataset_association (id, workflow_invocation_step_id, dataset_id, output_name) FROM stdin;
\.


--
-- Name: workflow_invocation_step_output_dataset_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_step_output_dataset_association_id_seq', 1, false);


--
-- Name: workflow_invocation_step_output_dataset_collection_assoc_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_step_output_dataset_collection_assoc_id_seq', 1, false);


--
-- Data for Name: workflow_invocation_step_output_dataset_collection_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation_step_output_dataset_collection_association (id, workflow_invocation_step_id, workflow_step_id, dataset_collection_id, output_name) FROM stdin;
\.


--
-- Name: workflow_invocation_to_subworkflow_invocation_associatio_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_invocation_to_subworkflow_invocation_associatio_id_seq', 1, false);


--
-- Data for Name: workflow_invocation_to_subworkflow_invocation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_invocation_to_subworkflow_invocation_association (id, workflow_invocation_id, subworkflow_invocation_id, workflow_step_id) FROM stdin;
\.


--
-- Data for Name: workflow_output; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_output (id, workflow_step_id, output_name, label, uuid) FROM stdin;
\.


--
-- Name: workflow_output_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_output_id_seq', 1, false);


--
-- Data for Name: workflow_request_input_parameters; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_request_input_parameters (id, workflow_invocation_id, name, type, value) FROM stdin;
\.


--
-- Name: workflow_request_input_parameters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_request_input_parameters_id_seq', 1, false);


--
-- Data for Name: workflow_request_input_step_parameter; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_request_input_step_parameter (id, workflow_invocation_id, workflow_step_id, parameter_value) FROM stdin;
\.


--
-- Name: workflow_request_input_step_parameter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_request_input_step_parameter_id_seq', 1, false);


--
-- Data for Name: workflow_request_step_states; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_request_step_states (id, workflow_invocation_id, workflow_step_id, value) FROM stdin;
\.


--
-- Name: workflow_request_step_states_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_request_step_states_id_seq', 1, false);


--
-- Data for Name: workflow_request_to_input_collection_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_request_to_input_collection_dataset (id, name, workflow_invocation_id, workflow_step_id, dataset_collection_id) FROM stdin;
\.


--
-- Name: workflow_request_to_input_collection_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_request_to_input_collection_dataset_id_seq', 1, false);


--
-- Data for Name: workflow_request_to_input_dataset; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_request_to_input_dataset (id, name, workflow_invocation_id, workflow_step_id, dataset_id) FROM stdin;
\.


--
-- Name: workflow_request_to_input_dataset_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_request_to_input_dataset_id_seq', 1, false);


--
-- Data for Name: workflow_step; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_step (id, create_time, update_time, workflow_id, type, tool_id, tool_version, tool_inputs, tool_errors, "position", config, order_index, label, uuid, subworkflow_id, dynamic_tool_id) FROM stdin;
\.


--
-- Data for Name: workflow_step_annotation_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_step_annotation_association (id, workflow_step_id, user_id, annotation) FROM stdin;
\.


--
-- Name: workflow_step_annotation_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_step_annotation_association_id_seq', 1, false);


--
-- Data for Name: workflow_step_connection; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_step_connection (id, output_step_id, input_step_input_id, output_name, input_subworkflow_step_id) FROM stdin;
\.


--
-- Name: workflow_step_connection_id_seq1; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_step_connection_id_seq1', 1, false);


--
-- Name: workflow_step_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_step_id_seq', 1, false);


--
-- Data for Name: workflow_step_input; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_step_input (id, workflow_step_id, name, merge_type, scatter_type, value_from, value_from_type, default_value, default_value_set, runtime_value) FROM stdin;
\.


--
-- Name: workflow_step_input_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_step_input_id_seq', 1, false);


--
-- Data for Name: workflow_step_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_step_tag_association (id, workflow_step_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: workflow_step_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_step_tag_association_id_seq', 1, false);


--
-- Data for Name: workflow_tag_association; Type: TABLE DATA; Schema: public; Owner: __GALAXY_DB_USER__
--

COPY workflow_tag_association (id, workflow_id, tag_id, user_id, user_tname, value, user_value) FROM stdin;
\.


--
-- Name: workflow_tag_association_id_seq; Type: SEQUENCE SET; Schema: public; Owner: __GALAXY_DB_USER__
--

SELECT pg_catalog.setval('workflow_tag_association_id_seq', 1, false);


--
-- Name: api_keys_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_dataset_association
    ADD CONSTRAINT cleanup_event_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_hda_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_hda_association
    ADD CONSTRAINT cleanup_event_hda_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_history_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_history_association
    ADD CONSTRAINT cleanup_event_history_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_icda_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_icda_association
    ADD CONSTRAINT cleanup_event_icda_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_ldda_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_ldda_association
    ADD CONSTRAINT cleanup_event_ldda_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_library_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_library_association
    ADD CONSTRAINT cleanup_event_library_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_library_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_library_dataset_association
    ADD CONSTRAINT cleanup_event_library_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_library_folder_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_library_folder_association
    ADD CONSTRAINT cleanup_event_library_folder_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_metadata_file_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_metadata_file_association
    ADD CONSTRAINT cleanup_event_metadata_file_association_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event
    ADD CONSTRAINT cleanup_event_pkey PRIMARY KEY (id);


--
-- Name: cleanup_event_user_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cleanup_event_user_association
    ADD CONSTRAINT cleanup_event_user_association_pkey PRIMARY KEY (id);


--
-- Name: cloudauthz_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY cloudauthz
    ADD CONSTRAINT cloudauthz_pkey PRIMARY KEY (id);


--
-- Name: custos_authnz_token_external_user_id_provider_key; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY custos_authnz_token
    ADD CONSTRAINT custos_authnz_token_external_user_id_provider_key UNIQUE (external_user_id, provider);


--
-- Name: custos_authnz_token_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY custos_authnz_token
    ADD CONSTRAINT custos_authnz_token_pkey PRIMARY KEY (id);


--
-- Name: custos_authnz_token_user_id_external_user_id_provider_key; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY custos_authnz_token
    ADD CONSTRAINT custos_authnz_token_user_id_external_user_id_provider_key UNIQUE (user_id, external_user_id, provider);


--
-- Name: data_manager_history_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY data_manager_history_association
    ADD CONSTRAINT data_manager_history_association_pkey PRIMARY KEY (id);


--
-- Name: data_manager_job_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY data_manager_job_association
    ADD CONSTRAINT data_manager_job_association_pkey PRIMARY KEY (id);


--
-- Name: dataset_collection_element_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_collection_element
    ADD CONSTRAINT dataset_collection_element_pkey PRIMARY KEY (id);


--
-- Name: dataset_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_collection
    ADD CONSTRAINT dataset_collection_pkey PRIMARY KEY (id);


--
-- Name: dataset_hash_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_hash
    ADD CONSTRAINT dataset_hash_pkey PRIMARY KEY (id);


--
-- Name: dataset_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_permissions
    ADD CONSTRAINT dataset_permissions_pkey PRIMARY KEY (id);


--
-- Name: dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset
    ADD CONSTRAINT dataset_pkey PRIMARY KEY (id);


--
-- Name: dataset_source_hash_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_source_hash
    ADD CONSTRAINT dataset_source_hash_pkey PRIMARY KEY (id);


--
-- Name: dataset_source_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_source
    ADD CONSTRAINT dataset_source_pkey PRIMARY KEY (id);


--
-- Name: dataset_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dataset_tag_association
    ADD CONSTRAINT dataset_tag_association_pkey PRIMARY KEY (id);


--
-- Name: default_history_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY default_history_permissions
    ADD CONSTRAINT default_history_permissions_pkey PRIMARY KEY (id);


--
-- Name: default_quota_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY default_quota_association
    ADD CONSTRAINT default_quota_association_pkey PRIMARY KEY (id);


--
-- Name: default_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY default_user_permissions
    ADD CONSTRAINT default_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: deferred_job_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY deferred_job
    ADD CONSTRAINT deferred_job_pkey PRIMARY KEY (id);


--
-- Name: dynamic_tool_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY dynamic_tool
    ADD CONSTRAINT dynamic_tool_pkey PRIMARY KEY (id);


--
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (id);


--
-- Name: extended_metadata_index_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY extended_metadata_index
    ADD CONSTRAINT extended_metadata_index_pkey PRIMARY KEY (id);


--
-- Name: extended_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY extended_metadata
    ADD CONSTRAINT extended_metadata_pkey PRIMARY KEY (id);


--
-- Name: form_definition_current_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY form_definition_current
    ADD CONSTRAINT form_definition_current_pkey PRIMARY KEY (id);


--
-- Name: form_definition_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY form_definition
    ADD CONSTRAINT form_definition_pkey PRIMARY KEY (id);


--
-- Name: form_values_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY form_values
    ADD CONSTRAINT form_values_pkey PRIMARY KEY (id);


--
-- Name: galaxy_group_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY galaxy_group
    ADD CONSTRAINT galaxy_group_pkey PRIMARY KEY (id);


--
-- Name: galaxy_session_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY galaxy_session
    ADD CONSTRAINT galaxy_session_pkey PRIMARY KEY (id);


--
-- Name: galaxy_session_to_history_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY galaxy_session_to_history
    ADD CONSTRAINT galaxy_session_to_history_pkey PRIMARY KEY (id);


--
-- Name: galaxy_user_openid_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY galaxy_user_openid
    ADD CONSTRAINT galaxy_user_openid_pkey PRIMARY KEY (id);


--
-- Name: galaxy_user_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY galaxy_user
    ADD CONSTRAINT galaxy_user_pkey PRIMARY KEY (id);


--
-- Name: genome_index_tool_data_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY genome_index_tool_data
    ADD CONSTRAINT genome_index_tool_data_pkey PRIMARY KEY (id);


--
-- Name: group_quota_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY group_quota_association
    ADD CONSTRAINT group_quota_association_pkey PRIMARY KEY (id);


--
-- Name: group_role_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY group_role_association
    ADD CONSTRAINT group_role_association_pkey PRIMARY KEY (id);


--
-- Name: history_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_annotation_association
    ADD CONSTRAINT history_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association_annotation_association
    ADD CONSTRAINT history_dataset_association_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_display_at_authorization_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association_display_at_authorization
    ADD CONSTRAINT history_dataset_association_display_at_authorization_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_history_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association_history
    ADD CONSTRAINT history_dataset_association_history_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association_rating_association
    ADD CONSTRAINT history_dataset_association_rating_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_subset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association_subset
    ADD CONSTRAINT history_dataset_association_subset_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_association_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_association_tag_association
    ADD CONSTRAINT history_dataset_association_tag_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_collection_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_collection_annotation_association
    ADD CONSTRAINT history_dataset_collection_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_collection_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_collection_association
    ADD CONSTRAINT history_dataset_collection_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_collection_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_collection_rating_association
    ADD CONSTRAINT history_dataset_collection_rating_association_pkey PRIMARY KEY (id);


--
-- Name: history_dataset_collection_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_dataset_collection_tag_association
    ADD CONSTRAINT history_dataset_collection_tag_association_pkey PRIMARY KEY (id);


--
-- Name: history_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_pkey PRIMARY KEY (id);


--
-- Name: history_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_rating_association
    ADD CONSTRAINT history_rating_association_pkey PRIMARY KEY (id);


--
-- Name: history_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_tag_association
    ADD CONSTRAINT history_tag_association_pkey PRIMARY KEY (id);


--
-- Name: history_user_share_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY history_user_share_association
    ADD CONSTRAINT history_user_share_association_pkey PRIMARY KEY (id);


--
-- Name: implicit_collection_jobs_job_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY implicit_collection_jobs_job_association
    ADD CONSTRAINT implicit_collection_jobs_job_association_pkey PRIMARY KEY (id);


--
-- Name: implicit_collection_jobs_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY implicit_collection_jobs
    ADD CONSTRAINT implicit_collection_jobs_pkey PRIMARY KEY (id);


--
-- Name: implicitly_converted_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY implicitly_converted_dataset_association
    ADD CONSTRAINT implicitly_converted_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: implicitly_created_dataset_collection_inputs_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY implicitly_created_dataset_collection_inputs
    ADD CONSTRAINT implicitly_created_dataset_collection_inputs_pkey PRIMARY KEY (id);


--
-- Name: job_export_history_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_export_history_archive
    ADD CONSTRAINT job_export_history_archive_pkey PRIMARY KEY (id);


--
-- Name: job_external_output_metadata_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_external_output_metadata
    ADD CONSTRAINT job_external_output_metadata_pkey PRIMARY KEY (id);


--
-- Name: job_import_history_archive_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_import_history_archive
    ADD CONSTRAINT job_import_history_archive_pkey PRIMARY KEY (id);


--
-- Name: job_metric_numeric_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_metric_numeric
    ADD CONSTRAINT job_metric_numeric_pkey PRIMARY KEY (id);


--
-- Name: job_metric_text_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_metric_text
    ADD CONSTRAINT job_metric_text_pkey PRIMARY KEY (id);


--
-- Name: job_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_parameter
    ADD CONSTRAINT job_parameter_pkey PRIMARY KEY (id);


--
-- Name: job_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_pkey PRIMARY KEY (id);


--
-- Name: job_state_history_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_state_history
    ADD CONSTRAINT job_state_history_pkey PRIMARY KEY (id);


--
-- Name: job_to_implicit_output_dataset_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_implicit_output_dataset_collection
    ADD CONSTRAINT job_to_implicit_output_dataset_collection_pkey PRIMARY KEY (id);


--
-- Name: job_to_input_dataset_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_input_dataset_collection
    ADD CONSTRAINT job_to_input_dataset_collection_pkey PRIMARY KEY (id);


--
-- Name: job_to_input_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_input_dataset
    ADD CONSTRAINT job_to_input_dataset_pkey PRIMARY KEY (id);


--
-- Name: job_to_input_library_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_input_library_dataset
    ADD CONSTRAINT job_to_input_library_dataset_pkey PRIMARY KEY (id);


--
-- Name: job_to_output_dataset_collection_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_output_dataset_collection
    ADD CONSTRAINT job_to_output_dataset_collection_pkey PRIMARY KEY (id);


--
-- Name: job_to_output_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_output_dataset
    ADD CONSTRAINT job_to_output_dataset_pkey PRIMARY KEY (id);


--
-- Name: job_to_output_library_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY job_to_output_library_dataset
    ADD CONSTRAINT job_to_output_library_dataset_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_collection_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_collection_annotation_association
    ADD CONSTRAINT library_dataset_collection_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_collection_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_collection_association
    ADD CONSTRAINT library_dataset_collection_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_collection_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_collection_rating_association
    ADD CONSTRAINT library_dataset_collection_rating_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_collection_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_collection_tag_association
    ADD CONSTRAINT library_dataset_collection_tag_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_dataset_association_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_dataset_association_permissions
    ADD CONSTRAINT library_dataset_dataset_association_permissions_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_dataset_association_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_dataset_association_tag_association
    ADD CONSTRAINT library_dataset_dataset_association_tag_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_dataset_info_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_dataset_info_association
    ADD CONSTRAINT library_dataset_dataset_info_association_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset_permissions
    ADD CONSTRAINT library_dataset_permissions_pkey PRIMARY KEY (id);


--
-- Name: library_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_dataset
    ADD CONSTRAINT library_dataset_pkey PRIMARY KEY (id);


--
-- Name: library_folder_info_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_folder_info_association
    ADD CONSTRAINT library_folder_info_association_pkey PRIMARY KEY (id);


--
-- Name: library_folder_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_folder_permissions
    ADD CONSTRAINT library_folder_permissions_pkey PRIMARY KEY (id);


--
-- Name: library_folder_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_folder
    ADD CONSTRAINT library_folder_pkey PRIMARY KEY (id);


--
-- Name: library_info_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_info_association
    ADD CONSTRAINT library_info_association_pkey PRIMARY KEY (id);


--
-- Name: library_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library_permissions
    ADD CONSTRAINT library_permissions_pkey PRIMARY KEY (id);


--
-- Name: library_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY library
    ADD CONSTRAINT library_pkey PRIMARY KEY (id);


--
-- Name: metadata_file_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY metadata_file
    ADD CONSTRAINT metadata_file_pkey PRIMARY KEY (id);


--
-- Name: migrate_version_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY migrate_version
    ADD CONSTRAINT migrate_version_pkey PRIMARY KEY (repository_id);


--
-- Name: oidc_user_authnz_tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY oidc_user_authnz_tokens
    ADD CONSTRAINT oidc_user_authnz_tokens_pkey PRIMARY KEY (id);


--
-- Name: page_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY page_annotation_association
    ADD CONSTRAINT page_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: page_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_pkey PRIMARY KEY (id);


--
-- Name: page_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY page_rating_association
    ADD CONSTRAINT page_rating_association_pkey PRIMARY KEY (id);


--
-- Name: page_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY page_revision
    ADD CONSTRAINT page_revision_pkey PRIMARY KEY (id);


--
-- Name: page_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY page_tag_association
    ADD CONSTRAINT page_tag_association_pkey PRIMARY KEY (id);


--
-- Name: page_user_share_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY page_user_share_association
    ADD CONSTRAINT page_user_share_association_pkey PRIMARY KEY (id);


--
-- Name: password_reset_token_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY password_reset_token
    ADD CONSTRAINT password_reset_token_pkey PRIMARY KEY (token);


--
-- Name: post_job_action_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY post_job_action_association
    ADD CONSTRAINT post_job_action_association_pkey PRIMARY KEY (id);


--
-- Name: post_job_action_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY post_job_action
    ADD CONSTRAINT post_job_action_pkey PRIMARY KEY (id);


--
-- Name: psa_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY psa_association
    ADD CONSTRAINT psa_association_pkey PRIMARY KEY (id);


--
-- Name: psa_code_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY psa_code
    ADD CONSTRAINT psa_code_pkey PRIMARY KEY (id);


--
-- Name: psa_nonce_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY psa_nonce
    ADD CONSTRAINT psa_nonce_pkey PRIMARY KEY (id);


--
-- Name: psa_partial_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY psa_partial
    ADD CONSTRAINT psa_partial_pkey PRIMARY KEY (id);


--
-- Name: quota_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY quota
    ADD CONSTRAINT quota_pkey PRIMARY KEY (id);


--
-- Name: repository_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY repository_dependency
    ADD CONSTRAINT repository_dependency_pkey PRIMARY KEY (id);


--
-- Name: repository_repository_dependency_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY repository_repository_dependency_association
    ADD CONSTRAINT repository_repository_dependency_association_pkey PRIMARY KEY (id);


--
-- Name: request_event_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY request_event
    ADD CONSTRAINT request_event_pkey PRIMARY KEY (id);


--
-- Name: request_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_pkey PRIMARY KEY (id);


--
-- Name: request_type_external_service_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY request_type_external_service_association
    ADD CONSTRAINT request_type_external_service_association_pkey PRIMARY KEY (id);


--
-- Name: request_type_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY request_type_permissions
    ADD CONSTRAINT request_type_permissions_pkey PRIMARY KEY (id);


--
-- Name: request_type_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY request_type
    ADD CONSTRAINT request_type_pkey PRIMARY KEY (id);


--
-- Name: request_type_run_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY request_type_run_association
    ADD CONSTRAINT request_type_run_association_pkey PRIMARY KEY (id);


--
-- Name: role_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY role
    ADD CONSTRAINT role_pkey PRIMARY KEY (id);


--
-- Name: run_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY run
    ADD CONSTRAINT run_pkey PRIMARY KEY (id);


--
-- Name: sample_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY sample_dataset
    ADD CONSTRAINT sample_dataset_pkey PRIMARY KEY (id);


--
-- Name: sample_event_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY sample_event
    ADD CONSTRAINT sample_event_pkey PRIMARY KEY (id);


--
-- Name: sample_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_pkey PRIMARY KEY (id);


--
-- Name: sample_run_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY sample_run_association
    ADD CONSTRAINT sample_run_association_pkey PRIMARY KEY (id);


--
-- Name: sample_state_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY sample_state
    ADD CONSTRAINT sample_state_pkey PRIMARY KEY (id);


--
-- Name: sequencer_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY external_service
    ADD CONSTRAINT sequencer_pkey PRIMARY KEY (id);


--
-- Name: stored_workflow_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY stored_workflow_annotation_association
    ADD CONSTRAINT stored_workflow_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: stored_workflow_menu_entry_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY stored_workflow_menu_entry
    ADD CONSTRAINT stored_workflow_menu_entry_pkey PRIMARY KEY (id);


--
-- Name: stored_workflow_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY stored_workflow
    ADD CONSTRAINT stored_workflow_pkey PRIMARY KEY (id);


--
-- Name: stored_workflow_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY stored_workflow_rating_association
    ADD CONSTRAINT stored_workflow_rating_association_pkey PRIMARY KEY (id);


--
-- Name: stored_workflow_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY stored_workflow_tag_association
    ADD CONSTRAINT stored_workflow_tag_association_pkey PRIMARY KEY (id);


--
-- Name: stored_workflow_user_share_connection_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY stored_workflow_user_share_connection
    ADD CONSTRAINT stored_workflow_user_share_connection_pkey PRIMARY KEY (id);


--
-- Name: tag_name_key; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_name_key UNIQUE (name);


--
-- Name: tag_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_pkey PRIMARY KEY (id);


--
-- Name: task_metric_numeric_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY task_metric_numeric
    ADD CONSTRAINT task_metric_numeric_pkey PRIMARY KEY (id);


--
-- Name: task_metric_text_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY task_metric_text
    ADD CONSTRAINT task_metric_text_pkey PRIMARY KEY (id);


--
-- Name: task_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_pkey PRIMARY KEY (id);


--
-- Name: tool_dependency_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tool_dependency
    ADD CONSTRAINT tool_dependency_pkey PRIMARY KEY (id);


--
-- Name: tool_shed_repository_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tool_shed_repository
    ADD CONSTRAINT tool_shed_repository_pkey PRIMARY KEY (id);


--
-- Name: tool_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tool_tag_association
    ADD CONSTRAINT tool_tag_association_pkey PRIMARY KEY (id);


--
-- Name: tool_version_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tool_version_association
    ADD CONSTRAINT tool_version_association_pkey PRIMARY KEY (id);


--
-- Name: tool_version_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY tool_version
    ADD CONSTRAINT tool_version_pkey PRIMARY KEY (id);


--
-- Name: transfer_job_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY transfer_job
    ADD CONSTRAINT transfer_job_pkey PRIMARY KEY (id);


--
-- Name: user_action_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY user_action
    ADD CONSTRAINT user_action_pkey PRIMARY KEY (id);


--
-- Name: user_address_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY user_address
    ADD CONSTRAINT user_address_pkey PRIMARY KEY (id);


--
-- Name: user_group_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY user_group_association
    ADD CONSTRAINT user_group_association_pkey PRIMARY KEY (id);


--
-- Name: user_preference_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY user_preference
    ADD CONSTRAINT user_preference_pkey PRIMARY KEY (id);


--
-- Name: user_quota_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY user_quota_association
    ADD CONSTRAINT user_quota_association_pkey PRIMARY KEY (id);


--
-- Name: user_role_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY user_role_association
    ADD CONSTRAINT user_role_association_pkey PRIMARY KEY (id);


--
-- Name: validation_error_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY validation_error
    ADD CONSTRAINT validation_error_pkey PRIMARY KEY (id);


--
-- Name: visualization_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY visualization_annotation_association
    ADD CONSTRAINT visualization_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: visualization_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY visualization
    ADD CONSTRAINT visualization_pkey PRIMARY KEY (id);


--
-- Name: visualization_rating_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY visualization_rating_association
    ADD CONSTRAINT visualization_rating_association_pkey PRIMARY KEY (id);


--
-- Name: visualization_revision_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY visualization_revision
    ADD CONSTRAINT visualization_revision_pkey PRIMARY KEY (id);


--
-- Name: visualization_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY visualization_tag_association
    ADD CONSTRAINT visualization_tag_association_pkey PRIMARY KEY (id);


--
-- Name: visualization_user_share_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY visualization_user_share_association
    ADD CONSTRAINT visualization_user_share_association_pkey PRIMARY KEY (id);


--
-- Name: worker_process_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY worker_process
    ADD CONSTRAINT worker_process_pkey PRIMARY KEY (id);


--
-- Name: worker_process_server_name_hostname_key; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY worker_process
    ADD CONSTRAINT worker_process_server_name_hostname_key UNIQUE (server_name, hostname);


--
-- Name: workflow_invocation_output_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation_output_dataset_association
    ADD CONSTRAINT workflow_invocation_output_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: workflow_invocation_output_dataset_collection_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_output_dataset_collection_association_pkey PRIMARY KEY (id);


--
-- Name: workflow_invocation_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation
    ADD CONSTRAINT workflow_invocation_pkey PRIMARY KEY (id);


--
-- Name: workflow_invocation_step_output_dataset_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_association
    ADD CONSTRAINT workflow_invocation_step_output_dataset_association_pkey PRIMARY KEY (id);


--
-- Name: workflow_invocation_step_output_dataset_collection_associa_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_step_output_dataset_collection_associa_pkey PRIMARY KEY (id);


--
-- Name: workflow_invocation_step_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation_step
    ADD CONSTRAINT workflow_invocation_step_pkey PRIMARY KEY (id);


--
-- Name: workflow_invocation_to_subworkflow_invocation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_invocation_to_subworkflow_invocation_association
    ADD CONSTRAINT workflow_invocation_to_subworkflow_invocation_association_pkey PRIMARY KEY (id);


--
-- Name: workflow_output_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_output
    ADD CONSTRAINT workflow_output_pkey PRIMARY KEY (id);


--
-- Name: workflow_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow
    ADD CONSTRAINT workflow_pkey PRIMARY KEY (id);


--
-- Name: workflow_request_input_parameters_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_request_input_parameters
    ADD CONSTRAINT workflow_request_input_parameters_pkey PRIMARY KEY (id);


--
-- Name: workflow_request_input_step_parameter_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_request_input_step_parameter
    ADD CONSTRAINT workflow_request_input_step_parameter_pkey PRIMARY KEY (id);


--
-- Name: workflow_request_step_states_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_request_step_states
    ADD CONSTRAINT workflow_request_step_states_pkey PRIMARY KEY (id);


--
-- Name: workflow_request_to_input_collection_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_request_to_input_collection_dataset
    ADD CONSTRAINT workflow_request_to_input_collection_dataset_pkey PRIMARY KEY (id);


--
-- Name: workflow_request_to_input_dataset_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_request_to_input_dataset
    ADD CONSTRAINT workflow_request_to_input_dataset_pkey PRIMARY KEY (id);


--
-- Name: workflow_step_annotation_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_step_annotation_association
    ADD CONSTRAINT workflow_step_annotation_association_pkey PRIMARY KEY (id);


--
-- Name: workflow_step_connection_pkey1; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_step_connection
    ADD CONSTRAINT workflow_step_connection_pkey1 PRIMARY KEY (id);


--
-- Name: workflow_step_input_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_step_input
    ADD CONSTRAINT workflow_step_input_pkey PRIMARY KEY (id);


--
-- Name: workflow_step_input_workflow_step_id_name_key; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_step_input
    ADD CONSTRAINT workflow_step_input_workflow_step_id_name_key UNIQUE (workflow_step_id, name);


--
-- Name: workflow_step_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_step
    ADD CONSTRAINT workflow_step_pkey PRIMARY KEY (id);


--
-- Name: workflow_step_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_step_tag_association
    ADD CONSTRAINT workflow_step_tag_association_pkey PRIMARY KEY (id);


--
-- Name: workflow_tag_association_pkey; Type: CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

ALTER TABLE ONLY workflow_tag_association
    ADD CONSTRAINT workflow_tag_association_pkey PRIMARY KEY (id);


--
-- Name: id_workflow_invocation_handler; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX id_workflow_invocation_handler ON workflow_invocation USING btree (handler);


--
-- Name: ix_api_keys_key; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_api_keys_key ON api_keys USING btree (key);


--
-- Name: ix_api_keys_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_api_keys_user_id ON api_keys USING btree (user_id);


--
-- Name: ix_cleanup_event_dataset_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_dataset_association_cleanup_event_id ON cleanup_event_dataset_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_dataset_association_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_dataset_association_dataset_id ON cleanup_event_dataset_association USING btree (dataset_id);


--
-- Name: ix_cleanup_event_hda_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_hda_association_cleanup_event_id ON cleanup_event_hda_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_hda_association_hda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_hda_association_hda_id ON cleanup_event_hda_association USING btree (hda_id);


--
-- Name: ix_cleanup_event_history_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_history_association_cleanup_event_id ON cleanup_event_history_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_history_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_history_association_history_id ON cleanup_event_history_association USING btree (history_id);


--
-- Name: ix_cleanup_event_icda_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_icda_association_cleanup_event_id ON cleanup_event_icda_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_icda_association_icda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_icda_association_icda_id ON cleanup_event_icda_association USING btree (icda_id);


--
-- Name: ix_cleanup_event_ldda_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_ldda_association_cleanup_event_id ON cleanup_event_ldda_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_ldda_association_ldda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_ldda_association_ldda_id ON cleanup_event_ldda_association USING btree (ldda_id);


--
-- Name: ix_cleanup_event_library_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_library_association_cleanup_event_id ON cleanup_event_library_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_library_association_library_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_library_association_library_id ON cleanup_event_library_association USING btree (library_id);


--
-- Name: ix_cleanup_event_library_dataset_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_library_dataset_association_cleanup_event_id ON cleanup_event_library_dataset_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_library_dataset_association_library_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_library_dataset_association_library_dataset_id ON cleanup_event_library_dataset_association USING btree (library_dataset_id);


--
-- Name: ix_cleanup_event_library_folder_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_library_folder_association_cleanup_event_id ON cleanup_event_library_folder_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_library_folder_association_library_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_library_folder_association_library_folder_id ON cleanup_event_library_folder_association USING btree (library_folder_id);


--
-- Name: ix_cleanup_event_metadata_file_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_metadata_file_association_cleanup_event_id ON cleanup_event_metadata_file_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_metadata_file_association_metadata_file_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_metadata_file_association_metadata_file_id ON cleanup_event_metadata_file_association USING btree (metadata_file_id);


--
-- Name: ix_cleanup_event_user_association_cleanup_event_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_user_association_cleanup_event_id ON cleanup_event_user_association USING btree (cleanup_event_id);


--
-- Name: ix_cleanup_event_user_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cleanup_event_user_association_user_id ON cleanup_event_user_association USING btree (user_id);


--
-- Name: ix_cloudauthz_authn_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cloudauthz_authn_id ON cloudauthz USING btree (authn_id);


--
-- Name: ix_cloudauthz_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_cloudauthz_user_id ON cloudauthz USING btree (user_id);


--
-- Name: ix_data_manager_history_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_data_manager_history_association_history_id ON data_manager_history_association USING btree (history_id);


--
-- Name: ix_data_manager_history_association_update_time; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_data_manager_history_association_update_time ON data_manager_history_association USING btree (update_time);


--
-- Name: ix_data_manager_history_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_data_manager_history_association_user_id ON data_manager_history_association USING btree (user_id);


--
-- Name: ix_data_manager_job_association_data_manager_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_data_manager_job_association_data_manager_id ON data_manager_job_association USING btree (data_manager_id);


--
-- Name: ix_data_manager_job_association_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_data_manager_job_association_job_id ON data_manager_job_association USING btree (job_id);


--
-- Name: ix_data_manager_job_association_update_time; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_data_manager_job_association_update_time ON data_manager_job_association USING btree (update_time);


--
-- Name: ix_dataset_collection_element_child_collection_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_collection_element_child_collection_id ON dataset_collection_element USING btree (child_collection_id);


--
-- Name: ix_dataset_collection_element_dataset_collection_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_collection_element_dataset_collection_id ON dataset_collection_element USING btree (dataset_collection_id);


--
-- Name: ix_dataset_collection_element_hda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_collection_element_hda_id ON dataset_collection_element USING btree (hda_id);


--
-- Name: ix_dataset_collection_element_ldda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_collection_element_ldda_id ON dataset_collection_element USING btree (ldda_id);


--
-- Name: ix_dataset_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_deleted ON dataset USING btree (deleted);


--
-- Name: ix_dataset_hash_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_hash_dataset_id ON dataset_hash USING btree (dataset_id);


--
-- Name: ix_dataset_object_store_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_object_store_id ON dataset USING btree (object_store_id);


--
-- Name: ix_dataset_permissions_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_permissions_dataset_id ON dataset_permissions USING btree (dataset_id);


--
-- Name: ix_dataset_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_permissions_role_id ON dataset_permissions USING btree (role_id);


--
-- Name: ix_dataset_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_purged ON dataset USING btree (purged);


--
-- Name: ix_dataset_source_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_source_dataset_id ON dataset_source USING btree (dataset_id);


--
-- Name: ix_dataset_source_hash_dataset_source_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_source_hash_dataset_source_id ON dataset_source_hash USING btree (dataset_source_id);


--
-- Name: ix_dataset_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_state ON dataset USING btree (state);


--
-- Name: ix_dataset_tag_association_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_tag_association_dataset_id ON dataset_tag_association USING btree (dataset_id);


--
-- Name: ix_dataset_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_tag_association_tag_id ON dataset_tag_association USING btree (tag_id);


--
-- Name: ix_dataset_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_tag_association_user_tname ON dataset_tag_association USING btree (user_tname);


--
-- Name: ix_dataset_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_tag_association_user_value ON dataset_tag_association USING btree (user_value);


--
-- Name: ix_dataset_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_tag_association_value ON dataset_tag_association USING btree (value);


--
-- Name: ix_dataset_update_time; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_dataset_update_time ON dataset USING btree (update_time);


--
-- Name: ix_default_history_permissions_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_default_history_permissions_history_id ON default_history_permissions USING btree (history_id);


--
-- Name: ix_default_history_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_default_history_permissions_role_id ON default_history_permissions USING btree (role_id);


--
-- Name: ix_default_quota_association_quota_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_default_quota_association_quota_id ON default_quota_association USING btree (quota_id);


--
-- Name: ix_default_quota_association_type; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_default_quota_association_type ON default_quota_association USING btree (type);


--
-- Name: ix_default_user_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_default_user_permissions_role_id ON default_user_permissions USING btree (role_id);


--
-- Name: ix_default_user_permissions_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_default_user_permissions_user_id ON default_user_permissions USING btree (user_id);


--
-- Name: ix_deferred_job_plugin; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_deferred_job_plugin ON deferred_job USING btree (plugin);


--
-- Name: ix_deferred_job_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_deferred_job_state ON deferred_job USING btree (state);


--
-- Name: ix_event_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_event_history_id ON event USING btree (history_id);


--
-- Name: ix_event_session_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_event_session_id ON event USING btree (session_id);


--
-- Name: ix_event_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_event_user_id ON event USING btree (user_id);


--
-- Name: ix_extended_metadata_index_extended_metadata_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_extended_metadata_index_extended_metadata_id ON extended_metadata_index USING btree (extended_metadata_id);


--
-- Name: ix_form_definition_current_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_form_definition_current_deleted ON form_definition_current USING btree (deleted);


--
-- Name: ix_form_definition_current_latest_form_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_form_definition_current_latest_form_id ON form_definition_current USING btree (latest_form_id);


--
-- Name: ix_form_definition_form_definition_current_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_form_definition_form_definition_current_id ON form_definition USING btree (form_definition_current_id);


--
-- Name: ix_form_definition_layout; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_form_definition_layout ON form_definition USING btree (layout);


--
-- Name: ix_form_definition_type; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_form_definition_type ON form_definition USING btree (type);


--
-- Name: ix_form_values_form_definition_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_form_values_form_definition_id ON form_values USING btree (form_definition_id);


--
-- Name: ix_galaxy_group_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_group_deleted ON galaxy_group USING btree (deleted);


--
-- Name: ix_galaxy_group_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_galaxy_group_name ON galaxy_group USING btree (name);


--
-- Name: ix_galaxy_session_disk_usage; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_session_disk_usage ON galaxy_session USING btree (disk_usage);


--
-- Name: ix_galaxy_session_session_key; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_galaxy_session_session_key ON galaxy_session USING btree (session_key);


--
-- Name: ix_galaxy_session_to_history_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_session_to_history_history_id ON galaxy_session_to_history USING btree (history_id);


--
-- Name: ix_galaxy_session_to_history_session_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_session_to_history_session_id ON galaxy_session_to_history USING btree (session_id);


--
-- Name: ix_galaxy_session_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_session_user_id ON galaxy_session USING btree (user_id);


--
-- Name: ix_galaxy_user_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_deleted ON galaxy_user USING btree (deleted);


--
-- Name: ix_galaxy_user_disk_usage; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_disk_usage ON galaxy_user USING btree (disk_usage);


--
-- Name: ix_galaxy_user_email; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_email ON galaxy_user USING btree (email);


--
-- Name: ix_galaxy_user_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_form_values_id ON galaxy_user USING btree (form_values_id);


--
-- Name: ix_galaxy_user_openid_openid; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_galaxy_user_openid_openid ON galaxy_user_openid USING btree (openid);


--
-- Name: ix_galaxy_user_openid_session_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_openid_session_id ON galaxy_user_openid USING btree (session_id);


--
-- Name: ix_galaxy_user_openid_update_time; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_openid_update_time ON galaxy_user_openid USING btree (update_time);


--
-- Name: ix_galaxy_user_openid_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_openid_user_id ON galaxy_user_openid USING btree (user_id);


--
-- Name: ix_galaxy_user_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_purged ON galaxy_user USING btree (purged);


--
-- Name: ix_galaxy_user_username; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_galaxy_user_username ON galaxy_user USING btree (username);


--
-- Name: ix_genome_index_tool_data_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_genome_index_tool_data_dataset_id ON genome_index_tool_data USING btree (dataset_id);


--
-- Name: ix_genome_index_tool_data_deferred_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_genome_index_tool_data_deferred_job_id ON genome_index_tool_data USING btree (deferred_job_id);


--
-- Name: ix_genome_index_tool_data_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_genome_index_tool_data_job_id ON genome_index_tool_data USING btree (job_id);


--
-- Name: ix_genome_index_tool_data_transfer_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_genome_index_tool_data_transfer_job_id ON genome_index_tool_data USING btree (transfer_job_id);


--
-- Name: ix_genome_index_tool_data_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_genome_index_tool_data_user_id ON genome_index_tool_data USING btree (user_id);


--
-- Name: ix_group_quota_association_group_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_group_quota_association_group_id ON group_quota_association USING btree (group_id);


--
-- Name: ix_group_quota_association_quota_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_group_quota_association_quota_id ON group_quota_association USING btree (quota_id);


--
-- Name: ix_group_role_association_group_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_group_role_association_group_id ON group_role_association USING btree (group_id);


--
-- Name: ix_group_role_association_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_group_role_association_role_id ON group_role_association USING btree (role_id);


--
-- Name: ix_hda_copied_from_library_dataset_dataset_association_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_hda_copied_from_library_dataset_dataset_association_id ON history_dataset_association USING btree (copied_from_library_dataset_dataset_association_id);


--
-- Name: ix_hda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_hda_id ON history_dataset_association_subset USING btree (history_dataset_association_id);


--
-- Name: ix_hda_subset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_hda_subset_id ON history_dataset_association_subset USING btree (history_dataset_association_subset_id);


--
-- Name: ix_history_anno_assoc_annotation; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_anno_assoc_annotation ON history_annotation_association USING btree (annotation);


--
-- Name: ix_history_annotation_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_annotation_association_history_id ON history_annotation_association USING btree (history_id);


--
-- Name: ix_history_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_annotation_association_user_id ON history_annotation_association USING btree (user_id);


--
-- Name: ix_history_dataset_anno_assoc_annotation; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_anno_assoc_annotation ON history_dataset_association_annotation_association USING btree (annotation);


--
-- Name: ix_history_dataset_association_annotation_association_h_e624; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_annotation_association_h_e624 ON history_dataset_association_annotation_association USING btree (history_dataset_association_id);


--
-- Name: ix_history_dataset_association_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_annotation_association_user_id ON history_dataset_association_annotation_association USING btree (user_id);


--
-- Name: ix_history_dataset_association_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_dataset_id ON history_dataset_association USING btree (dataset_id);


--
-- Name: ix_history_dataset_association_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_deleted ON history_dataset_association USING btree (deleted);


--
-- Name: ix_history_dataset_association_display_at_authorization_9dc8; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_display_at_authorization_9dc8 ON history_dataset_association_display_at_authorization USING btree (update_time);


--
-- Name: ix_history_dataset_association_display_at_authorization_a293; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_display_at_authorization_a293 ON history_dataset_association_display_at_authorization USING btree (history_dataset_association_id);


--
-- Name: ix_history_dataset_association_display_at_authorization_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_display_at_authorization_user_id ON history_dataset_association_display_at_authorization USING btree (user_id);


--
-- Name: ix_history_dataset_association_history_extended_metadata_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_history_extended_metadata_id ON history_dataset_association_history USING btree (extended_metadata_id);


--
-- Name: ix_history_dataset_association_history_history_dataset__5f1c; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_history_history_dataset__5f1c ON history_dataset_association_history USING btree (history_dataset_association_id);


--
-- Name: ix_history_dataset_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_history_id ON history_dataset_association USING btree (history_id);


--
-- Name: ix_history_dataset_association_history_version; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_history_version ON history_dataset_association_history USING btree (version);


--
-- Name: ix_history_dataset_association_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_purged ON history_dataset_association USING btree (purged);


--
-- Name: ix_history_dataset_association_rating_association_histo_2052; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_rating_association_histo_2052 ON history_dataset_association_rating_association USING btree (history_dataset_association_id);


--
-- Name: ix_history_dataset_association_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_rating_association_rating ON history_dataset_association_rating_association USING btree (rating);


--
-- Name: ix_history_dataset_association_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_rating_association_user_id ON history_dataset_association_rating_association USING btree (user_id);


--
-- Name: ix_history_dataset_association_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_state ON history_dataset_association USING btree (state);


--
-- Name: ix_history_dataset_association_subset_location; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_subset_location ON history_dataset_association_subset USING btree (location);


--
-- Name: ix_history_dataset_association_tag_association_history__d2de; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_tag_association_history__d2de ON history_dataset_association_tag_association USING btree (history_dataset_association_id);


--
-- Name: ix_history_dataset_association_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_tag_association_tag_id ON history_dataset_association_tag_association USING btree (tag_id);


--
-- Name: ix_history_dataset_association_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_tag_association_user_id ON history_dataset_association_tag_association USING btree (user_id);


--
-- Name: ix_history_dataset_association_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_tag_association_user_tname ON history_dataset_association_tag_association USING btree (user_tname);


--
-- Name: ix_history_dataset_association_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_tag_association_user_value ON history_dataset_association_tag_association USING btree (user_value);


--
-- Name: ix_history_dataset_association_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_association_tag_association_value ON history_dataset_association_tag_association USING btree (value);


--
-- Name: ix_history_dataset_collection_annotation_association_hi_f516; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_annotation_association_hi_f516 ON history_dataset_collection_annotation_association USING btree (history_dataset_collection_id);


--
-- Name: ix_history_dataset_collection_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_annotation_association_user_id ON history_dataset_collection_annotation_association USING btree (user_id);


--
-- Name: ix_history_dataset_collection_association_collection_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_association_collection_id ON history_dataset_collection_association USING btree (collection_id);


--
-- Name: ix_history_dataset_collection_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_association_history_id ON history_dataset_collection_association USING btree (history_id);


--
-- Name: ix_history_dataset_collection_rating_association_histor_c7e9; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_rating_association_histor_c7e9 ON history_dataset_collection_rating_association USING btree (history_dataset_collection_id);


--
-- Name: ix_history_dataset_collection_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_rating_association_rating ON history_dataset_collection_rating_association USING btree (rating);


--
-- Name: ix_history_dataset_collection_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_rating_association_user_id ON history_dataset_collection_rating_association USING btree (user_id);


--
-- Name: ix_history_dataset_collection_tag_association_history_d_f807; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_tag_association_history_d_f807 ON history_dataset_collection_tag_association USING btree (history_dataset_collection_id);


--
-- Name: ix_history_dataset_collection_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_tag_association_tag_id ON history_dataset_collection_tag_association USING btree (tag_id);


--
-- Name: ix_history_dataset_collection_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_tag_association_user_id ON history_dataset_collection_tag_association USING btree (user_id);


--
-- Name: ix_history_dataset_collection_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_tag_association_user_tname ON history_dataset_collection_tag_association USING btree (user_tname);


--
-- Name: ix_history_dataset_collection_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_tag_association_user_value ON history_dataset_collection_tag_association USING btree (user_value);


--
-- Name: ix_history_dataset_collection_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_dataset_collection_tag_association_value ON history_dataset_collection_tag_association USING btree (value);


--
-- Name: ix_history_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_deleted ON history USING btree (deleted);


--
-- Name: ix_history_importable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_importable ON history USING btree (importable);


--
-- Name: ix_history_importing; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_importing ON history USING btree (importing);


--
-- Name: ix_history_published; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_published ON history USING btree (published);


--
-- Name: ix_history_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_purged ON history USING btree (purged);


--
-- Name: ix_history_rating_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_rating_association_history_id ON history_rating_association USING btree (history_id);


--
-- Name: ix_history_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_rating_association_rating ON history_rating_association USING btree (rating);


--
-- Name: ix_history_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_rating_association_user_id ON history_rating_association USING btree (user_id);


--
-- Name: ix_history_slug; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_slug ON history USING btree (slug);


--
-- Name: ix_history_tag_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_tag_association_history_id ON history_tag_association USING btree (history_id);


--
-- Name: ix_history_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_tag_association_tag_id ON history_tag_association USING btree (tag_id);


--
-- Name: ix_history_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_tag_association_user_id ON history_tag_association USING btree (user_id);


--
-- Name: ix_history_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_tag_association_user_tname ON history_tag_association USING btree (user_tname);


--
-- Name: ix_history_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_tag_association_user_value ON history_tag_association USING btree (user_value);


--
-- Name: ix_history_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_tag_association_value ON history_tag_association USING btree (value);


--
-- Name: ix_history_update_time; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_update_time ON history USING btree (update_time);


--
-- Name: ix_history_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_user_id ON history USING btree (user_id);


--
-- Name: ix_history_user_share_association_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_user_share_association_history_id ON history_user_share_association USING btree (history_id);


--
-- Name: ix_history_user_share_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_history_user_share_association_user_id ON history_user_share_association USING btree (user_id);


--
-- Name: ix_icda_ldda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_icda_ldda_id ON implicitly_converted_dataset_association USING btree (ldda_id);


--
-- Name: ix_icda_ldda_parent_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_icda_ldda_parent_id ON implicitly_converted_dataset_association USING btree (ldda_parent_id);


--
-- Name: ix_implicit_collection_jobs_job_association_implicit_co_ea04; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicit_collection_jobs_job_association_implicit_co_ea04 ON implicit_collection_jobs_job_association USING btree (implicit_collection_jobs_id);


--
-- Name: ix_implicit_collection_jobs_job_association_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicit_collection_jobs_job_association_job_id ON implicit_collection_jobs_job_association USING btree (job_id);


--
-- Name: ix_implicitly_converted_dataset_assoc_ldda_parent_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_converted_dataset_assoc_ldda_parent_id ON implicitly_converted_dataset_association USING btree (ldda_parent_id);


--
-- Name: ix_implicitly_converted_dataset_association_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_converted_dataset_association_deleted ON implicitly_converted_dataset_association USING btree (deleted);


--
-- Name: ix_implicitly_converted_dataset_association_hda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_converted_dataset_association_hda_id ON implicitly_converted_dataset_association USING btree (hda_id);


--
-- Name: ix_implicitly_converted_dataset_association_hda_parent_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_converted_dataset_association_hda_parent_id ON implicitly_converted_dataset_association USING btree (hda_parent_id);


--
-- Name: ix_implicitly_converted_dataset_association_metadata_safe; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_converted_dataset_association_metadata_safe ON implicitly_converted_dataset_association USING btree (metadata_safe);


--
-- Name: ix_implicitly_converted_ds_assoc_ldda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_converted_ds_assoc_ldda_id ON implicitly_converted_dataset_association USING btree (ldda_id);


--
-- Name: ix_implicitly_created_dataset_collection_inputs_dataset_5590; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_created_dataset_collection_inputs_dataset_5590 ON implicitly_created_dataset_collection_inputs USING btree (dataset_collection_id);


--
-- Name: ix_implicitly_created_dataset_collection_inputs_input_d_b5c7; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_implicitly_created_dataset_collection_inputs_input_d_b5c7 ON implicitly_created_dataset_collection_inputs USING btree (input_dataset_collection_id);


--
-- Name: ix_jeom_library_dataset_dataset_association_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_jeom_library_dataset_dataset_association_id ON job_external_output_metadata USING btree (library_dataset_dataset_association_id);


--
-- Name: ix_job_export_history_archive_compressed; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_export_history_archive_compressed ON job_export_history_archive USING btree (compressed);


--
-- Name: ix_job_export_history_archive_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_export_history_archive_dataset_id ON job_export_history_archive USING btree (dataset_id);


--
-- Name: ix_job_export_history_archive_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_export_history_archive_history_id ON job_export_history_archive USING btree (history_id);


--
-- Name: ix_job_export_history_archive_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_export_history_archive_job_id ON job_export_history_archive USING btree (job_id);


--
-- Name: ix_job_external_output_metadata_history_dataset_association_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_external_output_metadata_history_dataset_association_id ON job_external_output_metadata USING btree (history_dataset_association_id);


--
-- Name: ix_job_external_output_metadata_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_external_output_metadata_job_id ON job_external_output_metadata USING btree (job_id);


--
-- Name: ix_job_handler; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_handler ON job USING btree (handler);


--
-- Name: ix_job_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_history_id ON job USING btree (history_id);


--
-- Name: ix_job_import_history_archive_history_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_import_history_archive_history_id ON job_import_history_archive USING btree (history_id);


--
-- Name: ix_job_import_history_archive_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_import_history_archive_job_id ON job_import_history_archive USING btree (job_id);


--
-- Name: ix_job_imported; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_imported ON job USING btree (imported);


--
-- Name: ix_job_library_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_library_folder_id ON job USING btree (library_folder_id);


--
-- Name: ix_job_metric_numeric_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_metric_numeric_job_id ON job_metric_numeric USING btree (job_id);


--
-- Name: ix_job_metric_text_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_metric_text_job_id ON job_metric_text USING btree (job_id);


--
-- Name: ix_job_object_store_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_object_store_id ON job USING btree (object_store_id);


--
-- Name: ix_job_parameter_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_parameter_job_id ON job_parameter USING btree (job_id);


--
-- Name: ix_job_params; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_params ON job USING btree (params);


--
-- Name: ix_job_session_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_session_id ON job USING btree (session_id);


--
-- Name: ix_job_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_state ON job USING btree (state);


--
-- Name: ix_job_state_history_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_state_history_job_id ON job_state_history USING btree (job_id);


--
-- Name: ix_job_state_history_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_state_history_state ON job_state_history USING btree (state);


--
-- Name: ix_job_to_implicit_output_dataset_collection_dataset_co_c788; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_implicit_output_dataset_collection_dataset_co_c788 ON job_to_implicit_output_dataset_collection USING btree (dataset_collection_id);


--
-- Name: ix_job_to_implicit_output_dataset_collection_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_implicit_output_dataset_collection_job_id ON job_to_implicit_output_dataset_collection USING btree (job_id);


--
-- Name: ix_job_to_input_dataset_collection_dataset_collection_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_input_dataset_collection_dataset_collection_id ON job_to_input_dataset_collection USING btree (dataset_collection_id);


--
-- Name: ix_job_to_input_dataset_collection_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_input_dataset_collection_job_id ON job_to_input_dataset_collection USING btree (job_id);


--
-- Name: ix_job_to_input_dataset_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_input_dataset_dataset_id ON job_to_input_dataset USING btree (dataset_id);


--
-- Name: ix_job_to_input_dataset_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_input_dataset_job_id ON job_to_input_dataset USING btree (job_id);


--
-- Name: ix_job_to_input_library_dataset_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_input_library_dataset_job_id ON job_to_input_library_dataset USING btree (job_id);


--
-- Name: ix_job_to_input_library_dataset_ldda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_input_library_dataset_ldda_id ON job_to_input_library_dataset USING btree (ldda_id);


--
-- Name: ix_job_to_output_dataset_collection_dataset_collection_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_output_dataset_collection_dataset_collection_id ON job_to_output_dataset_collection USING btree (dataset_collection_id);


--
-- Name: ix_job_to_output_dataset_collection_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_output_dataset_collection_job_id ON job_to_output_dataset_collection USING btree (job_id);


--
-- Name: ix_job_to_output_dataset_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_output_dataset_dataset_id ON job_to_output_dataset USING btree (dataset_id);


--
-- Name: ix_job_to_output_dataset_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_output_dataset_job_id ON job_to_output_dataset USING btree (job_id);


--
-- Name: ix_job_to_output_library_dataset_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_output_library_dataset_job_id ON job_to_output_library_dataset USING btree (job_id);


--
-- Name: ix_job_to_output_library_dataset_ldda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_to_output_library_dataset_ldda_id ON job_to_output_library_dataset USING btree (ldda_id);


--
-- Name: ix_job_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_job_user_id ON job USING btree (user_id);


--
-- Name: ix_lddap_library_dataset_dataset_association_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_lddap_library_dataset_dataset_association_id ON library_dataset_dataset_association_permissions USING btree (library_dataset_dataset_association_id);


--
-- Name: ix_lddia_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_lddia_deleted ON library_dataset_dataset_info_association USING btree (deleted);


--
-- Name: ix_lfia_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_lfia_deleted ON library_folder_info_association USING btree (deleted);


--
-- Name: ix_lfia_inheritable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_lfia_inheritable ON library_folder_info_association USING btree (inheritable);


--
-- Name: ix_lia_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_lia_deleted ON library_info_association USING btree (deleted);


--
-- Name: ix_lia_inheritable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_lia_inheritable ON library_info_association USING btree (inheritable);


--
-- Name: ix_library_dataset_collection_annotation_association_li_8a3d; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_annotation_association_li_8a3d ON library_dataset_collection_annotation_association USING btree (library_dataset_collection_id);


--
-- Name: ix_library_dataset_collection_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_annotation_association_user_id ON library_dataset_collection_annotation_association USING btree (user_id);


--
-- Name: ix_library_dataset_collection_association_collection_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_association_collection_id ON library_dataset_collection_association USING btree (collection_id);


--
-- Name: ix_library_dataset_collection_association_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_association_folder_id ON library_dataset_collection_association USING btree (folder_id);


--
-- Name: ix_library_dataset_collection_rating_association_librar_877d; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_rating_association_librar_877d ON library_dataset_collection_rating_association USING btree (library_dataset_collection_id);


--
-- Name: ix_library_dataset_collection_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_rating_association_rating ON library_dataset_collection_rating_association USING btree (rating);


--
-- Name: ix_library_dataset_collection_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_rating_association_user_id ON library_dataset_collection_rating_association USING btree (user_id);


--
-- Name: ix_library_dataset_collection_tag_association_library_d_41b1; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_tag_association_library_d_41b1 ON library_dataset_collection_tag_association USING btree (library_dataset_collection_id);


--
-- Name: ix_library_dataset_collection_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_tag_association_tag_id ON library_dataset_collection_tag_association USING btree (tag_id);


--
-- Name: ix_library_dataset_collection_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_tag_association_user_id ON library_dataset_collection_tag_association USING btree (user_id);


--
-- Name: ix_library_dataset_collection_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_tag_association_user_tname ON library_dataset_collection_tag_association USING btree (user_tname);


--
-- Name: ix_library_dataset_collection_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_tag_association_user_value ON library_dataset_collection_tag_association USING btree (user_value);


--
-- Name: ix_library_dataset_collection_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_collection_tag_association_value ON library_dataset_collection_tag_association USING btree (value);


--
-- Name: ix_library_dataset_dataset_association_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_dataset_id ON library_dataset_dataset_association USING btree (dataset_id);


--
-- Name: ix_library_dataset_dataset_association_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_deleted ON library_dataset_dataset_association USING btree (deleted);


--
-- Name: ix_library_dataset_dataset_association_library_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_library_dataset_id ON library_dataset_dataset_association USING btree (library_dataset_id);


--
-- Name: ix_library_dataset_dataset_association_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_name ON library_dataset_dataset_association USING btree (name);


--
-- Name: ix_library_dataset_dataset_association_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_permissions_role_id ON library_dataset_dataset_association_permissions USING btree (role_id);


--
-- Name: ix_library_dataset_dataset_association_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_state ON library_dataset_dataset_association USING btree (state);


--
-- Name: ix_library_dataset_dataset_association_tag_association__087f; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_tag_association__087f ON library_dataset_dataset_association_tag_association USING btree (user_value);


--
-- Name: ix_library_dataset_dataset_association_tag_association__3501; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_tag_association__3501 ON library_dataset_dataset_association_tag_association USING btree (user_tname);


--
-- Name: ix_library_dataset_dataset_association_tag_association__f6fd; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_tag_association__f6fd ON library_dataset_dataset_association_tag_association USING btree (library_dataset_dataset_association_id);


--
-- Name: ix_library_dataset_dataset_association_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_tag_association_tag_id ON library_dataset_dataset_association_tag_association USING btree (tag_id);


--
-- Name: ix_library_dataset_dataset_association_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_tag_association_user_id ON library_dataset_dataset_association_tag_association USING btree (user_id);


--
-- Name: ix_library_dataset_dataset_association_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_tag_association_value ON library_dataset_dataset_association_tag_association USING btree (value);


--
-- Name: ix_library_dataset_dataset_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_association_user_id ON library_dataset_dataset_association USING btree (user_id);


--
-- Name: ix_library_dataset_dataset_info_association_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_info_association_deleted ON library_dataset_dataset_info_association USING btree (deleted);


--
-- Name: ix_library_dataset_dataset_info_association_form_definition_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_info_association_form_definition_id ON library_dataset_dataset_info_association USING btree (form_definition_id);


--
-- Name: ix_library_dataset_dataset_info_association_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_info_association_form_values_id ON library_dataset_dataset_info_association USING btree (form_values_id);


--
-- Name: ix_library_dataset_dataset_info_association_library_dat_ceca; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_dataset_info_association_library_dat_ceca ON library_dataset_dataset_info_association USING btree (library_dataset_dataset_association_id);


--
-- Name: ix_library_dataset_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_deleted ON library_dataset USING btree (deleted);


--
-- Name: ix_library_dataset_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_folder_id ON library_dataset USING btree (folder_id);


--
-- Name: ix_library_dataset_library_dataset_dataset_association_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_library_dataset_dataset_association_id ON library_dataset USING btree (library_dataset_dataset_association_id);


--
-- Name: ix_library_dataset_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_name ON library_dataset USING btree (name);


--
-- Name: ix_library_dataset_permissions_library_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_permissions_library_dataset_id ON library_dataset_permissions USING btree (library_dataset_id);


--
-- Name: ix_library_dataset_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_permissions_role_id ON library_dataset_permissions USING btree (role_id);


--
-- Name: ix_library_dataset_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_dataset_purged ON library_dataset USING btree (purged);


--
-- Name: ix_library_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_deleted ON library USING btree (deleted);


--
-- Name: ix_library_folder_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_deleted ON library_folder USING btree (deleted);


--
-- Name: ix_library_folder_info_association_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_info_association_deleted ON library_folder_info_association USING btree (deleted);


--
-- Name: ix_library_folder_info_association_form_definition_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_info_association_form_definition_id ON library_folder_info_association USING btree (form_definition_id);


--
-- Name: ix_library_folder_info_association_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_info_association_form_values_id ON library_folder_info_association USING btree (form_values_id);


--
-- Name: ix_library_folder_info_association_inheritable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_info_association_inheritable ON library_folder_info_association USING btree (inheritable);


--
-- Name: ix_library_folder_info_association_library_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_info_association_library_folder_id ON library_folder_info_association USING btree (library_folder_id);


--
-- Name: ix_library_folder_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_name ON library_folder USING btree (name);


--
-- Name: ix_library_folder_parent_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_parent_id ON library_folder USING btree (parent_id);


--
-- Name: ix_library_folder_permissions_library_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_permissions_library_folder_id ON library_folder_permissions USING btree (library_folder_id);


--
-- Name: ix_library_folder_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_permissions_role_id ON library_folder_permissions USING btree (role_id);


--
-- Name: ix_library_folder_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_folder_purged ON library_folder USING btree (purged);


--
-- Name: ix_library_info_association_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_info_association_deleted ON library_info_association USING btree (deleted);


--
-- Name: ix_library_info_association_form_definition_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_info_association_form_definition_id ON library_info_association USING btree (form_definition_id);


--
-- Name: ix_library_info_association_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_info_association_form_values_id ON library_info_association USING btree (form_values_id);


--
-- Name: ix_library_info_association_inheritable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_info_association_inheritable ON library_info_association USING btree (inheritable);


--
-- Name: ix_library_info_association_library_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_info_association_library_id ON library_info_association USING btree (library_id);


--
-- Name: ix_library_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_name ON library USING btree (name);


--
-- Name: ix_library_permissions_library_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_permissions_library_id ON library_permissions USING btree (library_id);


--
-- Name: ix_library_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_permissions_role_id ON library_permissions USING btree (role_id);


--
-- Name: ix_library_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_purged ON library USING btree (purged);


--
-- Name: ix_library_root_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_library_root_folder_id ON library USING btree (root_folder_id);


--
-- Name: ix_metadata_file_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_metadata_file_deleted ON metadata_file USING btree (deleted);


--
-- Name: ix_metadata_file_hda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_metadata_file_hda_id ON metadata_file USING btree (hda_id);


--
-- Name: ix_metadata_file_lda_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_metadata_file_lda_id ON metadata_file USING btree (lda_id);


--
-- Name: ix_metadata_file_object_store_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_metadata_file_object_store_id ON metadata_file USING btree (object_store_id);


--
-- Name: ix_metadata_file_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_metadata_file_purged ON metadata_file USING btree (purged);


--
-- Name: ix_metadata_file_update_time; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_metadata_file_update_time ON metadata_file USING btree (update_time);


--
-- Name: ix_oidc_user_authnz_tokens_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_oidc_user_authnz_tokens_user_id ON oidc_user_authnz_tokens USING btree (user_id);


--
-- Name: ix_page_annotation_association_annotation; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_annotation_association_annotation ON page_annotation_association USING btree (annotation);


--
-- Name: ix_page_annotation_association_page_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_annotation_association_page_id ON page_annotation_association USING btree (page_id);


--
-- Name: ix_page_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_annotation_association_user_id ON page_annotation_association USING btree (user_id);


--
-- Name: ix_page_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_deleted ON page USING btree (deleted);


--
-- Name: ix_page_importable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_importable ON page USING btree (importable);


--
-- Name: ix_page_latest_revision_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_latest_revision_id ON page USING btree (latest_revision_id);


--
-- Name: ix_page_published; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_published ON page USING btree (published);


--
-- Name: ix_page_rating_association_page_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_rating_association_page_id ON page_rating_association USING btree (page_id);


--
-- Name: ix_page_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_rating_association_rating ON page_rating_association USING btree (rating);


--
-- Name: ix_page_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_rating_association_user_id ON page_rating_association USING btree (user_id);


--
-- Name: ix_page_revision_page_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_revision_page_id ON page_revision USING btree (page_id);


--
-- Name: ix_page_slug; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_slug ON page USING btree (slug);


--
-- Name: ix_page_tag_association_page_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_tag_association_page_id ON page_tag_association USING btree (page_id);


--
-- Name: ix_page_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_tag_association_tag_id ON page_tag_association USING btree (tag_id);


--
-- Name: ix_page_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_tag_association_user_id ON page_tag_association USING btree (user_id);


--
-- Name: ix_page_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_tag_association_user_tname ON page_tag_association USING btree (user_tname);


--
-- Name: ix_page_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_tag_association_user_value ON page_tag_association USING btree (user_value);


--
-- Name: ix_page_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_tag_association_value ON page_tag_association USING btree (value);


--
-- Name: ix_page_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_user_id ON page USING btree (user_id);


--
-- Name: ix_page_user_share_association_page_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_user_share_association_page_id ON page_user_share_association USING btree (page_id);


--
-- Name: ix_page_user_share_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_page_user_share_association_user_id ON page_user_share_association USING btree (user_id);


--
-- Name: ix_password_reset_token_token; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_password_reset_token_token ON password_reset_token USING btree (token);


--
-- Name: ix_password_reset_token_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_password_reset_token_user_id ON password_reset_token USING btree (user_id);


--
-- Name: ix_post_job_action_association_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_post_job_action_association_job_id ON post_job_action_association USING btree (job_id);


--
-- Name: ix_post_job_action_association_post_job_action_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_post_job_action_association_post_job_action_id ON post_job_action_association USING btree (post_job_action_id);


--
-- Name: ix_post_job_action_workflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_post_job_action_workflow_step_id ON post_job_action USING btree (workflow_step_id);


--
-- Name: ix_quota_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_quota_deleted ON quota USING btree (deleted);


--
-- Name: ix_quota_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_quota_name ON quota USING btree (name);


--
-- Name: ix_repository_dependency_tool_shed_repository_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_repository_dependency_tool_shed_repository_id ON repository_dependency USING btree (tool_shed_repository_id);


--
-- Name: ix_repository_repository_dependency_association_reposit_c823; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_repository_repository_dependency_association_reposit_c823 ON repository_repository_dependency_association USING btree (repository_dependency_id);


--
-- Name: ix_repository_repository_dependency_association_tool_sh_0af8; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_repository_repository_dependency_association_tool_sh_0af8 ON repository_repository_dependency_association USING btree (tool_shed_repository_id);


--
-- Name: ix_request_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_deleted ON request USING btree (deleted);


--
-- Name: ix_request_event_request_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_event_request_id ON request_event USING btree (request_id);


--
-- Name: ix_request_event_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_event_state ON request_event USING btree (state);


--
-- Name: ix_request_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_form_values_id ON request USING btree (form_values_id);


--
-- Name: ix_request_notification; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_notification ON request USING btree (notification);


--
-- Name: ix_request_request_type_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_request_type_id ON request USING btree (request_type_id);


--
-- Name: ix_request_type_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_deleted ON request_type USING btree (deleted);


--
-- Name: ix_request_type_external_service_association_external_s_e501; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_external_service_association_external_s_e501 ON request_type_external_service_association USING btree (external_service_id);


--
-- Name: ix_request_type_external_service_association_request_type_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_external_service_association_request_type_id ON request_type_external_service_association USING btree (request_type_id);


--
-- Name: ix_request_type_permissions_request_type_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_permissions_request_type_id ON request_type_permissions USING btree (request_type_id);


--
-- Name: ix_request_type_permissions_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_permissions_role_id ON request_type_permissions USING btree (role_id);


--
-- Name: ix_request_type_request_form_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_request_form_id ON request_type USING btree (request_form_id);


--
-- Name: ix_request_type_run_association_request_type_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_run_association_request_type_id ON request_type_run_association USING btree (request_type_id);


--
-- Name: ix_request_type_run_association_run_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_run_association_run_id ON request_type_run_association USING btree (run_id);


--
-- Name: ix_request_type_sample_form_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_type_sample_form_id ON request_type USING btree (sample_form_id);


--
-- Name: ix_request_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_request_user_id ON request USING btree (user_id);


--
-- Name: ix_role_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_role_deleted ON role USING btree (deleted);


--
-- Name: ix_role_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE UNIQUE INDEX ix_role_name ON role USING btree (name);


--
-- Name: ix_role_type; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_role_type ON role USING btree (type);


--
-- Name: ix_run_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_run_deleted ON run USING btree (deleted);


--
-- Name: ix_run_form_definition_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_run_form_definition_id ON run USING btree (form_definition_id);


--
-- Name: ix_run_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_run_form_values_id ON run USING btree (form_values_id);


--
-- Name: ix_run_subindex; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_run_subindex ON run USING btree (subindex);


--
-- Name: ix_sample_bar_code; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_bar_code ON sample USING btree (bar_code);


--
-- Name: ix_sample_dataset_external_service_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_dataset_external_service_id ON sample_dataset USING btree (external_service_id);


--
-- Name: ix_sample_dataset_sample_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_dataset_sample_id ON sample_dataset USING btree (sample_id);


--
-- Name: ix_sample_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_deleted ON sample USING btree (deleted);


--
-- Name: ix_sample_event_sample_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_event_sample_id ON sample_event USING btree (sample_id);


--
-- Name: ix_sample_event_sample_state_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_event_sample_state_id ON sample_event USING btree (sample_state_id);


--
-- Name: ix_sample_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_folder_id ON sample USING btree (folder_id);


--
-- Name: ix_sample_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_form_values_id ON sample USING btree (form_values_id);


--
-- Name: ix_sample_library_folder_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_library_folder_id ON sample USING btree (folder_id);


--
-- Name: ix_sample_library_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_library_id ON sample USING btree (library_id);


--
-- Name: ix_sample_request_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_request_id ON sample USING btree (request_id);


--
-- Name: ix_sample_run_association_run_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_run_association_run_id ON sample_run_association USING btree (run_id);


--
-- Name: ix_sample_run_association_sample_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_run_association_sample_id ON sample_run_association USING btree (sample_id);


--
-- Name: ix_sample_state_request_type_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sample_state_request_type_id ON sample_state USING btree (request_type_id);


--
-- Name: ix_sd_external_service_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sd_external_service_id ON sample_dataset USING btree (external_service_id);


--
-- Name: ix_sequencer_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sequencer_deleted ON external_service USING btree (deleted);


--
-- Name: ix_sequencer_form_definition_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sequencer_form_definition_id ON external_service USING btree (form_definition_id);


--
-- Name: ix_sequencer_form_values_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_sequencer_form_values_id ON external_service USING btree (form_values_id);


--
-- Name: ix_stored_workflow_ann_assoc_annotation; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_ann_assoc_annotation ON stored_workflow_annotation_association USING btree (annotation);


--
-- Name: ix_stored_workflow_annotation_association_stored_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_annotation_association_stored_workflow_id ON stored_workflow_annotation_association USING btree (stored_workflow_id);


--
-- Name: ix_stored_workflow_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_annotation_association_user_id ON stored_workflow_annotation_association USING btree (user_id);


--
-- Name: ix_stored_workflow_latest_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_latest_workflow_id ON stored_workflow USING btree (latest_workflow_id);


--
-- Name: ix_stored_workflow_menu_entry_stored_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_menu_entry_stored_workflow_id ON stored_workflow_menu_entry USING btree (stored_workflow_id);


--
-- Name: ix_stored_workflow_menu_entry_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_menu_entry_user_id ON stored_workflow_menu_entry USING btree (user_id);


--
-- Name: ix_stored_workflow_published; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_published ON stored_workflow USING btree (published);


--
-- Name: ix_stored_workflow_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_rating_association_rating ON stored_workflow_rating_association USING btree (rating);


--
-- Name: ix_stored_workflow_rating_association_stored_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_rating_association_stored_workflow_id ON stored_workflow_rating_association USING btree (stored_workflow_id);


--
-- Name: ix_stored_workflow_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_rating_association_user_id ON stored_workflow_rating_association USING btree (user_id);


--
-- Name: ix_stored_workflow_slug; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_slug ON stored_workflow USING btree (slug);


--
-- Name: ix_stored_workflow_tag_association_stored_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_tag_association_stored_workflow_id ON stored_workflow_tag_association USING btree (stored_workflow_id);


--
-- Name: ix_stored_workflow_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_tag_association_tag_id ON stored_workflow_tag_association USING btree (tag_id);


--
-- Name: ix_stored_workflow_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_tag_association_user_id ON stored_workflow_tag_association USING btree (user_id);


--
-- Name: ix_stored_workflow_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_tag_association_user_tname ON stored_workflow_tag_association USING btree (user_tname);


--
-- Name: ix_stored_workflow_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_tag_association_user_value ON stored_workflow_tag_association USING btree (user_value);


--
-- Name: ix_stored_workflow_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_tag_association_value ON stored_workflow_tag_association USING btree (value);


--
-- Name: ix_stored_workflow_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_user_id ON stored_workflow USING btree (user_id);


--
-- Name: ix_stored_workflow_user_share_connection_stored_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_user_share_connection_stored_workflow_id ON stored_workflow_user_share_connection USING btree (stored_workflow_id);


--
-- Name: ix_stored_workflow_user_share_connection_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_stored_workflow_user_share_connection_user_id ON stored_workflow_user_share_connection USING btree (user_id);


--
-- Name: ix_task_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_task_job_id ON task USING btree (job_id);


--
-- Name: ix_task_metric_numeric_task_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_task_metric_numeric_task_id ON task_metric_numeric USING btree (task_id);


--
-- Name: ix_task_metric_text_task_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_task_metric_text_task_id ON task_metric_text USING btree (task_id);


--
-- Name: ix_task_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_task_state ON task USING btree (state);


--
-- Name: ix_tool_dependency_tool_shed_repository_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_dependency_tool_shed_repository_id ON tool_dependency USING btree (tool_shed_repository_id);


--
-- Name: ix_tool_shed_repository_changeset_revision; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_shed_repository_changeset_revision ON tool_shed_repository USING btree (changeset_revision);


--
-- Name: ix_tool_shed_repository_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_shed_repository_deleted ON tool_shed_repository USING btree (deleted);


--
-- Name: ix_tool_shed_repository_includes_datatypes; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_shed_repository_includes_datatypes ON tool_shed_repository USING btree (includes_datatypes);


--
-- Name: ix_tool_shed_repository_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_shed_repository_name ON tool_shed_repository USING btree (name);


--
-- Name: ix_tool_shed_repository_owner; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_shed_repository_owner ON tool_shed_repository USING btree (owner);


--
-- Name: ix_tool_shed_repository_tool_shed; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_shed_repository_tool_shed ON tool_shed_repository USING btree (tool_shed);


--
-- Name: ix_tool_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_tag_association_tag_id ON tool_tag_association USING btree (tag_id);


--
-- Name: ix_tool_tag_association_tool_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_tag_association_tool_id ON tool_tag_association USING btree (tool_id);


--
-- Name: ix_tool_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_tag_association_user_id ON tool_tag_association USING btree (user_id);


--
-- Name: ix_tool_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_tag_association_user_tname ON tool_tag_association USING btree (user_tname);


--
-- Name: ix_tool_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_tag_association_user_value ON tool_tag_association USING btree (user_value);


--
-- Name: ix_tool_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_tag_association_value ON tool_tag_association USING btree (value);


--
-- Name: ix_tool_version_association_parent_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_version_association_parent_id ON tool_version_association USING btree (parent_id);


--
-- Name: ix_tool_version_association_tool_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_version_association_tool_id ON tool_version_association USING btree (tool_id);


--
-- Name: ix_tool_version_tool_shed_repository_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tool_version_tool_shed_repository_id ON tool_version USING btree (tool_shed_repository_id);


--
-- Name: ix_transfer_job_state; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_transfer_job_state ON transfer_job USING btree (state);


--
-- Name: ix_tsr_includes_datatypes; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_tsr_includes_datatypes ON tool_shed_repository USING btree (includes_datatypes);


--
-- Name: ix_user_action_session_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_action_session_id ON user_action USING btree (session_id);


--
-- Name: ix_user_action_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_action_user_id ON user_action USING btree (user_id);


--
-- Name: ix_user_address_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_address_deleted ON user_address USING btree (deleted);


--
-- Name: ix_user_address_purged; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_address_purged ON user_address USING btree (purged);


--
-- Name: ix_user_address_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_address_user_id ON user_address USING btree (user_id);


--
-- Name: ix_user_group_association_group_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_group_association_group_id ON user_group_association USING btree (group_id);


--
-- Name: ix_user_group_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_group_association_user_id ON user_group_association USING btree (user_id);


--
-- Name: ix_user_preference_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_preference_name ON user_preference USING btree (name);


--
-- Name: ix_user_preference_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_preference_user_id ON user_preference USING btree (user_id);


--
-- Name: ix_user_quota_association_quota_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_quota_association_quota_id ON user_quota_association USING btree (quota_id);


--
-- Name: ix_user_quota_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_quota_association_user_id ON user_quota_association USING btree (user_id);


--
-- Name: ix_user_role_association_role_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_role_association_role_id ON user_role_association USING btree (role_id);


--
-- Name: ix_user_role_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_user_role_association_user_id ON user_role_association USING btree (user_id);


--
-- Name: ix_validation_error_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_validation_error_dataset_id ON validation_error USING btree (dataset_id);


--
-- Name: ix_visualization_annotation_association_annotation; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_annotation_association_annotation ON visualization_annotation_association USING btree (annotation);


--
-- Name: ix_visualization_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_annotation_association_user_id ON visualization_annotation_association USING btree (user_id);


--
-- Name: ix_visualization_annotation_association_visualization_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_annotation_association_visualization_id ON visualization_annotation_association USING btree (visualization_id);


--
-- Name: ix_visualization_dbkey; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_dbkey ON visualization USING btree (dbkey);


--
-- Name: ix_visualization_deleted; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_deleted ON visualization USING btree (deleted);


--
-- Name: ix_visualization_importable; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_importable ON visualization USING btree (importable);


--
-- Name: ix_visualization_latest_revision_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_latest_revision_id ON visualization USING btree (latest_revision_id);


--
-- Name: ix_visualization_published; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_published ON visualization USING btree (published);


--
-- Name: ix_visualization_rating_association_rating; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_rating_association_rating ON visualization_rating_association USING btree (rating);


--
-- Name: ix_visualization_rating_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_rating_association_user_id ON visualization_rating_association USING btree (user_id);


--
-- Name: ix_visualization_rating_association_visualization_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_rating_association_visualization_id ON visualization_rating_association USING btree (visualization_id);


--
-- Name: ix_visualization_revision_dbkey; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_revision_dbkey ON visualization_revision USING btree (dbkey);


--
-- Name: ix_visualization_revision_visualization_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_revision_visualization_id ON visualization_revision USING btree (visualization_id);


--
-- Name: ix_visualization_slug; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_slug ON visualization USING btree (slug);


--
-- Name: ix_visualization_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_tag_association_tag_id ON visualization_tag_association USING btree (tag_id);


--
-- Name: ix_visualization_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_tag_association_user_id ON visualization_tag_association USING btree (user_id);


--
-- Name: ix_visualization_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_tag_association_user_tname ON visualization_tag_association USING btree (user_tname);


--
-- Name: ix_visualization_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_tag_association_user_value ON visualization_tag_association USING btree (user_value);


--
-- Name: ix_visualization_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_tag_association_value ON visualization_tag_association USING btree (value);


--
-- Name: ix_visualization_tag_association_visualization_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_tag_association_visualization_id ON visualization_tag_association USING btree (visualization_id);


--
-- Name: ix_visualization_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_user_id ON visualization USING btree (user_id);


--
-- Name: ix_visualization_user_share_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_user_share_association_user_id ON visualization_user_share_association USING btree (user_id);


--
-- Name: ix_visualization_user_share_association_visualization_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_visualization_user_share_association_visualization_id ON visualization_user_share_association USING btree (visualization_id);


--
-- Name: ix_wfinv_swfinv_swfi; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_wfinv_swfinv_swfi ON workflow_invocation_to_subworkflow_invocation_association USING btree (subworkflow_invocation_id);


--
-- Name: ix_wfinv_swfinv_wfi; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_wfinv_swfinv_wfi ON workflow_invocation_to_subworkflow_invocation_association USING btree (workflow_invocation_id);


--
-- Name: ix_wfreq_inputstep_wfi; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_wfreq_inputstep_wfi ON workflow_request_input_step_parameter USING btree (workflow_invocation_id);


--
-- Name: ix_worker_process_server_name; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_worker_process_server_name ON worker_process USING btree (server_name);


--
-- Name: ix_workflow_invocation_output_dataset_association_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_output_dataset_association_dataset_id ON workflow_invocation_output_dataset_association USING btree (dataset_id);


--
-- Name: ix_workflow_invocation_output_dataset_association_workf_5924; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_output_dataset_association_workf_5924 ON workflow_invocation_output_dataset_association USING btree (workflow_invocation_id);


--
-- Name: ix_workflow_invocation_output_dataset_collection_associ_ab6c; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_output_dataset_collection_associ_ab6c ON workflow_invocation_output_dataset_collection_association USING btree (workflow_invocation_id);


--
-- Name: ix_workflow_invocation_output_dataset_collection_associ_ec97; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_output_dataset_collection_associ_ec97 ON workflow_invocation_output_dataset_collection_association USING btree (dataset_collection_id);


--
-- Name: ix_workflow_invocation_step_job_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_job_id ON workflow_invocation_step USING btree (job_id);


--
-- Name: ix_workflow_invocation_step_output_dataset_association__66f5; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_output_dataset_association__66f5 ON workflow_invocation_step_output_dataset_association USING btree (dataset_id);


--
-- Name: ix_workflow_invocation_step_output_dataset_association__bcc0; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_output_dataset_association__bcc0 ON workflow_invocation_step_output_dataset_association USING btree (workflow_invocation_step_id);


--
-- Name: ix_workflow_invocation_step_output_dataset_collection_a_b73b; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_output_dataset_collection_a_b73b ON workflow_invocation_step_output_dataset_collection_association USING btree (dataset_collection_id);


--
-- Name: ix_workflow_invocation_step_output_dataset_collection_a_db49; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_output_dataset_collection_a_db49 ON workflow_invocation_step_output_dataset_collection_association USING btree (workflow_invocation_step_id);


--
-- Name: ix_workflow_invocation_step_workflow_invocation_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_workflow_invocation_id ON workflow_invocation_step USING btree (workflow_invocation_id);


--
-- Name: ix_workflow_invocation_step_workflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_step_workflow_step_id ON workflow_invocation_step USING btree (workflow_step_id);


--
-- Name: ix_workflow_invocation_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_invocation_workflow_id ON workflow_invocation USING btree (workflow_id);


--
-- Name: ix_workflow_output_workflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_output_workflow_step_id ON workflow_output USING btree (workflow_step_id);


--
-- Name: ix_workflow_request_to_input_collection_dataset_dataset_4671; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_request_to_input_collection_dataset_dataset_4671 ON workflow_request_to_input_collection_dataset USING btree (dataset_collection_id);


--
-- Name: ix_workflow_request_to_input_collection_dataset_workflo_7564; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_request_to_input_collection_dataset_workflo_7564 ON workflow_request_to_input_collection_dataset USING btree (workflow_invocation_id);


--
-- Name: ix_workflow_request_to_input_dataset_dataset_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_request_to_input_dataset_dataset_id ON workflow_request_to_input_dataset USING btree (dataset_id);


--
-- Name: ix_workflow_request_to_input_dataset_workflow_invocation_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_request_to_input_dataset_workflow_invocation_id ON workflow_request_to_input_dataset USING btree (workflow_invocation_id);


--
-- Name: ix_workflow_step_ann_assoc_annotation; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_ann_assoc_annotation ON workflow_step_annotation_association USING btree (annotation);


--
-- Name: ix_workflow_step_annotation_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_annotation_association_user_id ON workflow_step_annotation_association USING btree (user_id);


--
-- Name: ix_workflow_step_annotation_association_workflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_annotation_association_workflow_step_id ON workflow_step_annotation_association USING btree (workflow_step_id);


--
-- Name: ix_workflow_step_connection_input_step_input_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_connection_input_step_input_id ON workflow_step_connection USING btree (input_step_input_id);


--
-- Name: ix_workflow_step_connection_input_subworkflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_connection_input_subworkflow_step_id ON workflow_step_connection USING btree (input_subworkflow_step_id);


--
-- Name: ix_workflow_step_connection_output_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_connection_output_step_id ON workflow_step_connection USING btree (output_step_id);


--
-- Name: ix_workflow_step_input_workflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_input_workflow_step_id ON workflow_step_input USING btree (workflow_step_id);


--
-- Name: ix_workflow_step_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_tag_association_tag_id ON workflow_step_tag_association USING btree (tag_id);


--
-- Name: ix_workflow_step_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_tag_association_user_id ON workflow_step_tag_association USING btree (user_id);


--
-- Name: ix_workflow_step_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_tag_association_user_tname ON workflow_step_tag_association USING btree (user_tname);


--
-- Name: ix_workflow_step_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_tag_association_user_value ON workflow_step_tag_association USING btree (user_value);


--
-- Name: ix_workflow_step_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_tag_association_value ON workflow_step_tag_association USING btree (value);


--
-- Name: ix_workflow_step_tag_association_workflow_step_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_tag_association_workflow_step_id ON workflow_step_tag_association USING btree (workflow_step_id);


--
-- Name: ix_workflow_step_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_step_workflow_id ON workflow_step USING btree (workflow_id);


--
-- Name: ix_workflow_stored_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_stored_workflow_id ON workflow USING btree (stored_workflow_id);


--
-- Name: ix_workflow_tag_association_tag_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_tag_association_tag_id ON workflow_tag_association USING btree (tag_id);


--
-- Name: ix_workflow_tag_association_user_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_tag_association_user_id ON workflow_tag_association USING btree (user_id);


--
-- Name: ix_workflow_tag_association_user_tname; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_tag_association_user_tname ON workflow_tag_association USING btree (user_tname);


--
-- Name: ix_workflow_tag_association_user_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_tag_association_user_value ON workflow_tag_association USING btree (user_value);


--
-- Name: ix_workflow_tag_association_value; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_tag_association_value ON workflow_tag_association USING btree (value);


--
-- Name: ix_workflow_tag_association_workflow_id; Type: INDEX; Schema: public; Owner: __GALAXY_DB_USER__; Tablespace: 
--

CREATE INDEX ix_workflow_tag_association_workflow_id ON workflow_tag_association USING btree (workflow_id);


--
-- Name: api_keys_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY api_keys
    ADD CONSTRAINT api_keys_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: cleanup_event_dataset_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_dataset_association
    ADD CONSTRAINT cleanup_event_dataset_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_dataset_association_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_dataset_association
    ADD CONSTRAINT cleanup_event_dataset_association_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: cleanup_event_hda_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_hda_association
    ADD CONSTRAINT cleanup_event_hda_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_hda_association_hda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_hda_association
    ADD CONSTRAINT cleanup_event_hda_association_hda_id_fkey FOREIGN KEY (hda_id) REFERENCES history_dataset_association(id);


--
-- Name: cleanup_event_history_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_history_association
    ADD CONSTRAINT cleanup_event_history_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_history_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_history_association
    ADD CONSTRAINT cleanup_event_history_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: cleanup_event_icda_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_icda_association
    ADD CONSTRAINT cleanup_event_icda_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_icda_association_icda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_icda_association
    ADD CONSTRAINT cleanup_event_icda_association_icda_id_fkey FOREIGN KEY (icda_id) REFERENCES implicitly_converted_dataset_association(id);


--
-- Name: cleanup_event_ldda_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_ldda_association
    ADD CONSTRAINT cleanup_event_ldda_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_ldda_association_ldda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_ldda_association
    ADD CONSTRAINT cleanup_event_ldda_association_ldda_id_fkey FOREIGN KEY (ldda_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: cleanup_event_library_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_association
    ADD CONSTRAINT cleanup_event_library_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_library_association_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_association
    ADD CONSTRAINT cleanup_event_library_association_library_id_fkey FOREIGN KEY (library_id) REFERENCES library(id);


--
-- Name: cleanup_event_library_dataset_associati_library_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_dataset_association
    ADD CONSTRAINT cleanup_event_library_dataset_associati_library_dataset_id_fkey FOREIGN KEY (library_dataset_id) REFERENCES library_dataset(id);


--
-- Name: cleanup_event_library_dataset_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_dataset_association
    ADD CONSTRAINT cleanup_event_library_dataset_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_library_folder_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_folder_association
    ADD CONSTRAINT cleanup_event_library_folder_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_library_folder_association_library_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_library_folder_association
    ADD CONSTRAINT cleanup_event_library_folder_association_library_folder_id_fkey FOREIGN KEY (library_folder_id) REFERENCES library_folder(id);


--
-- Name: cleanup_event_metadata_file_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_metadata_file_association
    ADD CONSTRAINT cleanup_event_metadata_file_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_metadata_file_association_metadata_file_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_metadata_file_association
    ADD CONSTRAINT cleanup_event_metadata_file_association_metadata_file_id_fkey FOREIGN KEY (metadata_file_id) REFERENCES metadata_file(id);


--
-- Name: cleanup_event_user_association_cleanup_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_user_association
    ADD CONSTRAINT cleanup_event_user_association_cleanup_event_id_fkey FOREIGN KEY (cleanup_event_id) REFERENCES cleanup_event(id);


--
-- Name: cleanup_event_user_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cleanup_event_user_association
    ADD CONSTRAINT cleanup_event_user_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: cloudauthz_authn_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cloudauthz
    ADD CONSTRAINT cloudauthz_authn_id_fkey FOREIGN KEY (authn_id) REFERENCES oidc_user_authnz_tokens(id);


--
-- Name: cloudauthz_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY cloudauthz
    ADD CONSTRAINT cloudauthz_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: custos_authnz_token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY custos_authnz_token
    ADD CONSTRAINT custos_authnz_token_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: data_manager_history_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY data_manager_history_association
    ADD CONSTRAINT data_manager_history_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: data_manager_history_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY data_manager_history_association
    ADD CONSTRAINT data_manager_history_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: data_manager_job_association_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY data_manager_job_association
    ADD CONSTRAINT data_manager_job_association_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: dataset_collection_element_child_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_collection_element
    ADD CONSTRAINT dataset_collection_element_child_collection_id_fkey FOREIGN KEY (child_collection_id) REFERENCES dataset_collection(id);


--
-- Name: dataset_collection_element_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_collection_element
    ADD CONSTRAINT dataset_collection_element_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES dataset_collection(id);


--
-- Name: dataset_collection_element_hda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_collection_element
    ADD CONSTRAINT dataset_collection_element_hda_id_fkey FOREIGN KEY (hda_id) REFERENCES history_dataset_association(id);


--
-- Name: dataset_collection_element_ldda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_collection_element
    ADD CONSTRAINT dataset_collection_element_ldda_id_fkey FOREIGN KEY (ldda_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: dataset_hash_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_hash
    ADD CONSTRAINT dataset_hash_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: dataset_permissions_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_permissions
    ADD CONSTRAINT dataset_permissions_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: dataset_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_permissions
    ADD CONSTRAINT dataset_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: dataset_source_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_source
    ADD CONSTRAINT dataset_source_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: dataset_source_hash_dataset_source_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_source_hash
    ADD CONSTRAINT dataset_source_hash_dataset_source_id_fkey FOREIGN KEY (dataset_source_id) REFERENCES dataset_source(id);


--
-- Name: dataset_tag_association_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_tag_association
    ADD CONSTRAINT dataset_tag_association_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: dataset_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY dataset_tag_association
    ADD CONSTRAINT dataset_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: default_history_permissions_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_history_permissions
    ADD CONSTRAINT default_history_permissions_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: default_history_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_history_permissions
    ADD CONSTRAINT default_history_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: default_quota_association_quota_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_quota_association
    ADD CONSTRAINT default_quota_association_quota_id_fkey FOREIGN KEY (quota_id) REFERENCES quota(id);


--
-- Name: default_user_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_user_permissions
    ADD CONSTRAINT default_user_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: default_user_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY default_user_permissions
    ADD CONSTRAINT default_user_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: event_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: event_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_session_id_fkey FOREIGN KEY (session_id) REFERENCES galaxy_session(id);


--
-- Name: event_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: extended_metadata_index_extended_metadata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY extended_metadata_index
    ADD CONSTRAINT extended_metadata_index_extended_metadata_id_fkey FOREIGN KEY (extended_metadata_id) REFERENCES extended_metadata(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: fk_wfi_swi_swi; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_to_subworkflow_invocation_association
    ADD CONSTRAINT fk_wfi_swi_swi FOREIGN KEY (subworkflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: fk_wfi_swi_wfi; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_to_subworkflow_invocation_association
    ADD CONSTRAINT fk_wfi_swi_wfi FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: fk_wfi_swi_ws; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_to_subworkflow_invocation_association
    ADD CONSTRAINT fk_wfi_swi_ws FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: fk_wfreq_isp_wfi; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_input_step_parameter
    ADD CONSTRAINT fk_wfreq_isp_wfi FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: fk_wfreq_isp_ws; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_input_step_parameter
    ADD CONSTRAINT fk_wfreq_isp_ws FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: form_definition_current_latest_form_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY form_definition_current
    ADD CONSTRAINT form_definition_current_latest_form_id_fk FOREIGN KEY (latest_form_id) REFERENCES form_definition(id);


--
-- Name: form_definition_form_definition_current_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY form_definition
    ADD CONSTRAINT form_definition_form_definition_current_id_fkey FOREIGN KEY (form_definition_current_id) REFERENCES form_definition_current(id);


--
-- Name: form_values_form_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY form_values
    ADD CONSTRAINT form_values_form_definition_id_fkey FOREIGN KEY (form_definition_id) REFERENCES form_definition(id);


--
-- Name: galaxy_session_current_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_session
    ADD CONSTRAINT galaxy_session_current_history_id_fkey FOREIGN KEY (current_history_id) REFERENCES history(id);


--
-- Name: galaxy_session_to_history_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_session_to_history
    ADD CONSTRAINT galaxy_session_to_history_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: galaxy_session_to_history_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_session_to_history
    ADD CONSTRAINT galaxy_session_to_history_session_id_fkey FOREIGN KEY (session_id) REFERENCES galaxy_session(id);


--
-- Name: galaxy_session_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_session
    ADD CONSTRAINT galaxy_session_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: galaxy_user_openid_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_user_openid
    ADD CONSTRAINT galaxy_user_openid_session_id_fkey FOREIGN KEY (session_id) REFERENCES galaxy_session(id);


--
-- Name: galaxy_user_openid_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_user_openid
    ADD CONSTRAINT galaxy_user_openid_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: genome_index_tool_data_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY genome_index_tool_data
    ADD CONSTRAINT genome_index_tool_data_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: genome_index_tool_data_deferred_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY genome_index_tool_data
    ADD CONSTRAINT genome_index_tool_data_deferred_job_id_fkey FOREIGN KEY (deferred_job_id) REFERENCES deferred_job(id);


--
-- Name: genome_index_tool_data_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY genome_index_tool_data
    ADD CONSTRAINT genome_index_tool_data_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: genome_index_tool_data_transfer_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY genome_index_tool_data
    ADD CONSTRAINT genome_index_tool_data_transfer_job_id_fkey FOREIGN KEY (transfer_job_id) REFERENCES transfer_job(id);


--
-- Name: genome_index_tool_data_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY genome_index_tool_data
    ADD CONSTRAINT genome_index_tool_data_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: group_quota_association_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY group_quota_association
    ADD CONSTRAINT group_quota_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES galaxy_group(id);


--
-- Name: group_quota_association_quota_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY group_quota_association
    ADD CONSTRAINT group_quota_association_quota_id_fkey FOREIGN KEY (quota_id) REFERENCES quota(id);


--
-- Name: group_role_association_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY group_role_association
    ADD CONSTRAINT group_role_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES galaxy_group(id);


--
-- Name: group_role_association_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY group_role_association
    ADD CONSTRAINT group_role_association_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: history_annotation_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_annotation_association
    ADD CONSTRAINT history_annotation_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: history_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_annotation_association
    ADD CONSTRAINT history_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_association__history_dataset_association__fkey1; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_subset
    ADD CONSTRAINT history_dataset_association__history_dataset_association__fkey1 FOREIGN KEY (history_dataset_association_subset_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_a_history_dataset_association__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_annotation_association
    ADD CONSTRAINT history_dataset_association_a_history_dataset_association__fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_annotation_association
    ADD CONSTRAINT history_dataset_association_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_association_copied_from_history_dataset_as_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_copied_from_history_dataset_as_fkey FOREIGN KEY (copied_from_history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_copied_from_library_dataset_da_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_copied_from_library_dataset_da_fkey FOREIGN KEY (copied_from_library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: history_dataset_association_d_history_dataset_association__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_display_at_authorization
    ADD CONSTRAINT history_dataset_association_d_history_dataset_association__fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: history_dataset_association_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT history_dataset_association_dataset_id_fkey FOREIGN KEY (copied_from_history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_display_at_authorizati_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_display_at_authorization
    ADD CONSTRAINT history_dataset_association_display_at_authorizati_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_association_extended_metadata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_extended_metadata_id_fkey FOREIGN KEY (extended_metadata_id) REFERENCES extended_metadata(id);


--
-- Name: history_dataset_association_h_history_dataset_association__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_history
    ADD CONSTRAINT history_dataset_association_h_history_dataset_association__fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_hidden_beneath_collection_inst_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_hidden_beneath_collection_inst_fkey FOREIGN KEY (hidden_beneath_collection_instance_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: history_dataset_association_history_extended_metadata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_history
    ADD CONSTRAINT history_dataset_association_history_extended_metadata_id_fkey FOREIGN KEY (extended_metadata_id) REFERENCES extended_metadata(id);


--
-- Name: history_dataset_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: history_dataset_association_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association
    ADD CONSTRAINT history_dataset_association_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_r_history_dataset_association__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_rating_association
    ADD CONSTRAINT history_dataset_association_r_history_dataset_association__fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_rating_association
    ADD CONSTRAINT history_dataset_association_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_association_s_history_dataset_association__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_subset
    ADD CONSTRAINT history_dataset_association_s_history_dataset_association__fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_t_history_dataset_association__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_tag_association
    ADD CONSTRAINT history_dataset_association_t_history_dataset_association__fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: history_dataset_association_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_tag_association
    ADD CONSTRAINT history_dataset_association_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: history_dataset_association_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_association_tag_association
    ADD CONSTRAINT history_dataset_association_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_collection_an_history_dataset_collection_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_annotation_association
    ADD CONSTRAINT history_dataset_collection_an_history_dataset_collection_i_fkey FOREIGN KEY (history_dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: history_dataset_collection_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_annotation_association
    ADD CONSTRAINT history_dataset_collection_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_collection_as_copied_from_history_dataset__fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_association
    ADD CONSTRAINT history_dataset_collection_as_copied_from_history_dataset__fkey FOREIGN KEY (copied_from_history_dataset_collection_association_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: history_dataset_collection_ass_implicit_collection_jobs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_association
    ADD CONSTRAINT history_dataset_collection_ass_implicit_collection_jobs_id_fkey FOREIGN KEY (implicit_collection_jobs_id) REFERENCES implicit_collection_jobs(id);


--
-- Name: history_dataset_collection_association_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_association
    ADD CONSTRAINT history_dataset_collection_association_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES dataset_collection(id);


--
-- Name: history_dataset_collection_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_association
    ADD CONSTRAINT history_dataset_collection_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: history_dataset_collection_association_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_association
    ADD CONSTRAINT history_dataset_collection_association_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: history_dataset_collection_ra_history_dataset_collection_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_rating_association
    ADD CONSTRAINT history_dataset_collection_ra_history_dataset_collection_i_fkey FOREIGN KEY (history_dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: history_dataset_collection_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_rating_association
    ADD CONSTRAINT history_dataset_collection_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_dataset_collection_ta_history_dataset_collection_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_tag_association
    ADD CONSTRAINT history_dataset_collection_ta_history_dataset_collection_i_fkey FOREIGN KEY (history_dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: history_dataset_collection_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_tag_association
    ADD CONSTRAINT history_dataset_collection_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: history_dataset_collection_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_dataset_collection_tag_association
    ADD CONSTRAINT history_dataset_collection_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_rating_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_rating_association
    ADD CONSTRAINT history_rating_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: history_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_rating_association
    ADD CONSTRAINT history_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_tag_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_tag_association
    ADD CONSTRAINT history_tag_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: history_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_tag_association
    ADD CONSTRAINT history_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: history_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_tag_association
    ADD CONSTRAINT history_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history
    ADD CONSTRAINT history_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: history_user_share_association_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_user_share_association
    ADD CONSTRAINT history_user_share_association_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: history_user_share_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY history_user_share_association
    ADD CONSTRAINT history_user_share_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: implicit_collection_jobs_job_a_implicit_collection_jobs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicit_collection_jobs_job_association
    ADD CONSTRAINT implicit_collection_jobs_job_a_implicit_collection_jobs_id_fkey FOREIGN KEY (implicit_collection_jobs_id) REFERENCES implicit_collection_jobs(id);


--
-- Name: implicit_collection_jobs_job_association_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicit_collection_jobs_job_association
    ADD CONSTRAINT implicit_collection_jobs_job_association_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: implicitly_converted_dataset_association_hda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_converted_dataset_association
    ADD CONSTRAINT implicitly_converted_dataset_association_hda_id_fkey FOREIGN KEY (hda_id) REFERENCES history_dataset_association(id);


--
-- Name: implicitly_converted_dataset_association_hda_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_converted_dataset_association
    ADD CONSTRAINT implicitly_converted_dataset_association_hda_parent_id_fkey FOREIGN KEY (hda_parent_id) REFERENCES history_dataset_association(id);


--
-- Name: implicitly_converted_dataset_association_ldda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_converted_dataset_association
    ADD CONSTRAINT implicitly_converted_dataset_association_ldda_id_fkey FOREIGN KEY (ldda_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: implicitly_converted_dataset_association_ldda_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_converted_dataset_association
    ADD CONSTRAINT implicitly_converted_dataset_association_ldda_parent_id_fkey FOREIGN KEY (ldda_parent_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: implicitly_created_dataset_col_input_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_created_dataset_collection_inputs
    ADD CONSTRAINT implicitly_created_dataset_col_input_dataset_collection_id_fkey FOREIGN KEY (input_dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: implicitly_created_dataset_collectio_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY implicitly_created_dataset_collection_inputs
    ADD CONSTRAINT implicitly_created_dataset_collectio_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: job_dynamic_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_dynamic_tool_id_fkey FOREIGN KEY (dynamic_tool_id) REFERENCES dynamic_tool(id);


--
-- Name: job_export_history_archive_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_export_history_archive
    ADD CONSTRAINT job_export_history_archive_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: job_export_history_archive_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_export_history_archive
    ADD CONSTRAINT job_export_history_archive_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: job_export_history_archive_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_export_history_archive
    ADD CONSTRAINT job_export_history_archive_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_external_output_metadata_history_dataset_association_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_external_output_metadata
    ADD CONSTRAINT job_external_output_metadata_history_dataset_association_i_fkey FOREIGN KEY (history_dataset_association_id) REFERENCES history_dataset_association(id);


--
-- Name: job_external_output_metadata_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_external_output_metadata
    ADD CONSTRAINT job_external_output_metadata_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_external_output_metadata_library_dataset_dataset_assoc_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_external_output_metadata
    ADD CONSTRAINT job_external_output_metadata_library_dataset_dataset_assoc_fkey FOREIGN KEY (library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: job_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: job_import_history_archive_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_import_history_archive
    ADD CONSTRAINT job_import_history_archive_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: job_import_history_archive_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_import_history_archive
    ADD CONSTRAINT job_import_history_archive_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_library_folder_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_library_folder_id_fk FOREIGN KEY (library_folder_id) REFERENCES library_folder(id);


--
-- Name: job_metric_numeric_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_metric_numeric
    ADD CONSTRAINT job_metric_numeric_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_metric_text_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_metric_text
    ADD CONSTRAINT job_metric_text_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_parameter_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_parameter
    ADD CONSTRAINT job_parameter_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_session_id_fkey FOREIGN KEY (session_id) REFERENCES galaxy_session(id);


--
-- Name: job_state_history_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_state_history
    ADD CONSTRAINT job_state_history_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_implicit_output_dataset_colle_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_implicit_output_dataset_collection
    ADD CONSTRAINT job_to_implicit_output_dataset_colle_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES dataset_collection(id);


--
-- Name: job_to_implicit_output_dataset_collection_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_implicit_output_dataset_collection
    ADD CONSTRAINT job_to_implicit_output_dataset_collection_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_input_dataset_collection_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_dataset_collection
    ADD CONSTRAINT job_to_input_dataset_collection_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: job_to_input_dataset_collection_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_dataset_collection
    ADD CONSTRAINT job_to_input_dataset_collection_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_input_dataset_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_dataset
    ADD CONSTRAINT job_to_input_dataset_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES history_dataset_association(id);


--
-- Name: job_to_input_dataset_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_dataset
    ADD CONSTRAINT job_to_input_dataset_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_input_library_dataset_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_library_dataset
    ADD CONSTRAINT job_to_input_library_dataset_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_input_library_dataset_ldda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_input_library_dataset
    ADD CONSTRAINT job_to_input_library_dataset_ldda_id_fkey FOREIGN KEY (ldda_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: job_to_output_dataset_collection_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_dataset_collection
    ADD CONSTRAINT job_to_output_dataset_collection_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: job_to_output_dataset_collection_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_dataset_collection
    ADD CONSTRAINT job_to_output_dataset_collection_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_output_dataset_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_dataset
    ADD CONSTRAINT job_to_output_dataset_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES history_dataset_association(id);


--
-- Name: job_to_output_dataset_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_dataset
    ADD CONSTRAINT job_to_output_dataset_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_output_library_dataset_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_library_dataset
    ADD CONSTRAINT job_to_output_library_dataset_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: job_to_output_library_dataset_ldda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job_to_output_library_dataset
    ADD CONSTRAINT job_to_output_library_dataset_ldda_id_fkey FOREIGN KEY (ldda_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: job_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY job
    ADD CONSTRAINT job_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: library_dataset_collection_an_library_dataset_collection_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_annotation_association
    ADD CONSTRAINT library_dataset_collection_an_library_dataset_collection_i_fkey FOREIGN KEY (library_dataset_collection_id) REFERENCES library_dataset_collection_association(id);


--
-- Name: library_dataset_collection_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_annotation_association
    ADD CONSTRAINT library_dataset_collection_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: library_dataset_collection_association_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_association
    ADD CONSTRAINT library_dataset_collection_association_collection_id_fkey FOREIGN KEY (collection_id) REFERENCES dataset_collection(id);


--
-- Name: library_dataset_collection_association_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_association
    ADD CONSTRAINT library_dataset_collection_association_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES library_folder(id);


--
-- Name: library_dataset_collection_ra_library_dataset_collection_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_rating_association
    ADD CONSTRAINT library_dataset_collection_ra_library_dataset_collection_i_fkey FOREIGN KEY (library_dataset_collection_id) REFERENCES library_dataset_collection_association(id);


--
-- Name: library_dataset_collection_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_rating_association
    ADD CONSTRAINT library_dataset_collection_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: library_dataset_collection_ta_library_dataset_collection_i_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_tag_association
    ADD CONSTRAINT library_dataset_collection_ta_library_dataset_collection_i_fkey FOREIGN KEY (library_dataset_collection_id) REFERENCES library_dataset_collection_association(id);


--
-- Name: library_dataset_collection_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_tag_association
    ADD CONSTRAINT library_dataset_collection_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: library_dataset_collection_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_collection_tag_association
    ADD CONSTRAINT library_dataset_collection_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: library_dataset_dataset_asso_library_dataset_dataset_asso_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_tag_association
    ADD CONSTRAINT library_dataset_dataset_asso_library_dataset_dataset_asso_fkey1 FOREIGN KEY (library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: library_dataset_dataset_assoc_library_dataset_dataset_asso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_permissions
    ADD CONSTRAINT library_dataset_dataset_assoc_library_dataset_dataset_asso_fkey FOREIGN KEY (library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: library_dataset_dataset_association_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES dataset(id);


--
-- Name: library_dataset_dataset_association_extended_metadata_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_extended_metadata_id_fkey FOREIGN KEY (extended_metadata_id) REFERENCES extended_metadata(id);


--
-- Name: library_dataset_dataset_association_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset
    ADD CONSTRAINT library_dataset_dataset_association_id_fk FOREIGN KEY (library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: library_dataset_dataset_association_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_id_fkey FOREIGN KEY (copied_from_library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: library_dataset_dataset_association_library_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_library_dataset_id_fkey FOREIGN KEY (library_dataset_id) REFERENCES library_dataset(id);


--
-- Name: library_dataset_dataset_association_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: library_dataset_dataset_association_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_permissions
    ADD CONSTRAINT library_dataset_dataset_association_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: library_dataset_dataset_association_tag_associatio_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_tag_association
    ADD CONSTRAINT library_dataset_dataset_association_tag_associatio_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: library_dataset_dataset_association_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association_tag_association
    ADD CONSTRAINT library_dataset_dataset_association_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: library_dataset_dataset_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_association
    ADD CONSTRAINT library_dataset_dataset_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: library_dataset_dataset_info__library_dataset_dataset_asso_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_info_association
    ADD CONSTRAINT library_dataset_dataset_info__library_dataset_dataset_asso_fkey FOREIGN KEY (library_dataset_dataset_association_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: library_dataset_dataset_info_associatio_form_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_info_association
    ADD CONSTRAINT library_dataset_dataset_info_associatio_form_definition_id_fkey FOREIGN KEY (form_definition_id) REFERENCES form_definition(id);


--
-- Name: library_dataset_dataset_info_association_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_dataset_info_association
    ADD CONSTRAINT library_dataset_dataset_info_association_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: library_dataset_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset
    ADD CONSTRAINT library_dataset_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES library_folder(id);


--
-- Name: library_dataset_permissions_library_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_permissions
    ADD CONSTRAINT library_dataset_permissions_library_dataset_id_fkey FOREIGN KEY (library_dataset_id) REFERENCES library_dataset(id);


--
-- Name: library_dataset_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_dataset_permissions
    ADD CONSTRAINT library_dataset_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: library_folder_info_association_form_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_info_association
    ADD CONSTRAINT library_folder_info_association_form_definition_id_fkey FOREIGN KEY (form_definition_id) REFERENCES form_definition(id);


--
-- Name: library_folder_info_association_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_info_association
    ADD CONSTRAINT library_folder_info_association_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: library_folder_info_association_library_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_info_association
    ADD CONSTRAINT library_folder_info_association_library_folder_id_fkey FOREIGN KEY (library_folder_id) REFERENCES library_folder(id);


--
-- Name: library_folder_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder
    ADD CONSTRAINT library_folder_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES library_folder(id);


--
-- Name: library_folder_permissions_library_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_permissions
    ADD CONSTRAINT library_folder_permissions_library_folder_id_fkey FOREIGN KEY (library_folder_id) REFERENCES library_folder(id);


--
-- Name: library_folder_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_folder_permissions
    ADD CONSTRAINT library_folder_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: library_info_association_form_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_info_association
    ADD CONSTRAINT library_info_association_form_definition_id_fkey FOREIGN KEY (form_definition_id) REFERENCES form_definition(id);


--
-- Name: library_info_association_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_info_association
    ADD CONSTRAINT library_info_association_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: library_info_association_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_info_association
    ADD CONSTRAINT library_info_association_library_id_fkey FOREIGN KEY (library_id) REFERENCES library(id);


--
-- Name: library_permissions_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_permissions
    ADD CONSTRAINT library_permissions_library_id_fkey FOREIGN KEY (library_id) REFERENCES library(id);


--
-- Name: library_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library_permissions
    ADD CONSTRAINT library_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: library_root_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY library
    ADD CONSTRAINT library_root_folder_id_fkey FOREIGN KEY (root_folder_id) REFERENCES library_folder(id);


--
-- Name: metadata_file_hda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY metadata_file
    ADD CONSTRAINT metadata_file_hda_id_fkey FOREIGN KEY (hda_id) REFERENCES history_dataset_association(id);


--
-- Name: metadata_file_lda_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY metadata_file
    ADD CONSTRAINT metadata_file_lda_id_fkey FOREIGN KEY (lda_id) REFERENCES library_dataset_dataset_association(id);


--
-- Name: oidc_user_authnz_tokens_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY oidc_user_authnz_tokens
    ADD CONSTRAINT oidc_user_authnz_tokens_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: page_annotation_association_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_annotation_association
    ADD CONSTRAINT page_annotation_association_page_id_fkey FOREIGN KEY (page_id) REFERENCES page(id);


--
-- Name: page_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_annotation_association
    ADD CONSTRAINT page_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: page_rating_association_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_rating_association
    ADD CONSTRAINT page_rating_association_page_id_fkey FOREIGN KEY (page_id) REFERENCES page(id);


--
-- Name: page_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_rating_association
    ADD CONSTRAINT page_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: page_revision_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_revision
    ADD CONSTRAINT page_revision_page_id_fkey FOREIGN KEY (page_id) REFERENCES page(id);


--
-- Name: page_tag_association_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_tag_association
    ADD CONSTRAINT page_tag_association_page_id_fkey FOREIGN KEY (page_id) REFERENCES page(id);


--
-- Name: page_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_tag_association
    ADD CONSTRAINT page_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: page_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_tag_association
    ADD CONSTRAINT page_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: page_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page
    ADD CONSTRAINT page_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: page_user_share_association_page_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_user_share_association
    ADD CONSTRAINT page_user_share_association_page_id_fkey FOREIGN KEY (page_id) REFERENCES page(id);


--
-- Name: page_user_share_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY page_user_share_association
    ADD CONSTRAINT page_user_share_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: password_reset_token_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY password_reset_token
    ADD CONSTRAINT password_reset_token_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: post_job_action_association_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY post_job_action_association
    ADD CONSTRAINT post_job_action_association_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: post_job_action_association_post_job_action_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY post_job_action_association
    ADD CONSTRAINT post_job_action_association_post_job_action_id_fkey FOREIGN KEY (post_job_action_id) REFERENCES post_job_action(id);


--
-- Name: post_job_action_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY post_job_action
    ADD CONSTRAINT post_job_action_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: repository_dependency_tool_shed_repository_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY repository_dependency
    ADD CONSTRAINT repository_dependency_tool_shed_repository_id_fkey FOREIGN KEY (tool_shed_repository_id) REFERENCES tool_shed_repository(id);


--
-- Name: repository_repository_dependency__repository_dependency_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY repository_repository_dependency_association
    ADD CONSTRAINT repository_repository_dependency__repository_dependency_id_fkey FOREIGN KEY (repository_dependency_id) REFERENCES repository_dependency(id);


--
-- Name: repository_repository_dependency_a_tool_shed_repository_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY repository_repository_dependency_association
    ADD CONSTRAINT repository_repository_dependency_a_tool_shed_repository_id_fkey FOREIGN KEY (tool_shed_repository_id) REFERENCES tool_shed_repository(id);


--
-- Name: request_event_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_event
    ADD CONSTRAINT request_event_request_id_fkey FOREIGN KEY (request_id) REFERENCES request(id);


--
-- Name: request_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: request_request_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_request_type_id_fkey FOREIGN KEY (request_type_id) REFERENCES request_type(id);


--
-- Name: request_type_external_service_associat_external_service_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_external_service_association
    ADD CONSTRAINT request_type_external_service_associat_external_service_id_fkey FOREIGN KEY (external_service_id) REFERENCES external_service(id);


--
-- Name: request_type_external_service_association_request_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_external_service_association
    ADD CONSTRAINT request_type_external_service_association_request_type_id_fkey FOREIGN KEY (request_type_id) REFERENCES request_type(id);


--
-- Name: request_type_permissions_request_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_permissions
    ADD CONSTRAINT request_type_permissions_request_type_id_fkey FOREIGN KEY (request_type_id) REFERENCES request_type(id);


--
-- Name: request_type_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_permissions
    ADD CONSTRAINT request_type_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: request_type_request_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type
    ADD CONSTRAINT request_type_request_form_id_fkey FOREIGN KEY (request_form_id) REFERENCES form_definition(id);


--
-- Name: request_type_run_association_request_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_run_association
    ADD CONSTRAINT request_type_run_association_request_type_id_fkey FOREIGN KEY (request_type_id) REFERENCES request_type(id);


--
-- Name: request_type_run_association_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type_run_association
    ADD CONSTRAINT request_type_run_association_run_id_fkey FOREIGN KEY (run_id) REFERENCES run(id);


--
-- Name: request_type_sample_form_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request_type
    ADD CONSTRAINT request_type_sample_form_id_fkey FOREIGN KEY (sample_form_id) REFERENCES form_definition(id);


--
-- Name: request_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY request
    ADD CONSTRAINT request_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: run_form_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY run
    ADD CONSTRAINT run_form_definition_id_fkey FOREIGN KEY (form_definition_id) REFERENCES form_definition(id);


--
-- Name: run_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY run
    ADD CONSTRAINT run_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: sample_dataset_external_services_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_dataset
    ADD CONSTRAINT sample_dataset_external_services_id_fk FOREIGN KEY (external_service_id) REFERENCES external_service(id);


--
-- Name: sample_dataset_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_dataset
    ADD CONSTRAINT sample_dataset_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES sample(id);


--
-- Name: sample_event_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_event
    ADD CONSTRAINT sample_event_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES sample(id);


--
-- Name: sample_event_sample_state_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_event
    ADD CONSTRAINT sample_event_sample_state_id_fkey FOREIGN KEY (sample_state_id) REFERENCES sample_state(id);


--
-- Name: sample_folder_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_folder_id_fkey FOREIGN KEY (folder_id) REFERENCES library_folder(id);


--
-- Name: sample_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: sample_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: sample_library_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_library_id_fkey FOREIGN KEY (library_id) REFERENCES library(id);


--
-- Name: sample_request_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample
    ADD CONSTRAINT sample_request_id_fkey FOREIGN KEY (request_id) REFERENCES request(id);


--
-- Name: sample_run_association_run_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_run_association
    ADD CONSTRAINT sample_run_association_run_id_fkey FOREIGN KEY (run_id) REFERENCES run(id);


--
-- Name: sample_run_association_sample_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_run_association
    ADD CONSTRAINT sample_run_association_sample_id_fkey FOREIGN KEY (sample_id) REFERENCES sample(id);


--
-- Name: sample_state_request_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY sample_state
    ADD CONSTRAINT sample_state_request_type_id_fkey FOREIGN KEY (request_type_id) REFERENCES request_type(id);


--
-- Name: sequencer_form_definition_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY external_service
    ADD CONSTRAINT sequencer_form_definition_id_fkey FOREIGN KEY (form_definition_id) REFERENCES form_definition(id);


--
-- Name: sequencer_form_values_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY external_service
    ADD CONSTRAINT sequencer_form_values_id_fkey FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: stored_workflow_annotation_association_stored_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_annotation_association
    ADD CONSTRAINT stored_workflow_annotation_association_stored_workflow_id_fkey FOREIGN KEY (stored_workflow_id) REFERENCES stored_workflow(id);


--
-- Name: stored_workflow_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_annotation_association
    ADD CONSTRAINT stored_workflow_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: stored_workflow_latest_workflow_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow
    ADD CONSTRAINT stored_workflow_latest_workflow_id_fk FOREIGN KEY (latest_workflow_id) REFERENCES workflow(id);


--
-- Name: stored_workflow_menu_entry_stored_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_menu_entry
    ADD CONSTRAINT stored_workflow_menu_entry_stored_workflow_id_fkey FOREIGN KEY (stored_workflow_id) REFERENCES stored_workflow(id);


--
-- Name: stored_workflow_menu_entry_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_menu_entry
    ADD CONSTRAINT stored_workflow_menu_entry_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: stored_workflow_rating_association_stored_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_rating_association
    ADD CONSTRAINT stored_workflow_rating_association_stored_workflow_id_fkey FOREIGN KEY (stored_workflow_id) REFERENCES stored_workflow(id);


--
-- Name: stored_workflow_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_rating_association
    ADD CONSTRAINT stored_workflow_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: stored_workflow_tag_association_stored_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_tag_association
    ADD CONSTRAINT stored_workflow_tag_association_stored_workflow_id_fkey FOREIGN KEY (stored_workflow_id) REFERENCES stored_workflow(id);


--
-- Name: stored_workflow_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_tag_association
    ADD CONSTRAINT stored_workflow_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: stored_workflow_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_tag_association
    ADD CONSTRAINT stored_workflow_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: stored_workflow_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow
    ADD CONSTRAINT stored_workflow_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: stored_workflow_user_share_connection_stored_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_user_share_connection
    ADD CONSTRAINT stored_workflow_user_share_connection_stored_workflow_id_fkey FOREIGN KEY (stored_workflow_id) REFERENCES stored_workflow(id);


--
-- Name: stored_workflow_user_share_connection_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY stored_workflow_user_share_connection
    ADD CONSTRAINT stored_workflow_user_share_connection_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: tag_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tag
    ADD CONSTRAINT tag_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES tag(id);


--
-- Name: task_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY task
    ADD CONSTRAINT task_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: task_metric_numeric_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY task_metric_numeric
    ADD CONSTRAINT task_metric_numeric_task_id_fkey FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: task_metric_text_task_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY task_metric_text
    ADD CONSTRAINT task_metric_text_task_id_fkey FOREIGN KEY (task_id) REFERENCES task(id);


--
-- Name: tool_dependency_tool_shed_repository_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_dependency
    ADD CONSTRAINT tool_dependency_tool_shed_repository_id_fkey FOREIGN KEY (tool_shed_repository_id) REFERENCES tool_shed_repository(id);


--
-- Name: tool_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_tag_association
    ADD CONSTRAINT tool_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: tool_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_tag_association
    ADD CONSTRAINT tool_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: tool_version_association_parent_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_version_association
    ADD CONSTRAINT tool_version_association_parent_id_fkey FOREIGN KEY (parent_id) REFERENCES tool_version(id);


--
-- Name: tool_version_association_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_version_association
    ADD CONSTRAINT tool_version_association_tool_id_fkey FOREIGN KEY (tool_id) REFERENCES tool_version(id);


--
-- Name: tool_version_tool_shed_repository_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY tool_version
    ADD CONSTRAINT tool_version_tool_shed_repository_id_fkey FOREIGN KEY (tool_shed_repository_id) REFERENCES tool_shed_repository(id);


--
-- Name: user_action_session_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_action
    ADD CONSTRAINT user_action_session_id_fkey FOREIGN KEY (session_id) REFERENCES galaxy_session(id);


--
-- Name: user_action_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_action
    ADD CONSTRAINT user_action_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: user_address_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_address
    ADD CONSTRAINT user_address_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: user_form_values_id_fk; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY galaxy_user
    ADD CONSTRAINT user_form_values_id_fk FOREIGN KEY (form_values_id) REFERENCES form_values(id);


--
-- Name: user_group_association_group_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_group_association
    ADD CONSTRAINT user_group_association_group_id_fkey FOREIGN KEY (group_id) REFERENCES galaxy_group(id);


--
-- Name: user_group_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_group_association
    ADD CONSTRAINT user_group_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: user_preference_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_preference
    ADD CONSTRAINT user_preference_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: user_quota_association_quota_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_quota_association
    ADD CONSTRAINT user_quota_association_quota_id_fkey FOREIGN KEY (quota_id) REFERENCES quota(id);


--
-- Name: user_quota_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_quota_association
    ADD CONSTRAINT user_quota_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: user_role_association_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_role_association
    ADD CONSTRAINT user_role_association_role_id_fkey FOREIGN KEY (role_id) REFERENCES role(id);


--
-- Name: user_role_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY user_role_association
    ADD CONSTRAINT user_role_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: validation_error_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY validation_error
    ADD CONSTRAINT validation_error_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES history_dataset_association(id);


--
-- Name: visualization_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_annotation_association
    ADD CONSTRAINT visualization_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: visualization_annotation_association_visualization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_annotation_association
    ADD CONSTRAINT visualization_annotation_association_visualization_id_fkey FOREIGN KEY (visualization_id) REFERENCES visualization(id);


--
-- Name: visualization_rating_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_rating_association
    ADD CONSTRAINT visualization_rating_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: visualization_rating_association_visualization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_rating_association
    ADD CONSTRAINT visualization_rating_association_visualization_id_fkey FOREIGN KEY (visualization_id) REFERENCES visualization(id);


--
-- Name: visualization_revision_visualization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_revision
    ADD CONSTRAINT visualization_revision_visualization_id_fkey FOREIGN KEY (visualization_id) REFERENCES visualization(id);


--
-- Name: visualization_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_tag_association
    ADD CONSTRAINT visualization_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: visualization_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_tag_association
    ADD CONSTRAINT visualization_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: visualization_tag_association_visualization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_tag_association
    ADD CONSTRAINT visualization_tag_association_visualization_id_fkey FOREIGN KEY (visualization_id) REFERENCES visualization(id);


--
-- Name: visualization_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization
    ADD CONSTRAINT visualization_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: visualization_user_share_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_user_share_association
    ADD CONSTRAINT visualization_user_share_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: visualization_user_share_association_visualization_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY visualization_user_share_association
    ADD CONSTRAINT visualization_user_share_association_visualization_id_fkey FOREIGN KEY (visualization_id) REFERENCES visualization(id);


--
-- Name: workflow_invocation_history_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation
    ADD CONSTRAINT workflow_invocation_history_id_fkey FOREIGN KEY (history_id) REFERENCES history(id);


--
-- Name: workflow_invocation_output_dataset__workflow_invocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_association
    ADD CONSTRAINT workflow_invocation_output_dataset__workflow_invocation_id_fkey FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: workflow_invocation_output_dataset_asso_workflow_output_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_association
    ADD CONSTRAINT workflow_invocation_output_dataset_asso_workflow_output_id_fkey FOREIGN KEY (workflow_output_id) REFERENCES workflow_output(id);


--
-- Name: workflow_invocation_output_dataset_associ_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_association
    ADD CONSTRAINT workflow_invocation_output_dataset_associ_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_invocation_output_dataset_association_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_association
    ADD CONSTRAINT workflow_invocation_output_dataset_association_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES history_dataset_association(id);


--
-- Name: workflow_invocation_output_dataset_c_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_output_dataset_c_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: workflow_invocation_output_dataset_coll_workflow_output_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_output_dataset_coll_workflow_output_id_fkey FOREIGN KEY (workflow_output_id) REFERENCES workflow_output(id);


--
-- Name: workflow_invocation_output_dataset_collec_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_output_dataset_collec_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_invocation_output_dataset_workflow_invocation_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_output_dataset_workflow_invocation_id_fkey1 FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: workflow_invocation_step_implicit_collection_jobs_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step
    ADD CONSTRAINT workflow_invocation_step_implicit_collection_jobs_id_fkey FOREIGN KEY (implicit_collection_jobs_id) REFERENCES implicit_collection_jobs(id);


--
-- Name: workflow_invocation_step_job_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step
    ADD CONSTRAINT workflow_invocation_step_job_id_fkey FOREIGN KEY (job_id) REFERENCES job(id);


--
-- Name: workflow_invocation_step_outp_workflow_invocation_step_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_step_outp_workflow_invocation_step_id_fkey1 FOREIGN KEY (workflow_invocation_step_id) REFERENCES workflow_invocation_step(id);


--
-- Name: workflow_invocation_step_outpu_workflow_invocation_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_association
    ADD CONSTRAINT workflow_invocation_step_outpu_workflow_invocation_step_id_fkey FOREIGN KEY (workflow_invocation_step_id) REFERENCES workflow_invocation_step(id);


--
-- Name: workflow_invocation_step_output_data_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_step_output_data_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: workflow_invocation_step_output_dataset_associa_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_association
    ADD CONSTRAINT workflow_invocation_step_output_dataset_associa_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES history_dataset_association(id);


--
-- Name: workflow_invocation_step_output_dataset_c_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step_output_dataset_collection_association
    ADD CONSTRAINT workflow_invocation_step_output_dataset_c_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_invocation_step_workflow_invocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step
    ADD CONSTRAINT workflow_invocation_step_workflow_invocation_id_fkey FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: workflow_invocation_step_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation_step
    ADD CONSTRAINT workflow_invocation_step_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_invocation_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_invocation
    ADD CONSTRAINT workflow_invocation_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES workflow(id);


--
-- Name: workflow_output_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_output
    ADD CONSTRAINT workflow_output_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_parent_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow
    ADD CONSTRAINT workflow_parent_workflow_id_fkey FOREIGN KEY (parent_workflow_id) REFERENCES workflow(id);


--
-- Name: workflow_request_input_parameters_workflow_invocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_input_parameters
    ADD CONSTRAINT workflow_request_input_parameters_workflow_invocation_id_fkey FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: workflow_request_step_states_workflow_invocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_step_states
    ADD CONSTRAINT workflow_request_step_states_workflow_invocation_id_fkey FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: workflow_request_step_states_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_step_states
    ADD CONSTRAINT workflow_request_step_states_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_request_to_input_collectio_workflow_invocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_collection_dataset
    ADD CONSTRAINT workflow_request_to_input_collectio_workflow_invocation_id_fkey FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: workflow_request_to_input_collection_data_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_collection_dataset
    ADD CONSTRAINT workflow_request_to_input_collection_data_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_request_to_input_collection_dataset_collection_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_collection_dataset
    ADD CONSTRAINT workflow_request_to_input_collection_dataset_collection_id_fkey FOREIGN KEY (dataset_collection_id) REFERENCES history_dataset_collection_association(id);


--
-- Name: workflow_request_to_input_dataset_dataset_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_dataset
    ADD CONSTRAINT workflow_request_to_input_dataset_dataset_id_fkey FOREIGN KEY (dataset_id) REFERENCES history_dataset_association(id);


--
-- Name: workflow_request_to_input_dataset_workflow_invocation_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_dataset
    ADD CONSTRAINT workflow_request_to_input_dataset_workflow_invocation_id_fkey FOREIGN KEY (workflow_invocation_id) REFERENCES workflow_invocation(id);


--
-- Name: workflow_request_to_input_dataset_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_request_to_input_dataset
    ADD CONSTRAINT workflow_request_to_input_dataset_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_step_annotation_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_annotation_association
    ADD CONSTRAINT workflow_step_annotation_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: workflow_step_annotation_association_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_annotation_association
    ADD CONSTRAINT workflow_step_annotation_association_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_step_connection_input_step_input_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_connection
    ADD CONSTRAINT workflow_step_connection_input_step_input_id_fkey FOREIGN KEY (input_step_input_id) REFERENCES workflow_step_input(id);


--
-- Name: workflow_step_connection_input_subworkflow_step_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_connection
    ADD CONSTRAINT workflow_step_connection_input_subworkflow_step_id_fkey1 FOREIGN KEY (input_subworkflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_step_connection_output_step_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_connection
    ADD CONSTRAINT workflow_step_connection_output_step_id_fkey1 FOREIGN KEY (output_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_step_dynamic_tool_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step
    ADD CONSTRAINT workflow_step_dynamic_tool_id_fkey FOREIGN KEY (dynamic_tool_id) REFERENCES dynamic_tool(id);


--
-- Name: workflow_step_input_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_input
    ADD CONSTRAINT workflow_step_input_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_step_subworkflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step
    ADD CONSTRAINT workflow_step_subworkflow_id_fkey FOREIGN KEY (subworkflow_id) REFERENCES workflow(id);


--
-- Name: workflow_step_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_tag_association
    ADD CONSTRAINT workflow_step_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: workflow_step_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_tag_association
    ADD CONSTRAINT workflow_step_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: workflow_step_tag_association_workflow_step_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step_tag_association
    ADD CONSTRAINT workflow_step_tag_association_workflow_step_id_fkey FOREIGN KEY (workflow_step_id) REFERENCES workflow_step(id);


--
-- Name: workflow_step_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_step
    ADD CONSTRAINT workflow_step_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES workflow(id);


--
-- Name: workflow_stored_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow
    ADD CONSTRAINT workflow_stored_workflow_id_fkey FOREIGN KEY (stored_workflow_id) REFERENCES stored_workflow(id);


--
-- Name: workflow_tag_association_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_tag_association
    ADD CONSTRAINT workflow_tag_association_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES tag(id);


--
-- Name: workflow_tag_association_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_tag_association
    ADD CONSTRAINT workflow_tag_association_user_id_fkey FOREIGN KEY (user_id) REFERENCES galaxy_user(id);


--
-- Name: workflow_tag_association_workflow_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: __GALAXY_DB_USER__
--

ALTER TABLE ONLY workflow_tag_association
    ADD CONSTRAINT workflow_tag_association_workflow_id_fkey FOREIGN KEY (workflow_id) REFERENCES workflow(id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

