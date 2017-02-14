-- View: public.view_workouts

-- DROP VIEW public.view_workouts;

CREATE OR REPLACE VIEW public.view_workouts AS 
 SELECT u.user_name,
    s.schedule_name,
    w.workout_name,
    sw.day_order,
    sw.week_order,
    sl.current_day,
    sl.current_week
   FROM schedule s
     JOIN schedule_log sl ON sl.schedule_id = s.schedule_id
     JOIN users u ON u.user_id = sl.user_id
     JOIN schedule_workout sw ON sw.schedule_id = s.schedule_id
     JOIN workout w ON w.workout_id = sw.workout_id;

ALTER TABLE public.view_workouts
  OWNER TO postgres;
