\c exercise_db;

-- Function: update_schedule_log(text, text, integer, integer)

DROP FUNCTION IF EXISTS update_schedule_log(text, text, integer, integer);

CREATE OR REPLACE FUNCTION update_current_schedule(
    _user_name text,
    _schedule_name text,
    _set_week integer,
    _set_day integer,
    _set_period integer)
  RETURNS void AS
$$
   UPDATE current_schedule
   SET current_week = _set_week,
      current_day = _set_day,
      current_period = _set_period
   WHERE schedule_id = (
      SELECT schedule_id
      FROM schedules
      WHERE schedule_name = _schedule_name)
   AND user_id = (
      SELECT user_id
      FROM users
      WHERE user_name = _user_name);
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;
