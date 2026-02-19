/* =========================================
   HR DATABASE SETUP
   Database + Table
========================================= */

-- 1️⃣ Create Database (if not exists)
IF DB_ID('HR data') IS NULL
BEGIN
    CREATE DATABASE [HR data];
END
GO

-- 2️⃣ Use Database
USE [HR data];
GO

-- 3️⃣ Drop Table if it exists
IF OBJECT_ID('dbo.hr_data', 'U') IS NOT NULL
    DROP TABLE dbo.hr_data;
GO

-- 4️⃣ Create Tablle

DROP TABLE IF EXISTS dbo.hr_data_stage;
GO
CREATE TABLE dbo.hr_raw (
    Attrition VARCHAR(50),
    BusinessTravel VARCHAR(100),
    CF_age_band VARCHAR(50),
    CF_attrition_label VARCHAR(50),
    Department VARCHAR(100),
    EducationField VARCHAR(100),
    emp_no VARCHAR(50),
    EmployeeNumber VARCHAR(50),
    Gender VARCHAR(50),
    JobRole VARCHAR(100),
    MaritalStatus VARCHAR(50),
    OverTime VARCHAR(50),
    Over18 VARCHAR(10),
    TrainingTimesLastYear VARCHAR(50),
    col_minus2 VARCHAR(50),
    col_0 VARCHAR(50),
    Age VARCHAR(50),
    CF_attrition_count VARCHAR(50),
    CF_attrition_counts VARCHAR(50),
    CF_attrition_rate VARCHAR(50),
    CF_currentEmployee VARCHAR(50),
    DailyRate VARCHAR(50),
    DistanceFromHome VARCHAR(50),
    Education VARCHAR(50),
    EmployeeCount VARCHAR(50),
    EnvironmentSatisfaction VARCHAR(50),
    HourlyRate VARCHAR(50),
    JobInvolvement VARCHAR(50),
    JobLevel VARCHAR(50),
    JobSatisfaction VARCHAR(50),
    MonthlyIncome VARCHAR(50),
    MonthlyRate VARCHAR(50),
    NumCompaniesWorked VARCHAR(50),
    PercentSalaryHike VARCHAR(50),
    PerformanceRating VARCHAR(50),
    RelationshipSatisfaction VARCHAR(50),
    StandardHours VARCHAR(50),
    StockOptionLevel VARCHAR(50),
    TotalWorkingYears VARCHAR(50),
    WorkLifeBalance VARCHAR(50),
    YearsAtCompany VARCHAR(50),
    YearsInCurrentRole VARCHAR(50),
    YearsSinceLastPromotion VARCHAR(50),
    YearsWithCurrManager VARCHAR(50)
);

select * from dbo.hr_raw
BULK INSERT dbo.hr_raw
FROM 'C:\Users\DDC\Downloads\HR DATA_Excel.csv'
WITH
(
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    TABLOCK,
    CODEPAGE = '65001'
);




