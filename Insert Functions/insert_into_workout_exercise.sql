﻿-- Function: public.insert_into_workout_exercise(text, text, integer, boolean, boolean)

-- DROP FUNCTION public.insert_into_workout_exercise(text, text, integer, boolean, boolean);

CREATE OR REPLACE FUNCTION public.insert_into_workout_exercise(
    _workout_name text,
    _exercise_name text,
    _set_order integer,
    _record_weight boolean,
    _record_rep boolean)
  RETURNS void AS
$BODY$
INSERT INTO public.workout_exercise(
	workout_id, 
	exercise_id, 
	set_order,
	record_weight,
	record_repetition
)
VALUES (
	(SELECT workout_id 
	FROM workout 
	WHERE workout_name = _workout_name),
	(SELECT exercise_id 
	FROM exercise 
	WHERE exercise_name = _exercise_name),
	_set_order,
	_record_weight,
	_record_rep
);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_workout_exercise(text, text, integer, boolean, boolean)
  OWNER TO postgres;