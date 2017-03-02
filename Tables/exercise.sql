\c exercise_db;

DROP TABLE IF EXISTS exercises CASCADE;
DROP SEQUENCE IF EXISTS exercise_id_seq CASCADE;

-- Sequence: exercise_id_seq

CREATE SEQUENCE exercise_id_seq
  INCREMENT 1
  MINVALUE 1
  MAXVALUE 9223372036854775807
  START 1;

-- Table: exercises

CREATE TABLE public.exercises
(
  exercise_id integer NOT NULL DEFAULT nextval('exercise_id_seq'::regclass),
  exercise_name text NOT NULL,
  exercise_description text NOT NULL,
  CONSTRAINT exercise_pkey PRIMARY KEY (exercise_id)
);

GRANT SELECT (exercise_name, exercise_description)
  ON exercises TO exercise_conn;

--Total Synergistics
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Push-up/Side Arm Balance', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Crescent Chair', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Pull Knee Pull', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Flip Flop Crunch', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Crawly Plyo Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Releve-Plie, Weighted', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Chin-up Circle Crunch', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Boat Plow', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Balance Arch Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('3 Hop Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Glammour Hammer', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Brandon Boat', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Flying Warrior', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Squat Rockers', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Side Rise Punch', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Warrior Squat Moon', 'Fill in later');

--Agility X
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Agility X routine', 'Fill in later');

--The Challenge
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Standard Pull-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Standard Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Chin-up', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Military Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Close Grip Pull-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Wide Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Vaulter Pull-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Staggered Push-ups', 'Fill in later');
--X3 Yoga
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('X3 Yoga routine', 'Fill in later');

--CVX
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Press Jacks', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Atlas Twist', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('March and Reach', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Traveling Tire Twist', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Frog Squat Reach', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Arc Press Reach', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Hop Overs', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Balance Pull', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Twist and Pviot', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Side Lunge Jumps Shot', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Globe Squatters', 'Fill in later');
--The Warrior
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Plank-Sphinx Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Speed Skater', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Down Dog Crunches', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Elevator Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Double Uppercut, Sprawls', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Roller Boat', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('One Leg Jump Squats', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Thumbs-up Push-up', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Elbow, Over The Top Elbow, Sprawl', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Fifer Scissor Twist', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Warrior Squat Lunges', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Super Burpee', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Think Drills', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Abrinome', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Spiderman Squats', 'Fill in later');
--Isometrix
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Isometrix routine', 'Fill in later');
--Dynamix
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Dynamix routine', 'Fill in later');
--Accelerator
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Accelerator routine', 'Fill in later');
--Pilates X
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Pilates routine', 'Fill in later');
--Incinerator
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Renegade Row', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Floor Flys', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Rocket Launcher Row', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('"A" Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Monkey Pump', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Pike Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Pterodactyl Flys', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Flipper', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Popeye Hammer Curls', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Kneeler Curls', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Hail to The Chief', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Skyfers', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Arm and Hammer', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Rocket Launcher Kickback', 'Fill in later');
--Triometrics
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Triometrics routine', 'Fill in later');
--MMX
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('MMX routine', 'Fill in later');
--Eccentric Upper
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Military Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Deep Swimmer''s Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('V Pull-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Upright Hammer Pull', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Later/Anterior Raise', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Plyo Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Flip Flop Combo', 'Fill in later');
--Eccentric Lower
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Squats', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Lunge', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Sumo', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Weighted Pistol', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Side Kicks', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Front Kicks', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Albanian Squat', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Adductor Lunge', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Cross Reach', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('TT Plus', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Bridge Kicks', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Hip Flexor Splits', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Calf Dog', 'Fill in later');
--Decelerator
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Bounding Squats', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Crane Cracker Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Good God Squats', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Elevator Pull-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('2-Pop Hop', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Holmsen Screamer Hold', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Chin Pulls', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Joel Jump', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Starfish Push-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Duper 2', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Elevator Tiptoe Squats', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Superman/Bow', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Spinning Plyo Squat Lunges', 'Fill in later');
--Cold Start
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Cold Start routine', 'Fill in later');
--Complex Upper
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Slow-mo Chin-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Lunge Thrust Press', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('W Pull-ups', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Push-up Bird Dog Crunch', 'Fill in later');
--Complex Lower
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('DS Double L', 'Fill in later');
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('The Stabilizer', 'Fill in later');
--X3 Ab Ripper
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('X3 Ab Ripper routine', 'Fill in later');
--Rest Days
INSERT INTO exercises
  (exercise_name, exercise_description)
VALUES
  ('Rest', 'Fill in later');
