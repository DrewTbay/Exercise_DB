-- Sequence: schedule_workout_id_seq

DROP SEQUENCE IF EXISTS schedule_workout_id_seq;

CREATE SEQUENCE schedule_workout_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: schedule_workout

DROP TABLE IF EXISTS schedule_workout;

CREATE TABLE public.schedule_workout
(
  schedule_workout_id integer NOT NULL DEFAULT nextval('schedule_workout_id_seq'::regclass),
  workout_id integer NOT NULL,
  schedule_id integer NOT NULL,
  day_order integer NOT NULL DEFAULT 1,
  week_order integer NOT NULL DEFAULT 1,
  CONSTRAINT schedule_workout_pkey PRIMARY KEY (schedule_workout_id),
  CONSTRAINT schedule_fkey FOREIGN KEY (schedule_id)
      REFERENCES public.schedule (schedule_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT workout_fkey FOREIGN KEY (workout_id)
      REFERENCES public.workout (workout_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
);

-- Index: public.fki_sw_schedule_fkey

DROP INDEX IF EXISTS fki_sw_schedule_fkey;

CREATE INDEX fki_sw_schedule_fkey
  ON schedule_workout
  USING btree
  (schedule_id);

-- Index: fki_sw_workout_fkey

DROP INDEX IF EXISTS fki_sw_workout_fkey;

CREATE INDEX fki_sw_workout_fkey
  ON schedule_workout
  USING btree
  (workout_id);


