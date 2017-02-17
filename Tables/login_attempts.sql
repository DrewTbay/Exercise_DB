-- Sequence: public.user_login_attempt_id_seq

-- DROP SEQUENCE public.user_login_attempt_id_seq;

CREATE SEQUENCE public.login_attempt_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1
  CACHE 1;
ALTER TABLE public.login_attempt_id_seq
  OWNER TO postgres;

-- Table: public.login_attempts

-- DROP TABLE public.login_attempts;

CREATE TABLE public.login_attempts
(
  login_attempt_id integer NOT NULL DEFAULT nextval('login_attempt_id_seq'::regclass),
  attempt_date timestamp with time zone NOT NULL,
  successful_attempt boolean NOT NULL DEFAULT false,
  token text,
  user_id integer NOT NULL,
  last_time_active timestamp with time zone,
  CONSTRAINT login_attempt_id PRIMARY KEY (login_attempt_id),
  CONSTRAINT user_fkey FOREIGN KEY (user_id)
      REFERENCES public.users (user_id) MATCH SIMPLE
      ON UPDATE CASCADE ON DELETE CASCADE
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.login_attempts
  OWNER TO postgres;

-- Index: public.fki_user_fkey

-- DROP INDEX public.fki_user_fkey;

CREATE INDEX fki_user_fkey
  ON public.login_attempts
  USING btree
  (user_id);
