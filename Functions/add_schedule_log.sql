-- Function: public.add_schedule_log(text, text, text, integer, integer);

-- DROP FUNCTION public.add_schedule_log(text, text, text, integer, integer);

CREATE OR REPLACE FUNCTION public.add_schedule_log(
    _schedule_name text,
    _workout_name text,
    _user_name text,
    _day_done integer,
    _week_done integer)
  RETURNS void AS
$BODY$

   INSERT INTO schedule_workout_log (
      schedule_workout_id,
      period,
      user_id
   ) VALUES (
      (SELECT sw.schedule_workout_id
      FROM schedule_workout sw
      JOIN workout w 
         ON w.workout_id = sw.workout_id
         AND w.workout_name = _workout_name
      JOIN schedule s
         ON s.schedule_id = sw.schedule_id
         AND s.schedule_name = _schedule_name
      WHERE sw.day_order = _day_done
         AND sw.week_order = _week_done),
      (SELECT cs.current_period
      FROM current_schedule cs
      JOIN users u
         ON u.user_id = cs.user_id
         AND u.user_name = _user_name
      JOIN schedule s
         ON s.schedule_id = cs.schedule_id
         AND s.schedule_name = _schedule_name),
      (SELECT user_id 
      FROM users 
      WHERE user_name = _user_name)
   );
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
ALTER FUNCTION public.add_schedule_log(text, text, text, integer, integer)
  OWNER TO postgres;
