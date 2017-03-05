\c exercise_db;

DROP TABLE IF EXISTS workout_exercise CASCADE;
DROP SEQUENCE IF EXISTS workout_exercise_id_seq CASCADE;
DROP INDEX IF EXISTS fki_we_exercise_fkey CASCADE;
DROP INDEX IF EXISTS fki_we_workout_fkey CASCADE;

-- Sequence: workout_exercise_id_seq

CREATE SEQUENCE workout_exercise_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: workout_exercise

CREATE TABLE workout_exercise
(
  workout_exercise_id integer NOT NULL DEFAULT nextval('workout_exercise_id_seq'::regclass),
  workout_id integer NOT NULL,
  exercise_id integer NOT NULL,
  set_order integer NOT NULL DEFAULT 1,
  record_weight boolean NOT NULL DEFAULT false,
  record_repetition boolean NOT NULL DEFAULT false,
  CONSTRAINT workout_exercise_pkey PRIMARY KEY (workout_exercise_id),
  CONSTRAINT exercise_fkey FOREIGN KEY (exercise_id)
    REFERENCES exercises (exercise_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT workout_fkey FOREIGN KEY (workout_id)
    REFERENCES workouts (workout_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Index: fki_we_exercise_fkey

CREATE INDEX fki_we_exercise_fkey
  ON workout_exercise
  USING btree
  (exercise_id);

-- Index: fki_we_workout_fkey

CREATE INDEX fki_we_workout_fkey
  ON workout_exercise
  USING btree
  (workout_id);
