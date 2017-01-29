TRUNCATE workout_exercise CASCADE;

--Total Synergistics
SELECT insert_into_workout_exercise('Total Synergistics','Push-up/Side Arm Balance',1,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Crescent Chair', 2,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Pull Knee Pull', 3,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Flip Flop Combo', 4,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Crawly Plyo Push-ups', 5,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Releve-Plie, Weighted', 6,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','Chin-up Circle Crunch', 7,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Boat Plow', 8,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Balance Arch Press', 9,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','3 Hop Press', 10,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','Glammour Hammer', 11,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','Brandon Boat', 12,false,true);
SELECT insert_into_workout_exercise('Total Synergistics','Flying Warrior', 13,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','Squat Rockers', 14,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','Side Rise Punch', 15,true,true);
SELECT insert_into_workout_exercise('Total Synergistics','Warrior Squat Moon', 16,false,true);

SELECT * FROM workout_exercise;

--TRUNCATE workout_exercise;
