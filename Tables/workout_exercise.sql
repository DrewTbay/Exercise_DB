﻿-- Table: public.workout_exercise

-- DROP TABLE public.workout_exercise;

CREATE TABLE public.workout_exercise
(
  workout_exercise_id bigint NOT NULL DEFAULT nextval('workout_exercise_id_seq'::regclass),
  workout_id bigint,
  exercise_id bigint NOT NULL,
  schedule_id bigint,
  day_order smallint NOT NULL,
  CONSTRAINT workout_exercise_pkey PRIMARY KEY (workout_exercise_id),
  CONSTRAINT exercise_fkey FOREIGN KEY (exercise_id)
      REFERENCES public.exercise (exercise_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT schedule_fkey FOREIGN KEY (schedule_id)
      REFERENCES public.schedule (schedule_id) MATCH SIMPLE
      ON UPDATE NO ACTION ON DELETE NO ACTION,
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

-- Index: public.fki_schedule_fkey

-- DROP INDEX public.fki_schedule_fkey;

CREATE INDEX fki_schedule_fkey
  ON public.workout_exercise
  USING btree
  (schedule_id);

-- Index: public.fki_workout_fkey

-- DROP INDEX public.fki_workout_fkey;

CREATE INDEX fki_workout_fkey
  ON public.workout_exercise
  USING btree
  (workout_id);

