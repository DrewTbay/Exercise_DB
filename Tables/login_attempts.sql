\c exercise_db;

DROP TABLE IF EXISTS login_attempts CASCADE;
DROP SEQUENCE IF EXISTS user_login_attempt_id_seq CASCADE;
DROP INDEX IF EXISTS fki_user_fkey CASCADE;

-- Sequence: user_login_attempt_id_seq

CREATE SEQUENCE login_attempt_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: login_attempts

CREATE TABLE login_attempts
(
  login_attempt_id integer NOT NULL DEFAULT nextval('login_attempt_id_seq'::regclass),
  attempt_date timestamp with time zone NOT NULL,
  successful_attempt boolean NOT NULL DEFAULT false,
  token text,
  user_id integer NOT NULL,
  last_time_active timestamp with time zone,
  CONSTRAINT login_attempt_id PRIMARY KEY (login_attempt_id),
  CONSTRAINT user_fkey FOREIGN KEY (user_id)
    REFERENCES users (user_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Index: fki_user_fkey

CREATE INDEX fki_la_user_fkey
  ON login_attempts
  USING btree
  (user_id);
