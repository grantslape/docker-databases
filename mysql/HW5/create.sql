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