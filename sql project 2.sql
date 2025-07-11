create table hospdata(  
Hospital_Name varchar(100),	
Location	varchar(50),
Department	varchar(50),
Doctors_Count int,
Patients_Count int,
Admission_Date date,
Discharge_Date date,
Medical_Expenses numeric(10,2)
);
select* from hospdata;

  -- 1.Write an SQL query to find the total number of patients across all hospitals.
select sum(patients_count) as total_patients
from hospdata;

-- 2.Retrieve the average count of doctors available in each hospital.

select hospital_name,avg(doctors_count) as average_count
from hospdata
group by hospital_name;

-- 3.Find the top 3 hospital departments that have the highest number of patients.
select  department,sum(patients_count) as total_patients
from hospdata
group by department
order by total_patients desc
limit 3;

--4.Identify the hospital that recorded the highest medical expenses.
select* from hospdata;

select hospital_name,medical_expenses
from hospdata
order by medical_expenses desc
limit 1;

--5.Calculate the average medical expenses per day for each hospital.
SELECT hospital_name,SUM(medical_expenses) / SUM(discharge_date - admission_date) AS avg_expense_per_day
FROM hospdata

GROUP BY hospital_name

ORDER BY avg_expense_per_day DESC;

--6.Find the patient with the longest stay by calculating the difference between Discharge Date and Admission Date.
select hospital_name,location,SUM(discharge_date - admission_date) as stay_days
from hospdata
group by hospital_name,location
order by stay_days desc;

--7.Count the total number of patients treated in each city.
select location,sum(patients_count)
from hospdata
group by location;

--8.Calculate the average number of days patients spend in each department.

select department,avg(discharge_date - admission_date) as averagedays_spend
from hospdata
group by department;

--9.Find the department with the least number of patients.

select department,sum(patients_count) as  least_patient
from hospdata
group by department
order by sum(patients_count)
limit 1;

--10.Group the data by month and calculate the total medical expenses for each month.
select  extract( month from admission_date) as month ,sum(medical_expenses) as total_expenses
from hospdata
group by extract( month from admission_date)
order by  month ;





	


