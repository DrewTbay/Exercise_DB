-- Sequence: public.schedule_workout_id_seq

-- DROP SEQUENCE public.schedule_workout_id_seq;

CREATE SEQUENCE public.schedule_workout_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.schedule_workout_id_seq
  OWNER TO postgres;

-- Table: public.schedule_workout

-- DROP TABLE public.schedule_workout;

CREATE TABLE public.schedule_workout
(
  schedule_workout_id bigint NOT NULL DEFAULT nextval('schedule_workout_id_seq'::regclass),
  workout_id bigint NOT NULL,
  schedule_id bigint,
  day_order integer,
  week_order integer NOT NULL DEFAULT 1,
  CONSTRAINT schedule_workout_pkey PRIMARY KEY (schedule_workout_id),
  CONSTRAINT schedule_fkey FOREIGN KEY (schedule_id)
      REFERENCES public.schedule (schedule_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT workout_fkey FOREIGN KEY (workout_id)
      REFERENCES public.workout (workout_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.schedule_workout
  OWNER TO postgres;

-- Index: public.fki_schedule_fkey

-- DROP INDEX public.fki_schedule_fkey;

CREATE INDEX fki_schedule_fkey
  ON public.schedule_workout
  USING btree
  (schedule_id);

-- Index: public.fki_workout_fkey2

-- DROP INDEX public.fki_workout_fkey2;

CREATE INDEX fki_workout_fkey2
  ON public.schedule_workout
  USING btree
  (workout_id);


