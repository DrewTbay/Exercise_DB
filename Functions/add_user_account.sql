CREATE OR REPLACE FUNCTION add_user_account(
  _user_name text,
  _user_email text,
  _password text,
  _salt text)
  RETURNS boolean AS
$BODY$
  DECLARE inserted boolean;
  BEGIN

    INSERT INTO users (user_id, user_name, user_email, user_password, salt)
    VALUES (DEFAULT, _user_name, _user_email, _password, _salt)
    ON CONFLICT DO NOTHING
    RETURNING true INTO inserted;

    IF inserted IS NULL THEN
      RETURN false;
    END IF;
    RETURN inserted;
  END;
$BODY$
  LANGUAGE plpgsql VOLATILE
  COST 100;
