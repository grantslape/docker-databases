drop schema if exists hospital;

create schema hospital;

use hospital;

create table patients (
  patient_id int not null,
  `name` varchar(100) not null,
  address varchar(255) not null,
  primary key (patient_id)
)ENGINE = INNODB;

create table surgeons (
  surgeon_id int not null,
  `name` varchar(100) not null,
  PRIMARY KEY (surgeon_id)
 ) ENGINE = INNODB;

create table drugs (
  drug_id int not null AUTO_INCREMENT,
  `name` varchar(50) not null,
  side_effect varchar(100),
  primary key (drug_id)
)ENGINE = INNODB;

create table surgeries (
  surgery_id int not null AUTO_INCREMENT,
  patient_id int not null,
  surgeon_id int not null,
  surgery varchar(255) not null,
  surgery_date date not null,
  drug_id int,
  primary key (surgery_id),
  constraint surgeriesfk_1 foreign key (patient_id) references patients(patient_id),
  constraint surgeriesfk_2 foreign key (surgeon_id) references surgeons(surgeon_id),
  constraint surgeriesfk_3 foreign key (drug_id) references drugs(drug_id)
)ENGINE = INNODB;

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

select *
from patients;

select *
from surgeons;

select *
from drugs;

select *
from surgeries;