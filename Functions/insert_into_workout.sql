-- Function: public.insert_into_workout(text)

-- DROP FUNCTION public.insert_into_workout(text);

CREATE OR REPLACE FUNCTION public.insert_into_workout(_workoutname text)
  RETURNS void AS
$BODY$
INSERT INTO public.workout(name)
SELECT _workoutName
WHERE NOT EXISTS (
	SELECT workout_id
	FROM public.workout
	WHERE name = _workoutName
);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_workout(text)
  OWNER TO postgres;
