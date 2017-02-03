
CREATE SEQUENCE public.workout_exercise_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.workout_exercise_id_seq
  OWNER TO postgres;

-- Table: public.workout_exercise

-- DROP TABLE public.workout_exercise;

CREATE TABLE public.workout_exercise
(
  workout_exercise_id integer NOT NULL DEFAULT nextval('workout_exercise_id_seq'::regclass),
  workout_id integer NOT NULL,
  exercise_id integer NOT NULL,
  set_order integer NOT NULL DEFAULT 1,
  record_weight boolean NOT NULL DEFAULT false,
  record_repetition boolean NOT NULL DEFAULT false,
  CONSTRAINT workout_exercise_pkey PRIMARY KEY (workout_exercise_id),
  CONSTRAINT exercise_fkey FOREIGN KEY (exercise_id)
      REFERENCES public.exercise (exercise_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT workout_fkey FOREIGN KEY (workout_id)
      REFERENCES public.workout (workout_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.workout_exercise
  OWNER TO postgres;

-- Index: public.fki_exercise_fkey

-- DROP INDEX public.fki_exercise_fkey;

CREATE INDEX fki_exercise_fkey
  ON public.workout_exercise
  USING btree
  (exercise_id);

-- Index: public.fki_we_workout_fkey

-- DROP INDEX public.fki_we_workout_fkey;

CREATE INDEX fki_we_workout_fkey
  ON public.workout_exercise
  USING btree
  (workout_id);

t_id);

