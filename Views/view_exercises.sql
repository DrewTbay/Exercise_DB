-- View: public.view_exercises

-- DROP VIEW public.view_exercises;

CREATE OR REPLACE VIEW public.view_exercises AS 
 SELECT w.workout_name,
    e.exercise_name,
    we.set_order,
    we.record_weight,
    we.record_repetition
   FROM exercise e
     JOIN workout_exercise we ON e.exercise_id = we.exercise_id
     JOIN workout w ON we.workout_id = w.workout_id;

ALTER TABLE public.view_exercises
  OWNER TO postgres;
