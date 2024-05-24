#Doctors who are highly experienced
select Department.Department_Name,
concat(Doctor.First_Name,' ',Doctor.Last_Name) AS Name, 
max(Experience) AS Experience_In_Yrs 
FROM Doctor INNER JOIN Department on Doctor.Department_ID = Department.Department_ID 
group by Doctor.Department_ID;

#Department with highest no of doctors
SELECT Department.Department_Name, count(Doctor.Doctor_ID) AS Number_of_Doctors 
FROM Doctor INNER JOIN Department ON Doctor.Department_ID = Department.Department_ID 
group by Department.Department_Name order by Number_of_Doctors DESC LIMIT 1;

#no of patients in each patient type
SELECT Patient.PatientType, COUNT(Patient.Patient_ID) AS PatientCount
FROM Patient
WHERE Patient.PatientType IS NOT NULL
GROUP BY Patient.PatientType;

#Patients who paid their hospital bill and how much they paid
select Patient.Patient_ID, concat(Patient.First_Name,' ',Patient.Last_Name) AS Name, 
Patient.City, Patient.Contact_Number, sum(Transactions.Amount) AS Total_Bill_Paid 
from Patient inner join Transactions on Patient.Patient_ID = Transactions.Patient_ID group by Patient.Patient_ID 
order by Patient.Patient_ID;

#Emergency patient Medical records
select Patient.Patient_ID, Patient.Last_Name, Patient.Date_Of_Birth, Patient.Age, 
Patient.PatientType, EmergencyPatient.Emergency_Contact, EmergencyPatient.Admission_Reason, Medical_Record.Diagnosis,
Medical_Record.Symptoms
from Patient INNER JOIN EmergencyPatient ON Patient.Patient_ID = EmergencyPatient.EPatientID
INNER JOIN Medical_Record ON Patient.Patient_ID = Medical_Record.Patient_ID;

#Inpatient details with no of days treated in hospital and their room charge ex: room charge is 500 per day
WITH Inpatient_details AS(
SELECT concat(Patient.First_Name,' ',Patient.Last_Name) AS Name,
Patient.PatientType, InPatient.RoomNumber,
InPatient.AdmissionDate,
DATEDIFF(InPatient.DischargeDate, InPatient.AdmissionDate) AS Days_Stayed_In_Room 
FROM InPatient INNER JOIN Patient ON InPatient.IPatientID = Patient.Patient_ID
)
select *,(Days_Stayed_In_Room * 500) as Room_charge from Inpatient_details order by AdmissionDate;

#Insurance Providers with highest coverage amount
select Insurance.Insurance_Provider, Insurance.Coverage_Amount 
From Insurance order by Insurance.Coverage_Amount DESC LIMIT 2;

#Staff with highest salary and their experience
Select Department.Department_Name, CONCAT(Staff.First_Name, ' ', Staff.Last_Name) AS Name, Staff.Staff_Role,
round((DATEDIFF(CURDATE(), Staff.Joining_Date)/365),1) AS Experience, max(Staff.Salary) as Salary from Staff INNER JOIN Department ON
Staff.Department_ID = Department.Department_ID group by Staff.Department_ID;

#patients with their medications and their diagnosis results
select Patient.Patient_ID, concat(Patient.First_Name, ' ', Patient.Last_Name) AS Name, 
Medical_Record.Diagnosis, Medical_Record.Symptoms,
Prescription.Medication, Prescription.Dosage
FROM Patient INNER JOIN Medical_Record ON Patient.Patient_ID = Medical_Record.Patient_ID 
INNER JOIN Prescription ON Medical_Record.Record_ID = Prescription.Record_ID;

#No of appointments for each year and for each department
select Department.Department_Name, count(Appointment.Appointment_ID) AS Total_Appointments, 
year(Appointment.Appointment_Date) AS Year 
FROM Appointment INNER JOIN Doctor ON Appointment.Doctor_ID = Doctor.Doctor_ID 
INNER JOIN Department ON Doctor.Department_ID = Department.Department_ID 
group by Department.Department_Name, year order by year; 