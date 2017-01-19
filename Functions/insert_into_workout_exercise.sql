-- Function: public.insert_into_workout_exercise(text, text, integer)

-- DROP FUNCTION public.insert_into_workout_exercise(text, text, integer);

CREATE OR REPLACE FUNCTION public.insert_into_workout_exercise(
    _workoutname text,
    _exercisename text,
    _setorder integer)
  RETURNS void AS
$BODY$INSERT INTO public.workout_exercise(
	workout_id, 
	exercise_id, 
	set_order
)
VALUES (
	(SELECT workout_id 
	FROM workout 
	WHERE name = _workoutName),
	(SELECT exercise_id 
	FROM exercise 
	WHERE name = _exerciseName),
	_setOrder
);$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_workout_exercise(text, text, integer)
  OWNER TO postgres;
