-- Function: public.add_exercise_log(text, text, integer, numeric, smallint, smallint, text)

-- DROP FUNCTION public.add_exercise_log(text, text, integer, numeric, smallint, smallint, text);

CREATE OR REPLACE FUNCTION public.add_exercise_log(
    _workout_name text,
    _exercise_name text,
    _user_id integer,
    _weight numeric,
    _repetition smallint,
    _difficulty smallint,
    _note text)
  RETURNS void AS
$BODY$

	INSERT INTO workout_exercise_log (
		workout_exercise_id,
		user_id,
		weight,
		repetition,
		difficulty,
		note
	) VALUES (
		(SELECT 
			we.workout_exercise_id
		FROM workout_exercise we
		JOIN workout w
			ON w.workout_id = we.workout_id
			AND w.workout_name = _workout_name
		JOIN exercise e
			ON e.exercise_id = we.exercise_id
			AND e.exercise_name = _exercise_name),
		_user_id,
		_weight,
		_repetition,
		_difficulty,
		_note
	);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.add_exercise_log(text, text, integer, numeric, smallint, smallint, text)
  OWNER TO postgres;
