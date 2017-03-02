\c exercise_db;

-- Function: trig_user_create()

DROP FUNCTION IF EXISTS trig_user_create();

CREATE OR REPLACE FUNCTION trig_user_create()
  RETURNS trigger AS
$BODY$
  /* For each schedule create a schedule_workout to track 
  the progress through each schedule*/
DECLARE
  v_schedule_id integer;
BEGIN
  FOR v_schedule_id IN
    SELECT schedule_id 
    FROM schedules
  LOOP
    INSERT INTO schedule_log (
      schedule_id,
      user_id,
      current_week,
      current_day,
      current_period
    ) VALUES (
      v_schedule_id,
      NEW.user_id,
      1,
      1,
      1
    );
  END LOOP;
END
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;

DROP TRIGGER IF EXISTS create_schedule_logs ON users;

CREATE TRIGGER create_current_schedules AFTER INSERT ON users
  FOR EACH ROW EXECUTE PROCEDURE trig_user_create();
