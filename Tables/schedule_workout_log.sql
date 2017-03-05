\c exercise_db;

DROP TABLE IF EXISTS schedule_workout_log CASCADE;
DROP SEQUENCE IF EXISTS swl_id_seq CASCADE;
DROP INDEX IF EXISTS fki_swl_schedule_workout_fkey CASCADE;
DROP INDEX IF EXISTS fki_swl_users_fkey CASCADE;

-- Sequence: swl_id_seq

CREATE SEQUENCE swl_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: schedule_workout_log

CREATE TABLE schedule_workout_log
(
  swl_id integer NOT NULL DEFAULT nextval('swl_id_seq'::regclass),
  schedule_workout_id integer NOT NULL,
  period integer NOT NULL,
  user_id integer NOT NULL,
  CONSTRAINT swl_pkey PRIMARY KEY (swl_id),
  CONSTRAINT schedule_workout_fkey FOREIGN KEY (schedule_workout_id)
    REFERENCES schedule_workout (schedule_workout_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT users_fkey FOREIGN KEY (user_id)
    REFERENCES users (user_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Index: fki_swl_schedule_workout_fkey

CREATE INDEX fki_swl_schedule_workout_fkey
  ON schedule_workout_log
  USING btree
  (schedule_workout_id);

-- Index: fki_swl_users_fkey

CREATE INDEX fki_swl_users_fkey
  ON schedule_workout_log
  USING btree
  (user_id);
