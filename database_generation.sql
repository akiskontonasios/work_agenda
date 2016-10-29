CREATE TABLE IF NOT EXISTS work_items
(
  work_item_id bigint NOT NULL,
  description character varying(255),
  charge_in_euros float NOT NULL,
  CONSTRAINT work_item_pkey PRIMARY KEY (work_item_id)
)
WITH (
  OIDS=FALSE
);

CREATE TABLE IF NOT EXISTS working_schedule
(
  work_item_id bigint NOT NULL,
  weekday character varying(255),
  duration_in_hours float NOT NULL,
  CONSTRAINT fk_tests_students
     FOREIGN KEY (work_item_id) 
     REFERENCES work_items (work_item_id))
WITH (
  OIDS=FALSE
);

INSERT INTO work_items (work_item_id,description,charge_in_euros) 
VALUES (1, 'Ag.Stefanos - Leksimatheia', 8.9),
(2, 'Ag.Stefanos - Georgia', 20.0),
(3, 'Ag.Stefanos - Lena', 15.0),
(4, 'Barnabas', 20.0),
(5, 'Dionysos - Giorgos', 15.0),
(6, 'Kapandriti - Giorgos', 15.0),
(7, 'Kifisia - Poukamisas', 7.0),
(8, 'Ol. Xwrio - Aleksandros', 12.0),
(9, 'Xolargos - Poukamisas', 7.0);

INSERT INTO working_schedule (work_item_id,weekday,duration_in_hours) 
VALUES (6, 'Monday', 1.5),
(4, 'Monday', 2.5),
(7, 'Monday', 2.0),
(5, 'Tuesday', 2.0),
(8, 'Tuesday', 1.5),
(7, 'Tuesday', 1.0),
(6, 'Wednesday', 1.5),
(4, 'Wednesday', 2.5),
(7, 'Wednesday', 2.0),
(1, 'Thursday', 6.0),
(9, 'Friday', 2.0),
(1, 'Saturday', 6.0),
(2, 'Saturday', 1.0),
(3, 'Saturday', 1.0);