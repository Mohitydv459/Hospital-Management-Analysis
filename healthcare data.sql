create database healthcare;
use healthcare;

select * from patients_data;
select * from doctors_data;
select * from appointments_data;
select * from treatments_data;
select * from billing_data;

-- 1. Total revenue
SELECT ROUND(SUM(amount),2) AS total_revenue
FROM billing_data
WHERE payment_status = 'Paid';

-- 2. revenue generated per doctor
SELECT d.doctor_id,
	d.first_name,
	d.last_name,
    d.specialization,
    ROUND(SUM(b.amount),2) AS total_revenue
FROM billing_data b
JOIN  
	treatments_data t ON b.treatment_id = t.treatment_id
JOIN 
	appointments_data a ON t.appointment_id = a.appointment_id
JOIN
	doctors_data d ON a.doctor_id = d.doctor_id
WHERE b.payment_status = 'Paid'
GROUP BY d.doctor_id,d.specialization,d.first_name,d.last_name
ORDER BY total_revenue DESC;

-- 3. Revenue by Payment_method
SELECT b.payment_method,
	ROUND(SUM(b.amount),2) AS total_revenue
FROM billing_data b
WHERE b.payment_status = 'Paid'
GROUP BY b.payment_method;

-- 4. proportion of bills that are paid, pending, or failed.
SELECT payment_status,
	COUNT(bill_id) AS no_of_bills,
	ROUND(SUM(amount),2) AS total_amount
FROM billing_data
GROUP BY payment_status;

-- 5. Total No of Patients
SELECT COUNT(DISTINCT patient_id) AS total_patients
FROM patients_data;

-- 6. Avg age of patient
SELECT ROUND(AVG(TIMESTAMPDIFF(YEAR,date_of_birth,registration_date)),2)
FROM patients_data;

-- 7. patients gender
SELECT gender,COUNT(*) AS no_of_patients
FROM patients_data
GROUP BY gender;

-- 8. Total appointments & breakdown by status
SELECT status,COUNT(appointment_id)
FROM appointments_data
GROUP BY status;

-- 9. Daily or monthly appointment trends(Busiest months)
SELECT DATE_FORMAT(appointment_date,'%Y-%m') AS months,
	COUNT(appointment_id) AS total_appointments
FROM appointments_data
GROUP BY months
ORDER BY months;

-- 10. Patient Appointments per Doctor
SELECT d.doctor_id,
	d.first_name,
    d.last_name,
    COUNT(a.patient_id) AS total_appointments
FROM doctors_data d
JOIN 
	appointments_data a ON d.doctor_id = a.doctor_id
GROUP BY d.doctor_id,d.first_name,d.last_name
ORDER BY total_appointments DESC;

-- 11 doctor efficiency report
SELECT
  d.doctor_id,d.first_name, d.last_name, d.specialization,
  COUNT(DISTINCT a.appointment_id) AS total_appointments,
  COUNT(DISTINCT t.treatment_id) AS total_treatments,
  round(SUM(b.amount),2) AS total_revenue,
  ROUND(AVG(t.cost), 2) AS avg_treatment_cost
FROM doctors_data d
LEFT JOIN 
	appointments_data a ON d.doctor_id = a.doctor_id
LEFT JOIN 
	treatments_data t ON a.appointment_id = t.appointment_id
LEFT JOIN 
billing_data b ON t.treatment_id = b.treatment_id
GROUP BY d.doctor_id,d.first_name,d.last_name,d.specialization;

-- 12. cancellation rate
SELECT 
  SUM(CASE WHEN status='Cancelled' THEN 1 ELSE 0 END) AS cancelled,
  SUM(CASE WHEN status='No-show' THEN 1 ELSE 0 END) AS no_show,
  COUNT(*) AS total,
  ROUND(SUM(CASE WHEN status='Cancelled' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS cancel_rate_pct,
  ROUND(SUM(CASE WHEN status='No-show' THEN 1 ELSE 0 END)/COUNT(*)*100,2) AS no_show_rate_pct
FROM appointments_data;
