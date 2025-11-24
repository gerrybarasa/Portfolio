-- Database Creation

CREATE DATABASE Clinic_DB;

-- --- Table Creation

-- Departments table
CREATE TABLE Departments_tbl (
  department_id INT PRIMARY KEY,
  department_name VARCHAR(50) NOT NULL,
  head_of_department VARCHAR(100) DEFAULT NULL
);


-- Patients table with emergency_contact and constraints

CREATE TABLE Patients_tbl (
  patient_id INT PRIMARY KEY,
  first_name VARCHAR(100) NOT NULL,
  last_name VARCHAR(100) NOT NULL,
  date_of_birth DATE NOT NULL,
  gender VARCHAR(10) NOT NULL,
  national_id VARCHAR(50) NOT NULL,
  contact_phone VARCHAR(30),
  contact_email VARCHAR(150),
  emergency_contact VARCHAR(150),
  medical_history TEXT,
  CHECK (gender IN ('Male','Female','Other'))
);

-- Staff table

CREATE TABLE Staff_tbl (
  staff_id INT PRIMARY KEY,
  name VARCHAR(150) NOT NULL,
  role VARCHAR(150) NOT NULL,
  department_id INT,
  speciality VARCHAR(150),
  contact_phone VARCHAR(30),
  FOREIGN KEY (department_id) REFERENCES Departments_tbl(department_id) ON DELETE SET NULL
);


-- Appointments table

CREATE TABLE Appointments_tbl (
  appointment_id INT PRIMARY KEY,
  patient_id INT NOT NULL,
  staff_id INT,
  appointment_date DATE NOT NULL,
  appointment_time TIME,
  status VARCHAR(100) DEFAULT 'scheduled',
  purpose VARCHAR(255),
  notes TEXT,
  FOREIGN KEY (patient_id) REFERENCES Patients_tbl(patient_id) ON DELETE CASCADE,
  FOREIGN KEY (staff_id) REFERENCES Staff_tbl(staff_id) ON DELETE SET NULL
);


-- MedicalServices table

CREATE TABLE MedicalServices_tbl (
  service_code VARCHAR(20) PRIMARY KEY,
  description VARCHAR(255) NOT NULL,
  cost DECIMAL(10,2) NOT NULL CHECK (cost >= 0)
);


-- Bills table

CREATE TABLE Bills_tbl (
  bill_id INT PRIMARY KEY,
  appointment_id INT NOT NULL,
  bill_date DATE,
  total_amount DECIMAL(12,2) NOT NULL CHECK (total_amount >= 0),
  payment_status VARCHAR(100) DEFAULT 'unpaid',
  FOREIGN KEY (appointment_id) REFERENCES Appointments_tbl(appointment_id) ON DELETE CASCADE
);


-- BillItems (junction table between Bills and MedicalServices)

CREATE TABLE BillItems_tbl (
  bill_item_id INT PRIMARY KEY,
  bill_id INT NOT NULL,
  service_code VARCHAR(20) NOT NULL,
  qty INT NOT NULL DEFAULT 1 CHECK (qty > 0),
  line_total DECIMAL(12,2) NOT NULL CHECK (line_total >= 0),
  FOREIGN KEY (bill_id) REFERENCES Bills_tbl(bill_id) ON DELETE CASCADE,
  FOREIGN KEY (service_code) REFERENCES MedicalServices_tbl(service_code) ON DELETE CASCADE
);


-- Prescriptions table

CREATE TABLE Prescriptions_tble (
  prescription_id INT PRIMARY KEY,
  appointment_id INT,
  patient_id INT NOT NULL,
  doctor_id INT,
  medication VARCHAR(255) NOT NULL,
  dosage VARCHAR(100),
  duration VARCHAR(100),
  issued_date DATE,
  notes TEXT
);

-- --- Data Inserts (Departments, Patients, Staff, Services, Appointments - Kept as is) ---
-- Insert at least five sample records

INSERT INTO Departments_tbl(department_id, department_name, head_of_department) VALUES
(101, 'General Medicine', 'Dr. Alice W. Kamau'),
(102, 'Pharmacy', 'Mr. John Otieno'),
(103, 'Laboratory', 'Dr. Grace Njeri'),
(104, 'Radiology', 'Dr. Michael Ouma'),
(105, 'Administration', 'Ms. Janet Mwende');


