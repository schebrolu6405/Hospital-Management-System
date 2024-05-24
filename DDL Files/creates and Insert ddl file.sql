CREATE TABLE IF NOT EXISTS Patient (
    Patient_ID INT PRIMARY KEY,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Date_Of_Birth DATE,
    Gender VARCHAR(10),
    Contact_Number VARCHAR(15),
    City VARCHAR(50),
    State VARCHAR(50),
    Age INT
);

CREATE TABLE IF NOT EXISTS Insurance (
    Insurance_ID INT PRIMARY KEY,
    Patient_ID INT,
    Insurance_Provider VARCHAR(50),
    Coverage_Amount DECIMAL(10, 2),
    Coverage_Start_Date DATE,
    Coverage_End_Date DATE,
    FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE IF NOT EXISTS Staff (
    Staff_ID INT PRIMARY KEY,
    Department_ID INT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Staff_Role VARCHAR(50),
    Contact_Number VARCHAR(15),
    Joining_Date DATE,
    Salary DECIMAL(10, 2)
);


CREATE TABLE IF NOT EXISTS Department (
    Department_ID INT PRIMARY KEY,
    Department_Name VARCHAR(50),
    Head_Of_Department_ID INT,
	FOREIGN KEY (Head_Of_Department_ID) REFERENCES Staff(Staff_ID)
);

CREATE TABLE IF NOT EXISTS Doctor (
    Doctor_ID INT PRIMARY KEY,
	Department_ID INT,
    First_Name VARCHAR(50),
    Last_Name VARCHAR(50),
    Specialization VARCHAR(50),
    Contact_Number VARCHAR(15),
    Experience INT,
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID)
);


CREATE TABLE IF NOT EXISTS Appointment (
    Appointment_ID INT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Doctor_ID INT,
    Appointment_Date DATETIME,
    Visit_Type VARCHAR(50),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
	FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE IF NOT EXISTS Medical_Record (
    Record_ID INT PRIMARY KEY,
    Patient_ID INT,
    Doctor_ID INT,
    Record_Date DATE,
    Diagnosis TEXT,
    Symptoms TEXT,
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID),
	FOREIGN KEY (Doctor_ID) REFERENCES Doctor(Doctor_ID)
);

CREATE TABLE IF NOT EXISTS Prescription (
    Prescription_ID INT PRIMARY KEY,
    Record_ID INT,
    Medication VARCHAR(255),
    Dosage VARCHAR(50),
	FOREIGN KEY (Record_ID) REFERENCES Medical_Record(Record_ID)
);

CREATE TABLE IF NOT EXISTS Transactions (
    Transaction_ID INT PRIMARY KEY,
    Patient_ID INT,
    Amount DECIMAL(10, 2),
    Transaction_Date DATETIME,
    Payment_Mode VARCHAR(20),
	FOREIGN KEY (Patient_ID) REFERENCES Patient(Patient_ID)
);

CREATE TABLE InPatient (
  IPatientID int NOT NULL,
  AdmissionDate date DEFAULT NULL,
  RoomNumber varchar(4) DEFAULT NULL,
  DischargeDate date DEFAULT NULL,
  PRIMARY KEY (IPatientID)
);

CREATE TABLE OutPatient (
  OPatientID int NOT NULL,
  Last_Visit_Date date DEFAULT NULL,
  Next_Appointment_Date date DEFAULT NULL,
  PRIMARY KEY (OPatientID)
);

CREATE TABLE EmergencyPatient (
  EPatientID int NOT NULL,
  Emergency_Contact varchar(12) DEFAULT NULL,
  Admission_Reason varchar(30) DEFAULT NULL,
  PRIMARY KEY (EPatientID)
);

