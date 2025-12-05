# 💼 Employee Management System using MySQL

The Employee Management System (EMS) is a MySQL-based project that manages employee details, job roles, departments, payroll, and leave records.
It provides a clean, organized relational database structure to support efficient HR and organizational operations.

---

## 🎯 Problem Statement  
Many organizations face difficulties due to scattered employee data and manual handling of payroll, department assignments, and leave records.
This project addresses these issues by creating a centralized, structured MySQL database that streamlines and automates core HR operations.
It also improves data accuracy, reporting, and decision-making through well-designed relational models.

---

## 🥅 Project Objectives  
- Design a normalized relational database for HR data management.  
- Maintain relationships between employees, departments, and salaries.  
- Automate payroll processing with leave deductions.  
- Generate HR insights using SQL joins, subqueries, and CTEs.  
- Enforce data integrity using primary and foreign key constraints.

---

## 🧱 Database Structure  

### 📂 All datasets are available inside the folder for easy access.

- <a href = "https://github.com/Manikanta986/Employee-Management-System-Using---MySQL-/tree/main/Employee_Management_system_datasets" >Datasets</a>

### **Tables Created**

1. **JobDepartment** – Stores job roles, departments, and salary ranges.  
2. **SalaryBonus** – Contains salary, bonus, and annual pay linked to job roles.  
3. **Employee** – Stores employee personal and contact details.  
4. **Qualification** – Tracks employee qualifications and skill requirements.  
5. **Leaves** – Records employee leave history with reasons and dates.  
6. **Payroll** – Combines employee, job, salary, and leave data for net payment calculation.

### **Constraints Used**
- Primary Keys  
- Foreign Keys (with `CASCADE` and `SET NULL`)  
- Unique Constraints on `emp_email`  
- Cascading Delete/Update Actions  

### **SQL Concepts Applied**
- Joins (INNER, LEFT, RIGHT)
- Subqueries and CTEs  
- Aggregate Functions (COUNT, SUM, AVG)  
- GROUP BY and HAVING Clauses  
- Window Functions for ranking and insights
  
---

I’ve also designed an **ER Diagram** to visualize the database structure.  

<img width="850" height="692" alt="EMS - EMPLOYEMEE MANAGMENT SYSTEM" src="https://github.com/Manikanta986/Employee-Management-System-Using---MySQL-/blob/main/Er_Diagram.png" />

## 📊 Insights & Observations  
- The **Sales** department has the highest total salary allocation.  
- The **IT** department provides the highest average salary.  
- Over **20% of employees** exceed their allowed leave limit.  
- Some employees hold **multiple qualifications**, increasing role eligibility.  
- The **total annual salary expenditure** can be derived through query-based reports.  

---
## ✨ Key Features
- Centralized employee data management
- Automated payroll with leave-based deductions
- Department-wise salary and employee analytics
- Integrity maintained using PK–FK constraints
- SQL-based reporting for HR insights
---
## ⚙️ How to Use
- Clone the repository
- Import the SQL file into MySQL Workbench
- Load the datasets from the Employee_Management_system_datasets folder- <a href = "https://github.com/Manikanta986/Employee-Management-System-Using---MySQL-/tree/main/Employee_Management_system_datasets" >Datasets</a>
- Run the provided queries to explore insights
---
## 🚀 Future Enhancements
- Add stored procedures for automated payroll generation
- Implement triggers for leave validation
- Build a web UI using Flask/React for user interaction
- Add attendance management module
---
## 💡 Conclusion  
The **Employee Management System** improves HR efficiency, ensures payroll accuracy, and provides data-driven insights for better decision-making.  
It demonstrates practical knowledge of **database normalization, foreign key constraints, joins, and advanced SQL queries**.

---

## 🧰 Tools & Technologies Used  
- MySQL  
- MySQL Workbench  
- Excel (for sample data preparation)  

---

## 🔗 Explore the Full Project  
GitHub Repository: [https://github.com/Komerlasriram/Employee-Management-System-MySQL](https://github.com/Manikanta986/Employee-Management-System-Using---MySQL-)  
👤 Author: [Bolla Sai Durga Siva Manikanta](https://github.com/Manikanta986/)

---

## 🏷️ Hashtags  
#MySQLProject #SQLPortfolio #DatabaseProject #SQLCaseStudy #DataDrivenSolutions #SQLDevelopment #MySQL #RelationalDatabase #SQLQueries #EmployeeManagementSystem
