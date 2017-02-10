-- Sequence: public.schedule_log_id_seq

-- DROP SEQUENCE public.schedule_log_id_seq;

CREATE SEQUENCE public.schedule_log_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.schedule_log_id_seq
  OWNER TO postgres;


-- Table: public.schedule_log

-- DROP TABLE public.schedule_log;

CREATE TABLE public.schedule_log
(
  schedule_log_id integer NOT NULL DEFAULT nextval('schedule_log_id_seq'::regclass),
  user_id integer NOT NULL,
  current_week integer NOT NULL DEFAULT 1,
  current_day integer NOT NULL DEFAULT 1,
  schedule_id integer NOT NULL,
  CONSTRAINT schedule_log_pkey PRIMARY KEY (schedule_log_id),
  CONSTRAINT schedule_fkey FOREIGN KEY (schedule_id)
      REFERENCES public.schedule (schedule_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT users_fkey FOREIGN KEY (user_id)
      REFERENCES public.users (user_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.schedule_log
  OWNER TO postgres;

-- Index: public.fki_sl_schedule_fkey

-- DROP INDEX public.fki_sl_schedule_fkey;

CREATE INDEX fki_sl_schedule_fkey
  ON public.schedule_log
  USING btree
  (schedule_id);

-- Index: public.fki_sl_users_fkey

-- DROP INDEX public.fki_sl_users_fkey;

CREATE INDEX fki_sl_users_fkey
  ON public.schedule_log
  USING btree
  (user_id);

