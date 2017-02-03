-- Sequence: public.schedule_workout_id_seq

-- DROP SEQUENCE public.schedule_workout_id_seq;

CREATE SEQUENCE public.schedule_workout_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 5625
  CACHE 1;
ALTER TABLE public.schedule_workout_id_seq
  OWNER TO postgres;

-- Table: public.schedule_workout_log

-- DROP TABLE public.schedule_workout_log;

CREATE TABLE public.schedule_workout_log
(
  swl_id integer NOT NULL DEFAULT nextval('swl_id_seq'::regclass),
  schedule_workout_id integer NOT NULL,
  user_id integer NOT NULL,
  current_week integer NOT NULL DEFAULT 1,
  current_day integer NOT NULL DEFAULT 1,
  CONSTRAINT swl_pkey PRIMARY KEY (swl_id),
  CONSTRAINT schedule_workout_fkey FOREIGN KEY (schedule_workout_id)
      REFERENCES public.schedule_workout (schedule_workout_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT users_fkey FOREIGN KEY (user_id)
      REFERENCES public.users (user_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.schedule_workout_log
  OWNER TO postgres;

-- Index: public.fki_schedule_workout_fkey

-- DROP INDEX public.fki_schedule_workout_fkey;

CREATE INDEX fki_schedule_workout_fkey
  ON public.schedule_workout_log
  USING btree
  (schedule_workout_id);

-- Index: public.fki_swl_users_fkey

-- DROP INDEX public.fki_swl_users_fkey;

CREATE INDEX fki_swl_users_fkey
  ON public.schedule_workout_log
  USING btree
  (user_id);

