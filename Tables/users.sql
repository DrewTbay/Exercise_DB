\c exercise_db;

DROP TABLE IF EXISTS users CASCADE;
DROP SEQUENCE IF EXISTS user_id_seq CASCADE;

-- Sequence: user_id_seq

CREATE SEQUENCE user_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: users

CREATE TABLE users
(
  user_id integer NOT NULL DEFAULT nextval('user_id_seq'::regclass),
  user_name text NOT NULL,
  user_password text NOT NULL,
  salt text NOT NULL,
  user_email text NOT NULL,
  CONSTRAINT users_pkey PRIMARY KEY (user_id),
  CONSTRAINT unique_user_email UNIQUE (user_email),
  CONSTRAINT unique_user_name UNIQUE (user_name)
);

