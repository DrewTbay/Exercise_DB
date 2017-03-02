\c exercise_db;

-- View: view_exercises

DROP VIEW IF EXISTS view_exercises;

CREATE OR REPLACE VIEW view_exercises AS 
  SELECT w.workout_name,
    e.exercise_name,
    we.set_order,
    we.record_weight,
    we.record_repetition
  FROM exercises e
    JOIN workout_exercise we 
      ON e.exercise_id = we.exercise_id
    JOIN workouts w 
      ON we.workout_id = w.workout_id;

GRANT SELECT ALL ON view_exercises TO exercise_conn;