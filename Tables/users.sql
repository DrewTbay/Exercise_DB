-- Sequence: public.user_id_seq

-- DROP SEQUENCE public.user_id_seq;

CREATE SEQUENCE public.user_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.user_id_seq
  OWNER TO postgres;


-- Table: public.users

-- DROP TABLE public.users;

CREATE TABLE public.users
(
  user_id integer NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  user_name text NOT NULL,
  password text NOT NULL,
  salt text NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (user_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.users
  OWNER TO postgres;
