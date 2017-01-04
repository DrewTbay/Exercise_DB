-- Table: public.workout

-- DROP TABLE public.workout;

CREATE TABLE public.workout
(
  workout_id bigint NOT NULL DEFAULT nextval('workout_id_seq'::regclass),
  name text NOT NULL,
  CONSTRAINT workout_pkey PRIMARY KEY (workout_id)
);
