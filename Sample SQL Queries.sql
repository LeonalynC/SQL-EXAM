-- 1. SQL Query with Join
-- Problem: Retrieve a list of appointments along with patient names and the doctor assigned for each appointment.
 
SELECT 
    a.Appointment_ID, 
    p.FirstName AS PatientFirstName, 
    p.LastName AS PatientLastName, 
    d.FirstName AS DoctorFirstName, 
    d.LastName AS DoctorLastName, 
    a.AppointmentDate
FROM 
    Appointment a
JOIN 
    Patients p ON a.Patient_ID = p.Patient_ID
JOIN 
    Doctors d ON a.Doctor_ID = d.Doctor_ID;

-- 2. SQL Query with Join and Aggregate Function
-- Problem: Find the number of appointments scheduled for each doctor.

    SELECT 
    d.FirstName AS DoctorFirstName, 
    d.LastName AS DoctorLastName, 
    COUNT(a.Appointment_ID) AS TotalAppointments
FROM 
    Doctors d
JOIN 
    Appointment a ON d.Doctor_ID = a.Doctor_ID
GROUP BY 
    d.Doctor_ID, d.FirstName, d.LastName;

-- 3. SQL Query with Join and UNION
-- Problem: Find a list of all patients who have either scheduled an appointment or have submitted health data.

    SELECT 
    p.Patient_ID, 
    p.FirstName, 
    p.LastName 
FROM 
    Patients p
JOIN 
    Appointment a ON p.Patient_ID = a.Patient_ID

UNION

SELECT 
    p.Patient_ID, 
    p.FirstName, 
    p.LastName 
FROM 
    Patients p
JOIN 
    Health_Data h ON p.Patient_ID = h.Patient_ID;