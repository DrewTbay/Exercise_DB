\c exercise_db;

-- Function: add_login_log(timestamp, boolean, text, text, timestamp);

DROP FUNCTION IF EXISTS add_login_log(
  timestamp with time zone,
  boolean,
  text,
  text,
  timestamp with time zone
);

CREATE OR REPLACE FUNCTION add_login_log(
    _attempt_date timestamp with time zone,
    _successful_attempt boolean,
    _user_name text,
    _token text,
    _last_time_active timestamp with time zone)
  RETURNS void AS
$BODY$
  INSERT INTO login_attempts (
    user_id,
    attempt_date,
    successful_attempt,
    token,
    last_time_active
  ) VALUES (
    (SELECT user_id
    FROM users
    WHERE user_name = _user_name),
    _attempt_date,
    _successful_attempt,
    _token,
    _last_time_active
  );
$BODY$
  LANGUAGE sql VOLATILE
  COST 100;