INSERT INTO `Appointment` VALUES (9000,1001,4001,'2023-12-10 10:00:00','Check-up'),
(9001,1002,4002,'2023-12-12 14:30:00','Consultation'),
(9002,1003,4003,'2023-12-15 09:45:00','Check-up'),
(9003,1004,4004,'2023-12-18 11:15:00','Check-up'),
(9004,1005,4005,'2023-12-20 15:00:00','Consultation'),
(9005,1006,4006,'2023-12-22 12:30:00','Check-up'),
(9006,1007,4007,'2023-12-25 10:45:00','Follow-up'),
(9007,1008,4008,'2023-12-28 14:00:00','Check-up'),
(9008,1009,4009,'2023-12-31 13:15:00','Check-up'),
(9009,1010,4010,'2024-01-03 11:30:00','Follow-up'),
(9010,1011,4011,'2024-01-06 09:00:00','Check-up'),
(9011,1012,4012,'2024-01-09 15:30:00','Check-up'),
(9012,1013,4004,'2024-01-12 12:15:00','Follow-up'),
(9013,1014,4003,'2024-01-15 14:45:00','Consultation'),
(9014,1015,4012,'2024-01-18 10:30:00','Check-up'),
(9015,1016,4001,'2024-01-21 11:45:00','Follow-up'),
(9016,1017,4003,'2024-01-24 13:00:00','Check-up'),
(9017,1018,4007,'2024-01-27 15:15:00','Check-up'),
(9018,1019,4008,'2024-01-30 09:30:00','Follow-up'),
(9019,1020,4006,'2024-02-02 12:00:00','Consultation'),
(9020,1001,4012,'2024-02-05 10:15:00','Follow-up'),
(9021,1002,4012,'2024-02-08 14:30:00','Follow-up'),
(9022,1003,4009,'2024-02-11 09:45:00','Consultation'),
(9023,1004,4005,'2024-02-14 11:00:00','Follow-up'),
(9024,1005,4009,'2024-02-17 15:00:00','Follow-up'),
(9025,1000,4004,'2023-07-18 12:00:00','Check-up');


INSERT INTO `Department` VALUES (101,'Pediatric',5010),
(102,'Laboratory',5006),
(103,'Nursing',5017),
(104,'Neuro_Imaging',5008),
(105,'Pharmacy',5019);

INSERT INTO `Doctor` VALUES
(4001, 101, 'Dr. Emily', 'Johnson', 'Pediatric Cardiology', '(987)654-3210', 12),
(4002, 101, 'Dr. Chloe', 'Garcia', 'Pediatric Dermatology', '(999)000-1111', 14),
(4003, 101, 'Dr. Jackson', 'Ward', 'Pediatric Infectious Diseases', '(777)888-9999', 13),
(4004, 101, 'Dr. Priyansh', 'Lopez', 'Pediatric Neurology', '(333)444-5555', 23),
(4005, 101, 'Dr. Aria', 'King', 'Pediatric Pulmonology', '(666)777-8888', 11),
(4006, 104, 'Dr. Lily', 'Taylor', 'Neuro Imaging', '(555)666-7777', 21),
(4007, 104, 'Dr. Ethan', 'Martinez', 'Neuroradiology', '(111)222-3333', 17),
(4008, 104, 'Dr. Mia', 'Roberts', 'Neurointerventional radiology', '(999)000-1111', 14),
(4009, 104, 'Dr. Benjamin', 'Lee', 'Neurointerventional radiology', '(222)333-4444', 16),
(4010, 104, 'Dr. Grace', 'Hall', 'Neuro Imaging', '(111)222-3333', 24),
(4011, 101, 'Dr. Oliver', 'Young', 'Pediatric Cardiology', '(222)333-4444', 5),
(4012, 101, 'Dr. Mia', 'Moore', 'Pediatric Infectious Diseases', '(555)666-7777', 4);

INSERT INTO `EmergencyPatient` VALUES (1003,'123-985-2578','Fatigue'),(1012,'457-237-8956','Fatigue');

INSERT INTO `InPatient` VALUES (1001,'2023-02-14','A104','2023-02-28'),
(1004,'2023-07-08','B108','2023-07-11'),
(1015,'2023-04-22','A101','2023-05-01'),
(1022,'2023-10-15','B102','2023-10-17'),
(1023,'2023-12-14','C105','2023-12-25');

