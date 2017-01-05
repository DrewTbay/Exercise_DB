-- Table: public.exercise

-- DROP TABLE public.exercise;

CREATE TABLE public.exercise
(
  exercise_id bigint NOT NULL DEFAULT nextval('exercise_id_seq'::regclass),
  name text NOT NULL,
  description text,
  CONSTRAINT exercise_pkey PRIMARY KEY (exercise_id)
);
