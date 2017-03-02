\c exercise_db;

DROP TABLE IF EXISTS schedules CASCADE;
DROP SEQUENCE IF EXISTS schedule_id_seq CASCADE;

-- Sequence: schedule_id_seq

CREATE SEQUENCE public.schedule_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: schedules

CREATE TABLE schedules
(
  schedule_id integer NOT NULL DEFAULT nextval('schedule_id_seq'::regclass),
  schedule_name text NOT NULL,
  CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id)
);

GRANT SELECT (schedule_name) ON schedules TO exercise_conn;

INSERT INTO schedules (schedule_name) VALUES ('Classic');
INSERT INTO schedules (schedule_name) VALUES ('Lean');
INSERT INTO schedules (schedule_name) VALUES ('Mass');
INSERT INTO schedules (schedule_name) VALUES ('Doubles');
INSERT INTO schedules (schedule_name) VALUES ('Elite');