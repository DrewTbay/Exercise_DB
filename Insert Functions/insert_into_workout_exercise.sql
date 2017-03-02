\c exercise_db;

-- Function: insert_into_workout_exercise(text, text, integer, boolean, boolean)

DROP FUNCTION IF EXISTS insert_into_workout_exercise(
    text,
    text,
    integer,
    boolean,
    boolean);

CREATE OR REPLACE FUNCTION insert_into_workout_exercise(
    _workout_name text,
    _exercise_name text,
    _set_order integer,
    _record_weight boolean,
    _record_rep boolean)
  RETURNS void AS
$BODY$
  INSERT INTO workout_exercise(
    workout_id, 
    exercise_id, 
    set_order,
    record_weight,
    record_repetition
  ) VALUES (
    (SELECT workout_id 
    FROM workouts 
    WHERE workout_name = _workout_name),
    (SELECT exercise_id 
    FROM exercises 
    WHERE exercise_name = _exercise_name),
    _set_order,
    _record_weight,
    _record_rep
);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;

GRANT EXECUTE ON insert_into_workout_exercise TO exercise_conn;