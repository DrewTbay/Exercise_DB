-- Sequence: public.wel_id_seq

-- DROP SEQUENCE public.wel_id_seq;

CREATE SEQUENCE public.wel_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.wel_id_seq
  OWNER TO postgres;


-- Table: public.workout_exercise_log

-- DROP TABLE public.workout_exercise_log;

CREATE TABLE public.workout_exercise_log
(
  wel_id integer NOT NULL DEFAULT nextval('wel_id_seq'::regclass),
  workout_exercise_id bigint,
  weight numeric(4,2),
  repetition smallint,
  difficulty smallint,
  completed_on date,
  comment text,
  CONSTRAINT wel_pkey PRIMARY KEY (wel_id),
  CONSTRAINT workout_exercise_fkey FOREIGN KEY (workout_exercise_id)
      REFERENCES public.workout_exercise (workout_exercise_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.workout_exercise_log
  OWNER TO postgres;

-- Index: public.fki_workout_exercise_fkey

-- DROP INDEX public.fki_workout_exercise_fkey;

CREATE INDEX fki_workout_exercise_fkey
  ON public.workout_exercise_log
  USING btree
  (workout_exercise_id);

