-- Function: public.insert_into_workout_exercise(text, text, integer, boolean, boolean)

-- DROP FUNCTION public.insert_into_workout_exercise(text, text, integer, boolean, boolean);

CREATE OR REPLACE FUNCTION public.insert_into_workout_exercise(
    _workoutname text,
    _exercisename text,
    _setorder integer,
    _recordweight boolean,
    _recordrep boolean)
  RETURNS void AS
$BODY$INSERT INTO public.workout_exercise(
	workout_id, 
	exercise_id, 
	set_order,
	record_weight,
	record_repetition
)
VALUES (
	(SELECT workout_id 
	FROM workout 
	WHERE name = _workoutName),
	(SELECT exercise_id 
	FROM exercise 
	WHERE name = _exerciseName),
	_setOrder,
	_recordWeight,
	_recordRep
);$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_workout_exercise(text, text, integer, boolean, boolean)
  OWNER TO postgres;