INSERT INTO `Insurance` VALUES
(2000, 1000, 'ABC Insurance', 5000.00, '2022-12-31', '2023-12-31'),
(2001, 1001, 'XYZ Insurance', 7500.50, '2022-12-15', '2023-12-15'),
(2002, 1002, 'Insurance Co.', 10000.00, '2022-02-01', '2023-02-01'),
(2003, 1003, 'United Healthcare', 6000.75, '2023-11-01', '2024-11-01'),
(2004, 1004, 'Insurance Co.', 8000.25, '2023-03-15', '2024-03-15'),
(2005, 1005, 'United Healthcare', 9000.50, '2021-10-01', '2022-10-01'),
(2006, 1006, 'ABC Insurance', 7000.00, '2023-04-01', '2024-04-01'),
(2007, 1007, 'XYZ Insurance', 12000.00, '2021-09-15', '2022-09-15'),
(2008, 1008, 'Insurance Co.', 8500.25, '2022-05-01', '2023-05-01'),
(2009, 1009, 'United Healthcare', 9500.75, '2021-08-01', '2022-08-01'),
(2010, 1010, 'Insurance Co.', 11000.50, '2022-12-15', '2023-12-15'),
(2011, 1011, 'United Healthcare', 7700.00, '2021-07-01', '2022-07-01'),
(2012, 1012, 'ABC Insurance', 8800.25, '2023-08-15', '2024-08-15'),
(2013, 1013, 'XYZ Insurance', 10500.50, '2021-06-01', '2022-06-01'),
(2014, 1014, 'Insurance Co.', 9200.75, '2023-01-01', '2024-01-01'),
(2015, 1015, 'United Healthcare', 6400.00, '2021-05-15', '2022-05-15'),
(2016, 1016, 'ABC Insurance', 7800.25, '2022-12-21', '2023-12-21'),
(2017, 1017, 'United Healthcare', 9900.50, '2021-04-01', '2022-04-01'),
(2018, 1018, 'ABC Insurance', 7200.75, '2022-11-15', '2023-11-15'),
(2019, 1019, 'XYZ Insurance', 8700.00, '2021-03-01', '2022-03-01');

INSERT INTO `OutPatient` VALUES (1006,'2023-12-22','2024-01-06'),
(1007,'2023-12-25','2024-01-09'),
(1020,'2024-02-02','2024-02-16');

INSERT INTO `Medical_Record` VALUES
(7000, 1001, 4001, '2022-01-10', 'Common Cold', 'Runny nose, sneezing, coughing'),
(7001, 1002, 4002, '2022-01-12', 'Gastritis', 'Stomach pain, bloating, nausea'),
(7002, 1003, 4003, '2022-03-15', 'Influenza', 'Fever, body pain, fatigue'),
(7003, 1004, 4004, '2022-04-18', 'Hypertension', 'High blood pressure, headache'),
(7004, 1005, 4005, '2022-05-20', 'Autism', 'Social anxiety, repetitive movements'),
(7005, 1006, 4006, '2022-04-22', 'Asthma', 'Shortness of breath, congestion'),
(7006, 1007, 4007, '2022-04-25', 'Diabetes Type 2', 'Increased thirst, frequent urination'),
(7007, 1008, 4008, '2022-07-28', 'Migraine', 'Severe headache, fatigue'),
(7008, 1009, 4009, '2022-07-19', 'Hypothyroidism', 'Fatigue, weight gain, dry skin'),
(7009, 1010, 4010, '2022-09-25', 'Osteoarthritis', 'Joint pain, muscle spasms'),
(7010, 1011, 4011, '2022-10-06', 'Anxiety', 'Nervousness, restlessness'),
(7011, 1012, 4012, '2022-11-09', 'Anxiety', 'Nervousness, fatigue'),
(7012, 1013, 4004, '2023-01-12', 'Gastroenteritis', 'Diarrhea, vomiting, abdominal pain'),
(7013, 1014, 4003, '2023-01-15', 'Migraine', 'Severe headache, fatigue'),
(7014, 1015, 4012, '2023-02-18', 'Autism', 'Restlessness, chest discomfort'),
(7015, 1016, 4001, '2023-03-21', 'Influenza', 'Fever, body pain, fatigue'),
(7016, 1017, 4003, '2023-04-24', 'Conjunctivitis', 'Redness, itchy eyes'),
(7017, 1018, 4007, '2023-05-27', 'Peptic Ulcer', 'Abdominal pain, indigestion'),
(7018, 1019, 4008, '2023-05-30', 'Asthma', 'Shortness of breath, congestion'),
(7019, 1020, 4006, '2023-06-02', 'Insomnia', 'Difficulty falling asleep'),
(7020, 1001, 4012, '2023-07-05', 'Pneumonia', 'Fever, cough, chest pain'),
(7021, 1002, 4012, '2023-08-08', 'Common Cold', 'Runny nose, sneezing, coughing'),
(7022, 1003, 4009, '2023-09-11', 'Autism', 'Restlessness, repetitive movements'),
(7023, 1004, 4005, '2023-09-14', 'Pneumonia', 'Fever, cough, chest pain, congestion'),
(7024, 1005, 4009, '2023-08-17', 'Diabetes Type 2', 'Increased thirst, frequent urination');

