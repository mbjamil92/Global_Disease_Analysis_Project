
/*1. disease type dimension*/
create table disease_dw.disease_type_dim (
disease_type_id serial primary key,
disease_type_name varchar(250),
disease_type_description text);

/*1b.ETL*/
INSERT INTO disease_dw.disease_type_dim (disease_type_name,disease_type_description)
(SELECT DISTINCT disease_type_name,disease_type_description FROM public.disease_type);
INSERT INTO disease_dw.disease_type_dim (disease_type_name,disease_type_description) values ('NA', 'NA');

SELECT * FROM disease_dw.disease_type_dim ;


/*2. disease dimension*/
CREATE TABLE disease_dw.disease_dim (
disease_id serial primary key,
disease_name varchar(250));

/*2. ETL*/
INSERT INTO disease_dw.disease_dim (disease_name)
(SELECT DISTINCT disease_name FROM public.diseases);
INSERT INTO disease_dw.disease_dim (disease_name) values ('NA');

select * from disease_dw.disease_dim;


/*3. medicine dimension*/
CREATE TABLE disease_dw.medicine_dim (
medicine_id serial primary key,
medicine_name varchar(250),
medicine_company VARCHAR(250),
ingredient_name VARCHAR(250),
dose_amount FLOAT);

/*3. ETL*/
insert into disease_dw.medicine_dim (medicine_name,medicine_company,ingredient_name,dose_amount)
(select medicine_name,medicine_company,ingredient_name,dose_amount from public.medicine);
insert into disease_dw.medicine_dim (medicine_name,medicine_company,ingredient_name,dose_amount) values ('NA','NA','NA',NULL);


select * from disease_dw.medicine_dim;


/*4. symptom dimension*/
create table disease_dw.symptom_dim (
symptom_id serial primary key,
symptom_description varchar(1000));

/*4. ETL*/
insert into disease_dw.symptom_dim (symptom_description)
(select distinct symptom_description from public.symptom);
insert into disease_dw.symptom_dim (symptom_description) values('NA');

select * from disease_dw.symptom_dim;


/*5.insurance dimension*/
create table disease_dw.insurance_dim (
insurance_id serial primary key,
insurance_company_name varchar(100));

/*5.ETL*/
insert into disease_dw.insurance_dim (insurance_company_name)
(select distinct insurance_company_name from public.insurance);
insert into disease_dw.insurance_dim (insurance_company_name)values('NA');

select * from disease_dw.insurance_dim;


/*6. race dimension*/
create table disease_dw.race_dim (
race_id serial primary key,
race varchar(100));

/*6.ETL*/
insert into disease_dw.race_dim (race)
(select distinct race_description from public.race);
insert into disease_dw.race_dim (race)values('NA');

select * from disease_dw.race_dim;

/*7. country table */
create table disease_dw.country_dim (
country_id serial primary key,
country_name varchar(100));

/*7. ETL*/
insert into disease_dw.country_dim (country_name)
(select distinct country_name  from public.location);
insert into disease_dw.country_dim (country_name) values ('NA');

select * from disease_dw.country_dim;


/*8. marital status table */
create table disease_dw.marital_status_dim (
marital_status_id serial primary key,
marital_status VARCHAR(10));

/*8. ELT*/
insert into disease_dw.marital_status_dim (marital_status)
(select distinct person_marital_status  from public.person);
insert into disease_dw.marital_status_dim (marital_status) values ('NA');

select * from disease_dw.marital_status_dim;


/*9. gender table*/
create table disease_dw.gender_dim (
gender_id serial primary key,
gender VARCHAR(10));

/*9. ELT*/
insert into disease_dw.gender_dim (gender)
(select distinct gender  from public.person);
insert into disease_dw.gender_dim (gender)values ('NA');

select * from disease_dw.gender_dim;

/*10. city dimension*/
create table disease_dw.city_dim (
city_id serial primary key,
city_name varchar(100));

/*10. ETL*/
insert into disease_dw.city_dim (city_name)
(select distinct city_name from public.location);
insert into disease_dw.city_dim (city_name)values ('NA');

select * from disease_dw.city_dim


