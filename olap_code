
CREATE TABLE disease_type (

disease_type_code int PRIMARY KEY,
disease_type_name VARCHAR(250),
disease_type_description text
	
);

--Inserting data to disease_type:

INSERT INTO disease_type(disease_type_code,disease_type_name,disease_type_description) VALUES 
(1, 'infectious diseases', 'Infectious diseases are disorders caused by organisms — such as bacteria, viruses, fungi or 
	parasites. Many organisms live in and on our bodies. They are normally harmless or even helpful. But under certain 
 	conditions, some organisms may cause disease. Some infectious diseases can be passed from person to person.'),
(2, 'deficiency diseases', 'Deficiency (medicine), including various types of malnutrition, as well as genetic 
 diseases caused by deficiencies of endogenously produced proteins. A deficiency in construction, an item, or condition that 
 is considered sub-standard, or below minimum expectations.'),
(3,'hereditary diseases','It is a disease or disorder that is inherited genetically. Hereditary Diseases are passed on from one generation to another 
  through defective genes. These diseases are transmitted in the same family. There are two types of hereditary diseases like "genetic diseases", "non-genetic diseases".'),
(4,'physiological diseases','A physiological disorder is a condition in which the organs in the body malfunction causes illness. Examples are Asthma, Glaucoma, Diabetes.
 Physiological Disorders is normally caused when the normal or proper functioning of the body is affected because the bodys organs have malfunctioned, not working or the 
 actual cellular structures have changed over a period of time causing illness. Therefore the majority of diseases and ailments you will be able to name as they fall under
 the physiological category');
 
DELETE FROM disease_type
WHERE disease_type_code IN (1,2,3,4);

SELECT * FROM disease_type


--2nd Table:-
CREATE TABLE diseases (

disease_code INT PRIMARY KEY,
disease_name VARCHAR(250),
disease_mortality_rate float,
disease_type_code INT,
CONSTRAINT fk1_disease FOREIGN KEY(disease_type_code) REFERENCES disease_type(disease_type_code) ON DELETE CASCADE 

);

SELECT * FROM diseases;

--Inserting data into table#2:

--mortality stats from year 2010-2018 per 100,000 deaths

INSERT INTO diseases (disease_code, disease_name, disease_mortality_rate, disease_type_code) VALUES (1, 'Transmissible spongiform encephalopathies', 100, 1),
(2, 'AIDS/HIV', 85.5, 1), (3,'COVID-19', 0.23, 1), (4, 'Cholera', 2.5, 1), (5,'Angina', 5.4, 2), (6, 'Myocardial infarction(heart attack)', 30, 2),
(7, 'Hypertension', 13.5, 2), (8, 'Cancer', 158.3, 2), (9, 'Sickle Cell Anemia', 5, 3), (10, 'cystic fibrosis',0.049, 3), (11, 'Tay-Sachs', 0.03, 3),
(12, 'Hemophilia', 0.05,3), (13, 'Asthma', 0.44, 4), (14, 'Glaucoma', 24.3, 4), (15, 'Diabetes', 5.2, 4), (16, 'Alzheimers', 37.3 ,4);

--3rd Table:

CREATE TABLE medicine (

medicine_id INT PRIMARY KEY,
medicine_company VARCHAR(250),
medicine_name VARCHAR(250),
ingredient_name VARCHAR(250),
dose_amount FLOAT --SI Unit of Dose_amount is mg(miligrams)
	
);

SELECT * from medicine;

--Inserting data into the table#3:-

INSERT INTO medicine(medicine_id, medicine_company, medicine_name, ingredient_name, dose_amount) VALUES (1, 'Abbott', 'Creon', 'Pancreatin', 300), 
(2, 'Ziagen', 'Abacavir', 'dolutegravir sodium', 50), (3, 'Pifeltro', 'doravirine', 'colloidal silicon dioxide, croscarmellose sodium', 100),
(4, 'Pfizer Inc', 'Pfizer-BioNTech Covid-19 Vaccine', 'mRNA, lipids, phosphocholine etc', 2), (5, 'Targadox', 'doxycycline','gelatin, shellac glaze, 
sodium lauryl sulfate, starch, quinoline yellow (E104)', 100), (6, 'Apotheca, Inc', 'Aspirin', 'starch, corn, cellulose, mineral oil, titanium dioxide', 325),
(7, 'Ranexa', 'ranolazine', ' hypromellose, magnesium stearate, methacrylic acid-ethyl', 750), (8, 'Pfizer Inc', 'Ibrance', 'palbociclib ', 125),
(9, 'Emmaus Medical' , 'Endari', 'L-glutamine', 5), (10, 'Vertex Pharmaceuticals, Inc.', 'Kalydeco', 'ivacaftor', 150), (11, 'Chugai', 'Hemlibra', 'emicizumab', 150),
(12, 'ProAir RespiClick', 'Albuterol Sulfate Nebulizer Solution', 'Albuterol sulfate', 4.8), (13, 'Pfizer Inc', 'Xalatant', 'Benzalkonium chloride, 0.02% is added 
as a preservative', 50), (14, 'Pfizer Inc', 'Aricept', 'donepezil hydrochloride', 23), (15, 'Bristol-Myers Squibb', 'metformin', 'candellila wax, cellulose acetate, 
hypromellose, magnesium stearate, polyethylene glycols (PEG 400, PEG 8000), polysorbate 80', 100);

--4th Table: 

CREATE TABLE symptom (

symptom_code INT PRIMARY KEY,
symptom_description text
);


--Inserting data into 4th table:-

INSERT INTO symptom(symptom_code, symptom_description) VALUES (1, 'TSE personality changes, psychiatric problems such as depression, lack of coordination, 
and/or an unsteady gait.'), (2, 'Within a few weeks of HIV infection, flu-like symptoms such as fever, sore throat, and fatigue can occur. Then the
disease is usually asymptomatic until it progresses to AIDS. AIDS symptoms include weight loss, fever or night sweats, fatigue, and recurrent infections.'), 
(3, 'People with COVID-19 have symptoms ranging from mild symptoms to severe illness. Symptoms may appear 2-14 days after exposure to the virus. More symptoms 
are Fever or chills, cough, Shortness of breath or difficulty breathing, Fatigue, Muscle or body aches, Headache, New loss of taste or smell, Sore throat, 
Congestion or runny nose, Nausea or vomiting, Diarrhea.'), (4, 'Key symptoms of Cholera are diarrhea and dehydration. Rarely, shock and seizures may occur 
in severe cases.'), (5, 'Angina feels like squeezing, pressure, heaviness, tightness, or pain in the chest. It can be sudden or recur over time.'), 
(6, 'Heartache Symptoms include tightness or pain in the chest, neck, back, or arms, as well as fatigue, lightheadedness, abnormal heartbeat, 
and anxiety. Women are more likely to have atypical symptoms than men.'), (7, 'Hypertension High blood pressure often has no symptoms. Over 
time, if untreated, it can cause health conditions, such as heart disease and stroke.'), (8, 'Cancer Symptoms vary widely, or they may not occur 
at all. Some patients have abnormal bumps, unexplained fevers, night sweats, hair loss or unintentional weight loss.'), (9,'Infections, pain, 
and fatigue are symptoms of sickle cell disease.'), (10,'Cystic fibrosis Symptoms vary and can include cough, repeated lung infections, 
inability to gain weight, and fatty stools.'), (11, 'Tay-Sachs disease Symptoms are slowed development usually appear around six months of age. 
Symptoms progress until they lead to death, often around age four'), (12,'Hemophilia can result in: Bleeding within joints that can lead to chronic 
joint disease and pain. Bleeding in the head and sometimes in the brain which can cause long term problems, such as seizures and paralysis'), 
(13, 'Asthma may cause difficulty breathing, chest pain, cough, and wheezing. The symptoms may sometimes flare-up.'), 
(14, 'An attack of angle-closure glaucoma includes the following: severe pain in the eye or forehead. redness of the eye. decreased vision or 
blurred vision. seeing rainbows or halos. headache. nausea. vomiting.'), (15, 'Diabetes symptoms are excessive thirst or urination, fatigue, 
weight loss, or blurred vision.'), (16, 'Alzheimers is a type of dementia that affects memory, thinking and behavior. Symptoms eventually grow severe 
enough to interfere with daily tasks.');

SELECT * from symptom;
--5th Table:

CREATE TABLE insurance (

insurance_code INT PRIMARY KEY,
insurance_company_name VARCHAR(250),
insurance_max_limit float,
insurance_min_limit float

);

SELECT * FROM insurance;

--Inserting data in table#5: --currency in $$$

INSERT INTO insurance(insurance_code, insurance_company_name, insurance_max_limit, insurance_min_limit) VALUES (1, 'Adamjee Insurance', 100,99599), 
(2, 'Jubilee Life Insurance', 0, 100000), (3, 'Statefarm', 250, 450000), (4, 'AIG', 800, 550000), (5, 'United Health Care', 350, 650000);

--6th Table:

CREATE TABLE race (

race_code INT PRIMARY KEY,
race_description text	
	
);


--INSERTING data into Race:

SELECT * From race;
INSERT INTO race(race_code,race_description) VALUES (1, 'Asian'), (2, 'White'), (3, 'Black'), (4, 'Latino'), (5, 'Native American'), (6, 'Middle-Eastern'),
(7, 'North-African'), (8, 'Alsakan Natives');

--7th Table:

CREATE TABLE location (

location_code INT PRIMARY KEY,
city_name VARCHAR(250),
state_name VARCHAR(250),
country_name VARCHAR(250)	

);

INSERT INTO location(location_code, city_name, state_name, country_name) VALUES (1, 'East Setauket', 'New York', 'United States'), (2, 'Jersey City', 'New Jersey', 
'United States'), (3, 'New York', 'New York', 'United States'), (4, 'Sacramento', 'California', 'United States'), (5, 'Islamabad', 'Islamabad Capital Territory', 'Pakistan'),
(6, 'Punjab', 'Lahore', 'Pakistan'), (7, 'Sindh', 'Karachi', 'Pakistan'), (8, 'KPK', 'Peshawar', 'Pakistan'), (9, 'Beijing', 'Beijing', 'People Republic of China'), 
(10,'Hong Kong Special Administrative Region', 'Hong Kong', 'People Republic of China'), (11, 'Guangdong', 'Shenzhen', 'People Republic of China'), 
(12, 'Shanghai', 'Shanghai', 'People Republic of China'), (13, 'Milan', 'Bergamo', 'Italy'), (14, 'Maharashtra', 'Mumbai', 'India'), (15, 'Sao Paulo', 'Sau Paulo', 'Brazil');


Select* from location;

--8th Table:


CREATE TABLE person (

person_id INT PRIMARY KEY,
first_name VARCHAR(250),
last_name VARCHAR(250),
gender VARCHAR(1),
person_marital_status VARCHAR(10),
person_location_id INT,
race_id INT,
CONSTRAINT fk2_disease FOREIGN KEY(person_location_id) REFERENCES location(location_code) ON UPDATE CASCADE,	
CONSTRAINT fk3_disease FOREIGN KEY(race_id) REFERENCES race(race_code) ON DELETE SET NULL
	
);

--Inserting data into 8th Table:

INSERT INTO person (person_id, first_name, last_name, gender, person_marital_status,person_location_id, race_id) VALUES (1, 'Johny', 'Doe', 'M', 'Married', 1, 2),
(2, 'Amy', 'Doe', 'F','Married', 2, 2), (3, 'Shirley', 'Benson', 'F', 'Single', 3, 3), (4, 'Taylor', 'Swotski', 'F', 'Widow', 4, 5), (5, 'Naomi', 'Watts', 'F', 'Single',
3, 8), (6, 'Tariq', 'Jameel', 'M', 'Widow', 6, 1), (7, 'Mina', 'Khan', 'F', 'Married', 5, 1), (8, 'Rafia', 'Yousaf', 'F', 'Single', 5,1), (9, 'Hamza', 'Khan', 'M',
'Widow', 8,1), (10, 'Zardari', 'Ali', 'M', 'Widow', 7,1), (11, 'Yi', 'Ming', 'F', 'Single', 9, 1), (12, 'Ming', 'Ma', 'M', 'Married', 11,1), 
(13, 'Winyu', 'Chen', 'F', 'Widow', 10, 1), (14, 'Xin', 'Zouang', 'F', 'Married', 12, 1), (15, 'Cheng', 'Kim', 'M', 'Married', 10,1), (16, 'Maeasa', 'Ali', 'F',
'Single', 13, 6), (17, 'Totti', 'Janice', 'F', 'Married', 13, 2), (18, 'Marco', 'Luca', 'M', 'Married', 13, '2'), (19, 'Alexandra', 'Giovanni', 'F', 'Married', 
13, 7), (20, 'Anjali', 'Kumar', 'F', 'Widow', 14, 1), (21, 'Rajkumar', 'Hirani', 'M', 'Married', 14, 1), (22, 'Lupez', 'Nunez', 'M', 'Married', 15, 4), (23, 'Lucy',
'Paulo', 'F','Single', 15, 4), (24, 'Lucas', 'Pedro', 'M', 'Widow', 15, 3), (25, 'Maria', 'Francisca', 'F', 'Single', 15, 7);

Select * from person;


--Creating table#9:

CREATE TABLE patient_details (

patient_id INT PRIMARY KEY,
patient_start_date DATE,
patient_end_date DATE,
patient_group INT CHECK (patient_group>0 AND patient_group <4), --1 for child, 2 for adult and 3 for elderly
patient_healthcare_proxy BOOLEAN,
patient_treated_date DATE,
disease_id INT,
person_id INT,
medicine_id INT,
insurance_id INT,
symptom_id INT,	
CONSTRAINT fk4_disease FOREIGN KEY(disease_id) REFERENCES diseases(disease_code) ON DELETE CASCADE,
CONSTRAINT fk5_disease FOREIGN KEY(person_id ) REFERENCES person(person_id) ON UPDATE CASCADE,
CONSTRAINT fk6_disease FOREIGN KEY(medicine_id) REFERENCES medicine(medicine_id) ON DELETE RESTRICT,
CONSTRAINT fk7_disease FOREIGN KEY(insurance_id) REFERENCES insurance(insurance_code) ON DELETE SET NULL,
CONSTRAINT fk8_disease FOREIGN KEY(symptom_id) REFERENCES symptom(symptom_code) ON UPDATE NO ACTION
);


--Inserting data into the table#9:
SELECT * FROM patient_details;
DELETE FROM patient_details where patient_id IN (1,2,3,4,5);

INSERT INTO patient_details 
(patient_id, patient_start_date, patient_end_date, patient_group, patient_healthcare_proxy, patient_treated_date, disease_id, person_id, medicine_id, insurance_id, symptom_id) 
VALUES 
(1, '2015-03-22', '2015-05-12', 2, 't', '2015-03-28', 2, 1, 2, 5,2),
(2, '2010-08-23', '2010-09-10', 2, 't', '2010-08-28', 15, 2, 15, 5, 15),
(3, '1999-05-12', '1999-05-29', 2, 'f', '1999-05-17', 9, 3, 9, 4, 9),
(4, '1985-04-09', '1986-05-06', 3, 'f', '1985-04-29', 1, 4, 1, 3, 1),
(5, '2020-09-14', '2020-11-11', 3, 'f', '2020-09-15', 3, 5, 4, NULL, 3),
(6, '2010-02-15', '2010-05-01', 3, 'f', '2010-02-17', 6, 6, 6, NULL, 6),
(7, '1998-07-26', '1998-08-10', 2, 't', '1998-07-26', 4, 7, 5, 1, 4),
(8, '2011-08-07', '2011-08-30', 2, 't', '2011-08-08', NULL, 8, 6, 2, NULL),
(9, '1997-01-20', '1997-02-20', 2, 'f', '1997-05-22', 13, 9, 9, 2, 13),
(10, '1982-10-17', '1983-01-22', 3, 't', '1982-10-18', 5, 10, 3, 1, 5),
(11, '2011-11-04', '2012-01-30', 1, 't', '2011-11-05', 11, 11, 7, NULL, 11),
(12, '2018-12-08', '2020-05-29', 2, 't', '2018-12-09', 8, 12, 8, NULL, 8),
(13, '2016-09-19', '2020-03-21', 3, 'f', '2016-11-11', 7, 13, 7, NULL, 7),
(14, '2009-07-26', '2020-12-18', 2, 't', '2009-08-01', 10, 14, 10, NULL, 10),
(15, '2011-03-04', '2012-08-09', 3, 'f', '2011-03-10', 14, 15, 14, NULL, 14),
(16, '2008-01-29', '2008-03-09', 1, 't', '2008-02-10', 12, 16, 12, NULL, 12),
(17, '2001-09-09', '2010-12-30', 3, 't', '2001-10-01', 16, 17, 15, NULL, 16),
(18, '2019-08-14', '2020-02-10', 3, 'f', '2019-09-30', 14, 18, 14, NULL, 14),
(19, '1992-12-11', '1998-05-27', 2, 't', '1993-12-15', 8, 19, 8, NULL, 8),
(20, '1999-11-29', '2006-07-14', 3, 'f', '1999-11-30', 16, 20, 15, NULL, 16),
(21, '2020-04-29', '2020-09-25', 2, 't', '2020-04-30', 3, 21, 4, NULL, 3),
(22, '2020-05-12', '2020-05-31', 3, 't', '2020-05-14', 3, 22, 4, NULL, 3),
(23, '2000-06-12', '2000-09-30', 1, 'f', '2000-06-13', 1, 23, 1, NULL, 1),
(24, '2020-09-28', '2020-11-30', 3, 'f', '2020-09-29', 3, 24, 4, NULL, 3),
(25, '2010-11-12', '2012-12-31', 1, 't', '2010-11-14', 8, 25, 8, NULL, 8);

