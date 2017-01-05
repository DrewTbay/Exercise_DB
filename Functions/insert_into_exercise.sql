-- Function: public.insert_into_exercise(text, text)

-- DROP FUNCTION public.insert_into_exercise(text, text);

CREATE OR REPLACE FUNCTION public.insert_into_exercise(
    _name text,
    _desc text)
  RETURNS void AS
$BODY$
BEGIN
	IF NOT EXISTS(SELECT exercise_id FROM public.exercise WHERE name = _name) THEN
		INSERT INTO public.exercise (name, description) VALUES (_name, _desc);
	ELSE
		UPDATE public.exercise SET description = _desc WHERE name = _name;
	END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_exercise(text, text)
  OWNER TO postgres;
