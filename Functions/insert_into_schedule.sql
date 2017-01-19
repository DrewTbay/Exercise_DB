-- Function: public.insert_into_schedule(text)

-- DROP FUNCTION public.insert_into_schedule(text);

CREATE OR REPLACE FUNCTION public.insert_into_schedule(_schedulename text)
  RETURNS void AS
$BODY$INSERT INTO public.schedule(name)
SELECT _scheduleName
WHERE NOT EXISTS (
	SELECT schedule_id
	FROM public.schedule
	WHERE name = _scheduleName
);$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_schedule(text)
  OWNER TO postgres;
