-- View: public.view_schedules

-- DROP VIEW public.view_schedules;

CREATE OR REPLACE VIEW public.view_schedules AS 
 SELECT u.user_name,
    s.schedule_name,
    sl.current_week,
    sl.current_day
   FROM schedule s
     JOIN schedule_log sl ON s.schedule_id = sl.schedule_id
     JOIN users u ON u.user_id = sl.user_id;

ALTER TABLE public.view_schedules
  OWNER TO postgres;