INSERT INTO `Patient` VALUES
(1000, 'John', 'Doe', '1990-05-15', 'Male', '123-456-7890', 'Dallas', 'TX', 32, NULL),
(1001, 'Jane', 'Smith', '1985-08-20', 'Female', '987-654-3210', 'San Diego', 'CA', 37, 'InPatient'),
(1002, 'Michael', 'Johnson', '1978-03-10', 'Male', '555-111-2222', 'Chicago', 'IL', 44, NULL),
(1003, 'Emily', 'Davis', '1995-12-05', 'Female', '777-888-9999', 'Austin', 'TX', 26, 'Emergency'),
(1004, 'David', 'Miller', '1982-06-25', 'Male', '333-444-5555', 'Charlotte', 'NC', 39, 'InPatient'),
(1005, 'Olivia', 'Anderson', '1998-01-18', 'Female', '666-777-8888', 'Columbus', 'OH', 24, NULL),
(1006, 'William', 'Wilson', '1989-09-30', 'Male', '111-222-3333', 'Austin', 'TX', 33, 'OutPatient'),
(1007, 'Ava', 'Thompson', '1975-11-12', 'Female', '999-000-1111', 'San Diego', 'CA', 46, 'OutPatient'),
(1008, 'Ethan', 'Martin', '1992-04-22', 'Male', '444-555-6666', 'Dallas', 'TX', 29, NULL),
(1009, 'Sophia', 'Harris', '1980-07-08', 'Female', '888-999-0000', 'San Diego', 'CA', 42, NULL),
(1010, 'Daniel', 'White', '1993-02-14', 'Male', '222-333-4444', 'Seattle', 'WA', 28, NULL),
(1011, 'Mia', 'Moore', '1972-10-03', 'Female', '555-666-7777', 'Chicago', 'IL', 51, NULL),
(1012, 'Christopher', 'Taylor', '1987-05-28', 'Male', '777-888-9999', 'Boston', 'MA', 36, 'Emergency'),
(1013, 'Isabella', 'Brown', '1996-09-17', 'Female', '111-222-3333', 'San Jose', 'CA', 27, NULL),
(1014, 'Matthew', 'Jones', '1984-03-08', 'Male', '999-000-1111', 'Boston', 'MA', 38, NULL),
(1015, 'Aria', 'Johnson', '1991-06-12', 'Female', '444-555-6666', 'Austin', 'TX', 31, 'InPatient'),
(1016, 'James', 'Clark', '1979-12-25', 'Male', '888-999-0000', 'San Diego', 'CA', 42, NULL),
(1017, 'Grace', 'Lewis', '1997-04-30', 'Female', '222-333-4444', 'San Diego', 'CA', 24, NULL),
(1018, 'Andrew', 'Hall', '1983-08-15', 'Male', '555-666-7777', 'Charlotte', 'NC', 38, NULL),
(1019, 'Chloe', 'King', '1976-11-05', 'Female', '777-888-9999', 'New York', 'NY', 47, NULL),
(1020, 'Ryan', 'Ward', '1994-02-20', 'Male', '111-222-3333', 'Seattle', 'WA', 27, 'OutPatient'),
(1021, 'Lily', 'Baker', '1988-07-10', 'Female', '999-000-1111', 'New York', 'NY', 34, NULL),
(1022, 'Jackson', 'Cooper', '1981-04-22', 'Male', '444-555-6666', 'New York', 'NY', 41, 'InPatient'),
(1023, 'Hannah', 'Roberts', '1999-09-05', 'Female', '888-999-0000', 'San Jose', 'CA', 23, 'InPatient'),
(1024, 'Nathan', 'Evans', '1986-01-30', 'Male', '555-666-7777', 'Columbus', 'OH', 37, NULL);


