-- Table: public.workout_exercise_log

-- DROP TABLE public.workout_exercise_log;

CREATE TABLE public.workout_exercise_log
(
  wel_id integer NOT NULL DEFAULT nextval('exercise_id_seq'::regclass),
  workout_exercise_id bigint,
  weight numeric(4,2),
  repetition smallint,
  difficulty smallint,
  completed_on date,
  comment text,
  CONSTRAINT wel_pkey PRIMARY KEY (wel_id),
  CONSTRAINT workout_exercise_fkey FOREIGN KEY (workout_exercise_id)
      REFERENCES public.workout_exercise (workout_exercise_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION
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

