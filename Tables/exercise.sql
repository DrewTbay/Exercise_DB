﻿-- Sequence: public.exercise_id_seq

-- DROP SEQUENCE public.exercise_id_seq;

CREATE SEQUENCE public.exercise_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.exercise_id_seq
  OWNER TO postgres;

-- Table: public.exercise

-- DROP TABLE public.exercise;

CREATE TABLE public.exercise
(
  exercise_id bigint NOT NULL DEFAULT nextval('exercise_id_seq'::regclass),
  name text NOT NULL,
  description text,
  CONSTRAINT exercise_pkey PRIMARY KEY (exercise_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.exercise
  OWNER TO postgres;
