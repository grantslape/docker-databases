insert into hospital.patients
(patient_id, name, address)
values
(1111, 'John White', '15 New Street, New York, NY'),
(1234, 'Mary Jones', '10 Main Street, Rye, NY'),
(2345, 'Charles Brown', 'Dogwood Lane, Harrison, NY'),
(4876, 'Hal Kane', '55 Boston Post Road, Chester, CT'),
(5123, 'Paul Kosher', 'Blind Brook Mamaroneck, NY'),
(6845, 'Ann Hood', 'Hilton Road, Larchmont, NY');

insert into hospital.surgeons
(surgeon_id, name)
values
(145, 'Beth Little'),
(311, 'Michael Diamond'),
(243, 'Charles Field'),
(467, 'Patricia Gold'),
(189, 'David Rosen');

insert into hospital.drugs
(name, side_effect)
values
('Penicillin', 'Rash'),
('Tetracycline', 'Fever'),
('Cephalosporin', null),
('Demicillin', null);

insert into hospital.surgeries
(patient_id, surgeon_id, surgery, surgery_date, drug_id)
values
(1111, 145, 'Gallstones removal', '1985-01-01', 1),
(1111, 311, 'Kidney Stones removal', '1985-06-12', null),
(1234, 243, 'Eye cataract removal', '1984-04-05', 2),
(1234, 467, 'Thrombosis removal', '1985-05-10', null),
(2345, 189, 'Open heart surgery', '1986-01-08', 3),
(4876, 145, 'Cholecystectomy', '1985-11-05', 4),
(5123, 145, 'Gallstones removal', '1985-05-10', null),
(6845, 243, 'Eye cornea replacement', '1984-04-05', 2),
(6845, 243, 'Eye cataract removal', '1984-12-15', null);