INSERT INTO `Prescription` VALUES
(8000, 7000, 'Ibuprofen', '200mg, 1 tablet every 4 hours as needed for pain'),
(8001, 7001, 'Omeprazole', '20mg, 1 capsule daily before a meal'),
(8002, 7002, 'Oseltamivir', '75mg, 1 capsule twice daily for 5 days'),
(8003, 7003, 'Amlodipine', '5mg, 1 tablet daily in the morning'),
(8004, 7004, 'Loratadine', '10mg, 1 tablet daily as needed for allergies'),
(8005, 7005, 'Albuterol Inhaler', '2 puffs every 4-6 hours as needed for asthma'),
(8006, 7006, 'Metformin', '500mg, 1 tablet twice daily with meals'),
(8007, 7007, 'Sumatriptan', '50mg, 1 tablet as needed for migraine'),
(8008, 7008, 'Levothyroxine', '50mcg, 1 tablet daily on an empty stomach'),
(8009, 7009, 'Ibuprofen', '400mg, 1 tablet every 6 hours as needed for pain'),
(8010, 7010, 'Acetaminophen', '500mg, 1 tablet every 4-6 hours as needed for pain'),
(8011, 7011, 'Sertraline', '50mg, 1 tablet daily in the morning'),
(8012, 7012, 'Fluoxetine', '20mg, 1 capsule daily in the morning'),
(8013, 7013, 'Loperamide', '2mg, 2 tablets initially, then 1 tablet after each'),
(8014, 7014, 'Albuterol Inhaler', '2 puffs every 4-6 hours as needed for asthma'),
(8015, 7015, 'Ibuprofen', '200mg, 1 tablet every 4-6 hours as needed for pain'),
(8016, 7016, 'Artane', '2mg, 1 tablet twice daily for muscle spasms'),
(8017, 7017, 'Omeprazole', '20mg, 1 capsule daily before a meal'),
(8018, 7018, 'Naproxen', '250mg, 1 tablet every 8 hours as needed for pain'),
(8019, 7019, 'Hydroxychloroquine', '200mg, 1 tablet daily'),
(8020, 7020, 'Zolpidem', '10mg, 1 tablet at bedtime as needed for insomnia'),
(8021, 7001, 'Amoxicillin', '500mg, 1 capsule three times daily for 10 days'),
(8022, 7002, 'Loratadine', '10mg, 1 tablet daily as needed for allergies'),
(8023, 7003, 'Azithromycin', '250mg, 1 tablet daily for 5 days'),
(8024, 7004, 'Ibuprofen', '400mg, 1 tablet every 6 hours as needed for pain'),
(8025, 7005, 'Albuterol Inhaler', '2 puffs every 4-6 hours as needed for asthma');

INSERT INTO `Staff` VALUES
(5000, 103, 'John', 'Doe', 'Nurse', '(123)456-7890', '2022-01-15', 75000.00),
(5001, 103, 'Jane', 'Smith', 'Nurse', '(987)654-3210', '2022-02-20', 60000.50),
(5002, 104, 'Michael', 'Johnson', 'Lab Technician', '(555)111-2222', '2021-12-01', 55000.00),
(5003, 102, 'Emily', 'Davis', 'Lab Technician', '(777)888-9999', '2022-03-10', 45000.75),
(5004, 105, 'David', 'Miller', 'Pharmacist', '(333)444-5555', '2022-04-15', 50000.25),
(5005, 101, 'Olivia', 'Anderson', 'Receptionist', '(666)777-8888', '2021-11-01', 48000.50),
(5006, 103, 'William', 'Wilson', 'Care Taker', '(111)222-3333', '2022-05-01', 70000.00),
(5007, 105, 'Ava', 'Thompson', 'IT Support Specialist', '(999)000-1111', '2022-06-15', 65000.25),
(5008, 104, 'Ethan', 'Martin', 'Care Taker', '(444)555-6666', '2022-07-01', 52000.75),
(5009, 103, 'Sophia', 'Harris', 'Nurse', '(888)999-0000', '2022-08-15', 58000.50),
(5010, 103, 'Daniel', 'White', 'Nurse', '(222)333-4444', '2022-09-01', 72000.00),
(5011, 102, 'Mia', 'Moore', 'Lab Technician', '(555)666-7777', '2022-10-15', 62000.25),
(5012, 103, 'Christopher', 'Taylor', 'Care Taker', '(777)888-9999', '2022-11-30', 57000.00),
(5013, 104, 'Isabella', 'Brown', 'Lab Technician', '(111)222-3333', '2023-01-01', 49000.75),
(5014, 105, 'Matthew', 'Jones', 'Pharmacist', '(333)444-5555', '2023-02-15', 53000.25),
(5015, 101, 'Aria', 'Johnson', 'Receptionist', '(666)777-8888', '2023-03-01', 51000.50),
(5016, 103, 'James', 'Clark', 'Care Taker', '(111)222-3333', '2023-04-15', 73000.00),
(5017, 105, 'Grace', 'Lewis', 'IT Support Specialist', '(999)000-1111', '2023-05-30', 68000.25),
(5018, 101, 'Andrew', 'Hall', 'Care Taker', '(444)555-6666', '2023-07-01', 54000.75),
(5019, 103, 'Chloe', 'King', 'Nurse', '(888)999-0000', '2023-08-15', 60000.50),
(5020, 103, 'Ryan', 'Ward', 'Nurse', '(222)333-4444', '2023-09-01', 74000.00),
(5021, 102, 'Lily', 'Baker', 'Lab Technician', '(555)666-7777', '2023-10-15', 64000.25),
(5022, 103, 'Jackson', 'Cooper', 'Care Taker', '(777)888-9999', '2023-11-30', 59000.00),
(5023, 101, 'Hannah', 'Roberts', 'Lab Technician', '(111)222-3333', '2024-01-01', 51000.75),
(5024, 105, 'Nathan', 'Evans', 'Pharmacist', '(333)444-5555', '2024-02-15', 55000.25);

