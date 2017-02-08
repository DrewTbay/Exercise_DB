-- Function: public.insert_into_schedule(text)

-- DROP FUNCTION public.insert_into_schedule(text);

CREATE OR REPLACE FUNCTION public.insert_into_schedule(_schedule_name text)
  RETURNS void AS
$BODY$
INSERT INTO public.schedule(schedule_name)
SELECT _schedule_name
WHERE NOT EXISTS (
	SELECT schedule_id
	FROM public.schedule
	WHERE schedule_name = _schedule_name
);$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_schedule(text)
  OWNER TO postgres;
