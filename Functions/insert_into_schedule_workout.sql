-- Function: public.insert_into_schedule_workout(text, text, integer)

-- DROP FUNCTION public.insert_into_schedule_workout(text, text, integer);

CREATE OR REPLACE FUNCTION public.insert_into_schedule_workout(
    _schedule_name text,
    _workout_name text,
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
	WHERE schedule_name = _schedule_name),
	(SELECT workout_id 
	FROM workout 
	WHERE workout_name = _workout_name),
	_dayOrder
);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_schedule_workout(text, text, integer)
  OWNER TO postgres;