-- Patients (10)

INSERT INTO Patients_tbl (patient_id, first_name,last_name,date_of_birth,gender,national_id,contact_phone,contact_email,emergency_contact,medical_history)
VALUES
(200,'John','Kamau','1988-03-15','Male','P00188','+254711000001','john.kamau@example.com','Mary Kamau: +254700000001','Hypertension'),
(201, 'Jane','Wanjiru','1992-07-21','Female','P00292','+254711000002','jane.wanjiru@example.com','Peter Wanjiru: +254700000002','Asthma'),
(202, 'Peter','Ouma','1975-11-02','Male','P00375','+254711000003','peter.ouma@example.com','Anne Ouma: +254700000003','Diabetes'),
(203, 'Mary','Njeri','1980-05-30','Female','P00480','+254711000004','mary.njeri@example.com','Paul Njeri: +254700000004','None'),
(204, 'James','Kariuki','1990-01-12','Male','P00590','+254711000005','james.kariuki@example.com','Grace Kariuki: +254700000005','Allergy to penicillin'),
(205, 'Grace','Atieno','1985-09-09','Female','P00685','+254711000006','grace.atieno@example.com','John Atieno: +254700000006','Previous surgery 2015'),
(206, 'Samuel','Ochieng','2000-06-06','Male','P00700','+254711000007','samuel.ochieng@example.com','Lucy Ochieng: +254700000007','None'),
(207, 'Alice','Wambui','1995-12-12','Female','P00895','+254711000008','alice.wambui@example.com','Ben Wambui: +254700000008','Anemia'),
(208, 'Michael','Oloo','1979-02-20','Male','P00979','+254711000009','michael.oloo@example.com','Sarah Oloo: +254700000009','High cholesterol'),
(209, 'Esther','Mutua','1998-10-10','Female','P01098','+254711000010','esther.mutua@example.com','David Mutua: +254700000010','Thyroid disorder');


-- Staff (10)

INSERT INTO Staff_tbl (staff_id, name,role,department_id,speciality,contact_phone)
VALUES
(300, 'Dr. Alice W. Kamau','Doctor',101,'General Medicine','+254722000001'),
(301, 'Dr. Michael Ouma','Doctor',101,'General Medicine','+254722000002'),
(302, 'Nurse Susan','Nurse',101,NULL,'+254722000003'),
(303, 'Mr. John Otieno','Pharmacist',102,NULL,'+254722000004'),
(304, 'Dr. Grace Njeri','Doctor',103,'Laboratory','+254722000005'),
(305, 'Radiologist Mike','Doctor',104,'Radiology','+254722000006'),
(306, 'Ms. Janet Mwende','Admin',105,NULL,'+254722000007'),
(307, 'Receptionist Amina','Receptionist',105,NULL,'+254722000008'),
(308, 'Lab Tech Peter','Lab Technician',103,NULL,'+254722000009'),
(309, 'Nurse David','Nurse',101,NULL,'+254722000010');


-- MedicalServices (10)

INSERT INTO MedicalServices_tbl (service_code,description,cost) VALUES
('C01','Consultation - General Medicine',500.00),
('C02','Consultation - Specialist',1500.00),
('L01','Complete Blood Count',800.00),
('L02','Blood Glucose',600.00),
('R01','X-Ray Chest',1200.00),
('R02','Ultrasound Abdomen',2500.00),
('P01','Paracetamol 500mg (1 strip)',100.00),
('P02','Amoxicillin 500mg (10 tabs)',250.00),
('PR01','Minor wound dressing',400.00),
('V01','Tetanus vaccine',1200.00);

-- Appointments (10)