/*:->--------<-:*/
/*create a view ready for fact*/
CREATE VIEW fact_view AS
SELECT 
person.first_name,
person.last_name,  
patient_details.patient_start_date,
coalesce(person.gender,'NA') AS gender, 
coalesce(location.country_name,'NA') AS country_name,
coalesce(location.city_name,'NA') AS city_name,
coalesce(race.race_description, 'NA') AS race_description,
coalesce(person.person_marital_status,'NA') AS person_marital_status,
coalesce(insurance.insurance_company_name,'NA') AS insurance_company_name,
coalesce(diseases.disease_name,'NA') AS disease_name,
coalesce(disease_type.disease_type_name,'NA') AS disease_type_name,
coalesce(symptom.symptom_description,'NA') AS symptom_description,
coalesce(medicine.medicine_name,'NA') AS medicine_name
FROM patient_details left join person on patient_details.patient_id = person.person_id
left join race on race.race_code = person.race_id 
left join diseases on patient_details.disease_id  = diseases.disease_code
left join disease_type on disease_type.disease_type_code=diseases.disease_type_code
left join location on location.location_code=person.person_location_id
left join medicine on medicine.medicine_id = patient_details.medicine_id
left join symptom on symptom.symptom_code =patient_details.symptom_id
left join insurance on insurance.insurance_code =patient_details.insurance_id;
/*:->--------<-:*/
select * from fact_view


/*10. patient visiting fact*/
create table disease_dw.visiting_record
(patient_first_name varchar(100),
 patient_last_name varchar(100), 
 visiting_date date,
gender_id int references disease_dw.gender_dim (gender_id),
country_id int references disease_dw.country_dim (country_id),
city_id int references disease_dw.city_dim (city_id),
 race_id int references disease_dw.race_dim (race_id),
marital_status_id int references disease_dw.marital_status_dim (marital_status_id),
insurance_id int references disease_dw.insurance_dim (insurance_id),
disease_id int references disease_dw.disease_dim (disease_id),
disease_type_id int references disease_dw.disease_type_dim (disease_type_id),
symptom_id int references disease_dw.symptom_dim (symptom_id),
medicine_id int references disease_dw.medicine_dim (medicine_id),
primary key (patient_first_name, patient_last_name, visiting_date ));

/*FACT etl*/
insert into disease_dw.visiting_record
(select 
 v.first_name, 
 v.last_name, 
 v.patient_start_date, 
 disease_dw.gender_dim.gender_id,
 disease_dw.country_dim.country_id,
  disease_dw.city_dim.city_id,
 disease_dw.race_dim.race_id,
 disease_dw.marital_status_dim.marital_status_id,
 disease_dw.insurance_dim.insurance_id,
disease_dw.disease_dim.disease_id,
 disease_dw.disease_type_dim.disease_type_id,
 disease_dw.symptom_dim.symptom_id,
 disease_dw.medicine_dim.medicine_id
from 
 fact_view v, 
 disease_dw.gender_dim,
 disease_dw.country_dim,
  disease_dw.city_dim,
 disease_dw.race_dim,
 disease_dw.marital_status_dim,
 disease_dw.insurance_dim,
 disease_dw.disease_dim,
 disease_dw.disease_type_dim,
 disease_dw.symptom_dim,
disease_dw.medicine_dim
where 
 disease_dw.gender_dim.gender = v.gender
and disease_dw.country_dim.country_name = v.country_name
and disease_dw.city_dim.city_name = v.city_name 
and disease_dw.race_dim.race = v.race_description
and disease_dw.insurance_dim.insurance_company_name = v.insurance_company_name
and disease_dw.marital_status_dim.marital_status = v.person_marital_status 
and disease_dw.disease_dim.disease_name = v.disease_name
and disease_dw.disease_type_dim.disease_type_name = v.disease_type_name
and disease_dw.symptom_dim.symptom_description = v.symptom_description 
and disease_dw.medicine_dim.medicine_name = v.medicine_name);
--LOADED DONE

/* testing fact table */
select * from disease_dw.visiting_record;
SELECT count(visiting_date) From disease_dw.visiting_record;




