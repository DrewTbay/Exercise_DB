-- Sequence: public.user_login_id_seq

-- DROP SEQUENCE public.user_login_id_seq;

CREATE SEQUENCE public.user_login_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.user_login_id_seq
  OWNER TO postgres;


-- Table: public.user_login_log

-- DROP TABLE public.user_login_log;

CREATE TABLE public.user_login_log
(
  user_login_id integer NOT NULL DEFAULT nextval('user_login_id_seq'::regclass),
  attempt_date timestamp with time zone NOT NULL DEFAULT now(),
  successful_attempt boolean NOT NULL DEFAULT false,
  token text,
  user_id integer NOT NULL,
  CONSTRAINT user_login_id PRIMARY KEY (user_login_id),
  CONSTRAINT user_fkey FOREIGN KEY (user_id)
      REFERENCES public.users (user_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.user_login_log
  OWNER TO postgres;

-- Index: public.fki_user_fkey

-- DROP INDEX public.fki_user_fkey;

CREATE INDEX fki_user_fkey
  ON public.user_login_log
  USING btree
  (user_id);