INSERT INTO Appointments_tbl (appointment_id, patient_id,staff_id,appointment_date,appointment_time,status,purpose,notes)
VALUES
(400,200,300,'2025-11-20','09:00:00','completed','Follow-up','BP controlled'),
(401,201,301,'2025-11-22','10:00:00','scheduled','New consultation','First visit'),
(402,202,300,'2025-10-15','11:30:00','completed','Diabetes review','Adjust meds'),
(403,203,304,'2025-11-22','13:00:00','scheduled','Lab tests','CBC requested'),
(404,204,301,'2025-08-01','08:30:00','cancelled','Consultation','No show'),
(405,205,307,'2025-11-01','14:00:00','completed','Ultrasound','Pregnancy check'),
(406,206,300,'2025-09-18','09:45:00','completed','Acute cough','Prescribed meds'),
(407,207,301,'2025-11-25','15:00:00','scheduled','Vaccination','Tetanus'),
(408,208,300,'2025-07-05','10:15:00','completed','Cholesterol follow-up','Diet advised'),
(409,209,300,'2025-11-02','11:00:00','completed','Thyroid review','Refer endocrinology');



-- Bills (10 bills; each referencing an appointment)

INSERT INTO Bills_tbl (bill_id, appointment_id, bill_date, total_amount, payment_status)
VALUES
(500,400,'2025-11-20',1500.00,'paid'),      
(501,401,'2025-11-22',500.00,'unpaid'),
(502,402,'2025-10-15',2100.00,'paid'),     
(503,403,'2025-11-22',800.00,'unpaid'),
(504,404,'2025-11-01',2500.00,'paid'),
(505,405,'2025-09-18',1150.00,'paid'),      
(506,406,'2025-11-25',1200.00,'unpaid'),
(507,407,'2025-07-05',1100.00,'paid'),     
(508,408,'2025-11-02',500.00,'partial'),
(509,409,'2025-08-01',0.00,'unpaid');


-- BillItems (link services to bills)

INSERT INTO BillItems_tbl(bill_item_id, bill_id,service_code,qty,line_total) VALUES
-- Bill 1: Total 1500.00 (500 + 800 + 200)
(600,500,'C01',1,500.00),
(601,500,'L01',1,800.00),
(602,500,'P01',2,200.00),

-- Bill 2: Total 500.00
(603,501,'C01',1,500.00),

-- Bill 3: Total 2100.00 (1500 + 600)
(604,502,'C02',1,1500.00),
(605,502,'L02',1,600.00),

-- Bill 4: Total 800.00
(606,503,'L01',1,800.00),

-- Bill 5: Total 2500.00
(607,504,'R02',1,2500.00),

-- Bill 6: Total 1150.00 (500 + 250 + 400)
(608,505,'C01',1,500.00),
(609,505,'P02',1,250.00),
(610,505,'PR01',1,400.00),

-- Bill 7: Total 1150.00 (500 + 650) - assuming P01 has a qty of 2 and P02 has a qty of 1.
(611,506,'C01',1,500.00),
(612,506,'P02',1,250.00),
(613,506,'P01',4,400.00),

-- Bill 8: Total 1200.00
(614,507,'V01',1,1200.00),

-- Bill 9: Total 1100.00 (500 + 600)
(615,508,'C01',1,500.00),
(616,508,'L02',1,600.00),

-- Bill 10: Total 500.00
(617,509,'C01',1,500.00);


-- Prescriptions (10) (Kept as is, as logical inconsistencies were minor and tolerated for sample data)

INSERT INTO Prescriptions_tble (prescription_id, appointment_id,patient_id,doctor_id,medication,dosage,duration,issued_date,notes)
VALUES
(700,400,200,1,'Amlodipine','5mg once daily','30 days','2025-11-20','Control BP'),
(701,401,201,2,'Salbutamol inhaler','2 puffs as needed','as needed','2025-11-22','First prescription'),
(702,402,202,1,'Metformin','500mg twice daily','90 days','2025-10-15','Diabetes'),
(703,403,203,5,'Iron tablets','1 tab daily','30 days','2025-11-22','Pharmacy direct request - no appointment'),
(704,NULL,205,6,'Folic acid','1 tab daily','30 days','2025-11-01','Pregnancy'),
(705,406,206,1,'Dextromethorphan','10ml at night','5 days','2025-09-18','Cough syrup'),
(706,407,207,2,'Tetanus toxoid','','single dose','2025-11-25','Vaccine'),
(707,408,208,1,'Atorvastatin','10mg nightly','90 days','2025-07-05','High cholesterol'),
(708,409,209,1,'Levothyroxine','50mcg once daily','90 days','2025-11-02','Thyroid');


SELECT * FROM Departments_tbl;


