--DATA ANALYST PORTFOLIO SQL PROJECT 
--HR Data Analysis IN SQL


--Employee Count:
SELECT SUM(CAST(EmployeeCount AS INT)) AS Employee_Count
FROM dbo.hr_raw;

--Attrition Count:
select count(attrition) from dbo.hr_raw where attrition='Yes';

--Attrition Rate:
SELECT 
    ROUND(
        (CAST((SELECT COUNT(attrition) FROM dbo.hr_raw WHERE attrition = 'Yes') AS FLOAT) / 
        SUM(TRY_CAST(EmployeeCount AS INT))) * 100
    , 2) AS Attrition_Rate
FROM dbo.hr_raw;

--Active Employee:

SELECT 
    SUM(TRY_CAST(EmployeeCount AS INT)) - (SELECT COUNT(attrition) FROM dbo.hr_raw WHERE attrition = 'Yes') AS Active_Employees
FROM dbo.hr_raw; 


--Average Age:

SELECT ROUND(AVG(TRY_CAST(Age AS FLOAT)), 0) AS Avg_Age
FROM dbo.hr_raw;
--Attrition by Gender
select gender, count(attrition) as attrition_count from dbo.hr_raw
where attrition='Yes'
group by gender
order by count(attrition) desc;

--Department wise Attrition:
select department, count(attrition), round((cast (count(attrition) as numeric) / 
(select count(attrition) from dbo.hr_raw where attrition= 'Yes')) * 100, 2) as pct from dbo.hr_raw
where attrition='Yes'
group by department 
order by count(attrition) desc;


--No of Employee by Age Group
SELECT age,   SUM(TRY_CAST(EmployeeCount AS INT)) AS employee_count FROM dbo.hr_raw
GROUP BY age
order by age;

--Education Field wise Attrition:
select  EducationField, count(attrition) as attrition_count from dbo.hr_raw
where attrition='Yes'
group by  EducationField
order by count(attrition) desc;

--Attrition Rate by Gender for different Age Group
select  CF_age_band, gender, count(attrition) as attrition, 
round((cast(count(attrition) as numeric) / (select count(attrition) from dbo.hr_raw where attrition = 'Yes')) * 100,2) as pct
from dbo.hr_raw
where attrition = 'Yes'
group by CF_age_band, gender
order by  CF_age_band, gender desc;

--Job Satisfaction Rating

SELECT  JobRole,
    [1] AS Satisfaction_1,
    [2] AS Satisfaction_2,
    [3] AS Satisfaction_3,
    [4] AS Satisfaction_4
FROM (
    SELECT  JobRole, JobSatisfaction, TRY_CAST(EmployeeCount AS INT) AS EmployeeCount
    FROM dbo.hr_raw
) AS src
PIVOT (
    SUM(EmployeeCount)
    FOR JobSatisfaction IN ([1], [2], [3], [4])
) AS pvt
ORDER BY  JobRole;




