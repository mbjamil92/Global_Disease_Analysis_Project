-- TESTING TABLE#1:
SELECT * FROM disease_type;

--Testing Table#2
SELECT * FROM diseases;

--Testing Table#3
SELECT * from medicine;

--Testing Table#4
SELECT * from symptom;

--Testing Table#5
SELECT * FROM insurance;

--Testing Table#6
SELECT * From race;

--Testing Table#7
Select * from location;

--Testing Table#8
Select * from person;

--Testing Table#9:
SELECT * FROM patient_details;



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