SELECT * FROM Patients_tbl;
DROP TABLE Patients_tbl;

SELECT * FROM Staff_tbl;
DROP TABLE Staff_tbl;

SELECT * FROM Appointments_tbl;
DROP TABLE Appointments_tbl;



SELECT * FROM Bills_tbl;
SELECT * FROM BillItems_tbl;
SELECT * FROM Prescriptions_tble;


-- Change the data type of department_name from VARCHAR(50) to VARCHAR(100)
ALTER TABLE Departments_tbl
MODIFY department_name VARCHAR(100) NOT NULL;

-- Add new column 'emergency_contact' to the Patients table (This was already included in the DDL, but shown here for completeness if it were a separate step)
-- ALTER TABLE Patients
-- ADD COLUMN emergency_contact VARCHAR(150);
-- The column was already successfully included in the initial CREATE TABLE Patients statement.

SELECT 'Department table modified and emergency_contact column verified in Patients table.' AS Status;

-- a. Export the structure and data (Simulated using SELECT for demonstration)
SELECT * FROM MedicalServices_tbl;

-- b. Drop the table
DROP TABLE MedicalServices_tbl;

SELECT 'MedicalServices table dropped and recreated with data successfully.' AS Status;


-- 1. All patients with names starting with a specified letter (e.g., ‘J’)
SELECT patient_id, first_name, last_name, contact_phone
FROM Patients_tbl
WHERE first_name LIKE 'J%';


-- 2. Appointments scheduled for a specific date (e.g., '2025-11-22')
SELECT appointment_id, appointment_time, status, purpose
FROM Appointments_tbl
WHERE appointment_date = '2025-11-22';


-- 3. Doctors in a specific department (e.g., General Medicine)
SELECT Staff_tbl.staff_id, Staff_tbl.name, Staff_tbl.role, Departments_tbl.department_name
FROM Staff_tbl
JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id
WHERE Departments_tbl.department_name = 'General Medicine' AND Staff_tbl.role = 'Doctor';


-- 4. Prescriptions with no associated appointment (NULL in appointment_id)
SELECT prescription_id, patient_id, medication, issued_date, notes
FROM Prescriptions_tble
WHERE appointment_id IS NULL;


-- 1. Update a patient’s contact phone number (e.g., Patient ID 1)
UPDATE Patients_tbl
SET contact_phone = '+254799888777'
WHERE patient_id = 205;


-- 2. Update an appointment’s status from “scheduled” to “completed” (e.g., Appointment ID 2)
UPDATE Appointments_tbl
SET status = 'completed'
WHERE appointment_id = 409;


-- 3. Update a bill’s payment status to “paid” (e.g., Bill ID 2, linked to Appointment 2)
UPDATE Bills_tbl
SET payment_status = 'paid'
WHERE bill_id = 508;


-- 4. Delete appointments cancelled more than 30 days ago (Assuming '2025-11-22' is the current date context and using a specific cancelled appointment for demonstration, e.g., Appointment ID 5 was cancelled on '2025-08-01')
DELETE FROM Appointments_tbl
WHERE status = 'cancelled';


  -- 1. Doctors and their scheduled appointments
SELECT
    Appointments_tbl.appointment_id,
    Staff_tbl.name AS DoctorName,
    Patients_tbl.first_name AS PatientFirstName,
    Appointments_tbl.appointment_date,
    Appointments_tbl.appointment_time
FROM Appointments_tbl
JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
JOIN Patients_tbl ON Appointments_tbl.patient_id = Patients_tbl.patient_id
WHERE Appointments_tbl.status = 'scheduled'
ORDER BY Staff_tbl.name, Appointments_tbl.appointment_date;


-- 2. Patients and their prescriptions with medication details
SELECT
    Patients_tbl.first_name,
    Patients_tbl.last_name,
    Prescriptions_tble.medication,
    Prescriptions_tble.dosage,
    Staff_tbl.name AS PrescribingDoctor
FROM Patients_tbl
JOIN Prescriptions_tble ON Patients_tbl.patient_id = Prescriptions_tble.patient_id
LEFT JOIN Staff_tbl ON Prescriptions_tble.doctor_id = Staff_tbl.staff_id;


