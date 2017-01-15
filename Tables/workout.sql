-- Sequence: public.workout_id_seq

-- DROP SEQUENCE public.workout_id_seq;

CREATE SEQUENCE public.workout_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.workout_id_seq
  OWNER TO postgres;

-- Table: public.workout

-- DROP TABLE public.workout;

CREATE TABLE public.workout
(
  workout_id bigint NOT NULL DEFAULT nextval('workout_id_seq'::regclass),
  name text NOT NULL,
  CONSTRAINT workout_pkey PRIMARY KEY (workout_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.workout
  OWNER TO postgres;


