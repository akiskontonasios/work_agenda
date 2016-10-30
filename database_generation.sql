CREATE TABLE IF NOT EXISTS work_items
(
  work_item_id bigint NOT NULL,
  description character varying(255),
  charge_in_euros float NOT NULL,
  start_date date NOT NULL,
  end_date date,
  is_current boolean NOT NULL DEFAULT true,
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

INSERT INTO work_items (work_item_id,description,charge_in_euros, start_date, end_date, is_current)
VALUES
(1,  'Ag.Stefanos - Georgia', 20.0, '2016-09-15', null, true),
(2,  'Ag.Stefanos - Lena', 0.0, '2016-09-15', null, true),
(3,  'Barnabas', 20.0, '2016-09-15', null, true),
(4,  'Dionysos - Giorgos', 15.0, '2016-09-15', null, true),
(5,  'Kapandriti - Giorgos', 15.0, '2016-09-15', null, true),
(6,  'Kifisia - Poukamisas', 7.0, '2016-09-15', null, true),
(7,  'Leksimatheia - Xiotis Spyros', 8.9, '2016-09-15', null, true),
(8,  'Leksimatheia - Korontzi Nansy', 8.9, '2016-09-15', null, true),
(9,  'Leksimatheia - Kapouralou Konstantina', 8.9, '2016-09-15', null, true),
(10, 'Leksimatheia - Papadatos Giannis', 8.9, '2016-09-15', null, true),
(11, 'Leksimatheia - Xatzigeorgiou Mara', 8.9, '2016-09-15', null, true),
(12, 'Leksimatheia - Xatzigeorgiou Giorgos', 8.9, '2016-09-15', null, true),
(13, 'Leksimatheia - Sklavounou Eleni', 8.9, '2016-09-15', null, true),
(14, 'Leksimatheia - Fotsi Maria', 8.9, '2016-09-15', null, true),
(15, 'Leksimatheia - Zerva Eustathia', 8.9, '2016-09-15', null, true),
(16, 'Ol. Xwrio - Aleksandros', 12.0, '2016-09-15', null, true),
(17, 'Xolargos - Poukamisas', 7.0, '2016-09-15', null, true);

INSERT INTO working_schedule (work_item_id,weekday,duration_in_hours)
VALUES (5, 'Monday', 1.5),
(3, 'Monday', 2.5),
(6, 'Monday', 2.0),
(4, 'Tuesday', 2.0),
(16, 'Tuesday', 1.5),
(6, 'Tuesday', 1.0),
(5, 'Wednesday', 1.5),
(3, 'Wednesday', 2.5),
(6, 'Wednesday', 2.0),
(7, 'Thursday', 1.0),
(8, 'Thursday', 2.0),
(9, 'Thursday', 2.0),
(10, 'Thursday', 1.0),
(17, 'Friday', 2.0),
(10, 'Saturday', 1.0),
(11, 'Saturday', 1.0),
(12, 'Saturday', 1.0),
(13, 'Saturday', 1.0),
(14, 'Saturday', 1.0),
(15, 'Saturday', 1.0),
(1, 'Saturday', 1.0),
(2, 'Saturday', 1.0);