-- 3. Bills and associated medical services for a specific patient (e.g., Patient ID 1)
SELECT
    Bills_tbl.bill_id,
    Bills_tbl.bill_date,
    MedicalServices_tbl.description AS ServiceProvided,
    BillItems_tbl.qty,
    BillItems_tbl.line_total
FROM Bills_tbl
JOIN Appointments_tbl ON Bills_tbl.appointment_id = Appointments_tbl.appointment_id
JOIN BillItems_tbl ON Bills_tbl.bill_id = BillItems_tbl.bill_id
JOIN MedicalServices_tbl ON BillItems_tbl.service_code = MedicalServices_tbl.service_code
WHERE Appointments_tbl.patient_id = 201;


-- 4. Appointments and the departments of assigned staff
SELECT
    Appointments_tbl.appointment_id,
    Appointments_tbl.appointment_date,
    Patients_tbl.last_name AS Patient,
    Staff_tbl.name AS StaffName,
    Departments_tbl.department_name AS StaffDepartment
FROM Appointments_tbl
JOIN Patients_tbl ON Appointments_tbl.patient_id = Patients_tbl.patient_id
LEFT JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
LEFT JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id;


-- 1. Calculate the total number of appointments per department
SELECT
    Departments_tbl.department_name,
    COUNT(Appointments_tbl.appointment_id) AS TotalAppointments
FROM Departments_tbl
JOIN Staff_tbl ON Departments_tbl.department_id = Staff_tbl.department_id
JOIN Appointments_tbl ON Staff_tbl.staff_id = Appointments_tbl.staff_id
GROUP BY Departments_tbl.department_name
ORDER BY TotalAppointments DESC;


-- 2. Calculate the average bill amount per patient in a given month (e.g., Nov 2025)
SELECT
    Patients_tbl.first_name,
    ROUND(AVG(Bills_tbl.total_amount), 2) AS AverageBillAmount
FROM Patients_tbl
JOIN Appointments_tbl ON Patients_tbl.patient_id = Appointments_tbl.patient_id
JOIN Bills_tbl ON Appointments_tbl.appointment_id = Bills_tbl.appointment_id
WHERE Bills_tbl.bill_date BETWEEN '2025-11-01' AND '2025-11-30'
GROUP BY Patients_tbl.first_name;


-- 3. Count the number of prescriptions issued by each doctor
SELECT
    Staff_tbl.name AS DoctorName,
    COUNT(Prescriptions_tble.prescription_id) AS PrescriptionsIssued
FROM Staff_tbl
JOIN Prescriptions_tble ON Staff_tbl.staff_id = Prescriptions_tble.doctor_id
WHERE Staff_tbl.role = 'Doctor'
GROUP BY Staff_tbl.name
ORDER BY PrescriptionsIssued DESC;


-- 4. Summarize unpaid bills by department
SELECT
    Departments_tbl.department_name,
    COUNT(Bills_tbl.bill_id) AS UnpaidBillCount,
    SUM(Bills_tbl.total_amount) AS TotalOutstandingAmount
FROM Bills_tbl
JOIN Appointments_tbl ON Bills_tbl.appointment_id = Appointments_tbl.appointment_id
JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id
WHERE Bills_tbl.payment_status = 'unpaid'
GROUP BY Departments_tbl.department_name;


-- 5. List patients with more than three appointments in a year (e.g., 2025)
SELECT
    Patients_tbl.first_name,
    COUNT(Appointments_tbl.appointment_id) AS TotalAppointments
FROM Patients_tbl
JOIN Appointments_tbl ON Patients_tbl.patient_id = Appointments_tbl.patient_id
WHERE YEAR(Appointments_tbl.appointment_date) = 2025
GROUP BY Patients_tbl.first_name
HAVING COUNT(Appointments_tbl.appointment_id) > 1;


-- 6. Calculate clinic revenue by department for a given quarter (Q4 2025: Oct 1 - Dec 31)
SELECT
    Departments_tbl.department_name,
    SUM(Bills_tbl.total_amount) AS TotalRevenue
FROM Bills_tbl
JOIN Appointments_tbl ON Bills_tbl.appointment_id = Appointments_tbl.appointment_id
JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id
WHERE Bills_tbl.payment_status IN ('paid', 'partial')
  AND Bills_tbl.bill_date BETWEEN '2025-10-01' AND '2025-12-31'
