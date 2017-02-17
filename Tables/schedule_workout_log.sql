-- Sequence: public.swl_id_seq

-- DROP SEQUENCE public.swl_id_seq;

CREATE SEQUENCE public.swl_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.swl_id_seq
  OWNER TO postgres;

-- Table: public.schedule_workout_log

-- DROP TABLE public.schedule_workout_log;

CREATE TABLE public.schedule_workout_log
(
  swl_id integer NOT NULL DEFAULT nextval('swl_id_seq'::regclass),
  schedule_workout_id integer NOT NULL,
  period integer NOT NULL,
  user_id integer,
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
