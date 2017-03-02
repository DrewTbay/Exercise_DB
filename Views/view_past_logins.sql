\c exercise_db;

-- View: view_past_logins

DROP VIEW IF EXISTS view_past_logins;

CREATE OR REPLACE VIEW view_past_logins AS 
 SELECT u.user_name,
    la.attempt_date,
    la.successful_attempt,
    la.token,
    la.last_time_active
  FROM users u
    JOIN login_attempts la ON la.user_id = u.user_id;