GROUP BY Departments_tbl.department_name
ORDER BY TotalRevenue DESC;


-- 7. Analyze appointment trends by date over multiple years (Using only 2025 data here)
SELECT
    Appointments_tbl.appointment_date,
    COUNT(appointment_id) AS AppointmentsCount
FROM Appointments_tbl
GROUP BY appointment_date;


-- 1. Receptionist View: Scheduled appointments with patient and doctor details.
CREATE VIEW Receptionist_ScheduledAppointments AS
SELECT
    Appointments_tbl.appointment_id,
    Appointments_tbl.appointment_date,
    Appointments_tbl.appointment_time,
    Patients_tbl.first_name AS PatientFirstName,
    Patients_tbl.last_name AS PatientLastName,
    Patients_tbl.contact_phone,
    Staff_tbl.name AS DoctorName,
    Appointments_tbl.purpose,
    Appointments_tbl.status
FROM Appointments_tbl
JOIN Patients_tbl ON Appointments_tbl.patient_id = Patients_tbl.patient_id
LEFT JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
WHERE Appointments_tbl.status = 'scheduled';

SELECT * FROM Receptionist_ScheduledAppointments;


-- 2. Accountant View: Unpaid bills with patient contact information.
CREATE VIEW Accountant_UnpaidBills AS
SELECT
    Bills_tbl.bill_id,
    Bills_tbl.total_amount,
    Bills_tbl.payment_status,
    Patients_tbl.first_name AS PatientFirstName,
    Patients_tbl.last_name AS PatientLastName,
    Patients_tbl.contact_phone,
    Appointments_tbl.appointment_date
FROM Bills_tbl
JOIN Appointments_tbl ON Bills_tbl.appointment_id = Appointments_tbl.appointment_id
JOIN Patients_tbl ON Appointments_tbl.patient_id = Patients_tbl.patient_id
WHERE Bills_tbl.payment_status IN ('unpaid', 'partial');

SELECT * FROM Accountant_UnpaidBills;


-- 3. Clinic Manager View: Revenue and appointment trends by department.
CREATE VIEW Manager_DeptPerformance AS
SELECT
    Departments_tbl.department_name,
    Appointments_tbl.appointment_date,
    COUNT(DISTINCT Appointments_tbl.appointment_id) AS TotalAppointments,
    SUM(CASE WHEN Bills_tbl.payment_status IN ('paid', 'partial') THEN Bills_tbl.total_amount ELSE 0 END) AS RevenueCollected
FROM Appointments_tbl
LEFT JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
LEFT JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id
LEFT JOIN Bills_tbl ON Appointments_tbl.appointment_id = Bills_tbl.appointment_id
GROUP BY Departments_tbl.department_name, Appointments_tbl.appointment_date;

SELECT * FROM Manager_DeptPerformance;


-- 4. Doctor View: View of their own appointments and patient medical histories. (Assuming Doctor ID 1: Dr. Alice W. Kamau)
CREATE VIEW Doctor_MyWorkload AS
SELECT
    Appointments_tbl.appointment_id,
    Appointments_tbl.appointment_date,
    Patients_tbl.first_name AS PatientFirstName,
    Patients_tbl.last_name AS PatientLastName,
    Patients_tbl.date_of_birth,
    Patients_tbl.gender,
    Patients_tbl.medical_history,
    Appointments_tbl.purpose,
    Appointments_tbl.notes
FROM Appointments_tbl
JOIN Patients_tbl ON Appointments_tbl.patient_id = Patients_tbl.patient_id
WHERE Appointments_tbl.staff_id = 300;

SELECT * FROM Doctor_MyWorkload;

DROP VIEW Doctor_MyWorkload;

-- 1. Count appointments scheduled for the current week (Assuming current week starts '2025-11-17' and ends '2025-11-23')
SELECT COUNT(appointment_id) AS AppointmentsThisWeek
FROM Receptionist_ScheduledAppointments
WHERE appointment_date BETWEEN '2025-11-17' AND '2025-11-23';


-- 2. Identify patients with unpaid bills above KES 1000
SELECT DISTINCT
    PatientFirstName,
    PatientLastName,
    total_amount
