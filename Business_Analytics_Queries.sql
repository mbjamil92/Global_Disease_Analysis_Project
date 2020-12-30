/* some analytical queries */

/* Analytical Query #1 */
Select 
count(dw.visiting_date) AS "Total Patients",
disease_dw.gender_dim.gender AS "Gender", 
disease_dw.country_dim.country_name AS "Country", 
disease_dw.race_dim.race AS "Race",
disease_dw.marital_status_dim.marital_status AS "Marital Status",
disease_dw.disease_dim.disease_name AS "Disease Name",
disease_dw.disease_type_dim. disease_type_name AS "Type of Disease",
disease_dw.insurance_dim.insurance_company_name AS "Insurance Name", 
disease_dw.medicine_dim.medicine_name AS "Medicine Name"
FROM disease_dw.visiting_record dw, 
disease_dw.gender_dim,
 disease_dw.country_dim,
disease_dw.race_dim,
 disease_dw.marital_status_dim,
 disease_dw.insurance_dim,
 disease_dw.disease_dim,
 disease_dw.disease_type_dim,
disease_dw.medicine_dim
WHERE 
disease_dw.gender_dim.gender_id = dw.gender_id
and disease_dw.country_dim.country_id = dw.country_id
and disease_dw.race_dim.race_id = dw.race_id
and disease_dw.insurance_dim.insurance_id = dw.insurance_id
and disease_dw.marital_status_dim.marital_status_id = dw. marital_status_id 
and disease_dw.disease_dim.disease_id = dw.disease_id
and disease_dw.disease_type_dim.disease_type_id = dw.disease_type_id
and disease_dw.medicine_dim.medicine_id = dw.medicine_id
GROUP BY 2,3,4,5,6,7,8,9;

/* Analytical Query #2 */
select count (disease_dw.visiting_record.gender_id),disease_dw.gender_dim.gender, disease_dw.country_dim.country_name
from disease_dw.visiting_record , disease_dw.gender_dim, disease_dw.country_dim
where disease_dw.visiting_record.gender_id=disease_dw.gender_dim.gender_id
and disease_dw.visiting_record.country_id = disease_dw.country_dim.country_id
group by 2,3

/* Analytical Query #3 */
select count (disease_dw.visiting_record.race_id), disease_dw.race_dim.race, disease_dw.country_dim.country_name
from disease_dw.visiting_record , disease_dw.country_dim, disease_dw.race_dim
where disease_dw.visiting_record.country_id = disease_dw.country_dim.country_id
and  disease_dw.visiting_record.race_id = disease_dw.race_dim.race_id
group by 2,3
