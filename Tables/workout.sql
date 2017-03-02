\c exercise_db;

DROP TABLE IF EXISTS workouts CASCADE;
DROP SEQUENCE IF EXISTS workout_id_seq CASCADE;

-- Sequence: workout_id_seq

CREATE SEQUENCE workout_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: workouts

CREATE TABLE workouts
(
  workout_id integer NOT NULL DEFAULT nextval('workout_id_seq'::regclass),
  workout_name text NOT NULL,
  CONSTRAINT workout_pkey PRIMARY KEY (workout_id)
);

GRANT SELECT (workout_name) ON workouts TO exercise_conn;

INSERT INTO workouts (workout_name) VALUES ('Total Synergistics');
INSERT INTO workouts (workout_name) VALUES ('Agility X');
INSERT INTO workouts (workout_name) VALUES ('The Challenge');
INSERT INTO workouts (workout_name) VALUES ('X3 Yoga');
INSERT INTO workouts (workout_name) VALUES ('CVX');
INSERT INTO workouts (workout_name) VALUES ('The Warrior');
INSERT INTO workouts (workout_name) VALUES ('Isometrix');
INSERT INTO workouts (workout_name) VALUES ('Dynamix');
INSERT INTO workouts (workout_name) VALUES ('Accelerator');
INSERT INTO workouts (workout_name) VALUES ('Pilates X');
INSERT INTO workouts (workout_name) VALUES ('Incinerator');
INSERT INTO workouts (workout_name) VALUES ('Triometrics');
INSERT INTO workouts (workout_name) VALUES ('MMX');
INSERT INTO workouts (workout_name) VALUES ('Eccentric Upper');
INSERT INTO workouts (workout_name) VALUES ('Eccentric Lower');
INSERT INTO workouts (workout_name) VALUES ('Decelerator');
INSERT INTO workouts (workout_name) VALUES ('Cold Start');
INSERT INTO workouts (workout_name) VALUES ('Complex Upper');
INSERT INTO workouts (workout_name) VALUES ('Complex Lower');
INSERT INTO workouts (workout_name) VALUES ('X3 Ab Ripper');
INSERT INTO workouts (workout_name) VALUES ('Rest');