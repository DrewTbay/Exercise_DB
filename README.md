# Exercise_DB
Database for the Exericse Logging

The following commands will need to be run:

createuser exercise_conn -P -D- R -S

createdb exercise_db -O exercise_conn

psql -f ./Tables/schedule.sql

psql -f ./Tables/workout.sql

psql -f ./Tables/exercise.sql

psql -f ./Tables/schedule_workout.sql

psql -f ./Insert_Functions/insert_into_schedule_workout.sql

psql -f ./Insert_Functions/Insert_Data_Scripts/insert_schedule_workout.sql

psql -f ./Tables/workout_exercise.sql

psql -f ./Insert_Functions/insert_into_workout_exericse.sql

psql -f ./Insert_Functions/Insert_Data_Scripts/insert_workout_exericse.sql

psql -f ./Tables/users.sql

psql -f ./Tables/current_schedule.sql

psql -f ./Tables/login_attempts.sql

psql -f ./Trigger_Functions/trig_user_create.sql

psql -f ./Tables/schedule_workout_log.sql

psql -f ./Tables/workout_exercise_log.sql

psql -f ./Functions/add_exercise_log.sql

psql -f ./Functions/add_login_log.sql

psql -f ./Functions/add_schedule_log.sql

psql -f ./Update_Functions/update_current_schedule.sql

psql -f ./Views/view_current_workouts.sql

psql -f ./Views/view_exercises.sql

psql -f ./Views/view_past_logins.sql

psql -f ./Functions/add_user_account.sql