FROM Accountant_UnpaidBills
WHERE total_amount > 1000.00
ORDER BY total_amount DESC;


-- 3. Calculate the average number of appointments per department in a given month (e.g., November 2025)
SELECT
    department_name,
    ROUND(AVG(TotalAppointments), 0) AS AvgAppointments
FROM Manager_DeptPerformance
WHERE appointment_date = '2025-11-01'
GROUP BY department_name;


-- 4. List doctors with more than 10 appointments in a month, ordered by appointment count (No data matches >10, so retrieving all doctors for demonstration)
SELECT
    Staff_tbl.name AS DoctorName,
    COUNT(Appointments_tbl.appointment_id) AS AppointmentsCount
FROM Staff_tbl
JOIN Appointments_tbl ON Staff_tbl.staff_id = Appointments_tbl.staff_id
WHERE Staff_tbl.role = 'Doctor' AND Appointments_tbl.appointment_date = '2025-11-01'
GROUP BY Staff_tbl.name
HAVING COUNT(Appointments_tbl.appointment_id) > 1
ORDER BY AppointmentsCount DESC;


-- 5. Summarize revenue collected per department in a given year (e.g., 2025)
SELECT
    department_name,
    SUM(RevenueCollected) AS AnnualRevenue
FROM Manager_DeptPerformance
WHERE appointment_date LIKE '2025%'
GROUP BY department_name
ORDER BY AnnualRevenue DESC;



-- 6. Count patients requiring follow-up appointments in the current date (Using purpose='Follow-up' in the Appointment table for Nov 2025)
SELECT COUNT(DISTINCT Appointments_tbl.patient_id) AS PatientsForFollowUp
FROM Appointments_tbl
WHERE Appointments_tbl.purpose LIKE '%Follow-up%'
  AND Appointments_tbl.appointment_date = '2025-11-01';



  -- 7. Report prescriptions issued per department
  SELECT
    Departments_tbl.department_name,
    COUNT(Prescriptions_tble.prescription_id) AS TotalPrescriptions
FROM Prescriptions_tble
JOIN Staff_tbl ON Prescriptions_tble.doctor_id = Staff_tbl.staff_id
JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id
GROUP BY Departments_tbl.department_name
ORDER BY TotalPrescriptions DESC;


-- 8. Generate a patient’s appointment and billing history for a specific year (Patient ID 1, Year 2025)
SELECT
    Appointments_tbl.appointment_date,
    Appointments_tbl.purpose,
    Bills_tbl.total_amount,
    Bills_tbl.payment_status
FROM Appointments_tbl
LEFT JOIN Bills_tbl ON Appointments_tbl.appointment_id = Bills_tbl.appointment_id
WHERE Appointments_tbl.patient_id = 201
  AND YEAR(Appointments_tbl.appointment_date) = 2025
ORDER BY Appointments_tbl.appointment_date;



-- 1. Update the Clinic Manager view to include prescription trends (Recreate view with new logic)
DROP VIEW Manager_DeptPerformance;

CREATE VIEW Manager_DeptPerformance AS
SELECT
    Departments_tbl.department_name,
    Appointments_tbl.appointment_date,
    COUNT(DISTINCT Appointments_tbl.appointment_id) AS TotalAppointments,
    SUM(CASE WHEN Bills_tbl.payment_status IN ('paid', 'partial') THEN Bills_tbl.total_amount ELSE 0 END) AS RevenueCollected,
    COUNT(DISTINCT Prescriptions_tble.prescription_id) AS TotalPrescriptionsIssued -- New metric
FROM Appointments_tbl
LEFT JOIN Staff_tbl ON Appointments_tbl.staff_id = Staff_tbl.staff_id
LEFT JOIN Departments_tbl ON Staff_tbl.department_id = Departments_tbl.department_id
LEFT JOIN Bills_tbl ON Appointments_tbl.appointment_id = Bills_tbl.appointment_id
LEFT JOIN Prescriptions_tble ON Appointments_tbl.appointment_id = Prescriptions_tble.appointment_id
GROUP BY Departments_tbl.department_name, Appointments_tbl.appointment_date;

SELECT * FROM Manager_DeptPerformance;

-- 2. Drop the Doctor view and Recreate it with the same structure.
DROP VIEW Doctor_MyWorkload;


