-- Sequence: public.schedule_id_seq

-- DROP SEQUENCE public.schedule_id_seq;

CREATE SEQUENCE public.schedule_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.schedule_id_seq
  OWNER TO postgres;

-- Table: public.schedule

-- DROP TABLE public.schedule;

CREATE TABLE public.schedule
(
  schedule_id integer NOT NULL DEFAULT nextval('schedule_id_seq'::regclass),
  name text NOT NULL,
  CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.schedule
  OWNER TO postgres;

