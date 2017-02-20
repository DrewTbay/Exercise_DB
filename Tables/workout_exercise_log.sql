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
  workout_exercise_id integer NOT NULL,
  swl_id integer NOT NULL,
  weight numeric(4,2),
  repetition smallint,
  difficulty smallint,
  completed_on date,
  note text,
  CONSTRAINT wel_pkey PRIMARY KEY (wel_id),
  CONSTRAINT swl_fkey FOREIGN KEY (swl_id)
      REFERENCES public.schedule_workout_log (swl_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT workout_exercise_fkey FOREIGN KEY (workout_exercise_id)
      REFERENCES public.workout_exercise (workout_exercise_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.workout_exercise_log
  OWNER TO postgres;
GRANT ALL ON TABLE public.workout_exercise_log TO postgres;
GRANT SELECT, UPDATE, INSERT ON TABLE public.workout_exercise_log TO public;

-- Index: public.fki_swl_fkey

-- DROP INDEX public.fki_swl_fkey;

CREATE INDEX fki_swl_fkey
  ON public.workout_exercise_log
  USING btree
  (swl_id);

-- Index: public.fki_workout_exercise_fkey

-- DROP INDEX public.fki_workout_exercise_fkey;

CREATE INDEX fki_workout_exercise_fkey
  ON public.workout_exercise_log
  USING btree
  (workout_exercise_id);