INSERT INTO `Transactions` VALUES
(12000, 1001, 15000.00, '2023-12-10 08:30:00', 'Credit Card'),
(12001, 1002, 20075.00, '2023-12-12 10:45:00', 'Cash'),
(12002, 1003, 7529.67, '2023-12-15 13:20:00', 'Debit Card'),
(12003, 1004, 31578.00, '2023-12-18 15:55:00', 'Cash'),
(12004, 1005, 45689.00, '2023-12-20 18:10:00', 'Credit Card'),
(12005, 1006, 1200.00, '2023-12-22 20:25:00', 'Debit Card'),
(12006, 1007, 80657.00, '2023-12-25 22:40:00', 'Cash'),
(12007, 1008, 15678.00, '2023-12-28 01:05:00', 'Credit Card'),
(12008, 1009, 9025.79, '2023-12-31 03:20:00', 'Debit Card'),
(12009, 1010, 6075.88, '2024-01-03 05:35:00', 'Cash'),
(12010, 1011, 13065.00, '2024-01-06 07:50:00', 'Credit Card'),
(12011, 1012, 4050.76, '2024-01-09 10:05:00', 'Debit Card'),
(12012, 1013, 95801.00, '2024-01-12 12:20:00', 'Cash'),
(12013, 1014, 11009.00, '2024-01-15 14:35:00', 'Credit Card'),
(12014, 1015, 7009.00, '2024-01-18 16:50:00', 'Debit Card'),
(12015, 1016, 4530.70, '2024-01-21 19:05:00', 'Cash'),
(12016, 1017, 12347.00, '2024-01-24 21:20:00', 'Credit Card'),
(12017, 1018, 6785.00, '2024-01-27 23:35:00', 'Debit Card'),
(12018, 1019, 15098.00, '2024-01-30 01:50:00', 'Cash'),
(12019, 1020, 20096.00, '2024-02-02 04:05:00', 'Credit Card'),
(12020, 1001, 9568.00, '2024-02-05 06:20:00', 'Debit Card'),
(12021, 1002, 12009.00, '2024-02-08 08:35:00', 'Cash'),
(12022, 1003, 65901.00, '2024-02-11 10:50:00', 'Credit Card'),
(12023, 1004, 8097.12, '2024-02-14 13:05:00', 'Debit Card'),
(12024, 1005, 11098.00, '2024-02-17 15:20:00', 'Cash'),
(12025, 1006, 2345.54, '2024-02-20 17:35:00', 'Credit Card'),
(12026, 1007, 50031.00, '2024-02-23 19:50:00', 'Debit Card'),
(12027, 1008, 76854.00, '2024-02-26 22:05:00', 'Cash'),
(12028, 1009, 9080.30, '2024-02-29 00:20:00', 'Credit Card'),
(12029, 1010, 1234.43, '2024-03-03 02:35:00', 'Debit Card'),
(12030, 1011, 14098.00, '2024-03-06 04:50:00', 'Cash'),
(12031, 1012, 12345.00, '2024-03-09 07:05:00', 'Credit Card'),
(12032,1013,50503.00,'2024-03-12 09:20:00','Debit Card'),
(12033,1014,11098.00,'2024-03-15 11:35:00','Cash'),
(12034,1015,6547.00,'2024-03-18 13:50:00','Credit Card'),
(12035,1016,90876.00,'2024-03-21 16:05:00','Debit Card');



