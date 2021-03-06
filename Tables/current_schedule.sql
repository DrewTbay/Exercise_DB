﻿\c exercise_db;

DROP TABLE IF EXISTS current_schedule CASCADE;
DROP INDEX IF EXISTS fki_cs_users_fkey CASCADE;
DROP INDEX IF EXISTS fki_cs_schedule_fkey CASCADE;

-- Table: current_schedule

CREATE TABLE current_schedule
(
  user_id integer NOT NULL,
  current_week integer NOT NULL DEFAULT 1,
  current_day integer NOT NULL DEFAULT 1,
  schedule_id integer NOT NULL,
  current_period integer NOT NULL DEFAULT 1,
  CONSTRAINT schedule_log_pkey PRIMARY KEY (user_id, schedule_id),
  CONSTRAINT schedule_fkey FOREIGN KEY (schedule_id)
    REFERENCES schedules (schedule_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE,
  CONSTRAINT users_fkey FOREIGN KEY (user_id)
    REFERENCES users (user_id) MATCH SIMPLE
    ON UPDATE CASCADE ON DELETE CASCADE
);

-- Index: fki_cs_schedule_fkey

CREATE INDEX fki_cs_schedule_fkey
  ON current_schedule
  USING btree
  (schedule_id);

-- Index: fki_cs_users_fkey

CREATE INDEX fki_cs_users_fkey
  ON current_schedule
  USING btree
  (user_id);