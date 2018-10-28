drop schema if exists hospital;

create schema hospital;

use hospital;

create table patients_surgeons_surgeries (
  patient_id int not null,
  patient_name varchar(255) not null,
  address varchar(255) not null,
  surgeon_id int not null,
  surgeon_name varchar(255) not null,
  surgery_date date not null,
  surgery varchar(255) not null,
  drug varchar(50) null,
  side_effect varchar(50) null,
  primary key (patient_id, surgeon_id, surgery_date, surgery)
)ENGINE = INNODB;

insert into patients_surgeons_surgeries
  (patient_id, patient_name, address, surgeon_id, surgeon_name, surgery_date, surgery, drug, side_effect)
VALUES
  (1111, 'John White', '15 New Street, New York, NY', 145, 'Beth Little', '1985-01-01', 'Gallstones removal', 'Penicillin', 'Rash'),
  (1111, 'John White', '15 New Street, New York, NY', 311, 'Michael Diamond', '1985-06-12', 'Kidney stones removal', null, null),
  (1234, 'Mary Jones', '10 Main Street, Rye, NY', 243, 'Charles Field', '1984-04-05', 'Eye cataract removal', 'Tetracycline', 'Fever'),
  (1234, 'Mary Jones', '10 Main Street, Rye, NY', 467, 'Patricia Gold', '1985-05-10', 'Thrombosis removal', null, null),
  (2345, 'Charles Brown', 'Dogwood Lane, Harrison, NY', 189, 'David Rosen', '1986-01-08', 'Open heart surgery', 'Cephalosporin', null),
  (4876, 'Hal Kane', '55 Boston Post Road, Chester, CT',  145, 'Beth Little', '1985-11-05', 'Cholecystectomy', 'Demicillin', null),
  (5123, 'Paul Kosher', 'Blind Brook Mamaroneck, NY', 145, 'Beth Little', '1985-05-10', 'Gallstones removal', null, null),
  (6845, 'Ann Hood', 'Hilton Road, Larchmont, NY', 243, 'Charles Field', '1984-04-05', 'Eye cornea replacement', 'Tetracycline', 'Fever'),
  (6845, 'Ann Hood', 'Hilton Road, Larchmont, NY', 243, 'Charles Field', '1984-12-15', 'Eye cataract removal', null, null);

select *
from patients_surgeons_surgeries;