-- Table: public.schedule

-- DROP TABLE public.schedule;

CREATE TABLE public.schedule
(
  schedule_id bigint NOT NULL DEFAULT nextval('schedule_id_seq'::regclass),
  name text,
  CONSTRAINT schedule_pkey PRIMARY KEY (schedule_id)
)
WITH (
  OIDS=FALSE
);
ALTER TABLE public.schedule
  OWNER TO postgres;
