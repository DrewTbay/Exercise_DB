\c exercise_db;

-- Sequence: wel_id_seq

DROP TABLE IF EXISTS workout_exercise_log CASCADE;
DROP SEQUENCE IF EXISTS wel_id_seq CASCADE;
DROP INDEX IF EXISTS fki_swl_fkey CASCADE;
DROP INDEX IF EXISTS fki_workout_exercise_fkey CASCADE;

CREATE SEQUENCE wel_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: workout_exercise_log

CREATE TABLE workout_exercise_log
(
  wel_id integer NOT NULL DEFAULT nextval('wel_id_seq'::regclass),
  workout_exercise_id integer NOT NULL,
  swl_id integer NOT NULL,
  weight numeric(4,2),
  repetition smallint,
  difficulty smallint,
  completed_on date,
  note text,
  CONSTRAINT wel_pkey PRIMARY KEY (wel_id),
  CONSTRAINT swl_fkey FOREIGN KEY (swl_id)
    REFERENCES schedule_workout_log (swl_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT workout_exercise_fkey FOREIGN KEY (workout_exercise_id)
    REFERENCES workout_exercise (workout_exercise_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Index: fki_wel_swl_fkey

CREATE INDEX fki_wel_swl_fkey
  ON workout_exercise_log
  USING btree
  (swl_id);

-- Index: fki_wel_workout_exercise_fkey

CREATE INDEX fki_wel_workout_exercise_fkey
  ON workout_exercise_log
  USING btree
  (workout_exercise_id);
