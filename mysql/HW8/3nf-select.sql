/*
 * Total sugeries by surgeon descending
 */
select s.name, count(*) as "surgery_total"
from surgeries
join surgeons s on surgeries.surgeon_id = s.surgeon_id
group by s.surgeon_id
order by count(*) desc;

/*
 * Patients who had surgeries in 1985
 * and the surgery they had
 */
select
  distinct patients.patient_id,
  patients.name,
  group_concat(s.surgery separator ', ') as "surgeries"
from patients
join surgeries s on patients.patient_id = s.patient_id
where year(surgery_date) = '1985'
group by patients.patient_id;

/*
 * Average surgeries per patient
 */
select avg(b.count_by_patient)
from
  (
  select p.patient_id, count(*) as count_by_patient
  from surgeries s
  join patients p on s.patient_id = p.patient_id
  group by p.patient_id
  ) b;

/*
 * Surgeries per year
 */
select
  year(su.surgery_date) as `year`,
  count(*)
from surgeries su
group by `year`
order by `year`;

/*
 * Surgeries per month
 */
select
  monthname(su.surgery_date) as `month`,
  count(*)
from surgeries su
group by `month`
order by count(*) desc;

/*
 * total # of drug prescriptions per year
 */
select
  year(su.surgery_date) as `year`,
  count(*),
  group_concat(drugs.name separator ', ')
from surgeries su
join drugs on su.drug_id = drugs.drug_id
where su.drug_id is not null
group by `year`
order by `year`;

/*
 * Patients and distinct surgeons they've seen
 */
select
  p.name as "patient name",
  group_concat(distinct s.name separator ', ') as surgeons
from patients p
join surgeries su on p.patient_id = su.patient_id
join surgeons s on su.surgeon_id = s.surgeon_id
group by p.patient_id
order by p.patient_id desc;

/*
 * Drugs prescribed by surgeon
 */
select
  s.name,
  d.name,
  count(*)
from surgeries su
join surgeons s on su.surgeon_id = s.surgeon_id
join drugs d on su.drug_id = d.drug_id
group by s.surgeon_id, d.drug_id
order by count(*) desc, s.surgeon_id asc;

/*
 * Surgeries and the drugs administered for them
 */
select
  su.surgery,
  group_concat(d.name separator ', ')
from surgeries su
left join drugs d on su.drug_id = d.drug_id
group by su.surgery;

/*
 * Bad batch of prescriptions in 01/1985
 * Which patients were affected?
 */
select
  p.*
from patients p
join surgeries s on p.patient_id = s.patient_id
where month(s.surgery_date) = '1'
and year(s.surgery_date) = '1985';