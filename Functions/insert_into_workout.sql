-- Function: public.insert_into_workout(text)

DROP FUNCTION public.insert_into_workout(text);

CREATE OR REPLACE FUNCTION public.insert_into_workout(_workout_name text)
  RETURNS void AS
$BODY$
INSERT INTO public.workout(workout_name)
SELECT _workout_name
WHERE NOT EXISTS (
	SELECT workout_id
	FROM public.workout
	WHERE workout_name = _workout_name
);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_workout(text)
  OWNER TO postgres;
