-- Function: public.insert_into_exercise(text, text)

DROP FUNCTION public.insert_into_exercise(text, text);

CREATE OR REPLACE FUNCTION public.insert_into_exercise(
    _exercise_name text,
    _exercise_description text)
  RETURNS void AS
$BODY$
BEGIN
	IF NOT EXISTS(
		SELECT exercise_id 
		FROM public.exercise 
		WHERE exercise_name = _exercise_name
	) THEN
		INSERT INTO public.exercise 
			(exercise_name, 
			exercise_description) 
		VALUES (_exercise_name, 
			_exercise_description);
	ELSE
		UPDATE public.exercise 
		SET exercise_description = _exercise_description 
		WHERE exercise_name = _exercise_name;
	END IF;
END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
ALTER FUNCTION public.insert_into_exercise(text, text)
  OWNER TO postgres;
