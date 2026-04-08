CREATE DATABASE hospital_db;
USE hospital_db;
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    name VARCHAR(100),
    age INT,
    gender VARCHAR(10)
);
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    name VARCHAR(100),
    specialization VARCHAR(100)
);
CREATE TABLE appointments (
    appointment_id INT PRIMARY KEY,
    patient_id INT,
    doctor_id INT,
    appointment_date DATE,
    FOREIGN KEY (patient_id) REFERENCES patients(patient_id),
    FOREIGN KEY (doctor_id) REFERENCES doctors(doctor_id)
);
INSERT INTO patients VALUES
(1, 'Amit Kumar', 30, 'Male'),
(2, 'Sneha Patel', 25, 'Female'),
(3, 'David Lee', 40, 'Male');
INSERT INTO doctors VALUES
(101, 'Dr. Mehta', 'Cardiologist'),
(102, 'Dr. Rao', 'Neurologist');
INSERT INTO appointments VALUES
(1001, 1, 101, '2025-02-01'),
(1002, 2, 102, '2025-02-02'),
(1003, 1, 102, '2025-02-03');
SELECT d.name, COUNT(a.appointment_id) AS total_appointments
FROM doctors d
LEFT JOIN appointments a ON d.doctor_id = a.doctor_id
GROUP BY d.name;
SELECT p.name, d.name AS doctor, a.appointment_date
FROM appointments a
JOIN patients p ON a.patient_id = p.patient_id
JOIN doctors d ON a.doctor_id = d.doctor_id;