-- Function: insert_into_schedule_workout(text, text, integer, integer)

DROP FUNCTION IF EXISTS insert_into_schedule_workout(text, text, integer, integer);

CREATE OR REPLACE FUNCTION insert_into_schedule_workout(
    _schedule_name text,
    _workout_name text,
    _day_order integer,
    _week_order integer)
  RETURNS void AS
$BODY$
    INSERT INTO public.schedule_workout(
        schedule_id, 
        workout_id, 
        day_order,
        week_order
    ) VALUES (
        (SELECT schedule_id 
        FROM schedule 
        WHERE schedule_name = _schedule_name),
        (SELECT workout_id 
        FROM workout 
        WHERE workout_name = _workout_name),
        _day_order,
        _week_order
    );
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;

