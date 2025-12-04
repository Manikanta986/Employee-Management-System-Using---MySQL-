-- Project on Employee Management System
-- Create the database
create Database Project;
use Project;
-- Create the Table 1: JobDeparment
CREATE TABLE JobDepartment (
    Job_ID INT PRIMARY KEY,
    jobdept VARCHAR(50),
    name VARCHAR(100),
    description TEXT,
    salaryrange VARCHAR(50)
);
select *from JobDepartment;
-- Create the Table 2: Salary/Bonus
CREATE TABLE SalaryBonus (
    salary_ID INT PRIMARY KEY,
    Job_ID INT,
    Amount DECIMAL(10,2),
    Annual DECIMAL(10,2),
    Bonus DECIMAL(10,2),
    CONSTRAINT fk_salary_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(Job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
select *from SalaryBonus;
-- Create the Table 3: Employee
CREATE TABLE Employee (
    emp_ID INT PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50),
    gender VARCHAR(10),
    age INT,
    contact_add VARCHAR(100),
    emp_email VARCHAR(100) UNIQUE,
    emp_pass VARCHAR(50),
    Job_ID INT,
    CONSTRAINT fk_employee_job FOREIGN KEY (Job_ID)
        REFERENCES JobDepartment(Job_ID)
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
Select *from Employee;
-- Create the Table 4: Qualification
CREATE TABLE Qualification (
    QualID INT PRIMARY KEY,
    Emp_ID INT,
    Position VARCHAR(50),
    Requirements VARCHAR(255),
    Date_In DATE,
    CONSTRAINT fk_qualification_emp FOREIGN KEY (Emp_ID)
        REFERENCES Employee(emp_ID)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);
Select *from Qualification;
-- Create the Table 5: Leaves
CREATE TABLE Leaves (
    leave_ID INT PRIMARY KEY,
    emp_ID INT,
    date DATE,
    reason TEXT,
    CONSTRAINT fk_leave_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE
);
Select *from leaves;
-- Table 6: Payroll
CREATE TABLE Payroll (
    payroll_ID INT PRIMARY KEY,
    emp_ID INT,
    job_ID INT,
    salary_ID INT,
    leave_ID INT,
    date DATE,
    report TEXT,
    total_amount DECIMAL(10,2),
    CONSTRAINT fk_payroll_emp FOREIGN KEY (emp_ID) REFERENCES Employee(emp_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_job FOREIGN KEY (job_ID) REFERENCES JobDepartment(job_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_salary FOREIGN KEY (salary_ID) REFERENCES SalaryBonus(salary_ID)
        ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_payroll_leave FOREIGN KEY (leave_ID) REFERENCES Leaves(leave_ID)
        ON DELETE SET NULL ON UPDATE CASCADE
);
select *from payroll;
-- Check the Tables
select *from employee;
select *from jobdepartment;
select *from leaves;
select *from payroll;
select *from qualification;
select *from salarybonus;

-- Data Analysis using SQL
-- 1. Analysis on EMPLOYEE INSIGHTS

-- 1.1) How many unique employees are currently in the system?
select count(Distinct(emp_id)) as Total_Employee 
from employee;

-- 1.2) Which departments have the highest number of employees?
select 
jobdept as Department,
count(jobdept) as Employee_count 
from jobdepartment 
group by jobdept 
order by count(jobdept) desc;
    
-- 1.3) What is the average salary per department?
select j.jobdept, 
round(avg(s.amount),2) as Avg_Salary
from salarybonus s
join jobdepartment j on s.job_id = j.job_id
group by j.jobdept 
order by avg(s.amount) desc;

-- 1.4) Who are the top 5 highest-paid employees?
select e.emp_id, 
e.firstname as Name ,
p.total_amount as Highest_paid from payroll p
join employee e on e.emp_id = p.job_id
order by (p.total_amount) desc limit 5; 

-- 1.5) What is the total salary expenditure across the company?

select sum(total_amount) AS total_salary_expenditure
FROM Payroll;

