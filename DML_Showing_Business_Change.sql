--DML Showing Business Change in "Insurance Table":

INSERT INTO insurance

INSERT INTO insurance(insurance_code, insurance_company_name, insurance_max_limit, insurance_min_limit) VALUES 
(6, 'PICC Health', 50, 859990), (7, 'Hexie Health', 10, 100000), (8, 'Italian Servizio Sanitario Nazionale', 0, 120000), 
(9, 'Star Health and Allied Insurance Company Limited', 100, 742100), (10, 'Brazilian Unified Health System, SUS', 0, 10000);


--updating person_id where there was a duplication on patient_id was 17
UPDATE patient_details
SET person_id = 17
WHERE patient_id= 17;

--DML Showing Business Change in "Patient_Details Table":
-- 11 to 15 chinese patients
--16 to 19 italian patients
--20 to 21 indian patients
--22 to 25 brazilian patients

--Updating information for Chinese Patients
UPDATE patient_details
SET insurance_id =6 
WHERE patient_id = 11;

UPDATE patient_details
SET insurance_id =7 
WHERE patient_id = 12;

UPDATE patient_details
SET insurance_id =6 
WHERE patient_id = 13;

UPDATE patient_details
SET insurance_id =7
WHERE patient_id = 14;

UPDATE patient_details
SET insurance_id =7 
WHERE patient_id = 15;

--Updating information for Italian Patients
UPDATE patient_details
SET insurance_id =8 
WHERE patient_id IN (16,17,18,19);

--Updating information for Indian Patients
UPDATE patient_details
SET insurance_id = 9
WHERE patient_id IN (20,21);

--Updating information for Brazilian Patients
UPDATE patient_details
SET insurance_id = 10
WHERE patient_id IN (22,23,24,25);

--Checking all values in Patient_details:
SELECT * FROM patient_details;

--DML showing referential integrity

--ON DELETE CASCADE Behavior:
DELETE FROM disease_type 
WHERE disease_type_code IN (1,2); 

--over here 1 = Infectious Diseases and 2 = Deficiency Diseases

--Let's Check the disease Table to check the behavior:-

SELECT * FROM Diseases;

--ON DELETE RESTRICT Behavior:
DELETE FROM medicine
WHERE medicine_id =1;


SELECT * from medicine;
SELECT * from patient_details

--ON DELETE SET NULL Behavior:
DELETE from insurance
WHERE insurance_code IN (1,4,8);
SELECT * from patient_details;