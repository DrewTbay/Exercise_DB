-- Function: public.add_exercise_log(text, text, text, text, numeric, smallint, smallint, text);

-- DROP FUNCTION public.add_exercise_log(text, text, text, text, numeric, smallint, smallint, text);

CREATE OR REPLACE FUNCTION public.add_exercise_log(
    _schedule_name text,
    _workout_name text,
    _exercise_name text,
    _user_name text,
    _weight numeric,
    _repetition smallint,
    _difficulty smallint,
    _note text)
  RETURNS void AS
$BODY$

	INSERT INTO workout_exercise_log (
		workout_exercise_id,
		swl_id,
		weight,
		repetition,
		difficulty,
		note
	) VALUES (
		(SELECT we.workout_exercise_id
		FROM workout_exercise we
		JOIN workout w
			ON w.workout_id = we.workout_id
			AND w.workout_name = _workout_name
		JOIN exercise e
			ON e.exercise_id = we.exercise_id
			AND e.exercise_name = _exercise_name),
		(SELECT swl.swl_id
		FROM schedule_workout_log swl
		JOIN users u
		   ON u.user_id = swl.user_id
		   AND u.user_name = _user_name
		JOIN schedule_workout sw
		   ON sw.schedule_workout_id = swl.schedule_workout_id
		JOIN workout w
		   ON w.workout_id = sw.workout_id
		   AND w.workout_name = _workout_name
		JOIN schedule s
		   ON s.schedule_id = sw.schedule_id
		   AND s.schedule_name = _schedule_name
		JOIN current_schedule cs
		   ON cs.schedule_id = s.schedule_id
		   AND cs.user_id = u.user_id
		WHERE sw.day_order = cs.current_day
		   AND sw.week_order = cs.current_week),
		_weight,
		_repetition,
		_difficulty,
		_note
	);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.add_exercise_log(text, text, text, text, numeric, smallint, smallint, text)
  OWNER TO postgres;