-- 2. JOB ROLE AND DEPARTMENT ANALYSIS
-- 2.1) How many different job roles exist in each department?
select jobdept ,count(Distinct(name)) as Job_roles
from jobdepartment 
group by jobdept 
order by count(Job_id) desc;
select *from jobdepartment;
-- 2.2) What is the average salary range per department?
select j.jobdept as Department, 
round(avg(s.amount),2) as Avg_Salaryrange 
from jobdepartment j
join salarybonus s on s.job_id = j.job_id
group by j.jobdept
order by avg(s.amount)desc;

-- 2.3) Which job roles offer the highest salary?
select j.name as Role, j.jobdept  , s.amount from salarybonus s
join jobdepartment j on j.job_id = s.job_id
order by s.amount desc 
limit 5;

-- 2.4) Which departments have the highest total salary allocation?
select j.jobdept , sum(s.amount) as Total_salary 
from salarybonus s
join jobdepartment j on j.job_id = s.job_id
group by j.jobdept
order by sum(s.amount) desc;

-- 3. QUALIFICATION AND SKILLS ANALYSIS

-- 3.1) How many employees have at least one qualification listed?
select Count(distinct emp_id) 
as Emply_with_qualification 
from Qualification;

-- 3.2) Which positions require the most qualifications?
select position as Position, 
count(*) as Qualifications from Qualification
group by Position 
order by count(Requirements) desc;

-- 3.3) Which employees have the highest number of qualifications?
SELECT e.emp_ID,COUNT(q.QualID) AS num_qualifications
FROM Employee e
JOIN Qualification q ON e.emp_ID = q.Emp_ID
GROUP BY e.emp_ID
ORDER BY num_qualifications DESC;


-- 4.LEAVE AND ABSENCE PATTERNS

-- 4.1) Which year had the most employees taking leaves?
select *from leaves;
select *from payroll;
select Year(date), 
count(Distinct emp_id) from leaves 
group by Year(date);

-- 4.2) What is the average number of leave days taken by its employees per department?
SELECT 
    j.jobdept,
    COUNT(l.leave_id) * 1.0 / COUNT(DISTINCT e.emp_ID) AS avg_leave_days
FROM jobdepartment j
JOIN Employee e ON j.Job_ID = e.Job_ID
LEFT JOIN leaves l ON e.emp_ID = l.emp_ID
GROUP BY j.jobdept
ORDER BY avg_leave_days DESC;

-- 4.3) Which employees have taken the most leaves?
SELECT e.emp_ID, e.firstname, e.lastname, 
count(l.leave_id) as Most_leaves
FROM Employee e
JOIN Leaves l ON e.emp_ID = l.emp_ID
group by e.emp_id, e.firstname, e.lastname
order by Most_leaves desc;

-- 4.4) What is the total number of leave days taken company-wide?
select count(Leave_id) as Total_leaves 
from leaves;

-- 4.5) How do leave days correlate with payroll amounts?
SELECT e.emp_ID, COUNT(l.leave_ID) AS total_leaves, SUM(p.total_amount) AS payroll_total
FROM Employee e
LEFT JOIN Leaves l ON e.emp_ID = l.emp_ID
LEFT JOIN Payroll p ON e.emp_ID = p.emp_ID
GROUP BY e.emp_ID;



-- 5. PAYROLL AND COMPENSATION ANALYSIS

-- 5.1) What is the total monthly payroll processed?
select *from payroll;
select year(date),
month(date) As Monthly_payroll, 
sum(total_amount)from payroll 
group by year(date),month(date);

-- 5.2) What is the average bonus given per department?
select j.jobdept , 
round(avg(s.bonus),2) 
from salarybonus s
join jobdepartment j on j.job_id = s.job_id
group by j.jobdept 
order by avg(s.bonus) desc;

-- 5.3) Which department receives the highest total bonuses?
select j.jobdept, 
sum(s.bonus) 
from salarybonus s
join jobdepartment j on j.job_id = s.job_id
group by j.jobdept 
order by sum(s.bonus) desc; 

-- 5.4) What is the average value of total_amount after considering leave deductions?
select count(job_id) as No_of_employee,
avg(total_amount) as AvgTotal_amount 
from payroll;
