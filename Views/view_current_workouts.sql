\c exercise_db;

-- View: view_current_workouts

DROP VIEW IS EXISTS view_current_workouts;

CREATE OR REPLACE VIEW view_current_workouts AS 
  SELECT s.schedule_name,
    w.workout_name,
    sw.day_order,
    sw.week_order,
    u.user_name,
    cs.current_week,
    cs.current_day,
    CASE
      WHEN swl.swl_id IS NOT NULL THEN true
      ELSE false
    END AS completed
  FROM schedules s
    JOIN schedule_workout sw 
      ON sw.schedule_id = s.schedule_id
    JOIN workouts w 
      ON w.workout_id = sw.workout_id
    JOIN current_schedule cs 
      ON cs.schedule_id = s.schedule_id
    JOIN users u 
      ON u.user_id = cs.user_id
    LEFT JOIN schedule_workout_log swl 
      ON swl.schedule_workout_id = sw.schedule_workout_id 
      AND swl.period = cs.current_period 
      AND u.user_id = swl.user_id;

GRANT SELECT ALL ON view_current_workouts TO exercise_conn;