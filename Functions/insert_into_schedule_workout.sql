-- Function: public.insert_into_schedule_workout(text, text, integer)

-- DROP FUNCTION public.insert_into_schedule_workout(text, text, integer);

CREATE OR REPLACE FUNCTION public.insert_into_schedule_workout(
    _schedulename text,
    _workoutname text,
    _dayorder integer)
  RETURNS void AS
$BODY$INSERT INTO public.schedule_workout(
	schedule_id, 
	workout_id, 
	day_order
)
VALUES (
	(SELECT schedule_id 
	FROM schedule 
	WHERE name = _scheduleName),
	(SELECT workout_id 
	FROM workout 
	WHERE name = _workoutName),
	_dayOrder
);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_schedule_workout(text, text, integer)
  OWNER TO postgres;
